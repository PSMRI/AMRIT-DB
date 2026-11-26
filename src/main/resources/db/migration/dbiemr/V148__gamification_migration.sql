USE db_iemr;


SET @schema_name = 'db_iemr';
SET @tbl_name = 'm_user';

-- 1. gamificationEnabled
SET @col_name = 'gamificationEnabled';
SET @col_def = 'VARCHAR(250) NULL';

-- 2. badgesMechanics
SET @col_name = 'badgesMechanics';
SET @col_def = 'VARCHAR(250) NULL';

-- 3. monthlyRecapMechanics
SET @col_name = 'monthlyRecapMechanics';
SET @col_def = 'VARCHAR(250) NULL';

-- 4. eveningNotifications
SET @col_name = 'eveningNotifications';
SET @col_def = 'VARCHAR(250) NULL';

-- 5. consistencyDashboard
SET @col_name = 'consistencyDashboard';
SET @col_def = 'VARCHAR(250) NULL';

-- Dynamic migration for all columns
SET @columns = 'gamificationEnabled,badgesMechanics,monthlyRecapMechanics,eveningNotifications,consistencyDashboard';

DROP TEMPORARY TABLE IF EXISTS temp_migration_columns;

CREATE TEMPORARY TABLE temp_migration_columns (
    col_name VARCHAR(100),
    col_def VARCHAR(250)
);

INSERT INTO temp_migration_columns VALUES
('gamificationEnabled', 'VARCHAR(250) NULL'),
('badgesMechanics', 'VARCHAR(250) NULL'),
('monthlyRecapMechanics', 'VARCHAR(250) NULL'),
('eveningNotifications', 'VARCHAR(250) NULL'),
('consistencyDashboard', 'VARCHAR(250) NULL');

SET @tbl_exists = (
    SELECT COUNT(*)
    FROM information_schema.tables
    WHERE table_schema = @schema_name
    AND table_name = @tbl_name
);

DELIMITER $$

DROP PROCEDURE IF EXISTS add_gamification_columns$$

CREATE PROCEDURE add_gamification_columns()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE v_col_name VARCHAR(100);
    DECLARE v_col_def VARCHAR(250);
    DECLARE v_col_exists INT DEFAULT 0;

    DECLARE col_cursor CURSOR FOR
        SELECT col_name, col_def
        FROM temp_migration_columns;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    IF @tbl_exists = 0 THEN
        SELECT 'm_user table does not exist' AS migration_status;
    ELSE
        OPEN col_cursor;

        read_loop: LOOP
            FETCH col_cursor INTO v_col_name, v_col_def;

            IF done = 1 THEN
                LEAVE read_loop;
            END IF;

            SELECT COUNT(*) INTO v_col_exists
            FROM information_schema.columns
            WHERE table_schema = @schema_name
            AND table_name = @tbl_name
            AND column_name = v_col_name;

            IF v_col_exists = 0 THEN
                SET @sql = CONCAT(
                    'ALTER TABLE `', @schema_name, '`.`', @tbl_name,
                    '` ADD COLUMN `', v_col_name, '` ', v_col_def
                );

                PREPARE stmt FROM @sql;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;

                SELECT CONCAT(v_col_name, ' added successfully') AS migration_status;
            ELSE
                SELECT CONCAT(v_col_name, ' already exists - skipped') AS migration_status;
            END IF;

        END LOOP;

        CLOSE col_cursor;
    END IF;
END$$

CALL add_gamification_columns()$$

DROP PROCEDURE IF EXISTS add_gamification_columns$$

DELIMITER ;

DROP TEMPORARY TABLE IF EXISTS temp_migration_columns;


CREATE TABLE IF NOT EXISTS `badge_config` (
   `config_key` varchar(100) NOT NULL,
   `config_value` varchar(500) NOT NULL,
   PRIMARY KEY (`config_key`)
 );

 CREATE TABLE IF NOT EXISTS `badge_earned` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `user_id` int NOT NULL,
    `badge_id` varchar(50) NOT NULL,
    `level` int NOT NULL,
    `award_key` varchar(64) NOT NULL DEFAULT '',
    `earned_at` bigint NOT NULL,
    `received_at` bigint NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_badge_earned_user_badge_level_key` (`user_id`,`badge_id`,`level`,`award_key`)
  );

  CREATE TABLE IF NOT EXISTS `badge_streak_freeze` (
     `id` bigint NOT NULL AUTO_INCREMENT,
     `user_id` int DEFAULT NULL,
     `badge_id` varchar(50) DEFAULT NULL,
     `start_date` bigint NOT NULL,
     `end_date` bigint NOT NULL,
     PRIMARY KEY (`id`),
     KEY `idx_badge_streak_freeze_user_badge` (`user_id`,`badge_id`),
     KEY `idx_badge_streak_freeze_dates` (`start_date`,`end_date`)
   );


