-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.33-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for nodemysql
DROP DATABASE IF EXISTS `nodemysql`;
CREATE DATABASE IF NOT EXISTS `nodemysql` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `nodemysql`;

-- Dumping structure for table nodemysql.employee
DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(20) NOT NULL,
  `Last_Name` varchar(25) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL COMMENT 'The salt the crypted password was created with',
  `email` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Email` (`email`),
  KEY `First_Name` (`First_Name`,`Last_Name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table nodemysql.employee: ~7 rows (approximately)
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
REPLACE INTO `employee` (`id`, `First_Name`, `Last_Name`, `password`, `salt`, `email`, `created_at`, `active`) VALUES
	(1, 'The', 'Row', '$2b$10$YCP6FY9nFBo0F7PrvAyp7.Eu7S.wUYP9PT9h8b3Wqq0dI1z6sne.y', 'bpJkPBTK+oNZFqNVGB6ZOVgvCex9XHN0eP9T3QgsYdo=', 'therow@gmail.com', '2016-02-11 20:11:35', 1),
	(4, 'Zac', 'Posen', '$2b$10$YCP6FY9nFBo0F7PrvAyp7.Eu7S.wUYP9PT9h8b3Wqq0dI1z6sne.y', 'bpJkPBTK+oNZFqNVGB6ZOVgvCex9XHN0eP9T3QgsYdo=', 'zacposen@gmail.com', '2016-02-11 20:13:38', 1),
	(6, 'Rick', 'Owens', '$2b$10$YCP6FY9nFBo0F7PrvAyp7.Eu7S.wUYP9PT9h8b3Wqq0dI1z6sne.y', 'bpJkPBTK+oNZFqNVGB6ZOVgvCex9XHN0eP9T3QgsYdo=', 'rickwoens@gmail.com', '2016-02-11 20:57:50', 1),
	(7, 'Billy', 'Packham', '$2b$10$YCP6FY9nFBo0F7PrvAyp7.Eu7S.wUYP9PT9h8b3Wqq0dI1z6sne.y', 'bpJkPBTK+oNZFqNVGB6ZOVgvCex9XHN0eP9T3QgsYdo=', 'billypackham@gmail.com', '2016-02-11 21:03:38', 1),
	(8, 'Sandra', 'Schouler', '$2b$10$YCP6FY9nFBo0F7PrvAyp7.Eu7S.wUYP9PT9h8b3Wqq0dI1z6sne.y', 'bpJkPBTK+oNZFqNVGB6ZOVgvCex9XHN0eP9T3QgsYdo=', 'sandraschouler@gmail.com', '2016-02-11 21:04:44', 1),
	(9, 'Alexander', 'Nordlund', '$2b$10$YCP6FY9nFBo0F7PrvAyp7.Eu7S.wUYP9PT9h8b3Wqq0dI1z6sne.y', 'bpJkPBTK+oNZFqNVGB6ZOVgvCex9XHN0eP9T3QgsYdo=', 'alexander@gmail.com', '2016-02-11 21:11:02', 1),
	(10, 'David', 'Herrera', '$2b$10$YCP6FY9nFBo0F7PrvAyp7.Eu7S.wUYP9PT9h8b3Wqq0dI1z6sne.y', 'bpJkPBTK+oNZFqNVGB6ZOVgvCex9XHN0eP9T3QgsYdo=', 'davidherrera@gmail.com', '2016-02-11 21:18:05', 1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;

-- Dumping structure for table nodemysql.employee_location
DROP TABLE IF EXISTS `employee_location`;
CREATE TABLE IF NOT EXISTS `employee_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_id_2` (`employee_id`,`location_id`),
  KEY `employee_id` (`employee_id`,`location_id`),
  KEY `location_id` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- Dumping data for table nodemysql.employee_location: ~36 rows (approximately)
/*!40000 ALTER TABLE `employee_location` DISABLE KEYS */;
REPLACE INTO `employee_location` (`id`, `employee_id`, `location_id`) VALUES
	(1, 1, 3),
	(2, 1, 5),
	(3, 1, 7),
	(4, 1, 10),
	(5, 1, 13),
	(6, 1, 15),
	(7, 4, 9),
	(8, 6, 4),
	(9, 6, 5),
	(10, 6, 6),
	(11, 6, 7),
	(12, 6, 11),
	(13, 6, 15),
	(14, 6, 16),
	(15, 6, 17),
	(16, 6, 18),
	(17, 7, 4),
	(18, 7, 9),
	(19, 7, 11),
	(20, 7, 16),
	(21, 8, 3),
	(22, 8, 4),
	(23, 8, 7),
	(24, 8, 9),
	(25, 8, 11),
	(26, 8, 13),
	(32, 9, 3),
	(33, 9, 4),
	(31, 9, 10),
	(30, 9, 11),
	(29, 9, 17),
	(28, 9, 18),
	(27, 9, 20),
	(36, 10, 9),
	(35, 10, 15),
	(34, 10, 16);
/*!40000 ALTER TABLE `employee_location` ENABLE KEYS */;

-- Dumping structure for table nodemysql.location
DROP TABLE IF EXISTS `location`;
CREATE TABLE IF NOT EXISTS `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(20) DEFAULT NULL,
  `country` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- Dumping data for table nodemysql.location: ~16 rows (approximately)
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
REPLACE INTO `location` (`id`, `city`, `country`) VALUES
	(1, 'Phnom Penh', 'Cambodia'),
	(3, 'Santiago', 'Chile'),
	(4, 'Tokyo', 'Japan'),
	(5, 'Cairo', 'Egypt'),
	(6, 'Tallinn', 'Estonia'),
	(7, 'Suva', 'Fiji'),
	(9, 'Stockholm', 'Sweden'),
	(10, 'Helsinki', 'Finland'),
	(11, 'Caracas', 'Venezuela'),
	(13, 'Male', 'Maldives'),
	(14, 'Nairobi', 'Kenya'),
	(15, 'Hanoi', 'Vietnam'),
	(16, 'Scotland', 'Edinburgh'),
	(17, 'Belgrade', 'Serbia'),
	(18, 'Madrid', 'Spain'),
	(20, 'Strängnäs', 'Strängnäs');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;

-- Dumping structure for table nodemysql.movie
DROP TABLE IF EXISTS `movie`;
CREATE TABLE IF NOT EXISTS `movie` (
  `id` int(11) NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `price` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table nodemysql.movie: ~22 rows (approximately)
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
REPLACE INTO `movie` (`id`, `name`, `price`, `active`) VALUES
	(1, 'The Little Marmaid', 1, 0),
	(2, 'The Lion King', 1, 0),
	(3, 'Mulan', 1, 1),
	(4, 'Aladdin', 1, 1),
	(5, 'Hercules', 1, 0),
	(6, 'The Snow White', 1, 1),
	(7, 'Candleshoe', 1, 1),
	(9, 'Man of the House', 2, 1),
	(10, 'Popeye', 2, 1),
	(11, 'Toy Story', 2, 1),
	(12, 'The Parent Trap', 3, 1),
	(15, 'A Bug\'s Life', 3, 0),
	(16, 'Tarzan', 3, 1),
	(17, 'Snow Dogs', 4, 1),
	(18, 'Ghosts of the Abyss', 4, 1),
	(19, 'Brother Bear', 4, 1),
	(20, 'Big Hero 6', 4, 1),
	(21, 'Pete\'s Dragon', 4, 1),
	(22, 'Zootopia', 4, 1),
	(23, 'Incredibles 2', 4, 1),
	(24, 'Coco', 4, 1),
	(25, 'Cars 3', 4, 1);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;

-- Dumping structure for table nodemysql.movie_order
DROP TABLE IF EXISTS `movie_order`;
CREATE TABLE IF NOT EXISTS `movie_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `location_id` int(11) NOT NULL,
  `week` int(11) NOT NULL,
  `total_price` float(10,2) NOT NULL,
  `ordered_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` text CHARACTER SET utf8,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `location_id` (`location_id`),
  KEY `ordered_by` (`ordered_by`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;

-- Dumping data for table nodemysql.movie_order: ~11 rows (approximately)
/*!40000 ALTER TABLE `movie_order` DISABLE KEYS */;
REPLACE INTO `movie_order` (`id`, `date`, `location_id`, `week`, `total_price`, `ordered_by`, `updated_at`, `comment`) VALUES
	(102, '2018-11-29', 7, 48, 473.00, 1, '2018-11-29 15:43:34', 'FIRST OREDER UPDATE'),
	(105, '2018-11-29', 9, 48, 22.00, 4, '2018-11-29 18:04:58', 'Working UPDate');
/*!40000 ALTER TABLE `movie_order` ENABLE KEYS */;

-- Dumping structure for table nodemysql.order_quantity
DROP TABLE IF EXISTS `order_quantity`;
CREATE TABLE IF NOT EXISTS `order_quantity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_order_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sauce_order_id` (`movie_order_id`,`movie_id`),
  KEY `sauce_id` (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=342 DEFAULT CHARSET=latin1;

-- Dumping data for table nodemysql.order_quantity: ~42 rows (approximately)
/*!40000 ALTER TABLE `order_quantity` DISABLE KEYS */;
REPLACE INTO `order_quantity` (`id`, `movie_order_id`, `movie_id`, `quantity`) VALUES
	(312, 102, 9, 13),
	(313, 102, 11, 7),
	(314, 102, 7, 15),
	(315, 102, 10, 13),
	(316, 102, 4, 2),
	(317, 102, 20, 12),
	(318, 102, 19, 5),
	(319, 102, 21, 12),
	(320, 102, 18, 12),
	(321, 102, 17, 12),
	(322, 102, 12, 14),
	(323, 102, 22, 11),
	(324, 102, 23, 2),
	(325, 102, 24, 8),
	(326, 102, 25, 13),
	(337, 105, 3, 4),
	(338, 105, 4, 4),
	(339, 105, 6, 3),
	(340, 105, 7, 3),
	(341, 105, 9, 4);
/*!40000 ALTER TABLE `order_quantity` ENABLE KEYS */;

-- Dumping structure for table nodemysql.price_list
DROP TABLE IF EXISTS `price_list`;
CREATE TABLE IF NOT EXISTS `price_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `price` float(10,2) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `movie_id` (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- Dumping data for table nodemysql.price_list: ~22 rows (approximately)
/*!40000 ALTER TABLE `price_list` DISABLE KEYS */;
REPLACE INTO `price_list` (`id`, `movie_id`, `price`, `date`) VALUES
	(1, 1, 10.45, '2016-03-27'),
	(2, 2, 12.56, '2016-03-27'),
	(3, 3, 4.23, '2016-03-27'),
	(4, 4, 6.66, '2016-03-27'),
	(5, 5, 5.67, '2016-03-27'),
	(6, 6, 7.23, '2016-03-27'),
	(7, 7, 8.43, '2016-03-27'),
	(8, 9, 10.45, '2016-03-27'),
	(9, 10, 10.45, '2016-03-27'),
	(10, 11, 12.56, '2016-03-27'),
	(11, 12, 4.23, '2016-03-27'),
	(12, 15, 6.66, '2016-03-27'),
	(13, 16, 5.67, '2016-03-27'),
	(14, 17, 7.23, '2016-03-27'),
	(15, 18, 8.43, '2016-03-27'),
	(16, 19, 10.45, '2016-03-27'),
	(17, 20, 4.23, '2016-03-27'),
	(18, 21, 6.66, '2016-03-27'),
	(19, 22, 5.67, '2016-03-27'),
	(20, 23, 6.66, '2016-03-27'),
	(21, 24, 5.67, '2016-03-27'),
	(22, 25, 12.56, '2016-03-27');
/*!40000 ALTER TABLE `price_list` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
