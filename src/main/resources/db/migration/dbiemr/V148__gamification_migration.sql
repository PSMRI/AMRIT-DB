USE db_iemr;


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