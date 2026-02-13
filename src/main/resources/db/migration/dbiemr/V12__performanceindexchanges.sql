use dbiemr;

-- create index  inx_CallDateFrom on t_mctsoutboundcalls(CallDateFrom);

-- create index  inx_CallDateTo  on t_mctsoutboundcalls(CallDateTo);

-- create index  inx_preferredlanguage  on t_mothervalidrecord(preferredlanguage);

-- create index  inx_preferredlanguage on t_childvaliddata(preferredlanguage);


-- create index  inx_villageid on i_ben_flow_outreach(villageID);

-- create index  inx_modified_date on i_ben_flow_outreach(modified_date);


USE dbiemr;


-- 1️ Index: inx_CallDateFrom ON t_mctsoutboundcalls(CallDateFrom)

SET @idx1 := (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.STATISTICS
    WHERE TABLE_SCHEMA='dbiemr'
      AND TABLE_NAME='t_mctsoutboundcalls'
      AND INDEX_NAME='inx_CallDateFrom'
);

SET @sql1 := IF(
    @idx1 = 0,
    'ALTER TABLE t_mctsoutboundcalls ADD INDEX inx_CallDateFrom (CallDateFrom);',
    'SELECT "Index inx_CallDateFrom already exists";'
);

PREPARE stmt1 FROM @sql1;
EXECUTE stmt1;
DEALLOCATE PREPARE stmt1;



-- 2️ Index: inx_CallDateTo ON t_mctsoutboundcalls(CallDateTo)

SET @idx2 := (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.STATISTICS
    WHERE TABLE_SCHEMA='dbiemr'
      AND TABLE_NAME='t_mctsoutboundcalls'
      AND INDEX_NAME='inx_CallDateTo'
);

SET @sql2 := IF(
    @idx2 = 0,
    'ALTER TABLE t_mctsoutboundcalls ADD INDEX inx_CallDateTo (CallDateTo);',
    'SELECT "Index inx_CallDateTo already exists";'
);

PREPARE stmt2 FROM @sql2;
EXECUTE stmt2;
DEALLOCATE PREPARE stmt2;



-- 3️ Index: inx_preferredlanguage ON t_mothervalidrecord(preferredlanguage)

SET @idx3 := (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.STATISTICS
    WHERE TABLE_SCHEMA='dbiemr'
      AND TABLE_NAME='t_mothervalidrecord'
      AND INDEX_NAME='inx_preferredlanguage'
);

SET @sql3 := IF(
    @idx3 = 0,
    'ALTER TABLE t_mothervalidrecord ADD INDEX inx_preferredlanguage (preferredlanguage);',
    'SELECT "Index inx_preferredlanguage on t_mothervalidrecord already exists";'
);

PREPARE stmt3 FROM @sql3;
EXECUTE stmt3;
DEALLOCATE PREPARE stmt3;



-- 4️ Index: inx_preferredlanguage ON t_childvaliddata(preferredlanguage)

SET @idx4 := (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.STATISTICS
    WHERE TABLE_SCHEMA='dbiemr'
      AND TABLE_NAME='t_childvaliddata'
      AND INDEX_NAME='inx_preferredlanguage'
);

SET @sql4 := IF(
    @idx4 = 0,
    'ALTER TABLE t_childvaliddata ADD INDEX inx_preferredlanguage (preferredlanguage);',
    'SELECT "Index inx_preferredlanguage on t_childvaliddata already exists";'
);

PREPARE stmt4 FROM @sql4;
EXECUTE stmt4;
DEALLOCATE PREPARE stmt4;



-- 5️ Index: inx_villageid ON i_ben_flow_outreach(villageID)

SET @idx5 := (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.STATISTICS
    WHERE TABLE_SCHEMA='dbiemr'
      AND TABLE_NAME='i_ben_flow_outreach'
      AND INDEX_NAME='inx_villageid'
);

SET @sql5 := IF(
    @idx5 = 0,
    'ALTER TABLE i_ben_flow_outreach ADD INDEX inx_villageid (villageID);',
    'SELECT "Index inx_villageid already exists";'
);

PREPARE stmt5 FROM @sql5;
EXECUTE stmt5;
DEALLOCATE PREPARE stmt5;


-- 6️ Index: inx_modified_date ON i_ben_flow_outreach(modified_date)

SET @idx6 := (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.STATISTICS
    WHERE TABLE_SCHEMA='dbiemr'
      AND TABLE_NAME='i_ben_flow_outreach'
      AND INDEX_NAME='inx_modified_date'
);

SET @sql6 := IF(
    @idx6 = 0,
    'ALTER TABLE i_ben_flow_outreach ADD INDEX inx_modified_date (modified_date);',
    'SELECT "Index inx_modified_date already exists";'
);

PREPARE stmt6 FROM @sql6;
EXECUTE stmt6;
DEALLOCATE PREPARE stmt6;






