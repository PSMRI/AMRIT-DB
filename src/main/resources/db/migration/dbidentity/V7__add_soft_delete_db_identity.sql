-- ========================================
--  Migration: ADD NEW COLUMN
-- ========================================

ALTER TABLE db_identity.i_beneficiarydetails_rmnch
ADD COLUMN IF NOT EXISTS isDeactivate BOOLEAN DEFAULT FALSE;

ALTER TABLE db_identity.i_householddetails
ADD COLUMN IF NOT EXISTS isDeactivate BOOLEAN DEFAULT FALSE;


