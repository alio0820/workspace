/*
MySQL Data Transfer
Source Host: localhost
Source Database: hibernate
Target Host: localhost
Target Database: hibernate
Date: 2011/9/11/���� 20:43:42
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for accounting
-- ----------------------------
CREATE TABLE `accounting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for p1
-- ----------------------------
CREATE TABLE `p1` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `age` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for s1
-- ----------------------------
CREATE TABLE `s1` (
  `name` varchar(255) NOT NULL,
  `passWord` varchar(255) NOT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`,`passWord`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for student
-- ----------------------------
CREATE TABLE `student` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `studentName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for student1
-- ----------------------------
CREATE TABLE `student1` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `studentName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for student2
-- ----------------------------
CREATE TABLE `student2` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `studentName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
CREATE TABLE `teacher` (
  `t_id` int(11) NOT NULL,
  `teacherName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`t_id`),
  KEY `FKAA31CBE2D8DC52B0` (`t_id`),
  CONSTRAINT `FKAA31CBE2D8DC52B0` FOREIGN KEY (`t_id`) REFERENCES `student` (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for teacher1
-- ----------------------------
CREATE TABLE `teacher1` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacherName` varchar(255) DEFAULT NULL,
  `s_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`t_id`),
  UNIQUE KEY `s_id` (`s_id`),
  KEY `FK9C07B08FD8DBDE51` (`s_id`),
  CONSTRAINT `FK9C07B08FD8DBDE51` FOREIGN KEY (`s_id`) REFERENCES `student1` (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for teacher2
-- ----------------------------
CREATE TABLE `teacher2` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacherName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for teacherstudent
-- ----------------------------
CREATE TABLE `teacherstudent` (
  `s_id` int(11) NOT NULL,
  `t_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `FK800BF419F30F9C57` (`t_id`),
  KEY `FK800BF419D8DBDE51` (`s_id`),
  CONSTRAINT `FK800BF419D8DBDE51` FOREIGN KEY (`s_id`) REFERENCES `student2` (`s_id`),
  CONSTRAINT `FK800BF419F30F9C57` FOREIGN KEY (`t_id`) REFERENCES `teacher2` (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `accounting` VALUES ('1', '101', '建筑安装工程投资');
INSERT INTO `accounting` VALUES ('2', '102', '设备投资');
INSERT INTO `accounting` VALUES ('3', '103', '待摊投资');
INSERT INTO `accounting` VALUES ('4', '104', '其他投资');
INSERT INTO `accounting` VALUES ('5', '111', '交付使用资产');
INSERT INTO `accounting` VALUES ('6', '232', '银行存款');
INSERT INTO `accounting` VALUES ('17', '功夫', '好');
INSERT INTO `accounting` VALUES ('18', '你好', '天才');
INSERT INTO `accounting` VALUES ('31', '第三方', '似懂非懂分');
INSERT INTO `accounting` VALUES ('43', '鬼地方', '鬼地方');
INSERT INTO `accounting` VALUES ('44', 'vfds', '豆腐干');
INSERT INTO `accounting` VALUES ('45', 'zz', 'aa');
INSERT INTO `p1` VALUES ('1', '30', 'zhouqi');
INSERT INTO `s1` VALUES ('zhouqi', '1234', '15');
INSERT INTO `student` VALUES ('1', 'zqs');
INSERT INTO `student1` VALUES ('4', 'zqs');
INSERT INTO `student2` VALUES ('1', 'A');
INSERT INTO `student2` VALUES ('2', 'B');
INSERT INTO `teacher` VALUES ('1', 'zh');
INSERT INTO `teacher1` VALUES ('4', 'zh', '4');
INSERT INTO `teacher2` VALUES ('1', 'a');
INSERT INTO `teacher2` VALUES ('2', 'b');
INSERT INTO `teacherstudent` VALUES ('1', '2', '1');
INSERT INTO `teacherstudent` VALUES ('1', '2', '2');
INSERT INTO `teacherstudent` VALUES ('2', '2', '3');
