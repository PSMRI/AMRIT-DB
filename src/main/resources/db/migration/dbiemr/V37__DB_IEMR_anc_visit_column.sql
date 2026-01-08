USE db_iemr;

ALTER TABLE t_anc_visit
ADD COLUMN file_path VARCHAR(255),
ADD COLUMN serial_no VARCHAR(100),
ADD COLUMN method_of_termination VARCHAR(100),
ADD COLUMN method_of_termination_id INT,
ADD COLUMN termination_done_by VARCHAR(100),
ADD COLUMN termination_done_by_id INT,
ADD COLUMN is_paiucd_id INT,
ADD COLUMN is_paiucd VARCHAR(10),
ADD COLUMN remarks TEXT,
ADD COLUMN abortion_img1 VARCHAR(255),
ADD COLUMN abortion_img2 VARCHAR(255),
ADD COLUMN place_of_death VARCHAR(100),
ADD COLUMN place_of_death_id INT,
ADD COLUMN other_place_of_death VARCHAR(255),
ADD COLUMN visit_date TIMESTAMP,
ADD COLUMN lmp_date TIMESTAMP,
ADD COLUMN is_YesOrNo BOOLEAN,
ADD COLUMN date_of_sterilisation TIMESTAMP,
ADD COLUMN place_of_anc VARCHAR(100),
ADD COLUMN place_of_ancId INT;
