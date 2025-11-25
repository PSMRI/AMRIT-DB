use db_iemr;

ALTER TABLE db_iemr.t_videocallparameter ADD COLUMN IF NOT EXISTS RecordingFileName VARCHAR(255);
 