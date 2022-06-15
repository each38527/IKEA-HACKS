ALTER TABLE `ikea_hacks`.`article` 
ADD INDEX `appetizerId_idx` (`appetizerId` ASC);
ALTER TABLE `ikea_hacks`.`article` 
ADD CONSTRAINT `appetizerId`
  FOREIGN KEY (`appetizerId`)
  REFERENCES `ikea_hacks`.`appetizer` (`appetizerId`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


ALTER TABLE `ikea_hacks`.`productcategory` 
ADD INDEX `categoriesId_idx` (`categoriesId` ASC) ;
ALTER TABLE `ikea_hacks`.`productcategory` 
ADD CONSTRAINT `categoriesId`
  FOREIGN KEY (`categoriesId`)
  REFERENCES `ikea_hacks`.`categories` (`categoriesId`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `ikea_hacks`.`post` 
ADD INDEX `userId_idx` (`userId` ASC);
ALTER TABLE `ikea_hacks`.`post` 
ADD CONSTRAINT `userId`
  FOREIGN KEY (`userId`)
  REFERENCES `ikea_hacks`.`contributor` (`userId`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `ikea_hacks`.`post` 
ADD INDEX `pcategoryId_idx` (`pcategoryId` ASC);
ALTER TABLE `ikea_hacks`.`post` 
ADD CONSTRAINT `pcategoryId`
  FOREIGN KEY (`pcategoryId`)
  REFERENCES `ikea_hacks`.`productcategory` (`pcategoryId`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

