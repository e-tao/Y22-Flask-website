-- --------------------------------------------------------
-- Host:                         192.168.1.15
-- Server version:               10.6.4-MariaDB-1:10.6.4+maria~focal - mariadb.org binary distribution
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for bluescafe
DROP DATABASE IF EXISTS `bluescafe`;
CREATE DATABASE IF NOT EXISTS `bluescafe` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `bluescafe`;

-- Dumping structure for table bluescafe.menu
DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `menuId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(64) NOT NULL,
  `day` date NOT NULL,
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluescafe.menu: ~16 rows (approximately)
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`menuId`, `item`, `day`) VALUES
	(1, 'Quiche au légumes', '2022-03-14'),
	(2, 'Brochettes de crevettes et garniture', '2022-03-15'),
	(3, 'Tacos de boeuf', '2022-03-16'),
	(4, 'Risotto d\'orge et pétoncles', '2022-03-17'),
	(40, 'a', '2022-03-21'),
	(41, 'aa', '2022-03-22'),
	(42, 'aaa', '2022-03-23'),
	(43, 'aaaa', '2022-03-24'),
	(44, 'aaaaa', '2022-03-25'),
	(45, 'aaaaaa', '2022-03-26'),
	(46, 'x', '2022-03-21'),
	(47, 'xx', '2022-03-22'),
	(48, 'xxx', '2022-03-30'),
	(49, 'xxxx', '2022-03-24'),
	(50, 'xxxxx', '2022-03-25'),
	(51, 'zzzzzzz', '2022-03-26');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

-- Dumping structure for table bluescafe.page
DROP TABLE IF EXISTS `page`;
CREATE TABLE IF NOT EXISTS `page` (
  `pageId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(450) NOT NULL,
  `name` text NOT NULL,
  `content` longtext NOT NULL,
  `order` int(2) unsigned NOT NULL,
  PRIMARY KEY (`pageId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluescafe.page: ~4 rows (approximately)
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` (`pageId`, `title`, `name`, `content`, `order`) VALUES
	(1, 'HOME', 'HOME', ' <div class="welcome-text">\r\n       WE ARE BLUES CAFE\r\n    </div>', 0),
	(4, 'MUSIC', 'MUSIC', '<div class="calendar-container">\r\n\r\n<div class="header">\r\n<ul class="weekdays">\r\n<li>Sunday</li>\r\n<li>Monday</li>\r\n<li>Tuesday</li>\r\n<li>Wednesday</li>\r\n<li>Thursday</li>\r\n<li>Friday</li>\r\n<li>Saturday</li>\r\n</ul>\r\n\r\n<ul class="daynumbers">\r\n<li>6</li>\r\n<li>7</li>\r\n<li>8</li>\r\n<li>9</li>\r\n<li>10</li>\r\n<li>11</li>\r\n<li>12</li>\r\n</ul>\r\n</div>\r\n\r\n<div class="timeslots-container">\r\n<ul class="timeslots">\r\n<li>6pm</li>\r\n<li>7pm</li>\r\n<li>8pm</li>\r\n<li>9pm</li>\r\n<li>10pm</li>\r\n<li>11pm</li>\r\n<li>12am</li>\r\n</ul>\r\n</div>\r\n\r\n<div class="event-container">\r\n\r\n<div class="slot slot-1">\r\n<div class="event-status"></div>\r\n<span>Country Music</span>\r\n\r\n<div class="music slot-2">\r\n<div class="event-status"></div>\r\n<span>Jazz</span>\r\n\r\n<div class="slot3 slot-3">\r\n<div class="event-status"></div>\r\n<span>Blues</span>\r\n\r\n</div>\r\n\r\n</div>\r\n\r\n\r\n\r\n\r\n\r\n</div>\r\n</div>\r\n\r\n\r\n\r\n\r\n', 2),
	(5, 'COFFEE', 'COFFEE', '  <section class="services">\r\n        <h1>Our Coffee</h1>\r\n     <div class="container">\r\n            <div class="box1">\r\n                <img src="static/img/keep.jpg">\r\n                <div class="info">\r\n                    <h8></h8>\r\n\r\n                    <p1>\r\n                    </p>\r\n              \r\n\r\n<p>\r\n                </div>\r\n            </div>\r\n            <div class="box">\r\n                <img src="static/img/lightroast.jpg">\r\n                <div class="info">\r\n                    <h3>Light Roast</h3>\r\n\r\n                    <p2>Light roast beans are roasted for less time than medium or dark roast beans. They taste fruity, bright, and complex. Lightly roasting beans preserves the flavors of the bean\'s origins. They are fast becoming a favorite of craft roasters, baristas, and coffee lovers</p>\r\n                    <button class="btn">More</button>\r\n\r\n\r\n                </div>\r\n            </div>\r\n            <div class="box">\r\n                <img src="static/img/medium.jpg">\r\n                <div class="info">\r\n                    <h3>Medium Roast</h3>\r\n\r\n                    <p> Medium Roast coffees are brown and have a little thicker body than a Light Roast. Unlike Light, Medium starts to take on a bit of the taste from the roasting process, losing some of the bright floral flavors that are typical of a Light Roast</p>\r\n                    <button class="btn">More</button>\r\n\r\n\r\n\r\n                </div>\r\n            </div>\r\n            <div class="box">\r\n                <img src="static/img/coffee3.jpg">\r\n                <div class="info">\r\n                    <h3>Ice Coffee</h3>\r\n\r\n                    <p>Enjoy a chilled iced coffee, typically sweetened or \r\nflavored and served over ice.\r\n                    </p>\r\n                    <button class="btn">More</button>\r\n\r\n\r\n                </div>\r\n            </div>\r\n            <div class="box">\r\n                <img src="static/img/darkroast.jpg">\r\n                <div class="info">\r\n                    <h3>Dark Roast</h3>\r\n\r\n                    <p>Dark roast coffee beans have been roasted longer than other types, resulting in a darker bean and a more full-bodied cup of joe. A longer roast moderates bright flavors and reduces caffeine levels, so dark roast coffee is less sour and more bitter than a light roast. Coffee isn\'t just about flavor and energy, though.</p>\r\n                    <button class="btn">More</button>\r\n\r\n\r\n                </div>\r\n            </div>\r\n            <div class="box">\r\n                <img src="static/img/tea.jpg">\r\n                <div class="info">\r\n                    <h3>Tea</h3>\r\n\r\n                    <p>We offer Black Tea, Green Tea, Herbal Tea, Ginger Orange and many more.</p>\r\n                    <button class="btn">More</button>\r\n\r\n\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>', 1),
	(6, 'CONTACT', 'CONTACT', '<h6>☕Contact Blues Café☕</h6>\r\n<hr>\r\n\r\n<div class="wrapp">\r\n     <h4>Contact Form<h4>\r\n     <h5>We will try to contact within 24 Hours!</h5>\r\n     <input type="text" name="" id="" placeholder="Enter your Name">\r\n     <input type="email" name="" id="" placeholder="Enter your Email">\r\n     <input type="text" name="" id="" placeholder="Enter your Phone Number">\r\n     <textarea name="" id"" cols"30" rows="10" placeholder="Type your message here"></textarea>\r\n     <a href="#">Submit</a>\r\n</div>\r\n\r\n', 3);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;

-- Dumping structure for table bluescafe.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `userId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `passHash` varchar(64) NOT NULL,
  `cookieHash` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluescafe.user: ~1 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`userId`, `username`, `passHash`, `cookieHash`) VALUES
	(1, 'admin', '$2b$12$HHhsTUQRKi6iItqm/.pple4w3dUps.zJnPiJ5iMJ5R9JjDA6uL4C6', '$2b$12$uoNfVFQiu4pImYiuse2MCOPx5Ezu7duEDVFi2FjbihXSB7aF3wSyW');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
