/*
SQLyog Community Edition- MySQL GUI v7.0  
MySQL - 5.0.41-community-nt : Database - upload
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`upload` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `upload`;

/*Table structure for table `file_upload` */

DROP TABLE IF EXISTS `file_upload`;

CREATE TABLE `file_upload` (
  `file_id` varchar(24) collate utf8_bin NOT NULL,
  `file_src_name` varchar(100) collate utf8_bin default NULL,
  `file_save_name` varchar(100) collate utf8_bin default NULL,
  `file_url` varchar(200) collate utf8_bin default NULL,
  `upload_time` varchar(19) collate utf8_bin default NULL,
  `delete_flag` int(11) default NULL,
  `memo` varchar(100) collate utf8_bin default NULL,
  `prepare1` int(11) default NULL,
  `prepare2` varchar(50) collate utf8_bin default NULL,
  `prepare3` varchar(50) collate utf8_bin default NULL,
  PRIMARY KEY  (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `file_upload` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
