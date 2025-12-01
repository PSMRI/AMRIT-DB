use db_iemr;

-- ALTER TABLE m_qualityauditquestionnaire
-- ADD COLUMN Role VARCHAR(50) DEFAULT 'Associate,ANM,MO';


-- Check if column exists
SELECT COUNT(*) INTO @col_exists
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'm_qualityauditquestionnaire'
  AND COLUMN_NAME = 'Role';

-- Build dynamic SQL
SET @sql = IF(
    @col_exists = 0,
    'ALTER TABLE m_qualityauditquestionnaire ADD COLUMN Role VARCHAR(50) DEFAULT ''Associate,ANM,MO'';',
    'SELECT "Column already exists";'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



UPDATE m_qualityauditquestionnaire
SET Role = 'Associate,ANM,MO'
WHERE Role IS NULL;

DROP VIEW IF EXISTS db_iemr.v_get_qualityaudit_sectionquestionairevalues;

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `piramaldev`@`%` 
    SQL SECURITY DEFINER
VIEW `db_iemr`.`v_get_qualityaudit_sectionquestionairevalues` AS
    SELECT 
        UUID() AS `id`,
        `t1`.`id` AS `sectionId`,
        `t1`.`Name` AS `sectionName`,
        `t1`.`SectionRank` AS `SectionRank`,
        `t2`.`id` AS `questionId`,
        `t2`.`Question` AS `Question`,
        `t2`.`QuestionRank` AS `QuestionRank`,
        `t3`.`id` AS `optionId`,
        `t3`.`QuestionValues` AS `QuestionValues`,
        `t3`.`Score` AS `Score`,
        `t1`.`ProviderServiceMapID` AS `ProviderServiceMapID`,
        `t2`.`isFatalQuestion` AS `isFatalQuestion`,
        `t2`.`Role` AS `Role`
    FROM
        ((`db_iemr`.`m_qualityauditsection` `t1`
        JOIN `db_iemr`.`m_qualityauditquestionnaire` `t2` ON ((`t1`.`id` = `t2`.`Sectionid`)))
        JOIN `db_iemr`.`m_qualityauditquestionnairevalues` `t3` ON ((`t2`.`id` = `t3`.`QuestionID`)))
    WHERE
        ((`t1`.`Deleted` IS FALSE)
            AND (`t2`.`Deleted` IS FALSE)
            AND (`t3`.`Deleted` IS FALSE));

DROP PROCEDURE IF EXISTS `Pr_QualityAuditorSectionQuestionaire`;



DELIMITER $$

CREATE PROCEDURE `Pr_QualityAuditorSectionQuestionaire`(IN v_psmrid INT)
BEGIN
    SELECT 
        s.id AS sectionid,
        s.Name AS SectionName,
        q.id AS Questionid,
        q.Question,
        s.sectionrank,
        q.questionrank,
        q.AnswerType,
        s.providerservicemapid,
        q.isFatalQuestion,
        q.deleted,
        s.createdby,
        s.createdDate,
        s.modifiedBy,
        s.lastModDate,
        q.Role
    FROM m_qualityauditsection s
    INNER JOIN m_qualityauditquestionnaire q 
        ON s.id = q.sectionid
    WHERE s.providerservicemapid = IFNULL(v_psmrid, s.providerservicemapid)
      AND s.providerservicemapid IS NOT NULL
      AND s.id IS NOT NULL;
END$$

DELIMITER ;