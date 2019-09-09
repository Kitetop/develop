USE mysql;
UPDATE user SET authentication_string=PASSWORD("root") WHERE user='root';
FLUSH PRIVILEGES;
CREATE DATABASE test DEFAULT CHARACTER SET utf8;
USE test;
DROP TABLE IF EXISTS `manage_depart`;
CREATE TABLE `manage_depart` (
  `id` tinyint(11) NOT NULL AUTO_INCREMENT,
  `depart` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `manage_depart` WRITE;
UNLOCK TABLES;
