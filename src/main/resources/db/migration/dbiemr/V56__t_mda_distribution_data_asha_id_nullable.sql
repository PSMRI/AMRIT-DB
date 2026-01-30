USE db_iemr;

-- MdaDistributionData entity does not map AshaId; allow NULL so entity inserts succeed
ALTER TABLE db_iemr.t_mda_distribution_data
  MODIFY COLUMN AshaId INT NULL DEFAULT NULL;
