
USE db_iemr;

ALTER TABLE db_iemr.ELIGIBLE_COUPLE_TRACKING
    ADD COLUMN date_of_antra_injection TIMESTAMP NULL,
    ADD COLUMN due_date_of_antra_injection VARCHAR(255),
    ADD COLUMN mpa_file VARCHAR(255),
    ADD COLUMN antra_dose VARCHAR(100),
    ADD COLUMN discharge_summary1 VARCHAR(255),
    ADD COLUMN discharge_summary2 VARCHAR(255);
