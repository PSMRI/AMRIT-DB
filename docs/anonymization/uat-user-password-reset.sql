-- UAT user password reset - run against the TARGET (UAT) db_iemr after every
-- anonymization refresh.
--
-- The anonymizer SUPPRESSes m_user.Password / CZPassword / AgentPassword so
-- production credentials never reach UAT. This script restores usable logins
-- by setting a known test password for every active user.
--
-- Test password: UatTest@123
-- Hash format matches Common-API SecurePassword: PBKDF2WithHmacSHA512,
-- "iterations:saltHex:hashHex" with 1001 iterations and a 16-byte salt.
--
-- Regenerate the hash if the test password must change:
--   python3 -c "import hashlib,os; s=os.urandom(16); \
--     print(f\"1001:{s.hex()}:{hashlib.pbkdf2_hmac('sha512', b'<newpass>', s, 1001, dklen=64).hex()}\")"

UPDATE db_iemr.m_user
SET Password = '1001:193d6af529194c9431d6d86222252106:45d5583170d7ab133f3a522effb408859064d5e9e14aa6b6a5b291fc9b265f6dd7314f39b89eaa1c7c21cd91f4edc8f42ba70a603c4e0c9f2b56dc8ed2bdb6b0'
WHERE Deleted = 0 OR Deleted IS NULL;
