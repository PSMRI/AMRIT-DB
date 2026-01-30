USE db_iemr;

-- Align t_micro_birth_plan with MicroBirthPlan entity: community_support_contact length 100
ALTER TABLE db_iemr.t_micro_birth_plan
  MODIFY COLUMN community_support_contact VARCHAR(100) DEFAULT NULL;
