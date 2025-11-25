import re
from pathlib import Path

p = Path(r"src/main/resources/db/migration/dbiemr/V1__DB_IEMR.sql")
text = p.read_text(encoding='utf-8')
lines = text.splitlines()
new_lines = []
for line in lines:
    stripped = line.lstrip()
    # If line contains drop table (case-insensitive) and is not commented, comment it
    if re.match(r"(?i)\s*drop\s+table", line) and not stripped.startswith('--'):
        new_lines.append('-- ' + line)
        continue
    # For CREATE TABLE, ensure IF NOT EXISTS (case-insensitive)
    m = re.match(r"(\s*)(CREATE\s+TABLE)(.*)$", line, flags=re.IGNORECASE)
    if m:
        prefix, create_clause, rest = m.groups()
        # if 'IF NOT EXISTS' not in the rest or in clause
        if re.search(r"(?i)if\s+not\s+exist(s)?", line) is None:
            # Normalize to uppercase CREATE TABLE IF NOT EXISTS
            new_line = f"{prefix}CREATE TABLE IF NOT EXISTS{rest}"
            new_lines.append(new_line)
            continue
    new_lines.append(line)

p.write_text('\n'.join(new_lines), encoding='utf-8')
print('Updated file:', p)
