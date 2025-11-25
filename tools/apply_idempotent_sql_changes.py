import re
from pathlib import Path
p = Path('src/main/resources/db/migration/dbiemr/V1__DB_IEMR.sql')
text = p.read_text(encoding='utf-8')
orig = text
# Comment active DROP TABLE statements (not already commented out)
text = re.sub(r"(?mi)^(\s*)(DROP\s+TABLE\b.*)$", r"\1-- \2", text)
# Ensure CREATE TABLE lines contain IF NOT EXISTS
# Add 'IF NOT EXISTS' after CREATE TABLE where missing
text = re.sub(r"(?mi)^(\s*)(CREATE\s+TABLE\s+)(?!IF\s+NOT\s+EXISTS)(.*)$", r"\1\2IF NOT EXISTS \3", text)
# Some lines use 'CREATE TABLE if not exist' typo; normalize to 'IF NOT EXISTS'
text = re.sub(r"(?mi)IF\s+NOT\s+EXIST\b", "IF NOT EXISTS", text)
# Write backup
bk = p.with_suffix('.sql.bak')
bk.write_text(orig, encoding='utf-8')
p.write_text(text, encoding='utf-8')
print('Patched', p)
print('Backup saved to', bk)
