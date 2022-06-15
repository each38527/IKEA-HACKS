CREATE SCHEMA IF NOT EXISTS `ikea_hacks` DEFAULT CHARACTER SET latin1 ;
USE `ikea_hacks` ;

-- -----------------------------------------------------
-- Table `ikea_hacks`.`appetizer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ikea_hacks`.`appetizer` (
  `appetizerId` INT(11) NOT NULL AUTO_INCREMENT,
  `header` VARCHAR(30) NULL DEFAULT NULL,
  `app_image` BLOB NULL DEFAULT NULL,
  `app_text` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`appetizerId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ikea_hacks`.`article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ikea_hacks`.`article` (
  `articleId` INT(11) NOT NULL AUTO_INCREMENT,
  `art_image` VARCHAR(50) NULL DEFAULT NULL,
  `rating` ENUM('1', '2', '3', '4', '5') NULL DEFAULT NULL,
  `art_text` VARCHAR(200) NOT NULL,
  `appetizerid` INT(11) NOT NULL,
  PRIMARY KEY (`articleId`, `appetizerid`),
    FOREIGN KEY (`appetizerid`)
    REFERENCES `ikea_hacks`.`appetizer` (`appetizerId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ikea_hacks`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ikea_hacks`.`categories` (
  `categoriesId` INT(11) NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`categoriesId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ikea_hacks`.`contributor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ikea_hacks`.`contributor` (
  `userId` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(40) NOT NULL,
  `password` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`userId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ikea_hacks`.`productcategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ikea_hacks`.`productcategory` (
  `pcategoryId` INT(11) NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(30) NOT NULL,
  `categoriesId` INT(11) NOT NULL,
  PRIMARY KEY (`pcategoryId`, `categoriesId`),
    FOREIGN KEY (`categoriesId`)
    REFERENCES `ikea_hacks`.`categories` (`categoriesId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ikea_hacks`.`post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ikea_hacks`.`post` (
  `userId` INT(11) NOT NULL,
  `pcategoryId` INT(11) NOT NULL,
  `articleId` INT(11) NOT NULL,
  `state` TINYINT(1) NOT NULL,
  `date_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
    FOREIGN KEY (`userId`)
    REFERENCES `ikea_hacks`.`contributor` (`userId`),
    FOREIGN KEY (`pcategoryId`)
    REFERENCES `ikea_hacks`.`productcategory` (`pcategoryId`),
    FOREIGN KEY (`articleId`)
    REFERENCES `ikea_hacks`.`article` (`articleId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
