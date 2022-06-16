CREATE SCHEMA IF NOT EXISTS `ikea_hacks` DEFAULT CHARACTER SET latin1 ;
USE `ikea_hacks` ;

CREATE TABLE `categories` (
  `categoriesId` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`categoriesId`)
  )ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
  Insert INTO `categories`(`category_name`)
VALUES 
('Kitchen'),
('Bedroom'),
('Diningroom'),
('Office'),
('Livingroom');

CREATE TABLE `productcategory` (
  `pcategoryId` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(50) NOT NULL,
  `categoriesId` INT,
  PRIMARY KEY (`pcategoryId`)
   )ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
Insert INTO  `productcategory` (`product_name`,`categoriesId`)
VALUES 
("Bedroller",2),
("Sofa",5),
("Pots",1),
("Dinnertable",3),
("Desk lamp",4);

CREATE TABLE `contributor` (
  `userId` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(40) NOT NULL,
  `password` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`userId`)
  )ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
  Insert INTO `contributor`(`email`, `password`)
VALUES 
('lkaemena0@yellowpages.com', 'G3sGqBA95'),
('emorter1@linkedin.com', 'dZy19yZY'),
('chammill2@hatena.ne.jp', 'pAkGg1lhpSko'),
('dtellett3@hexun.com', 'tLpdcPSG'),
('arubra4@scribd.com', 'fgjVgGKIWSt');

CREATE TABLE `appetizer` (
  `appetizerId` INT NOT NULL AUTO_INCREMENT,
  `header` VARCHAR(100),
  `app_image` VARCHAR(60),
  `app_text` VARCHAR(1000),
  PRIMARY KEY (`appetizerId`)
  )ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
  
Insert INTO `appetizer` (`header`, `app_image`, `app_text`)
VALUES

("Ikea Storage Hack","http://dummyimage.com/109x100.png/5fa2dd/ffffff", "Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum."),
("35 Best Ikea Kitchen HACKS", "http://dummyimage.com/144x100.png/ff4444/ffffff", "Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla."),
("16 Awesome Ways to Hack the Ikea Spice Rack", "http://dummyimage.com/174x100.png/ff4444/ffffff", "Sometimes I think that Ikea items are like Legos. You can put them together in different ways to make something a little different and interesting. That’s actually kind of the definition of a Hack, isn’t it?"),
("Ikea Nursery Hacks", "http://dummyimage.com/198x100.png/ff4444/ffffff","In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi."),
("9 Ikea Lego Hacks","http://dummyimage.com/172x100.png/ff4444/ffffff", "Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl.");

  CREATE TABLE `article` (
  `articleId` INT NOT NULL AUTO_INCREMENT,
  `art_image` VARCHAR(50),
  `rating` ENUM('1', '2', '3', '4', '5'),
  `art_text` VARCHAR(2000) NOT NULL,
  `appetizerId` INT,
  PRIMARY KEY (`articleId`)
    )ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
Insert INTO `article` (`art_image`, `rating`, `art_text`,`appetizerId`)
VALUES
("http://dummyimage.com/174x100.png/ff4444/ffffff", 5, "The Bekvam Ikea Spice Rack is a perfect example. There are countless Ikea Spice Rack hacks across the internet. I found the 16 best ones.Ikea Spice Rack Hacks You’ll Want to Try
Are you ready to hack? Some of these are using the spice rack in a creative way, some are decorating them in a useful way and others are literally flipping the spice rack on it’s head.",3),
("http://dummyimage.com/109x100.png/5fa2dd/ffffff", 5, "Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.",4),
("http://dummyimage.com/144x100.png/ff4444/ffffff", 2, "Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.",2),
("http://dummyimage.com/198x100.png/ff4444/ffffff", 1, "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.",5),
("http://dummyimage.com/172x100.png/ff4444/ffffff", 1, "Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.",1);

CREATE TABLE  `post` (
  `postId` INT NOT NULL AUTO_INCREMENT,
  `userId` INT,
  `pcategoryId` INT,
  `articleId` INT,
  `state` boolean NOT NULL,
  `date_time` TIMESTAMP,
  PRIMARY KEY (`postId`)
    )ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
Insert INTO `post`(`userId`,`pcategoryId`,`articleId`,`state`, `date_time`)
Values 
(4,2,3,true, "2022-03-20 04:59:31"),
(3,4,2,false, "2022-01-15 17:32:26"),
(2,3,5,false, "2021-08-14 09:32:14"),
(5,1,1,true, "2022-05-17 05:36:29"),
(1,1,4,true, "2021-10-16 03:37:13");