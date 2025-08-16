#!/usr/bin/env python3
import csv, json, os, re, sys, hashlib
from datetime import datetime, UTC
from pathlib import Path

# -------- Helpers --------
def load_config(path: Path):
    with path.open("r", encoding="utf-8") as f:
        cfg = json.load(f)
    cfg.setdefault("min_len", 12)
    cfg.setdefault("buckets", [])
    cfg.setdefault("scrubs", [])
    return cfg

def ensure_dirs(base: Path):
    for sub in ["jsonl","md"]:
        (base/sub).mkdir(parents=True, exist_ok=True)

def read_rows(path: Path):
    suf = path.suffix.lower()
    if suf==".jsonl":
        with path.open("r", encoding="utf-8") as f:
            for line in f:
                line=line.strip()
                if not line: continue
                try:
                    yield json.loads(line)
                except:
                    yield {"timestamp": None, "model": None, "text": line}
    elif suf==".csv":
        with path.open("r", encoding="utf-8") as f:
            r=csv.DictReader(f)
            for row in r: yield row
    elif suf==".json":
        with path.open("r", encoding="utf-8") as f:
            data=json.load(f)
        # If it's an object with an array under a key, try common keys
        if isinstance(data, dict):
            for k in ["conversations","messages","items","data"]:
                if k in data and isinstance(data[k], list):
                    for row in data[k]:
                        yield row
                    return
            # fallback: treat dict itself as a row
            yield data
        elif isinstance(data, list):
            for row in data:
                yield row
        else:
            pass
    else:
        sys.exit("Use a .json, .jsonl, or .csv export")

FIELDS_TEXT = ["text","message","content","body","snippet"]
FIELDS_TS   = ["timestamp","time","created_at","date","ts"]
FIELDS_MODEL= ["model","engine","variant"]

# Some ChatGPT exports use nested structures:
NESTED_TEXT_FIELDS = [
    ("messages", "content"),           # {messages:[{content:"..."}]}
    ("mapping", None),                 # mapping dict of id -> {message:{content:{parts:[...]}}}
]

def extract_from_mapping(row):
    # Attempt to flatten OpenAI-style "mapping" objects
    mapping = row.get("mapping", {})
    if not isinstance(mapping, dict): return []
    out=[]
    for k,v in mapping.items():
        msg = v.get("message") if isinstance(v, dict) else None
        if not msg: continue
        content = msg.get("content") if isinstance(msg, dict) else None
        ts = msg.get("create_time") or msg.get("update_time") or row.get("create_time") or ""
        mdl = msg.get("metadata",{}).get("model_slug","")
        role = msg.get("author",{}).get("role","")
        text = ""
        if isinstance(content, dict) and isinstance(content.get("parts"), list):
            text = "\n".join([str(p) for p in content["parts"] if p is not None])
        elif isinstance(content, str):
            text = content
        if text:
            out.append({"timestamp": ts, "model": mdl or role, "text": text})
    return out

def get_text(row):
    # direct fields
    for k in FIELDS_TEXT:
        if k in row and row[k]: return str(row[k])
    # nested edge cases
    if "mapping" in row:
        # handled in caller by expanding; return empty to skip here
        return ""
    if "messages" in row and isinstance(row["messages"], list):
        parts=[]
        for m in row["messages"]:
            c = m.get("content") or m.get("text") or ""
            if isinstance(c, dict) and "parts" in c:
                parts += [str(p) for p in c["parts"] if p is not None]
            elif isinstance(c, str):
                parts.append(c)
        return "\n".join(parts)
    # fallback combine
    parts=[]
    for k in ["user","assistant","role","model","title","name"]:
        if k in row and row.get(k): parts.append(str(row[k]))
    return " ".join(parts)

def get_ts(row):
    for k in FIELDS_TS:
        if k in row and row[k]: return str(row[k])
    for k in ["create_time","update_time","created","modified"]:
        if k in row and row[k]: return str(row[k])
    return ""

def get_model(row):
    for k in FIELDS_MODEL:
        if k in row and row[k]: return str(row[k])
    # sometimes model is tucked under metadata
    if "metadata" in row and isinstance(row["metadata"], dict):
        return str(row["metadata"].get("model_slug","") or row["metadata"].get("model",""))
    return ""

