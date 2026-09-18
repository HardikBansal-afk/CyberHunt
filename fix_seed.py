#!/usr/bin/env python3
r"""
fix_seed.py -- repair CyberHunt seed.sql

Problem
-------
Some challenge blocks were generated without a `description` value, e.g.

    INSERT INTO challenges (event_id, title, description, category,
                            difficulty, points, flag_hash, is_active)
    VALUES (
      (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
      'Which storage class keeps a local variable value between calls?',
      'C Coding',                 <-- this is the CATEGORY, sitting in description
      'medium'::difficulty_level,
      10,
      'static',
      TRUE
    )

8 target columns, 7 values -> Postgres raises:
    ERROR: INSERT has more target columns than expressions

Fix
---
Walk every `INSERT INTO challenges (...) VALUES (...)` block, split the VALUES
list at top level (respecting parentheses and '' escaped quotes), and when a
block has 7 values instead of 8, re-insert a description right after the title.

Also strips Word/markdown escape artifacts (\|, \%, \0, \_, \*) that leaked in
from the source .docx and would otherwise show up literally in the UI.

Usage
-----
    python3 fix_seed.py seed.sql               # writes seed_fixed.sql
    python3 fix_seed.py seed.sql out.sql       # explicit output name
"""

import re
import sys

INSERT_RE = re.compile(
    r"INSERT INTO challenges \((?P<cols>[^)]*)\)\s*\n\s*VALUES \(\n",
    re.MULTILINE,
)


def split_top_level(body: str):
    """Split a VALUES body on commas that are not inside () or '...'."""
    parts, buf = [], []
    depth = 0
    in_str = False
    i = 0
    while i < len(body):
        ch = body[i]
        if in_str:
            if ch == "'":
                if i + 1 < len(body) and body[i + 1] == "'":
                    buf.append("''")
                    i += 2
                    continue
                in_str = False
            buf.append(ch)
        else:
            if ch == "'":
                in_str = True
                buf.append(ch)
            elif ch == "(":
                depth += 1
                buf.append(ch)
            elif ch == ")":
                depth -= 1
                buf.append(ch)
            elif ch == "," and depth == 0:
                parts.append("".join(buf))
                buf = []
            else:
                buf.append(ch)
        i += 1
    parts.append("".join(buf))
    return parts


def find_values_body(text: str, start: int):
    """Given index just after 'VALUES (', return (body, index_of_closing_paren)."""
    depth = 1
    in_str = False
    i = start
    while i < len(text):
        ch = text[i]
        if in_str:
            if ch == "'":
                if i + 1 < len(text) and text[i + 1] == "'":
                    i += 2
                    continue
                in_str = False
        else:
            if ch == "'":
                in_str = True
            elif ch == "(":
                depth += 1
            elif ch == ")":
                depth -= 1
                if depth == 0:
                    return text[start:i], i
        i += 1
    raise ValueError("unterminated VALUES list")


def unescape_docx(sql: str) -> str:
    for bad, good in ((r"\|", "|"), (r"\%", "%"), (r"\_", "_"),
                      (r"\*", "*"), (r"\0", "0")):
        sql = sql.replace(bad, good)
    return sql


# Proper descriptions for the 8 blocks whose description was dropped by the
# generator. Keyed by title; quotes are already SQL-escaped ('').
DESCRIPTION_OVERRIDES = {
    "Which storage class keeps a local variable value between function calls?":
        "Identify the C storage class that preserves a local variable''s value "
        "between function calls.",
    "Which preprocessor directive is commonly used to include a header file?":
        "Identify the C preprocessor directive used to include a header file.",
    "What type of bug occurs when allocated memory is never released?":
        "Identify the class of bug that occurs when dynamically allocated memory "
        "is never freed.",
    "Which memory region normally stores local automatic variables?":
        "Identify the memory region in which local automatic variables are "
        "normally stored.",
    "What type of array is commonly used to represent a string in C?":
        "Identify the array type used to represent a string in C.",
    "What is the process of converting a variable from one type to another called?":
        "Identify the term for converting a variable from one data type to another.",
    "Which function is used to allocate zero-initialized memory for an array?":
        "Identify the C library function that allocates zero-initialized memory "
        "for an array.",
    "What is the technique of allocating memory during program execution called?":
        "Identify the term for allocating memory during program execution.",
}


def description_for(title_literal: str) -> str:
    """title_literal includes the surrounding single quotes."""
    inner = title_literal.strip()[1:-1].strip()
    text = DESCRIPTION_OVERRIDES.get(inner)
    if text is None:
        text = inner  # fall back to reusing the title
    return "'" + text + "'"


def fix(text: str):
    out = []
    pos = 0
    repaired = []

    for m in INSERT_RE.finditer(text):
        cols = [c.strip() for c in m.group("cols").split(",")]
        body, close = find_values_body(text, m.end())
        vals = split_top_level(body)

        if len(vals) == len(cols):
            continue  # this block is fine, leave it byte-for-byte alone

        if len(vals) == len(cols) - 1 and "description" in cols:
            title = vals[1].strip().rstrip("\n").strip()
            desc = description_for(title)
            new_vals = vals[:2] + ["\n    " + desc] + vals[2:]
            new_body = ",".join(new_vals)
            out.append(text[pos:m.end()])
            out.append(new_body)
            pos = close
            repaired.append(title[:70])
        else:
            raise SystemExit(
                f"Unhandled block near offset {m.start()}: "
                f"{len(vals)} values for {len(cols)} columns"
            )

    out.append(text[pos:])
    return unescape_docx("".join(out)), repaired


def main():
    src = sys.argv[1] if len(sys.argv) > 1 else "seed.sql"
    dst = sys.argv[2] if len(sys.argv) > 2 else "seed_fixed.sql"

    with open(src, encoding="utf-8") as fh:
        text = fh.read()

    fixed, repaired = fix(text)

    with open(dst, "w", encoding="utf-8") as fh:
        fh.write(fixed)

    print(f"Repaired {len(repaired)} INSERT block(s):")
    for t in repaired:
        print("  -", t)
    print(f"\nWrote {dst}")


if __name__ == "__main__":
    main()
