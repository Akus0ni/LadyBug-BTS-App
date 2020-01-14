-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ladybug_main
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ladybug_main` ;

-- -----------------------------------------------------
-- Schema ladybug_main
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ladybug_main` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `ladybug_main` ;

-- -----------------------------------------------------
-- Table `ladybug_main`.`employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ladybug_main`.`employees` ;

CREATE TABLE IF NOT EXISTS `ladybug_main`.`employees` (
  `emp_id` VARCHAR(45) NOT NULL,
  `emp_name` VARCHAR(45) NULL,
  `emp_email` VARCHAR(45) NOT NULL unique,
  `emp_password` VARCHAR(45) NOT NULL,
  `emp_role` VARCHAR(45) NULL,
  `emp_username` VARCHAR(45) NULL,
  `mgr_id` VARCHAR(45),
  PRIMARY KEY (`emp_id`),
	CONSTRAINT `FK_MANAGER` FOREIGN KEY (`mgr_id`) REFERENCES `ladybug_main`.`employees` (`emp_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ladybug_main`.`projects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ladybug_main`.`projects` ;

CREATE TABLE IF NOT EXISTS `ladybug_main`.`projects` (
  `project_id` VARCHAR(45) NOT NULL,
  `project_name` VARCHAR(45) NOT NULL,
  `project_desc` VARCHAR(45) NULL,
  `project_mgr` VARCHAR(45) NULL,
  PRIMARY KEY (`project_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ladybug_main`.`bug_dtls`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ladybug_main`.`bug_dtls` ;

CREATE TABLE IF NOT EXISTS `ladybug_main`.`bug_dtls` (
  `bug_id` VARCHAR(45) NOT NULL,
  `bug_name` VARCHAR(45) NOT NULL,
  `bug_desc` VARCHAR(250) NOT NULL,
  `bug_start` DATETIME NULL,
  `bug_end` DATETIME NULL,
  `bug_priority` VARCHAR(45) NULL,
  `bug_by_emp_id` VARCHAR(45) NOT NULL,
  `bug_assignee` VARCHAR(45) NULL,
  `bug_project_id` VARCHAR(45) NULL,
  `bug_status` VARCHAR(45) NULL,
  `bug_mgr_id` VARCHAR(45) NULL,
  PRIMARY KEY (`bug_id`),
  CONSTRAINT `emp_id`
    FOREIGN KEY (`bug_by_emp_id`)
    REFERENCES `ladybug_main`.`employees` (`emp_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `project_id`
    FOREIGN KEY (`bug_project_id`)
    REFERENCES `ladybug_main`.`projects` (`project_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `emp_id_idx` ON `ladybug_main`.`bug_dtls` (`bug_by_emp_id` ASC) VISIBLE;

CREATE INDEX `project_id_idx` ON `ladybug_main`.`bug_dtls` (`bug_project_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `ladybug_main`.`emp_project_relation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ladybug_main`.`emp_project_relation` ;

CREATE TABLE IF NOT EXISTS `ladybug_main`.`emp_project_relation` (
  `proj_id` VARCHAR(45) NOT NULL,
  `e_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`e_id`, `proj_id`),
  CONSTRAINT `proj_id`
    FOREIGN KEY (`proj_id`)
    REFERENCES `ladybug_main`.`projects` (`project_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `e_id`
    FOREIGN KEY (`e_id`)
    REFERENCES `ladybug_main`.`employees` (`emp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `project_id_idx` ON `ladybug_main`.`emp_project_relation` (`proj_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
