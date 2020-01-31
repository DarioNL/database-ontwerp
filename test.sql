-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sportvereniging
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sportvereniging
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sportvereniging` DEFAULT CHARACTER SET utf8 ;
USE `sportvereniging` ;

-- -----------------------------------------------------
-- Table `sportvereniging`.`commissie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sportvereniging`.`commissie` ;

CREATE TABLE IF NOT EXISTS `sportvereniging`.`commissie` (
                                                             `commissieid` CHAR(2) NOT NULL COMMENT 'Primary key bestaat uit twee tekens',
                                                             `commissienaam` VARCHAR(20) NULL COMMENT 'Naam van een commissie',
                                                             PRIMARY KEY (`commissieid`))
    ENGINE = InnoDB
    COMMENT = 'Een commissie is een groep leden die een bepaalde taak uitvoert';


-- -----------------------------------------------------
-- Table `sportvereniging`.`lid`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sportvereniging`.`lid` ;

CREATE TABLE IF NOT EXISTS `sportvereniging`.`lid` (
                                                       `lidid` INT NOT NULL COMMENT 'Primary Key',
                                                       `voorletters` VARCHAR(7) NULL COMMENT 'De voorletters van dit lid',
                                                       `tussenvoegsel` VARCHAR(7) NULL COMMENT 'Het tussenvoegsel van dit lid',
                                                       `achternaam` VARCHAR(25) NULL COMMENT 'De achternaam van een lid',
                                                       `telefoon` VARCHAR(11) NULL COMMENT 'Het telefoonnummer van een lid',
                                                       PRIMARY KEY (`lidid`))
    ENGINE = InnoDB
    COMMENT = 'Een lid van de sportvereniging';


-- -----------------------------------------------------
-- Table `sportvereniging`.`lidcommissie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sportvereniging`.`lidcommissie` ;

CREATE TABLE IF NOT EXISTS `sportvereniging`.`lidcommissie` (
                                                                `lidid` INT NOT NULL COMMENT 'Vreemde sleutel die verwijst naar de primary key in tabel lid',
                                                                `commissieid` CHAR(2) NOT NULL,
                                                                PRIMARY KEY (`lidid`, `commissieid`),
                                                                INDEX `fk_lidcommissie_lid1_idx` (`lidid` ASC) ,
                                                                INDEX `fk_lidcommissie_commissie1_idx` (`commissieid` ASC) ,
                                                                CONSTRAINT `fk_lidcommissie_lid1`
                                                                    FOREIGN KEY (`lidid`)
                                                                        REFERENCES `sportvereniging`.`lid` (`lidid`)
                                                                        ON DELETE NO ACTION
                                                                        ON UPDATE NO ACTION,
                                                                CONSTRAINT `fk_lidcommissie_commissie1`
                                                                    FOREIGN KEY (`commissieid`)
                                                                        REFERENCES `sportvereniging`.`commissie` (`commissieid`)
                                                                        ON DELETE NO ACTION
                                                                        ON UPDATE NO ACTION)
    ENGINE = InnoDB
    COMMENT = 'Relatietabel tussen tabellen commissie en lid';

SET SQL_MODE = '';
DROP USER IF EXISTS sportvereniging;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'sportvereniging' IDENTIFIED BY 'sport';

GRANT SELECT ON TABLE `sportvereniging`.* TO 'sportvereniging';
GRANT SELECT, INSERT, TRIGGER ON TABLE `sportvereniging`.* TO 'sportvereniging';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `sportvereniging`.* TO 'sportvereniging';
SET SQL_MODE = '';
DROP USER IF EXISTS sportvereniging1;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'sportvereniging1' IDENTIFIED BY '123';

GRANT SELECT, INSERT, TRIGGER ON TABLE `sportvereniging`.* TO 'sportvereniging1';
GRANT SELECT ON TABLE `sportvereniging`.* TO 'sportvereniging1';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `sportvereniging`.* TO 'sportvereniging1';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `sportvereniging`.`commissie`
-- -----------------------------------------------------
START TRANSACTION;
USE `sportvereniging`;
INSERT INTO `sportvereniging`.`commissie` (`commissieid`, `commissienaam`) VALUES ('SC', 'Selectiecommissie');
INSERT INTO `sportvereniging`.`commissie` (`commissieid`, `commissienaam`) VALUES ('BC', 'Barcommissie');
INSERT INTO `sportvereniging`.`commissie` (`commissieid`, `commissienaam`) VALUES ('MC', 'Materiaalcommissie');
INSERT INTO `sportvereniging`.`commissie` (`commissieid`, `commissienaam`) VALUES ('KC', 'Kascommissie');
INSERT INTO `sportvereniging`.`commissie` (`commissieid`, `commissienaam`) VALUES ('', '');
INSERT INTO `sportvereniging`.`commissie` (`commissieid`, `commissienaam`) VALUES ('', '');
INSERT INTO `sportvereniging`.`commissie` (`commissieid`, `commissienaam`) VALUES ('', '');

COMMIT;


-- -----------------------------------------------------
-- Data for table `sportvereniging`.`lid`
-- -----------------------------------------------------
START TRANSACTION;
USE `sportvereniging`;
INSERT INTO `sportvereniging`.`lid` (`lidid`, `voorletters`, `tussenvoegsel`, `achternaam`, `telefoon`) VALUES (1100, 'K. M.', NULL, 'Timmers', '06-13579246');
INSERT INTO `sportvereniging`.`lid` (`lidid`, `voorletters`, `tussenvoegsel`, `achternaam`, `telefoon`) VALUES (1112, 'P', NULL, 'Pietersen', '06-24681357');
INSERT INTO `sportvereniging`.`lid` (`lidid`, `voorletters`, `tussenvoegsel`, `achternaam`, `telefoon`) VALUES (1386, 'A. C', 'Van der', 'Water', '06-71829328');
INSERT INTO `sportvereniging`.`lid` (`lidid`, `voorletters`, `tussenvoegsel`, `achternaam`, `telefoon`) VALUES (1045, 'L. J', 'Van der', 'Heiden', '06-97531864');
INSERT INTO `sportvereniging`.`lid` (`lidid`, `voorletters`, `tussenvoegsel`, `achternaam`, `telefoon`) VALUES (1067, 'F.', 'In \'t', 'Veld', '06-68429753');
INSERT INTO `sportvereniging`.`lid` (`lidid`, `voorletters`, `tussenvoegsel`, `achternaam`, `telefoon`) VALUES (1375, 'T.', NULL, 'Knop', '06-53781234');

COMMIT;


-- -----------------------------------------------------
-- Data for table `sportvereniging`.`lidcommissie`
-- -----------------------------------------------------
START TRANSACTION;
USE `sportvereniging`;
INSERT INTO `sportvereniging`.`lidcommissie` (`lidid`, `commissieid`) VALUES (1100, 'SC');
INSERT INTO `sportvereniging`.`lidcommissie` (`lidid`, `commissieid`) VALUES (1112, 'SC');
INSERT INTO `sportvereniging`.`lidcommissie` (`lidid`, `commissieid`) VALUES (1386, 'BC');
INSERT INTO `sportvereniging`.`lidcommissie` (`lidid`, `commissieid`) VALUES (1045, 'SC');
INSERT INTO `sportvereniging`.`lidcommissie` (`lidid`, `commissieid`) VALUES (1100, 'BC');
INSERT INTO `sportvereniging`.`lidcommissie` (`lidid`, `commissieid`) VALUES (1067, 'SC');
INSERT INTO `sportvereniging`.`lidcommissie` (`lidid`, `commissieid`) VALUES (1375, 'MC');

COMMIT;

