USE dbiemr;

-- Align t_micro_birth_plan with MicroBirthPlan entity: community_support_contact length 100
ALTER TABLE dbiemr.t_micro_birth_plan
  MODIFY COLUMN community_support_contact VARCHAR(255) DEFAULT NULL;
