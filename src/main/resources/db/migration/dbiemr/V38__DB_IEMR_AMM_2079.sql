USE db_iemr;
ALTER TABLE db_iemr.vhnc_form
    ADD COLUMN village_name VARCHAR(255),
    ADD COLUMN anm INT,
    ADD COLUMN aww INT,
    ADD COLUMN no_of_pragnent_women INT,
    ADD COLUMN no_of_lacting_mother INT,
    ADD COLUMN no_of_committee INT,
    ADD COLUMN followup_previous TINYINT(1);

