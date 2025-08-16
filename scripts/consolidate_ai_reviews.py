import sys, re, pathlib
src_dir = pathlib.Path(sys.argv[1])
out_path = pathlib.Path(sys.argv[2])

sections = {
  "brief": r"^## One-paragraph brief",
  "why": r"^## Why now",
  "success": r"^## Success criteria",
  "impl": r"^## Implementation notes",
  "partners": r"^## Suggested partners",
}

def split_sections(text):
    lines = text.splitlines()
    idx = {}
    for key, pat in sections.items():
        for i,l in enumerate(lines):
            if re.search(pat, l.strip(), re.I):
                idx[key]=i
                break
    blocks = {}
    keys_order = ["brief","why","success","impl","partners"]
    for i,k in enumerate(keys_order):
        if k in idx:
            start = idx[k]+1
            # find next section or EOF
            next_i = min([idx[v] for v in keys_order[i+1:] if v in idx] or [len(lines)])
            blocks[k] = "\n".join([ln for ln in lines[start:next_i]]).strip()
    title = None
    for l in lines:
        if l.startswith("# "):
            title = l.strip()
            break
    return title, blocks

files = sorted([p for p in src_dir.glob("*.md") if p.is_file()])
if not files:
    print("No inputs found", file=sys.stderr); sys.exit(1)

titles = []
collected = {k:set() for k in ["success","impl","partners"]}
first_brief=None; first_why=None; title_line=None

for p in files:
    t = p.read_text(encoding="utf-8")
    title, blocks = split_sections(t)
    if title and not title_line: title_line = title
    if blocks.get("brief") and not first_brief: first_brief = blocks["brief"].strip()
    if blocks.get("why") and not first_why: first_why = blocks["why"].strip()
    for k in ["success","impl","partners"]:
        b = blocks.get(k,"").strip()
        if not b: continue
        # split bullets if present; else add whole block
        if any(s in b for s in ["\n- ","\n* ","- "]):
            for line in b.splitlines():
                line=line.rstrip()
                if line.lstrip().startswith(("-", "*")):
                    collected[k].add(line.strip())
        else:
            for line in b.splitlines():
                if line.strip():
                    if not line.lstrip().startswith(("-", "*")):
                        line = "- " + line.strip()
                    collected[k].add(line)

# stable order
def tidy(bullets):
    return "\n".join(sorted(bullets, key=lambda s: s.lower()))

out = []
out.append(title_line or "# Project Eden — Review Scroll")
out.append("")
out.append("## One-paragraph brief")
out.append(first_brief or "")
out.append("")
out.append("## Why now")
out.append(first_why or "")
out.append("")
out.append("## Success criteria (12 weeks)")
out.append(tidy(collected["success"]))
out.append("")
out.append("## Implementation notes")
out.append(tidy(collected["impl"]))
out.append("")
out.append("## Suggested partners")
out.append(tidy(collected["partners"]))
out.append("")
out.append("> Updated from v1.5.5 → v1.5.6 by consensus (2025-08-16)")
out_path.write_text("\n".join(out).strip()+"\n", encoding="utf-8")
print(f"Wrote: {out_path}")
