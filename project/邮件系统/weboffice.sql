/*
MySQL Data Transfer
Source Host: localhost
Source Database: weboffice
Target Host: localhost
Target Database: weboffice
Date: 2013/8/17 17:02:50
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for mail
-- ----------------------------
CREATE TABLE `mail` (
  `userId` varchar(32) NOT NULL,
  `emailUserName` varchar(64) NOT NULL DEFAULT '',
  `emailPassword` varchar(32) DEFAULT NULL,
  `updateDate` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`userId`,`emailUserName`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for mailserver
-- ----------------------------
CREATE TABLE `mailserver` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `serverName` varchar(32) NOT NULL COMMENT '服务器名称',
  `receiveServer` varchar(32) NOT NULL COMMENT '接收服务器',
  `sendServer` varchar(32) NOT NULL COMMENT '发送服务器',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `updateDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`,`receiveServer`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for relationdegree
-- ----------------------------
CREATE TABLE `relationdegree` (
  `degreeId` int(8) NOT NULL COMMENT '关系程度Id',
  `degreeName` varchar(32) DEFAULT NULL COMMENT '关系程度名称',
  PRIMARY KEY (`degreeId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for relationdetail
-- ----------------------------
CREATE TABLE `relationdetail` (
  `personId1` int(8) NOT NULL DEFAULT '0',
  `personId2` int(8) NOT NULL DEFAULT '0',
  `date` varchar(16) DEFAULT NULL,
  `location` varchar(128) DEFAULT NULL COMMENT '地点',
  `content` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`personId1`,`personId2`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for relationinfo
-- ----------------------------
CREATE TABLE `relationinfo` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `birthday` varchar(32) DEFAULT NULL,
  `cellphone` varchar(16) DEFAULT NULL,
  `homephone` varchar(16) DEFAULT NULL,
  `companyName` varchar(64) DEFAULT NULL,
  `companyAddress` varchar(128) DEFAULT NULL,
  `companyPhone` varchar(255) DEFAULT NULL,
  `profession` varchar(32) DEFAULT NULL COMMENT '职位',
  `position` varchar(32) DEFAULT NULL COMMENT '职务',
  `graduateSchool` varchar(32) DEFAULT NULL,
  `grade` varchar(8) DEFAULT NULL COMMENT '年级',
  `hobby` varchar(128) DEFAULT NULL,
  `homeAddress` varchar(128) DEFAULT NULL,
  `QQ` varchar(16) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `MSN` varchar(32) DEFAULT NULL,
  `fax` varchar(32) DEFAULT NULL,
  `companyWebsite` varchar(64) DEFAULT NULL,
  `postcode` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for relationsummarize
-- ----------------------------
CREATE TABLE `relationsummarize` (
  `personId1` int(8) NOT NULL DEFAULT '0' COMMENT '关系主体',
  `personId2` int(8) NOT NULL DEFAULT '0' COMMENT '关系次体',
  `nickName` varchar(64) DEFAULT NULL COMMENT '昵称',
  `relationName` int(8) NOT NULL COMMENT '关系',
  `degree` int(8) DEFAULT NULL COMMENT '关系程度',
  `firstMeetTime` varchar(16) DEFAULT NULL COMMENT '初识时间',
  `recentContactTime` varchar(16) DEFAULT NULL COMMENT '最近一次联系时间',
  `contactRate` double(32,0) DEFAULT '0' COMMENT '联系频率',
  `nextMeet` varchar(16) DEFAULT NULL COMMENT '下次拟定会面时间',
  `remark1` varchar(256) DEFAULT NULL COMMENT '备注1',
  `remark2` varchar(256) DEFAULT NULL COMMENT '备注2',
  PRIMARY KEY (`personId1`,`personId2`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for relationtype
-- ----------------------------
CREATE TABLE `relationtype` (
  `typeId` varchar(8) NOT NULL COMMENT '关系Id',
  `typeName` varchar(32) DEFAULT NULL COMMENT '关系名称',
  `parentClassify` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for user
-- ----------------------------
CREATE TABLE `user` (
  `userId` varchar(32) NOT NULL,
  `nickName` varchar(64) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `value1` varchar(32) DEFAULT NULL,
  `value2` varchar(32) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `valid` varchar(8) DEFAULT NULL,
  `registerDate` varchar(32) DEFAULT NULL,
  `registerIp` varchar(32) DEFAULT NULL,
  `lastDate` varchar(32) DEFAULT NULL,
  `lastIp` varchar(32) DEFAULT NULL,
  `updateDate` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `mail` VALUES ('a', '450383731@qq.com', '9110#zhai', null);
INSERT INTO `mail` VALUES ('a', 'wangjiuyingzui@163.com', 'xingye', null);
INSERT INTO `mailserver` VALUES ('1', '网易126邮箱', 'pop3.126.com', 'smtp.126.com', null, '2013-04-27 00:00:00');
INSERT INTO `mailserver` VALUES ('2', '网易163免费邮', 'pop.163.com', 'smtp.163.com', null, '2013-04-27 00:00:00');
INSERT INTO `mailserver` VALUES ('3', '网易163VIP邮箱', 'pop.vip.163.com', 'smtp.vip.163.com', null, '2013-04-27 00:00:00');
INSERT INTO `mailserver` VALUES ('4', '网易188财富邮', 'pop.188.com', 'smtp.188.com', null, '2013-04-27 12:25:53');
INSERT INTO `mailserver` VALUES ('5', '网易yeah.net邮箱', 'pop.yeah.net', 'smtp.yeah.net', null, '2013-04-27 12:32:24');
INSERT INTO `mailserver` VALUES ('6', '网易netease.com邮箱', 'pop.netease.com', 'smtp.netease.com', null, '2013-04-27 12:33:05');
INSERT INTO `mailserver` VALUES ('7', '新浪收费邮箱', 'pop3.vip.sina.com', 'smtp.vip.sina.com', null, '2013-04-27 12:34:52');
INSERT INTO `mailserver` VALUES ('8', '新浪免费邮箱', 'pop3.sina.com.cn', 'smtp.sina.com.cn', null, '2013-04-27 12:35:25');
INSERT INTO `mailserver` VALUES ('9', '搜狐邮箱', 'pop3.sohu.com', 'smtp.sohu.com', null, '2013-04-27 12:35:59');
INSERT INTO `mailserver` VALUES ('10', '21cn快感邮', 'vip.21cn.com', 'vip.21cn.com', null, '2013-04-27 12:37:05');
INSERT INTO `mailserver` VALUES ('11', '21cn经济邮', 'pop.163.com', 'smtp.163.com', null, '2013-04-27 12:38:21');
INSERT INTO `mailserver` VALUES ('12', 'tom邮箱', 'pop.tom.com', 'smtp.tom.com', null, '2013-04-27 12:39:05');
INSERT INTO `mailserver` VALUES ('13', '263邮箱', '263.net', 'smtp.263.net', null, '2013-04-27 12:39:43');
INSERT INTO `mailserver` VALUES ('14', '网易163.com邮箱', 'rwypop.china.com', 'rwypop.china.com', null, '2013-04-27 12:40:22');
INSERT INTO `mailserver` VALUES ('15', '雅虎邮箱', 'pop.mail.yahoo.com', 'smtp.mail.yahoo.com', null, '2013-04-27 12:40:56');
INSERT INTO `mailserver` VALUES ('16', 'Gmail邮箱', 'pop.gmail.com', 'smtp.gmail.com', null, '2013-04-27 12:41:50');
INSERT INTO `mailserver` VALUES ('17', 'QQ邮箱', 'pop.qq.com', 'smtp.qq.com', null, '2013-04-27 12:51:11');
INSERT INTO `relationdegree` VALUES ('1', '一般');
INSERT INTO `relationdegree` VALUES ('2', '比较熟');
INSERT INTO `relationdegree` VALUES ('3', '很熟');
INSERT INTO `relationdegree` VALUES ('4', '非常熟');
INSERT INTO `relationdegree` VALUES ('5', '不熟');
INSERT INTO `relationinfo` VALUES ('1', '张敏', '女', '1989-08-17', '12345678998', '1234567', '北京影视有限责任公司', '北京市海淀区', '12345678909', '金融', '影视策划', '北京电影学院', '2008级', '舞蹈、看书、音乐', '天津市', '123456789', '123456789@qq.com', 'msn', '12345678', 'www.bjys.com', '123456');
INSERT INTO `relationinfo` VALUES ('2', '王小虎', '男', '1990-10-01', '13668893472', '1231231', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `relationinfo` VALUES ('3', '吴佳', '男', '1991-09-05', '18972125639', '023-6683781', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `relationinfo` VALUES ('4', '李杰', '男', '1990-03-27', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `relationinfo` VALUES ('5', '陈夕瑶', '女', '1990-11-23', null, null, '中国烟草无锡分公司', null, null, '销售', '营销主管', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `relationinfo` VALUES ('6', '郑爽', '女', '1989-01-19', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `relationinfo` VALUES ('7', '翟志刚', '男', '---', '15223347938', null, '中国航天局', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `relationinfo` VALUES ('8', '周源源', '女', '1990-12-15', null, null, null, null, null, null, null, '苏州大学', '2009级', null, null, null, null, null, null, null, null);
INSERT INTO `relationinfo` VALUES ('9', '叶夏', '男', '1991-07-12', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `relationinfo` VALUES ('10', '韦小敏', '女', '1987-01-05', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `relationinfo` VALUES ('11', '李刚', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `relationtype` VALUES ('01', '亲人', '0');
INSERT INTO `relationtype` VALUES ('0101', '爸爸', '01');
INSERT INTO `relationtype` VALUES ('0102', '妈妈', '01');
INSERT INTO `relationtype` VALUES ('0103', '哥哥', '01');
INSERT INTO `relationtype` VALUES ('0104', '弟弟', '01');
INSERT INTO `relationtype` VALUES ('0105', '姐姐', '01');
INSERT INTO `relationtype` VALUES ('0106', '妹妹', '01');
INSERT INTO `relationtype` VALUES ('0107', '爷爷', '01');
INSERT INTO `relationtype` VALUES ('0108', '奶奶', '01');
INSERT INTO `relationtype` VALUES ('0109', '外公', '01');
INSERT INTO `relationtype` VALUES ('0110', '外婆', '01');
INSERT INTO `relationtype` VALUES ('0111', '伯伯', '01');
INSERT INTO `relationtype` VALUES ('0112', '叔叔', '01');
INSERT INTO `relationtype` VALUES ('0113', '姑姑', '01');
INSERT INTO `relationtype` VALUES ('0114', '姑父', '01');
INSERT INTO `relationtype` VALUES ('0115', '小姨', '01');
INSERT INTO `relationtype` VALUES ('0116', '姨父', '01');
INSERT INTO `relationtype` VALUES ('0117', '舅舅', '01');
INSERT INTO `relationtype` VALUES ('0118', '舅妈', '01');
INSERT INTO `relationtype` VALUES ('0119', '堂哥', '01');
INSERT INTO `relationtype` VALUES ('0120', '堂弟', '01');
INSERT INTO `relationtype` VALUES ('0121', '堂姐', '01');
INSERT INTO `relationtype` VALUES ('0122', '堂妹', '01');
INSERT INTO `relationtype` VALUES ('0123', '表哥', '01');
INSERT INTO `relationtype` VALUES ('0124', '表弟', '01');
INSERT INTO `relationtype` VALUES ('0125', '表姐', '01');
INSERT INTO `relationtype` VALUES ('0126', '表妹', '01');
INSERT INTO `relationtype` VALUES ('02', '朋友', '0');
INSERT INTO `relationtype` VALUES ('0201', '男朋友', '02');
INSERT INTO `relationtype` VALUES ('0202', '女朋友', '02');
INSERT INTO `relationtype` VALUES ('0203', '朋友', '02');
INSERT INTO `relationtype` VALUES ('03', '同学', '0');
INSERT INTO `relationtype` VALUES ('0301', '小学同学', '03');
INSERT INTO `relationtype` VALUES ('0302', '初中同学', '03');
INSERT INTO `relationtype` VALUES ('0303', '高中同学', '03');
INSERT INTO `relationtype` VALUES ('0304', '大学同学', '03');
INSERT INTO `relationtype` VALUES ('0305', '研究生同学', '03');
INSERT INTO `relationtype` VALUES ('0306', '同学', '03');
INSERT INTO `relationtype` VALUES ('04', '同事', '0');
INSERT INTO `relationtype` VALUES ('0401', '以前同事', '04');
INSERT INTO `relationtype` VALUES ('0402', '同事', '04');
INSERT INTO `relationtype` VALUES ('05', '老乡', '0');
INSERT INTO `relationtype` VALUES ('06', '老师', '0');
INSERT INTO `relationtype` VALUES ('0601', '小学老师', '06');
INSERT INTO `relationtype` VALUES ('0602', '初中老师', '06');
INSERT INTO `relationtype` VALUES ('0603', '高中老师', '06');
INSERT INTO `relationtype` VALUES ('0604', '大学老师', '06');
INSERT INTO `relationtype` VALUES ('0605', '研究生老师', '06');
INSERT INTO `relationtype` VALUES ('0606', '老师', '06');
INSERT INTO `relationtype` VALUES ('07', '客户', '0');
INSERT INTO `relationtype` VALUES ('08', '熟人', '0');
INSERT INTO `relationtype` VALUES ('09', '偶遇', '0');
INSERT INTO `relationtype` VALUES ('10', '一面之交', '0');
INSERT INTO `user` VALUES ('a', '剑宗', '123456', null, null, '剑宗的账号谁敢偷', '1', '2013-4-14', '192.168.1.104', null, null, '2013-4-14');
