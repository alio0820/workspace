/*
MySQL Data Transfer
Source Host: localhost
Source Database: amarsoft
Target Host: localhost
Target Database: amarsoft
Date: 2013/9/1 10:36:11
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for groupmember
-- ----------------------------
CREATE TABLE `groupmember` (
  `groupId` varchar(16) NOT NULL,
  `memberId` varchar(16) NOT NULL,
  PRIMARY KEY (`groupId`,`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for mealorder
-- ----------------------------
CREATE TABLE `mealorder` (
  `orderId` varchar(32) NOT NULL,
  `userId` varchar(32) NOT NULL,
  `orderDate` varchar(16) DEFAULT NULL,
  `orderTime` int(8) DEFAULT '2' COMMENT '1表示早餐，2表示中餐，3表示晚餐，4表示夜宵',
  `orderPrice` int(8) DEFAULT NULL,
  `addRice` int(8) DEFAULT '0',
  `confirm` int(8) DEFAULT '0' COMMENT '是否付款确认',
  PRIMARY KEY (`orderId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for mealorder_total
-- ----------------------------
CREATE TABLE `mealorder_total` (
  `totalId` varchar(16) DEFAULT '',
  `groupId` varchar(16) NOT NULL,
  `orderDate` varchar(16) NOT NULL DEFAULT '',
  `orderTime` int(8) NOT NULL DEFAULT '0',
  `price_8` int(8) DEFAULT '0',
  `price_10` int(8) DEFAULT '0',
  `price_12` int(8) DEFAULT '0',
  `addRiceNum` int(8) DEFAULT '0',
  `num` int(8) DEFAULT NULL,
  `total` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for role
-- ----------------------------
CREATE TABLE `role` (
  `roleId` varchar(16) NOT NULL,
  `roleName` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for user
-- ----------------------------
CREATE TABLE `user` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `userId` varchar(16) DEFAULT NULL,
  `password` varchar(16) NOT NULL,
  `userName` varchar(32) DEFAULT NULL,
  `nickName` varchar(32) DEFAULT NULL,
  `roleId` varchar(16) DEFAULT NULL,
  `groupId` varchar(16) DEFAULT NULL,
  `registerTime` varchar(16) DEFAULT NULL,
  `registerIp` varchar(16) DEFAULT NULL,
  `recentTime` varchar(16) DEFAULT NULL,
  `recentIp` varchar(16) DEFAULT NULL,
  `updateTime` varchar(16) DEFAULT NULL,
  `valid` int(8) DEFAULT '0',
  `remark` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `groupmember` VALUES ('yzheng', 'cdzhai');
INSERT INTO `groupmember` VALUES ('yzheng', 'yzheng');
INSERT INTO `mealorder` VALUES ('20130726124307', 'yzheng', '2013-07-26', '3', '12', '1', '0');
INSERT INTO `mealorder` VALUES ('20130730073514', 'yzheng', '2013-07-30', '3', '8', '1', '1');
INSERT INTO `mealorder_total` VALUES ('20130724125619', '1', '2013-07-25', '3', '0', '0', '0', '0', '0', '0');
INSERT INTO `mealorder_total` VALUES ('20130726120113', '1', '2013-07-26', '3', '0', '0', '0', '0', '0', '0');
INSERT INTO `mealorder_total` VALUES ('20130730073536', '1', '2013-07-30', '3', '1', '0', '0', '1', '1', '8');
INSERT INTO `role` VALUES ('0', '管理员');
INSERT INTO `role` VALUES ('1', '会员');
INSERT INTO `role` VALUES ('2', '组长');
INSERT INTO `role` VALUES ('3', '伙夫长');
INSERT INTO `user` VALUES ('1', 'cdzhai', '123456', '翟灿东', '四爷', '0', '1', null, null, null, null, null, '1', null);
INSERT INTO `user` VALUES ('2', 'yzheng', '123456', '郑杨', '老郑', '2', '1', null, null, null, null, null, '1', null);
INSERT INTO `user` VALUES ('3', 'ycliu', '123456', '刘毓椿', '春哥', '3', '1', null, null, null, null, null, '1', null);
INSERT INTO `user` VALUES ('4', 'lxiao', '123456', '肖磊', '磊哥', '1', '1', null, null, null, null, null, '1', null);
INSERT INTO `user` VALUES ('5', 'dlsong', '123456', '宋代立', '宋大哥', '1', '1', null, null, null, null, null, '1', null);
