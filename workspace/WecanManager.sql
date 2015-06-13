/*
MySQL Data Transfer
Source Host: localhost
Source Database: wecan_manager
Target Host: localhost
Target Database: wecan_manager
Date: 2011/11/8 10:32:19
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for authority
-- ----------------------------
CREATE TABLE `authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `identity` varchar(255) DEFAULT NULL COMMENT '身份',
  `addmanager` tinyint(1) DEFAULT NULL COMMENT '添加管理员',
  `delmanager` tinyint(1) DEFAULT NULL COMMENT '删除管理员',
  `updatemanager` tinyint(1) DEFAULT NULL COMMENT '修改管理员信息',
  `adduser` tinyint(1) DEFAULT NULL COMMENT '添加用户',
  `deluser` tinyint(1) DEFAULT NULL COMMENT '删除用户',
  `updateuser` tinyint(1) DEFAULT NULL COMMENT '更新用户信息',
  `addnotice` tinyint(1) DEFAULT NULL COMMENT '公布公告',
  `aceptnotice` tinyint(1) DEFAULT NULL COMMENT '接受公告',
  `querynotice` tinyint(1) DEFAULT NULL COMMENT '查看公告',
  `updownmessage` tinyint(1) DEFAULT NULL COMMENT '修改个人信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for commend
-- ----------------------------
CREATE TABLE `commend` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `date` datetime DEFAULT NULL COMMENT '管理员向表中添加记录的时间',
  `reason` varchar(255) DEFAULT NULL COMMENT '奖励原因',
  `usercommend_id` int(11) DEFAULT NULL COMMENT '外键，即关联到user表，确定是哪个人发布的',
  PRIMARY KEY (`id`),
  KEY `usercommend_id` (`usercommend_id`),
  CONSTRAINT `usercommend_id` FOREIGN KEY (`usercommend_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for notice
-- ----------------------------
CREATE TABLE `notice` (
  `id` int(11) NOT NULL COMMENT '主键',
  `topic` varchar(255) DEFAULT NULL COMMENT '公告题目',
  `text` text COMMENT '公告内容',
  `sendToSomeone` varchar(255) DEFAULT NULL COMMENT '公告接受者',
  `sendr` int(11) DEFAULT NULL COMMENT '外键，关联user,确定是哪个人发表的公告',
  PRIMARY KEY (`id`),
  KEY `sender` (`sendr`),
  CONSTRAINT `sender` FOREIGN KEY (`sendr`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `count_id` varchar(10) NOT NULL COMMENT '工号',
  `name` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `department` varchar(255) DEFAULT NULL COMMENT '部门',
  `tel` varchar(255) DEFAULT NULL COMMENT '联系方式',
  `major` varchar(255) DEFAULT NULL COMMENT '专业',
  `photo` varchar(255) DEFAULT NULL COMMENT '照片，存路径',
  `description` varchar(255) DEFAULT NULL COMMENT '备注',
  `authority_id` int(11) DEFAULT NULL COMMENT '外键，关联authority表，确定该成员的身份及权利',
  PRIMARY KEY (`id`),
  KEY `authority_id` (`authority_id`),
  CONSTRAINT `authority_id` FOREIGN KEY (`authority_id`) REFERENCES `authority` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `authority` VALUES ('1', '超级管理员', '1', '1', '1', '1', '1', '1', '1', '0', '1', '1');
INSERT INTO `authority` VALUES ('2', '管理员', '0', '0', '0', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `authority` VALUES ('3', '成员', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1');
INSERT INTO `user` VALUES ('1', 'chengqingmin', 'wecan2011', '00100001', '成青敏', '技术部', null, null, null, null, '1');
INSERT INTO `user` VALUES ('2', 'sunling', 'wecan2011', '00100002', '孙玲', '技术部', null, null, null, null, '2');
INSERT INTO `user` VALUES ('3', 'houxun', 'wecan2011', '00100003', '侯寻', '技术部', null, null, null, null, '3');
INSERT INTO `user` VALUES ('4', 'sunxiansong', 'wecan2011', '00100004', '孙显松', '技术部', null, null, null, null, '3');
INSERT INTO `user` VALUES ('5', 'wangzhuomin', 'wecan2011', '00100005', '王卓敏', '技术部', null, null, null, null, '3');
INSERT INTO `user` VALUES ('6', 'sunminjie', 'wecan2011', '00200001', '孙敏捷', '市场部', null, null, null, null, '2');
INSERT INTO `user` VALUES ('7', 'baijie', 'wecan2011', '00200002', '白洁', '市场部', null, null, null, null, '3');
INSERT INTO `user` VALUES ('8', 'liwei', 'wecan2011', '00100006', '李薇', '技术部', null, null, null, null, '3');
INSERT INTO `user` VALUES ('9', 'linchuangsheng', 'wecan2011', '00100007', '林创胜', '技术部', null, null, null, null, '3');
INSERT INTO `user` VALUES ('10', 'wangcailei', 'wecan2011', '00100008', '王彩垒', '技术部', null, null, null, null, '3');
INSERT INTO `user` VALUES ('11', 'wangxi', 'wecan2011', '00100009', '王茜', '技术部', null, null, null, null, '3');
INSERT INTO `user` VALUES ('12', 'yuhuaren', 'wecan2011', '00100010', '禹华仁', '技术部', null, null, null, null, '3');
