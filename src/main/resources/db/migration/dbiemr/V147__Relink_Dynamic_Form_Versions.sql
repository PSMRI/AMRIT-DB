CREATE TABLE IF NOT EXISTS bak_v147_form_version (
    versionId  BIGINT     NOT NULL,
    formId     BIGINT     NULL,
    isLatest   TINYINT(1) NULL,
    backedUpAt TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (versionId)
);

INSERT IGNORE INTO bak_v147_form_version (versionId, formId, isLatest)
SELECT versionId, formId, isLatest
FROM t_form_version;

UPDATE t_form_version v
JOIN (SELECT version_id,
             MIN(SUBSTRING_INDEX(sectionUuid, '_', 1)) AS prefix
      FROM t_form_section
      GROUP BY version_id
      HAVING COUNT(DISTINCT SUBSTRING_INDEX(sectionUuid, '_', 1)) = 1) s
  ON s.version_id = v.versionId
JOIN t_dynamic_form f ON f.formUuid = CASE s.prefix
     WHEN 'OCT' THEN 'OCCUPATION_CONTACT_TRACING'
     WHEN 'CFU' THEN 'CONTACT_FOLLOW_UP'
     WHEN 'TFU' THEN 'TPT_FOLLOW_UP'
     WHEN 'CCT' THEN 'COMMUNITY_CONTACT_TRACING'
     WHEN 'TB2' THEN 'TB_COUNSELLING_V2'
     WHEN 'TB'  THEN 'TB_COUNSELLING'
     END
SET v.formId = f.formId
WHERE v.formId <> f.formId;

UPDATE t_form_version v
JOIN (SELECT formId, MAX(versionId) AS keep_id
      FROM t_form_version
      WHERE isLatest = 1
      GROUP BY formId
      HAVING COUNT(*) > 1) d
  ON d.formId = v.formId
SET v.isLatest = 0
WHERE v.isLatest = 1
  AND v.versionId <> d.keep_id;
