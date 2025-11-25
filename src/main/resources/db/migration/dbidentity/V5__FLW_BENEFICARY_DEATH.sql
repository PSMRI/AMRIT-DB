use db_identity;
-- add beneficiary death column (make idempotent: add only if not exists)
alter table i_beneficiarydetails_rmnch add column if not exists isDeath TINYINT(1) DEFAULT 0;
alter table i_beneficiarydetails_rmnch add column if not exists isDeathValue VARCHAR(50) DEFAULT NULL;
alter table i_beneficiarydetails_rmnch add column if not exists timeOfDeath VARCHAR(20) DEFAULT NULL;
alter table i_beneficiarydetails_rmnch add column if not exists reasonOfDeath VARCHAR(255) DEFAULT NULL;
alter table i_beneficiarydetails_rmnch add column if not exists reasonOfDeathId INT DEFAULT NULL;
alter table i_beneficiarydetails_rmnch add column if not exists placeOfDeath VARCHAR(255) DEFAULT NULL;
alter table i_beneficiarydetails_rmnch add column if not exists placeOfDeathId INT DEFAULT NULL;
alter table i_beneficiarydetails_rmnch add column if not exists otherPlaceOfDeath VARCHAR(255) DEFAULT NULL;
alter table i_beneficiarydetails_rmnch add column if not exists dateOfDeath VARCHAR(200) DEFAULT NULL;
