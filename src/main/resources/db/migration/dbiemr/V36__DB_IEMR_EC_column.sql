

USE db_iemr;

ALTER TABLE t_eligible_couple_register
    ADD COLUMN is_kit_handed_over TINYINT(1) DEFAULT 0,
    ADD COLUMN is_kit_handed_over_date VARCHAR(255),
    ADD COLUMN kit_photo1 LONGTEXT,
    ADD COLUMN kit_photo2 LONGTEXT;
