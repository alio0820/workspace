/*
MySQL Data Transfer
Source Host: localhost
Source Database: test
Target Host: localhost
Target Database: test
Date: 2011/9/11/���� 20:42:50
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for accounting
-- ----------------------------
CREATE TABLE `accounting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`,`num`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for contract
-- ----------------------------
CREATE TABLE `contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractNum` varchar(254) DEFAULT NULL,
  `contractName` varchar(254) DEFAULT NULL,
  `sideA` varchar(254) DEFAULT NULL,
  `sideB` varchar(254) DEFAULT NULL,
  `sideC` varchar(254) DEFAULT NULL,
  `signDate` date DEFAULT NULL,
  `money` varchar(254) DEFAULT NULL,
  `projectName` varchar(254) DEFAULT NULL,
  `kind` int(11) DEFAULT NULL,
  `contractContent` varchar(254) DEFAULT NULL,
  `pay` varchar(254) DEFAULT NULL,
  `route` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dataattribute
-- ----------------------------
CREATE TABLE `dataattribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`num`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for filesort
-- ----------------------------
CREATE TABLE `filesort` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`num`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for filesort_next
-- ----------------------------
CREATE TABLE `filesort_next` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) DEFAULT NULL,
  `id_forward` int(255) NOT NULL,
  PRIMARY KEY (`id`,`num`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for finance
-- ----------------------------
CREATE TABLE `finance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `own_project` varchar(255) NOT NULL,
  `money` varchar(255) NOT NULL,
  `borrow_object` varchar(255) DEFAULT NULL,
  `pay_way` varchar(255) DEFAULT NULL,
  `government_buystyle` varchar(255) DEFAULT NULL,
  `government_buysite` varchar(255) DEFAULT NULL,
  `proofID` varchar(255) NOT NULL,
  `contract_special` varchar(255) NOT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `haber_subject` varchar(255) DEFAULT NULL,
  `project_manage` varchar(255) DEFAULT NULL,
  `government_buyway` varchar(255) DEFAULT NULL,
  `government_buyclassify` varchar(255) DEFAULT NULL,
  `isSubmit` varchar(255) DEFAULT NULL,
  `projectid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for property
-- ----------------------------
CREATE TABLE `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`num`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for property_next
-- ----------------------------
CREATE TABLE `property_next` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) DEFAULT NULL,
  `id_forward` int(11) NOT NULL,
  PRIMARY KEY (`id`,`num`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for stu
-- ----------------------------
CREATE TABLE `stu` (
  `name` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for user
-- ----------------------------
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

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
INSERT INTO `contract` VALUES ('135', 'CNAO-2-1-2008-001', 'sh', '太极计算机股份有限公司', '审计署信息化建设办公室', '太极计算机股份有限公司', '2011-07-06', '900000', '地方金审工程二期立项审查', '0', 'hjhhh', '45345', 'gfgsghf');
INSERT INTO `dataattribute` VALUES ('1', '01', '金审工程立项');
INSERT INTO `dataattribute` VALUES ('2', '02', '金审工程立项批复文件');
INSERT INTO `dataattribute` VALUES ('3', '03', '金审工程调整申报文件');
INSERT INTO `dataattribute` VALUES ('4', '04', '金审工程调整批复文件');
INSERT INTO `dataattribute` VALUES ('5', '05', '金审工程领导讲话');
INSERT INTO `dataattribute` VALUES ('6', '06', '金审工程领导与实施机构');
INSERT INTO `dataattribute` VALUES ('7', '07', '金审工程规划建设文件');
INSERT INTO `dataattribute` VALUES ('8', '08', '金审工程工作会议文件');
INSERT INTO `dataattribute` VALUES ('9', '09', '金审工程管理办法');
INSERT INTO `dataattribute` VALUES ('12', '10', '金审工程标准规范');
INSERT INTO `filesort` VALUES ('1', '01', '工程立项文件');
INSERT INTO `filesort` VALUES ('2', '02', '工程管理文件');
INSERT INTO `filesort` VALUES ('3', '03', '土建项目文件');
INSERT INTO `filesort` VALUES ('4', '04', '网络建设项目文件');
INSERT INTO `filesort` VALUES ('5', '05', '安全建设项目文件');
INSERT INTO `filesort` VALUES ('6', '06', '应用建设项目文件');
INSERT INTO `filesort` VALUES ('7', '07', '信息资源项目文件');
INSERT INTO `filesort` VALUES ('8', '08', '运行服务项目文件');
INSERT INTO `filesort` VALUES ('9', '09', '科研项目文件');
INSERT INTO `filesort` VALUES ('10', '10', '工程预算财务文件');
INSERT INTO `filesort` VALUES ('12', '地方', '但纷纷');
INSERT INTO `filesort` VALUES ('15', '分地方滴', '大幅度');
INSERT INTO `filesort` VALUES ('17', '感觉登记', '发电公司');
INSERT INTO `filesort` VALUES ('18', '随碟附送都', '随碟附送都');
INSERT INTO `filesort` VALUES ('20', '神鼎飞丹砂', '似懂非懂');
INSERT INTO `filesort` VALUES ('22', '大幅度', '第三方');
INSERT INTO `filesort` VALUES ('23', '第一个程序', '中软国际IT培训基地');
INSERT INTO `filesort_next` VALUES ('1', '0101', '项目建议书文件', '1');
INSERT INTO `filesort_next` VALUES ('2', '0102', '可行性研究报告文件', '1');
INSERT INTO `filesort_next` VALUES ('3', '0103', '初步设计及投资概算报告', '1');
INSERT INTO `filesort_next` VALUES ('4', '0104', '工程实施调整报告', '1');
INSERT INTO `filesort_next` VALUES ('5', '0105', '地方金审工程立项审查文件', '1');
INSERT INTO `finance` VALUES ('4', '2011-07-20', '金审', '1400', '金审', '金审', '金审', '国内', '6666', '金审', '金审', '金审', '金审', '金审', '金审', '已提交', null);
INSERT INTO `finance` VALUES ('30', '2011-07-25', '金审工程二期项目建议书', '12000', '建筑安装工程投资', '财政直接支付', '自行组织集中采购机构采购', '国内', '0003', '二期可研论证', '', '建筑安装工程投资', '房屋购置费', '竞争性谈判', '货物', '已提交', null);
INSERT INTO `finance` VALUES ('40', '2011-07-26', '四', '44', '四', '四', '四', '国内', '5378', '四', '七', '四', '四', '四', '四', '已提交', null);
INSERT INTO `finance` VALUES ('42', '2011-07-27', '八', '88', '八', '八', '八', '国内', '3292', '八', '八', '八', '八', '八', '八', '已提交', null);
INSERT INTO `finance` VALUES ('46', '2011-07-10', '五', '55', '五', '五', '五', '国内', '0746', '五', '五', '五', '五', '五', '五', '已提交', null);
INSERT INTO `finance` VALUES ('47', '2011-07-11', '十', '10', '十', '十', '十', '国内', '3576', '十', '十', '十', '十', '十', '十', null, null);
INSERT INTO `finance` VALUES ('48', '2011-07-27', '二', '22', '二', '二', '二', '国内', '8567', '二', '二', '二', '二', '二', '二', null, null);
INSERT INTO `finance` VALUES ('49', '2011-07-27', '三', '33', '三', '三', '三', '国内', '8964', '三', '三', '三', '三', '三', '三', null, null);
INSERT INTO `finance` VALUES ('50', '2011-07-27', '四', '44', '四', '四', '四', '国内', '8515', '四', '四', '四', '四', '四', '四', '已提交', null);
INSERT INTO `finance` VALUES ('51', '2011-07-24', '一', '11', '一', '一', '一', '国外', '7136', '一', '一', '一', '一', '一', '一', null, null);
INSERT INTO `finance` VALUES ('52', '2011-07-26', '六', '66', '六', '六', '六', '国外', '3630', '六', '六', '六', '六', '六', '六', null, null);
INSERT INTO `finance` VALUES ('53', '2011-07-28', '九', '99', '九', '九', '九', '国内', '6128', '九', '时', '九', '九', '九', '九', null, null);
INSERT INTO `property` VALUES ('1', '01', '土建及改造工程');
INSERT INTO `property` VALUES ('2', '02', '网络设备');
INSERT INTO `property` VALUES ('3', '03', '服务器设备');
INSERT INTO `property` VALUES ('4', '04', '存储设备');
INSERT INTO `property` VALUES ('5', '05', '安全设备');
INSERT INTO `property` VALUES ('6', '06', '终端设备');
INSERT INTO `property` VALUES ('7', '07', '视频设备');
INSERT INTO `property` VALUES ('8', '08', '外围设备');
INSERT INTO `property` VALUES ('9', '09', '机房设备');
INSERT INTO `property` VALUES ('10', '10', '其他设备');
INSERT INTO `property` VALUES ('11', '20', '通用软件');
INSERT INTO `property` VALUES ('12', '21', '定制软件');
INSERT INTO `property` VALUES ('13', '22', '信息资源');
INSERT INTO `property` VALUES ('14', '3r5343', 'q');
INSERT INTO `property_next` VALUES ('1', '0101', '土建购置', '1');
INSERT INTO `property_next` VALUES ('2', '0102', '机房改造设施', '1');
INSERT INTO `property_next` VALUES ('3', '0103', '网络改造设施', '1');
INSERT INTO `property_next` VALUES ('4', '0104', '广域接入设施', '1');
INSERT INTO `property_next` VALUES ('5', '为儿童因', '斯蒂', '1');
INSERT INTO `stu` VALUES ('1', '1');
INSERT INTO `stu` VALUES ('aa', '1');
INSERT INTO `stu` VALUES ('bb', '1');
INSERT INTO `stu` VALUES ('qq', '11');
INSERT INTO `user` VALUES ('1', 'zcd', '111');
INSERT INTO `user` VALUES ('2', 'bb', '111');
INSERT INTO `user` VALUES ('3', '你好', '11');
