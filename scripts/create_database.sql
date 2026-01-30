CREATE TABLE IF NOT EXISTS `student` (
	`student_id` VARCHAR(255) NOT NULL UNIQUE,
	`graduation_year` VARCHAR(255),
	`form_of_education_id` INTEGER,
	`school_id` INTEGER,
	`gender_id` INTEGER,
	`environment_id` INTEGER,
	`class_year` VARCHAR(255),
	`field_of_study_id` INTEGER,
	`language_id` INTEGER,
	`specialization_id` INTEGER,
	`grades_id` INTEGER,
	PRIMARY KEY(`student_id`)
);


CREATE TABLE IF NOT EXISTS `gender` (
	`gender_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`gender_type` VARCHAR(255),
	PRIMARY KEY(`gender_id`)
);


CREATE TABLE IF NOT EXISTS `environment` (
	`environment_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`environment_type` VARCHAR(255),
	PRIMARY KEY(`environment_id`)
);


CREATE TABLE IF NOT EXISTS `school` (
	`school_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`locality_id` INTEGER,
	PRIMARY KEY(`school_id`)
);


CREATE TABLE IF NOT EXISTS `locality` (
	`locality_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`locality_name` VARCHAR(255),
	`county_id` INTEGER,
	PRIMARY KEY(`locality_id`)
);


CREATE TABLE IF NOT EXISTS `county` (
	`county_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`county_name` INTEGER,
	PRIMARY KEY(`county_id`)
);


CREATE TABLE IF NOT EXISTS `elective_subject` (
	`elective_subject_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`elective_subject_name` VARCHAR(255),
	PRIMARY KEY(`elective_subject_id`)
);


CREATE TABLE IF NOT EXISTS `grades` (
	`grades_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`status` VARCHAR(255),
	`average` FLOAT,
	`year` INTEGER,
	`session` INTEGER,
	`status_digital` VARCHAR(255),
	`digital_score` FLOAT,
	`status_elective_subject` VARCHAR(255),
	`final_score_elective_subject` FLOAT,
	`status_ro_oral` VARCHAR(255),
	`status_ro_written` VARCHAR(255),
	`status_subject_2` VARCHAR(255),
	`final_score_subject_2` FLOAT,
	`status_subject_1` VARCHAR(255),
	`final_score_subject_1` FLOAT,
	`modern_language_oral_oi` VARCHAR(255),
	`modern_language_written_production` VARCHAR(255),
	`modern_language_listening` VARCHAR(255),
	`modern_language_oral_production` VARCHAR(255),
	`modern_language_written_reading_comprehension` VARCHAR(255),
	`modern_language_status_c` VARCHAR(255),
	PRIMARY KEY(`grades_id`)
);


CREATE TABLE IF NOT EXISTS `specialization` (
	`specialization_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`core_subject_1` VARCHAR(255),
	`core_subject_2` INTEGER,
	`elective_subject_id` INTEGER,
	`profile_id` INTEGER,
	PRIMARY KEY(`specialization_id`)
);


CREATE TABLE IF NOT EXISTS `profile` (
	`profile_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`profile_name` VARCHAR(255),
	PRIMARY KEY(`profile_id`)
);


CREATE TABLE IF NOT EXISTS `field_of_study` (
	`field_of_study_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`field_of_study_name` VARCHAR(255),
	PRIMARY KEY(`field_of_study_id`)
);


CREATE TABLE IF NOT EXISTS `form_of_education` (
	`form_of_education_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`form_of_education_name` VARCHAR(255),
	PRIMARY KEY(`form_of_education_id`)
);


CREATE TABLE IF NOT EXISTS `modern_language` (
	`language_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`language_name` VARCHAR(255),
	PRIMARY KEY(`language_id`)
);


ALTER TABLE `student`
ADD FOREIGN KEY(`gender_id`) REFERENCES `gender`(`gender_id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `locality`
ADD FOREIGN KEY(`county_id`) REFERENCES `county`(`county_id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `student`
ADD FOREIGN KEY(`school_id`) REFERENCES `school`(`school_id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `student`
ADD FOREIGN KEY(`field_of_study_id`) REFERENCES `field_of_study`(`field_of_study_id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `student`
ADD FOREIGN KEY(`language_id`) REFERENCES `modern_language`(`language_id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `school`
ADD FOREIGN KEY(`locality_id`) REFERENCES `locality`(`locality_id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `student`
ADD FOREIGN KEY(`specialization_id`) REFERENCES `specialization`(`specialization_id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `specialization`
ADD FOREIGN KEY(`elective_subject_id`) REFERENCES `elective_subject`(`elective_subject_id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `specialization`
ADD FOREIGN KEY(`profile_id`) REFERENCES `profile`(`profile_id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `student`
ADD FOREIGN KEY(`grades_id`) REFERENCES `grades`(`grades_id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `student`
ADD FOREIGN KEY(`environment_id`) REFERENCES `environment`(`environment_id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `student`
ADD FOREIGN KEY(`form_of_education_id`) REFERENCES `form_of_education`(`form_of_education_id`)
ON UPDATE CASCADE ON DELETE CASCADE;