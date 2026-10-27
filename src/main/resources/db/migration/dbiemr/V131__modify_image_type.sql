USE db_iemr;

alter table db_iemr.ahd_form modify image1 longblob;
alter table db_iemr.ahd_form modify image2 longblob;

alter table db_iemr.vhnc_form modify image1 longblob;
alter table db_iemr.vhnc_form modify image2 longblob;

alter table db_iemr.VHND_form modify image1 longblob;
alter table db_iemr.VHND_form modify image2 longblob;

alter table db_iemr.deworming_form modify image1 longblob;
alter table db_iemr.deworming_form modify image2 longblob;

alter table db_iemr.phc_review_meeting modify image1 longblob;
alter table db_iemr.phc_review_meeting modify image2 longblob;