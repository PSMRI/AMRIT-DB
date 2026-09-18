USE db_iemr;

-- One-time cleanup: a handful of existing m_nikshay_* name rows have stray
-- leading/trailing whitespace (confirmed: 5752 facility rows, 1 TU row as of
-- 2026-09-17; villages/districts were already clean). V111/V112/V113 match
-- rows by exact NAME (never by NikshayCode/ID, per the standing rule for this
-- remap), so a dirty row like 'SRI SAI MULTI SPECIALTY HOSPITAL ' (trailing
-- space) silently fails an exact-string lookup and gets skipped with no error.
--
-- The fix belongs here, once, at the data -- not by wrapping every WHERE
-- clause in V111/V112/V113 with TRIM(column). Wrapping the *column* in TRIM()
-- defeats the name indexes added in V110 (MySQL can't use an index on
-- FacilityName to satisfy TRIM(FacilityName)=...), forcing a full table scan
-- on every single one of the hundreds of thousands of statements in those
-- files. Trimming the data once keeps plain `column = 'value'` lookups both
-- correct and index-friendly. Collation on these columns is already
-- utf8mb4_0900_ai_ci (case/accent-insensitive), so no LOWER() is needed either.
--
-- Idempotent: the WHERE clause only touches rows that are still dirty, so a
-- re-run does nothing on a database this has already cleaned.

UPDATE m_nikshay_state    SET StateName    = TRIM(StateName)    WHERE StateName    <> TRIM(StateName);
UPDATE m_nikshay_district SET DistrictName = TRIM(DistrictName) WHERE DistrictName <> TRIM(DistrictName);
UPDATE m_nikshay_tu       SET TUName       = TRIM(TUName)       WHERE TUName       <> TRIM(TUName);
UPDATE m_nikshay_facility SET FacilityName = TRIM(FacilityName) WHERE FacilityName <> TRIM(FacilityName);
UPDATE m_nikshay_village  SET VillageName  = TRIM(VillageName)  WHERE VillageName  <> TRIM(VillageName);
