SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `digicart` DEFAULT CHARACTER SET latin1 ;
USE `digicart` ;

-- -----------------------------------------------------
-- Table `digicart`.`floor`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `digicart`.`floor` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `describe` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `digicart`.`sector`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `digicart`.`sector` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `alias` VARCHAR(45) NOT NULL ,
  `describe` TEXT NULL DEFAULT NULL ,
  `id_floor_fk` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `id_floor_fk` (`id_floor_fk` ASC) ,
  CONSTRAINT `id_floor_fk`
    FOREIGN KEY (`id_floor_fk` )
    REFERENCES `digicart`.`floor` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `digicart`.`type`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `digicart`.`type` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `describe` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `digicart`.`item`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `digicart`.`item` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `alias` VARCHAR(45) NOT NULL ,
  `describe` TEXT NULL DEFAULT NULL ,
  `bar_code` VARCHAR(45) NOT NULL ,
  `status` INT(11) NULL DEFAULT NULL ,
  `id_sector_fd` INT(11) NOT NULL ,
  `id_type_fk` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `id_sector_fk` (`id_sector_fd` ASC) ,
  INDEX `id_type_fk` (`id_type_fk` ASC) ,
  CONSTRAINT `id_sector_fk`
    FOREIGN KEY (`id_sector_fd` )
    REFERENCES `digicart`.`sector` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_type_fk`
    FOREIGN KEY (`id_type_fk` )
    REFERENCES `digicart`.`type` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `digicart`.`stock`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `digicart`.`stock` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `amount` INT(11) NOT NULL ,
  `id_item_fk` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `id_item_fk` (`id_item_fk` ASC) ,
  CONSTRAINT `id_item_fk`
    FOREIGN KEY (`id_item_fk` )
    REFERENCES `digicart`.`item` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
