import sys
from pathlib import Path

# Add path to import filter_chats module
sys.path.append(str(Path(__file__).resolve().parent.parent))
from filter_chats import extract_from_mapping, compile_scrubs, scrub_text


def test_extract_from_mapping():
    row = {
        "mapping": {
            "first": {
                "message": {
                    "create_time": 111,
                    "content": {"parts": ["hello"]},
                    "metadata": {"model_slug": "gpt-4"},
                    "author": {"role": "assistant"},
                }
            },
            "second": {
                "message": {
                    "create_time": 222,
                    "content": {"parts": ["hi", "there"]},
                    "author": {"role": "user"},
                }
            },
        }
    }

    expected = [
        {"timestamp": 111, "model": "gpt-4", "text": "hello"},
        {"timestamp": 222, "model": "user", "text": "hi\nthere"},
    ]
    assert extract_from_mapping(row) == expected


def test_scrub_text():
    scrubs = compile_scrubs(
        [
            {"pattern": r"secret", "replace": "[redacted]"},
            {"pattern": r"\d+", "replace": "#"},
        ]
    )
    original = "secret code 1234"
    assert scrub_text(original, scrubs) == "[redacted] code #"

