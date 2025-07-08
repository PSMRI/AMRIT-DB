
use db_iemr;

-- take backup
CREATE TABLE t_hbnc_visit_backup AS SELECT * FROM t_hbnc_visit;

--  Drop old columns not in your entity

ALTER TABLE t_hbnc_visit
DROP COLUMN all_limbs_limp,
DROP COLUMN baby_cry_continuously,
DROP COLUMN baby_eyes_swollen,
DROP COLUMN baby_fed_properly,
DROP COLUMN baby_kept_warm,
DROP COLUMN baby_referred,
DROP COLUMN baby_temp,
DROP COLUMN baby_yellow,
DROP COLUMN bloated_stomach,
DROP COLUMN breath_fast,
DROP COLUMN chest_drawing,
DROP COLUMN cold_on_touch,
DROP COLUMN crt_weak_stopped,
DROP COLUMN baby_referral_date,
DROP COLUMN mother_referral_date,
DROP COLUMN feeding_less_stopped,
DROP COLUMN foul_discharge,
DROP COLUMN mother_breast_problem,
DROP COLUMN mother_less_no_milk,
DROP COLUMN mother_referred,
DROP COLUMN mother_speaks_abnormally,
DROP COLUMN mother_temp,
DROP COLUMN num_pad_changed,
DROP COLUMN num_times_full_meal,
DROP COLUMN baby_referral_place_other,
DROP COLUMN mother_referral_place_other,
DROP COLUMN baby_referral_place,
DROP COLUMN mother_referral_place,
DROP COLUMN pus_navel,
DROP COLUMN supervisor,
DROP COLUMN supervisor_comment,
DROP COLUMN supervisor_name,
DROP COLUMN supervisor_sign_date,
DROP COLUMN visit_no;

-- Add new columns (only if not already in table)

ALTER TABLE t_hbnc_visit
ADD COLUMN hbnc_visit_day VARCHAR(255) DEFAULT NULL,
ADD COLUMN hbnc_due_date DATE DEFAULT NULL,
ADD COLUMN date_of_death DATE DEFAULT NULL,
ADD COLUMN reason_for_death VARCHAR(255) DEFAULT NULL,
ADD COLUMN place_of_death VARCHAR(255) DEFAULT NULL,
ADD COLUMN other_place_of_death VARCHAR(255) DEFAULT NULL,
ADD COLUMN urine_passed BIT(1) DEFAULT NULL,
ADD COLUMN stool_passed BIT(1) DEFAULT NULL,
ADD COLUMN diarrhoea BIT(1) DEFAULT NULL,
ADD COLUMN vomiting BIT(1) DEFAULT NULL,
ADD COLUMN convulsions BIT(1) DEFAULT NULL,
ADD COLUMN activity VARCHAR(255) DEFAULT NULL,
ADD COLUMN sucking VARCHAR(255) DEFAULT NULL,
ADD COLUMN breathing VARCHAR(255) DEFAULT NULL,
ADD COLUMN chest_indrawing VARCHAR(255) DEFAULT NULL,
ADD COLUMN temperature VARCHAR(255) DEFAULT NULL,
ADD COLUMN jaundice BIT(1) DEFAULT NULL,
ADD COLUMN umbilical_stump_condition VARCHAR(255) DEFAULT NULL,
ADD COLUMN baby_discharged_from_sncu BIT(1) DEFAULT 0,
ADD COLUMN discharge_summary_image VARCHAR(255) DEFAULT NULL;