def compile_scrubs(scrubs):
    return [(re.compile(s["pattern"]), s["replace"]) for s in scrubs]

def scrub_text(txt, scrubs):
    for pat, repl in scrubs:
        txt = pat.sub(repl, txt)
    return txt

def compile_buckets(buckets):
    out=[]
    for b in buckets:
        rx = re.compile(b["regex"], re.I|re.M)
        out.append( (b["key"], b.get("title", b["key"].title()), rx, b.get("private", False)) )
    return out

def md_header():
    now=datetime.now(UTC).strftime("%Y-%m-%d %H:%M:%S UTC")
    return f"---\ncreated: {now}\norigin: chat_export\n---\n"

def sha1(s): return hashlib.sha1(s.encode("utf-8")).hexdigest()

# -------- Main --------
def main():
    if len(sys.argv) < 2:
        print("Usage: python3 filter_chats.py <export.json|jsonl|csv> [filters.config.json]")
        sys.exit(1)
    export_path = Path(sys.argv[1])
    cfg_path = Path(sys.argv[2]) if len(sys.argv)>=3 else Path("filters.config.json")
    out_dir = Path("filtered")

    cfg = load_config(cfg_path)
    min_len = cfg["min_len"]
    scrubs = compile_scrubs(cfg["scrubs"])
    buckets = compile_buckets(cfg["buckets"])
    bucket_keys = [k for (k,_,_,_) in buckets] + ["misc"]
    private_buckets=set([k for (k,_,_,priv) in buckets if priv])

    ensure_dirs(out_dir)
    writers = {b: open(out_dir/"jsonl"/f"{b}.jsonl","w",encoding="utf-8") for b in bucket_keys}
    md_files = {b: open(out_dir/"md"/f"{b}.md","w",encoding="utf-8") for b in bucket_keys}
    for b in md_files:
        md_files[b].write(md_header()+f"# {b.title()} — Filtered Log\n\n")
    counts={b:0 for b in bucket_keys}

    # Read & expand rows (handle mapping-style)
    base_rows = list(read_rows(export_path))
    expanded=[]
    for r in base_rows:
        if isinstance(r, dict) and "mapping" in r:
            expanded.extend(extract_from_mapping(r))
        else:
            expanded.append(r)

    for row in expanded:
        if not isinstance(row, dict): 
            # if row is just a string
            raw = str(row)
            ts = ""
            mdl = ""
        else:
            raw = get_text(row)
            ts = get_ts(row)
            mdl = get_model(row)

        if not raw or len(raw) < min_len: 
            continue

        txt = scrub_text(raw, scrubs)
        hits=[]
        for (key, _title, rx, _priv) in buckets:
            if rx.search(txt): hits.append(key)
        if not hits: hits=["misc"]

        # stable id for dedupe
        base = (ts or "") + (txt[:64])
        _id = sha1(base)

        for b in hits:
            obj={"id": _id, "timestamp": ts, "model": mdl, "bucket": b, "text": txt}
            print(json.dumps(obj, ensure_ascii=False), file=writers[b])

            md_files[b].write(f"## {ts or 'No Timestamp'}\n")
            if mdl: md_files[b].write(f"*Model:* `{mdl}`  \n")
            md_files[b].write(f"*ID:* `{_id}`  \n\n")
            md_files[b].write(txt.strip()+"\n\n---\n\n")
            counts[b]+=1

    with open(out_dir/"index.md","w",encoding="utf-8") as idx:
        idx.write(md_header()+"# Filtered Export — Index\n\n")
        total=sum(counts.values())
        for b in bucket_keys:
            flag = " (private)" if b in private_buckets else ""
            idx.write(f"- **{b}**: {counts[b]} entries{flag}  \n")
        idx.write(f"\n**Total:** {total}\n")

    for f in writers.values(): f.close()
    for f in md_files.values(): f.close()
    print("✅ Done. See ./filtered/{jsonl,md}/ and ./filtered/index.md")

if __name__=="__main__":
    main()
