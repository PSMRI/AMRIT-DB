USE db_iemr;

CREATE INDEX idx_hbnc_visit_asha_id_id
ON db_iemr.t_hbnc_visit (asha_id, id);