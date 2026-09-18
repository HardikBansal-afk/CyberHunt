#!/usr/bin/env python3
"""
update_seed.py - updates CyberHunt's database/seed.sql from the new CYBER_HUNT (4) docx.

What it does
  A) Rewrites challenges #61-#120 (Password Puzzles) with the real questions, answers and
     hints from the new docx (the old file had 'TBD' placeholders).
  B) Fixes wrong Hidden Clue rows: #43, #46, #47, #50, #58, #60, plus stray '#' in hints of #20/#40.
  C) With --extra: removes stray "# <emoji>" markers that got glued onto 8 answers elsewhere
     (#140, #160, #200, #220, #260, #280, #320, #340) - those answers can never match otherwise.

Usage (run from the repo root, in the VS Code terminal):
    python update_seed.py            # DRY RUN: shows what would change, writes nothing
    python update_seed.py --apply    # writes database/seed.sql (backup: seed.sql.bak)
    python update_seed.py --apply --extra
    python update_seed.py --file path/to/seed.sql
Safe to run twice: already-applied fixes are detected and skipped.
"""
import argparse, json, re, shutil, sys
from pathlib import Path

PASSWORD_PUZZLES = json.loads(r"""[
 {
  "q": "What word describes a secret code used to access an account?",
  "a": "Password",
  "h": [
   "You use it to log in",
   "It should be kept secret",
   "It protects your account"
  ]
 },
 {
  "q": "What device is commonly used to unlock a phone using your face?",
  "a": "Face",
  "h": [
   "It is part of your identity",
   "Cameras can recognize it",
   "It is on the front of your head"
  ]
 },
 {
  "q": "What symbol is commonly used in email addresses?",
  "a": "@",
  "h": [
   "symbol of AT",
   "It separates the username and domain",
   "Its symbol is @"
  ]
 },
 {
  "q": "What does a website usually begin with when using secure communication?",
  "a": "HTTPS",
  "h": [
   "It is related to HTTP",
   "The extra letter matters",
   "The S stands for secure"
  ]
 },
 {
  "q": "What is the secret number used with a bank card?",
  "a": "PIN",
  "h": [
   "It usually contains digits",
   "You enter it at an ATM",
   "It stands for Personal Identification Number"
  ]
 },
 {
  "q": "What malicious software can copy itself and spread between computers?",
  "a": "Worm",
  "h": [
   "It is malware",
   "It can spread automatically",
   "Its name is also an animal"
  ]
 },
 {
  "q": "What malicious program disguises itself as legitimate software?",
  "a": "Trojan",
  "h": [
   "Think of Greek mythology",
   "It hides its true purpose",
   "It is named after a famous horse"
  ]
 },
 {
  "q": "What technology converts readable information into an unreadable form?",
  "a": "Encryption",
  "h": [
   "It protects information",
   "A key is often involved",
   "It turns plaintext into ciphertext"
  ]
 },
 {
  "q": "What do we call a person who illegally accesses computer systems?",
  "a": "Hacker",
  "h": [
   "They work with computers",
   "They may exploit vulnerabilities",
   "The word starts with H"
  ]
 },
 {
  "q": "What is the process of proving who you are online?",
  "a": "Authentication",
  "h": [
   "It happens during login",
   "Passwords can be used",
   "It verifies identity"
  ]
 },
 {
  "q": "What device connects multiple devices within a network?",
  "a": "Router",
  "h": [
   "It directs traffic",
   "You may have one at home",
   "It connects networks"
  ]
 },
 {
  "q": "What is a fake message designed to steal personal information called?",
  "a": "Phishing",
  "h": [
   "It often arrives by email",
   "It tries to trick you",
   "It sounds like fishing"
  ]
 },
 {
  "q": "What is the name of Google's web browser?",
  "a": "Chrome",
  "h": [
   "It is made by Google",
   "It is used to browse websites",
   "Its logo has red, yellow, green and blue"
  ]
 },
 {
  "q": "What is the general term for information, such as a username and password, that proves your identity when you log in?",
  "a": "Credential",
  "h": [
   "It proves something about your identity",
   "Passwords are one type",
   "It can be used to log in"
  ]
 },
 {
  "q": "What do we call information that is hidden from unauthorized people?",
  "a": "Confidential",
  "h": [
   "It should not be publicly shared",
   "Sensitive information can be this",
   "It means private or secret"
  ]
 },
 {
  "q": "What is the common abbreviation for a Virtual Private Network?",
  "a": "VPN",
  "h": [
   "It can improve privacy online",
   "It creates an encrypted connection",
   "It has three letters"
  ]
 },
 {
  "q": "What do we call a weakness in computer software?",
  "a": "Vulnerability",
  "h": [
   "Attackers may exploit it",
   "Security teams try to fix it",
   "It means a weakness"
  ]
 },
 {
  "q": "What is the term for unwanted email?",
  "a": "Spam",
  "h": [
   "It fills inboxes",
   "It can contain advertisements",
   "It is also a canned meat brand"
  ]
 },
 {
  "q": "What is the secret piece of information used in cryptography?",
  "a": "Key",
  "h": [
   "It can unlock encrypted information",
   "It works with encryption",
   "You use one to open a lock too"
  ]
 },
 {
  "q": "What is the name of Microsoft's operating system?",
  "a": "Windows",
  "h": [
   "It runs on PCs",
   "Microsoft developed it",
   "Its name relates to something in a house"
  ]
 },
 {
  "q": "What attack tries many possible passwords until one works?",
  "a": "Bruteforce",
  "h": [
   "It relies on repeated attempts",
   "Computers can automate it",
   "It tries combinations one after another"
  ]
 },
 {
  "q": "What attack uses a list of commonly used passwords?",
  "a": "Dictionary",
  "h": [
   "It doesn't necessarily try every combination",
   "Common words are useful to the attacker",
   "Think about a collection of words"
  ]
 },
 {
  "q": "What technique adds random data to a password before hashing?",
  "a": "Salting",
  "h": [
   "It strengthens password storage",
   "It is combined with a hash",
   "Think of adding something before cooking"
  ]
 },
 {
  "q": "What is the process of converting a password into a fixed length value?",
  "a": "Hashing",
  "h": [
   "It is commonly one way",
   "Password databases use it",
   "SHA 256 is an example"
  ]
 },
 {
  "q": "What attack secretly intercepts communication between two parties?",
  "a": "MitM",
  "h": [
   "The attacker is in the middle",
   "Communication is intercepted",
   "It is abbreviated using four letters"
  ]
 },
 {
  "q": "What attack overwhelms a server with traffic from many systems?",
  "a": "DDoS",
  "h": [
   "It targets availability",
   "Many devices may participate",
   "It stands for Distributed Denial of Service"
  ]
 },
 {
  "q": "What malware encrypts files and demands payment?",
  "a": "Ransomware",
  "h": [
   "Your files may become inaccessible",
   "Money is demanded",
   "The name combines ransom and software"
  ]
 },
 {
  "q": "What is a fake login page designed to steal credentials called?",
  "a": "Phishing",
  "h": [
   "It looks like a legitimate website",
   "Users enter their credentials",
   "It is a type of social engineering"
  ]
 },
 {
  "q": "What security system monitors and filters network traffic?",
  "a": "Firewall",
  "h": [
   "It can block suspicious traffic",
   "It protects networks",
   "Think of a wall against fire"
  ]
 },
 {
  "q": "What protocol is commonly used to securely transfer web pages?",
  "a": "HTTPS",
  "h": [
   "It is an HTTP extension",
   "It uses encryption",
   "Look at the beginning of secure websites"
  ]
 },
 {
  "q": "What type of encryption uses the same key to encrypt and decrypt data?",
  "a": "Symmetric",
  "h": [
   "One key is involved",
   "It is generally fast",
   "Its opposite is asymmetric"
  ]
 },
 {
  "q": "What encryption system uses a public and private key?",
  "a": "Asymmetric",
  "h": [
   "Two keys are involved",
   "One key can be publicly shared",
   "RSA is an example"
  ]
 },
 {
  "q": "What attack injects malicious database commands through user input?",
  "a": "SQLi",
  "h": [
   "It targets databases",
   "SQL is involved",
   "The full term starts with SQL"
  ]
 },
 {
  "q": "What vulnerability allows malicious scripts to execute in another user's browser?",
  "a": "XSS",
  "h": [
   "It targets web applications",
   "JavaScript may be involved",
   "It has three letters"
  ]
 },
 {
  "q": "What process converts ciphertext back into readable information?",
  "a": "Decryption",
  "h": [
   "It reverses encryption",
   "A key may be required",
   "It produces plaintext"
  ]
 },
 {
  "q": "What is a security update that fixes a vulnerability called?",
  "a": "Patch",
  "h": [
   "Software developers release it",
   "It fixes bugs or security issues",
   "Think of repairing a hole"
  ]
 },
 {
  "q": "What attack tricks users into revealing confidential information through psychological manipulation?",
  "a": "Social",
  "h": [
   "It targets people rather than only machines",
   "It exploits human behavior",
   "It is commonly followed by \"engineering.\""
  ]
 },
 {
  "q": "What security principle gives users only the access they actually need?",
  "a": "LeastPrivilege",
  "h": [
   "It limits permissions",
   "Users shouldn't get unnecessary access",
   "Think \"Least ______.\""
  ]
 },
 {
  "q": "What is an additional authentication factor besides a password called?",
  "a": "MFA",
  "h": [
   "It improves login security",
   "It may involve a phone or biometric",
   "It has three letters"
  ]
 },
 {
  "q": "What attack attempts to steal a user's active login session?",
  "a": "SessionHijacking",
  "h": [
   "It targets sessions",
   "Cookies may be involved",
   "The session is taken over"
  ]
 },
 {
  "q": "What cryptographic algorithm produces a 256 bit hash commonly used for integrity verification?",
  "a": "SHA256",
  "h": [
   "It belongs to SHA 2",
   "The number is 256",
   "SHA + 256"
  ]
 },
 {
  "q": "What attack exploits differences in how applications process SQL queries?",
  "a": "SQLi",
  "h": [
   "It targets databases",
   "User input is often involved",
   "Think of SQL Injection"
  ]
 },
 {
  "q": "What vulnerability occurs when an application executes commands supplied by an attacker?",
  "a": "Injection",
  "h": [
   "It involves untrusted input",
   "SQL injection is one example",
   "The attack inserts something malicious"
  ]
 },
 {
  "q": "What attack exploits a program's failure to properly handle memory boundaries?",
  "a": "Overflow",
  "h": [
   "It involves memory",
   "Buffers are involved",
   "Think \"buffer ______.\""
  ]
 },
 {
  "q": "What attack uses previously captured authentication data to gain access later?",
  "a": "Replay",
  "h": [
   "The attacker reuses something",
   "It may involve captured packets",
   "The word means to play again"
  ]
 },
 {
  "q": "What security property ensures information has not been modified without authorization?",
  "a": "Integrity",
  "h": [
   "It is one of the CIA triad",
   "It protects against unauthorized modification",
   "CIA stands for Confidentiality, Integrity, Availability"
  ]
 },
 {
  "q": "What security property ensures authorized users can access information when needed?",
  "a": "Availability",
  "h": [
   "It is part of CIA",
   "Downtime affects it",
   "It starts with A"
  ]
 },
 {
  "q": "What security property prevents unauthorized disclosure of information?",
  "a": "Confidentiality",
  "h": [
   "It is part of CIA",
   "Encryption helps achieve it",
   "It means keeping information secret"
  ]
 },
 {
  "q": "What security vulnerability involves sending malicious instructions through a web application's input fields?",
  "a": "Injection",
  "h": [
   "User input is manipulated",
   "SQL injection is a common example",
   "It is a major web application security category"
  ]
 },
 {
  "q": "What mechanism securely stores a user's login state between requests in many web applications?",
  "a": "Cookie",
  "h": [
   "Browsers store it",
   "It can contain session information",
   "It is named after something you can eat"
  ]
 },
 {
  "q": "What protocol translates domain names into IP addresses?",
  "a": "DNS",
  "h": [
   "It works behind the scenes when visiting websites",
   "It resolves names such as google.com",
   "It stands for Domain Name System"
  ]
 },
 {
  "q": "What protocol automatically assigns IP addresses to devices on a network?",
  "a": "DHCP",
  "h": [
   "It happens when devices join networks",
   "It assigns IP configuration",
   "It has four letters"
  ]
 },
 {
  "q": "What command line tool is commonly used to test network connectivity using ICMP?",
  "a": "Ping",
  "h": [
   "It sends packets to another host",
   "It measures response time",
   "It sounds like a sonar signal"
  ]
 },
 {
  "q": "What system translates human readable domain names into numerical network addresses?",
  "a": "DNS",
  "h": [
   "Websites use domain names",
   "Computers communicate using IP addresses",
   "It stands for Domain Name System"
  ]
 },
 {
  "q": "What attack involves pretending to be a legitimate device or user?",
  "a": "Spoofing",
  "h": [
   "The attacker pretends to be legitimate",
   "DNS can be involved",
   "The word means impersonation"
  ]
 },
 {
  "q": "What type of malware secretly records a user's keystrokes?",
  "a": "Keylogger",
  "h": [
   "It monitors typing",
   "Passwords can be captured",
   "Think Key + Logger"
  ]
 },
 {
  "q": "What malicious software provides unauthorized remote access to a computer?",
  "a": "RAT",
  "h": [
   "It allows remote control",
   "It is a type of malware",
   "It stands for Remote Access Trojan"
  ]
 },
 {
  "q": "What technique hides secret information inside an image, audio file, or other medium?",
  "a": "Steganography",
  "h": [
   "The message is hidden rather than simply encrypted",
   "Images can contain hidden data",
   "It is associated with the idea of covered writing"
  ]
 },
 {
  "q": "What attack exploits a previously unknown software vulnerability?",
  "a": "ZeroDay",
  "h": [
   "Developers may not yet have a fix",
   "The vulnerability is newly discovered",
   "It has \"zero days\" of prior warning or patching"
  ]
 },
 {
  "q": "What security technique verifies that a digital message came from the claimed sender and was not altered?",
  "a": "Signature",
  "h": [
   "It uses cryptographic methods",
   "It can provide authenticity and integrity",
   "Think of signing a document digitally"
  ]
 }
]""")

