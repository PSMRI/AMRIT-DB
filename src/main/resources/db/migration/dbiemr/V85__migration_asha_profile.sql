USE db_iemr;

ALTER TABLE db_iemr.asha_profile
MODIFY profileImage longblob;

ALTER TABLE db_iemr.asha_profile
MODIFY dob varchar(100) NULL,
MODIFY date_of_joining varchar(100) NULL;

ALTER TABLE db_iemr.asha_profile
MODIFY employee_id INT NOT NULL,
MODIFY ProviderServiceMapID INT NULL;
