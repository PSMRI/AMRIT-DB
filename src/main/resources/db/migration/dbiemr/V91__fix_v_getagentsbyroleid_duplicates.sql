-- v_getagentsbyroleid (defined in V2__DB_IEMR.sql) LEFT JOINs m_userlangmapping directly
-- on UserID. m_userlangmapping is one-to-many per user (one row per language the agent
-- speaks/reads), so the join fans out and duplicates every agent row once per language
-- mapping -- e.g. an agent with 4 language rows shows up 4 times in getAgentsByRoleId.
-- Replacing the join with correlated subqueries for the CanRead=1 language keeps exactly
-- one row per usr.USRMappingID.

DROP VIEW IF EXISTS v_getagentsbyroleid;

CREATE
    ALGORITHM = UNDEFINED
    DEFINER = `piramaldev`@`%`
    SQL SECURITY DEFINER
VIEW `v_getagentsbyroleid` AS
    SELECT
        `usr`.`USRMappingID` AS `USRMappingID`,
        `u`.`UserID` AS `UserID`,
        `u`.`FirstName` AS `FirstName`,
        `u`.`MiddleName` AS `MiddleName`,
        `u`.`LastName` AS `LastName`,
        `usr`.`RoleID` AS `RoleID`,
        `usr`.`AgentID` AS `AgentID`,
        (SELECT `ulm`.`LanguageID`
            FROM `m_userlangmapping` `ulm`
            WHERE `ulm`.`UserID` = `usr`.`UserID`
                AND ((0 <> `ulm`.`CanRead`) IS TRUE)
            ORDER BY `ulm`.`LanguageID`
            LIMIT 1) AS `preferredlanguageid`,
        (SELECT `l`.`LanguageName`
            FROM `m_userlangmapping` `ulm`
            JOIN `m_language` `l` ON (`l`.`LanguageID` = `ulm`.`LanguageID`)
            WHERE `ulm`.`UserID` = `usr`.`UserID`
                AND ((0 <> `ulm`.`CanRead`) IS TRUE)
            ORDER BY `ulm`.`LanguageID`
            LIMIT 1) AS `preferredlanguage`
    FROM
        `m_user` `u`
        JOIN `m_userservicerolemapping` `usr` ON (`u`.`UserID` = `usr`.`UserID`)
    WHERE
        ((0 <> `u`.`Deleted`) IS FALSE)
        AND ((0 <> `usr`.`Deleted`) IS FALSE);