# (block number, old text, new text) - each must match exactly once inside that block
HIDDEN_CLUE_PATCHES = [
    (20, "'My normal surface is dark. #'", "'My normal surface is dark'"),
    (40, "'I can grant access. #'", "'I can grant access'"),
    (43, "'HCAOBOW'", "'HCAOBBOW'"),
    (46, "'YH'", "'YBERH'"),
    (47, "'EUEPSWRD'", "'EUEPSWR'"),
    (50, "'Is'", "'is old'"),
    (58, "LFMMP", "IFMMP"),
    (58, "'KELLO'", "'HELLO'"),
    (58, "('L becomes K', 1, 1)", "('I becomes H', 1, 1)"),
    (60, "'AYT'", "'CODE'"),
]

def sql(s):
    return s.replace("'", "''")

def build_block(num, item):
    idx = num - 61
    diff, pts = (("easy", 5) if idx < 20 else ("medium", 10) if idx < 40 else ("hard", 15))
    hints = ",\n".join(f"  ('{sql(h)}', {i}, {i})" for i, h in enumerate(item["h"], 1))
    return f"""-- [{num}/360] Password Puzzles / {diff} / Password Puzzle #{num}
WITH new_challenge AS (
  INSERT INTO challenges (event_id, title, description, category, difficulty, points, flag_hash, is_active)
  VALUES (
    (SELECT id FROM events WHERE slug = 'cyberhunt-2026'),
    'Password Puzzle #{num}',
    '{sql(item["q"])}',
    'Password Puzzles',
    '{diff}'::difficulty_level,
    {pts},
    '{sql(item["a"])}',
    TRUE
  )
  RETURNING id
)
INSERT INTO hints (challenge_id, hint_text, point_cost, order_index)
SELECT new_challenge.id, v.hint_text, v.point_cost, v.order_index
FROM new_challenge, (VALUES
{hints}
) AS v(hint_text, point_cost, order_index);

"""

