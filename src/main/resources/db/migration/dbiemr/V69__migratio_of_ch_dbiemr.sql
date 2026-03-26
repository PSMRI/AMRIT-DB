USE db_iemr;

ALTER TABLE sammelan_record
DROP INDEX uk_asha_month;

ALTER TABLE sammelan_record
ADD UNIQUE KEY uk_asha_month (`asha_id`, `meeting_date`);