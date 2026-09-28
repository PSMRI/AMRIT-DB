USE db_iemr;

-- Nikshay location rows loaded by migration use fixed IDs from a reserved range per
-- state (slot k: TU 10,000*(k+1)+1.., facility 1,000,000*(k+1)+1.., village
-- 10,000,000*(k+1)+1..), with room for 40 states. Move the auto-increment counters
-- above every reserved range, so rows added later by hand never land inside a
-- range a future state's load will use. MySQL never lowers a counter below the
-- current max ID, so this is safe to run on any DB.

ALTER TABLE m_nikshay_tu       AUTO_INCREMENT = 420001;
ALTER TABLE m_nikshay_facility AUTO_INCREMENT = 42000001;
ALTER TABLE m_nikshay_village  AUTO_INCREMENT = 420000001;