def marker(n):
    return f"-- [{n}/360]"

def block_span(text, n):
    s = text.find(marker(n))
    if s < 0:
        return None
    e = text.find(marker(n + 1), s)
    return s, (len(text) if e < 0 else e)

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--file", default="database/seed.sql")
    ap.add_argument("--apply", action="store_true")
    ap.add_argument("--extra", action="store_true")
    args = ap.parse_args()

    path = Path(args.file)
    if not path.exists():
        sys.exit(f"Cannot find {path}. Run from the repo root or pass --file.")
    text = path.read_text(encoding="utf-8")
    manual = 0

    # B) Hidden Clue patches (done first so block numbering is untouched)
    for n, old, new in HIDDEN_CLUE_PATCHES:
        span = block_span(text, n)
        if not span:
            print(f"[MANUAL] Block #{n} not found"); manual += 1; continue
        s, e = span
        blk = text[s:e]
        if blk.count(old) == 1:
            text = text[:s] + blk.replace(old, new) + text[e:]
            print(f"[OK]     #{n}: {old!r} -> {new!r}")
        elif old not in blk and new in blk:
            print(f"[SKIP]   #{n}: already applied ({new!r})")
        else:
            print(f"[MANUAL] #{n}: expected exactly 1 match of {old!r}, found {blk.count(old)}"); manual += 1

    # A) rewrite #61-#120
    a, b = block_span(text, 61), block_span(text, 120)
    if not a or not b:
        print("[MANUAL] Could not find blocks #61 / #120 - password puzzles NOT updated"); manual += 1
    else:
        start, end = a[0], b[1]
        new_blocks = "".join(build_block(61 + i, it) for i, it in enumerate(PASSWORD_PUZZLES))
        text = text[:start] + new_blocks + text[end:]
        print(f"[OK]     #61-#120 rewritten from the new docx (60 password puzzles)")

    # C) optional stray-marker cleanup
    if args.extra:
        text, k = re.subn(r"\s#\s[\U0001F7E2\U0001F7E1\U0001F534]'", "'", text)
        print(f"[OK]     --extra: removed {k} stray '# <emoji>' markers (expected 8)")

    if not args.apply:
        print("\nDRY RUN - nothing written. Re-run with --apply to save.")
    else:
        shutil.copyfile(path, path.with_suffix(path.suffix + ".bak"))
        path.write_text(text, encoding="utf-8")
        print(f"\nSaved {path} (backup: {path.name}.bak)")
    if manual:
        print(f"{manual} item(s) need manual attention - see [MANUAL] lines.")

if __name__ == "__main__":
    main()
