/*
Navicat MySQL Data Transfer

Source Server         : hadoop
Source Server Version : 50154
Source Host           : localhost:3306
Source Database       : hadoopdb

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2012-01-13 21:27:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `citrtree`
-- ----------------------------
DROP TABLE IF EXISTS `citrtree`;
CREATE TABLE `citrtree` (
  `ID` char(20) NOT NULL,
  `TimeStam` int(64) NOT NULL,
  `Spec` char(16) DEFAULT NULL,
  `Age` int(32) DEFAULT NULL,
  `soilprop` char(4) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of citrtree
-- ----------------------------
INSERT INTO `citrtree` VALUES ('chongq_fuling_000001', '1294195200', null, null, '沙土');
INSERT INTO `citrtree` VALUES ('chongq_fuling_000002', '1294195200', null, null, '沙土');
INSERT INTO `citrtree` VALUES ('chongq_fuling_000003', '1294194600', null, null, '沙土');
INSERT INTO `citrtree` VALUES ('chongq_fuling_000004', '1294194600', null, null, '沙土');
INSERT INTO `citrtree` VALUES ('chongq_fuling_000005', '1294194600', null, null, '沙土');
INSERT INTO `citrtree` VALUES ('chongq_fuling_000006', '1294194600', null, null, '沙土');
INSERT INTO `citrtree` VALUES ('chongq_fuling_000007', '1294193400', null, null, '沙土');
INSERT INTO `citrtree` VALUES ('chongq_fuling_000008', '1294193400', null, null, '沙土');
INSERT INTO `citrtree` VALUES ('chongq_fuling_000009', '1294193400', null, null, '沙土');
INSERT INTO `citrtree` VALUES ('chongq_fuling_000010', '1294193400', null, null, '沙土');
INSERT INTO `citrtree` VALUES ('chongq_fuling_000011', '1294193400', null, null, '粘土');
INSERT INTO `citrtree` VALUES ('chongq_fuling_000012', '1294192800', null, null, '粘土');
INSERT INTO `citrtree` VALUES ('chongq_fuling_000013', '1294192800', null, null, '粘土');
INSERT INTO `citrtree` VALUES ('chongq_fuling_000014', '1294192200', null, null, '粘土');
INSERT INTO `citrtree` VALUES ('chongq_fuling_000015', '1294191600', null, null, '粘土');
INSERT INTO `citrtree` VALUES ('chongq_fuling_000016', '1294191600', null, null, '粘土');
INSERT INTO `citrtree` VALUES ('chongq_fuling_000017', '1294191000', null, null, '粘土');
INSERT INTO `citrtree` VALUES ('chongq_fuling_000018', '1294191000', null, null, '粘土');
INSERT INTO `citrtree` VALUES ('chongq_fuling_000019', '1294191000', null, null, '粘土');
INSERT INTO `citrtree` VALUES ('chongq_fuling_000020', '1294190400', null, null, '粘土');
INSERT INTO `citrtree` VALUES ('chongq_fuling_000021', '1294189800', null, null, '壤土');
INSERT INTO `citrtree` VALUES ('chongq_fuling_000022', '1294189800', null, null, '壤土');
INSERT INTO `citrtree` VALUES ('chongq_fuling_000023', '1294188600', null, null, '壤土');
INSERT INTO `citrtree` VALUES ('chongq_fuling_000024', '1294188600', null, null, '壤土');
INSERT INTO `citrtree` VALUES ('chongq_fuling_000025', '1294188600', null, null, '壤土');
INSERT INTO `citrtree` VALUES ('chongq_fuling_000026', '1294188600', null, null, '壤土');
INSERT INTO `citrtree` VALUES ('chongq_fuling_000027', '1294188600', null, null, '壤土');
INSERT INTO `citrtree` VALUES ('chongq_fuling_000028', '1294188000', null, null, '壤土');
INSERT INTO `citrtree` VALUES ('chongq_fuling_000029', '1294185000', null, null, '壤土');
INSERT INTO `citrtree` VALUES ('chongq_fuling_000030', '1294183200', null, null, '壤土');

-- ----------------------------
-- Table structure for `irrisugg`
-- ----------------------------
DROP TABLE IF EXISTS `irrisugg`;
CREATE TABLE `irrisugg` (
  `expeSuggNumb` char(20) NOT NULL,
  `conc` char(4) NOT NULL,
  `expeSugg` text NOT NULL,
  PRIMARY KEY (`expeSuggNumb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of irrisugg
-- ----------------------------
INSERT INTO `irrisugg` VALUES ('suggest1', '缺乏', '立即进行春灌,先在树冠下筑土埂形成灌水盘，每平方米树冠投影面积灌水20kg；在树冠滴水线附近挖灌水穴2-4个，每平方米树冠投影面积灌水10kg；');
INSERT INTO `irrisugg` VALUES ('suggest2', '缺乏', '立即进行冬灌,先在树冠下筑土埂形成灌水盘，每平方米树冠投影面积灌水10kg；在树冠滴水线附近挖灌水穴2-4个，每平方米树冠投影面积灌水7kg；霜冻来临前树盘灌透水');
INSERT INTO `irrisugg` VALUES ('suggest3', '缺乏', '先进行松土和树盘覆草，每平方米树冠投影面积灌水30kg；在树冠滴水线附近挖灌水穴2-4个，每平方米树冠投影面积灌水30kg；');
INSERT INTO `irrisugg` VALUES ('suggest4', '低量', '先进行松土和树盘覆草，每平方米树冠投影面积灌水15kg；在树冠滴水线附近挖灌水穴2-4个，每平方米树冠投影面积灌水10kg');
INSERT INTO `irrisugg` VALUES ('suggest5', '低量', '立即进行冬灌,先在树冠下筑土埂形成灌水盘，在树冠滴水线附近挖灌水穴2-4个，每平方米树冠投影面积灌水5kg；霜冻来临前树盘灌透水');
INSERT INTO `irrisugg` VALUES ('suggest6', '低量', '先进行松土和树盘覆草，每平方米树冠投影面积灌水20kg；在树冠滴水线附近挖灌水穴2-4个，每平方米树冠投影面积灌水15kg；');
INSERT INTO `irrisugg` VALUES ('suggest7', '适宜', '不需灌水，可进行树冠下土面覆盖杂草保墒。');
INSERT INTO `irrisugg` VALUES ('suggest8', '过量', '开挖排水沟，排除果园过多积水。');

-- ----------------------------
-- Table structure for `loca`
-- ----------------------------
DROP TABLE IF EXISTS `loca`;
CREATE TABLE `loca` (
  `High` double(32,0) NOT NULL,
  `Dime` double(32,0) NOT NULL,
  `Litu` double(32,0) NOT NULL,
  `ID` char(20) NOT NULL,
  PRIMARY KEY (`High`,`Dime`,`Litu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loca
-- ----------------------------

-- ----------------------------
-- Table structure for `mete`
-- ----------------------------
DROP TABLE IF EXISTS `mete`;
CREATE TABLE `mete` (
  `ID` char(20) NOT NULL,
  `TimeStam` int(64) NOT NULL,
  `AirTemp` double(32,0) NOT NULL,
  `Humi` double(32,0) NOT NULL,
  `AtmoPres` double(32,0) NOT NULL,
  `UVRadi` double(32,0) NOT NULL,
  `Evap` double(32,0) NOT NULL,
  `RainFall` double(32,0) NOT NULL,
  PRIMARY KEY (`ID`,`TimeStam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mete
-- ----------------------------

-- ----------------------------
-- Table structure for `soilfert`
-- ----------------------------
DROP TABLE IF EXISTS `soilfert`;
CREATE TABLE `soilfert` (
  `ID` char(20) NOT NULL,
  `TimeStam` int(64) NOT NULL,
  `NCont` double(32,0) NOT NULL,
  `KCont` double(32,0) NOT NULL,
  `PCont` double(32,0) NOT NULL,
  `PHValu` double(32,0) NOT NULL,
  PRIMARY KEY (`ID`,`TimeStam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of soilfert
-- ----------------------------

-- ----------------------------
-- Table structure for `soilhumi`
-- ----------------------------
DROP TABLE IF EXISTS `soilhumi`;
CREATE TABLE `soilhumi` (
  `ID` char(20) NOT NULL,
  `TimeStam` int(64) NOT NULL,
  `Humi1` double(32,0) NOT NULL,
  `Humi2` double(32,0) NOT NULL,
  `Humi3` double(32,0) NOT NULL,
  PRIMARY KEY (`ID`,`TimeStam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of soilhumi
-- ----------------------------
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000001', '1294117200', '193', '137', '240');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000001', '1294120800', '382', '126', '135');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000001', '1294124400', '256', '211', '221');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000001', '1294128000', '111', '101', '165');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000001', '1294131600', '182', '14', '75');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000001', '1294135200', '108', '193', '191');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000001', '1294138800', '142', '0', '0');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000001', '1294142400', '137', '111', '90');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000001', '1294146000', '101', '79', '108');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000001', '1294149600', '96', '2', '92');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000001', '1294153200', '90', '88', '81');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000001', '1294156800', '99', '73', '88');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000001', '1294160400', '104', '71', '88');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000001', '1294164000', '84', '90', '79');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000001', '1294167600', '33', '73', '89');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000001', '1294171200', '98', '76', '70');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000001', '1294174800', '97', '78', '68');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000001', '1294178400', '85', '3', '84');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000001', '1294182000', '27', '85', '77');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000001', '1294185600', '82', '88', '78');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000001', '1294189200', '90', '80', '92');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000001', '1294192800', '95', '89', '79');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000002', '1294117200', '418', '234', '178');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000002', '1294120800', '276', '140', '104');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000002', '1294124400', '307', '235', '273');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000002', '1294128000', '130', '168', '137');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000002', '1294131600', '166', '7', '81');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000002', '1294135200', '35', '79', '135');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000002', '1294138800', '99', '132', '0');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000002', '1294142400', '14', '5', '94');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000002', '1294146000', '34', '3', '107');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000002', '1294149600', '87', '97', '89');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000002', '1294153200', '105', '19', '14');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000002', '1294156800', '87', '87', '67');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000002', '1294160400', '86', '91', '80');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000002', '1294164000', '86', '78', '94');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000002', '1294167600', '84', '62', '90');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000002', '1294171200', '93', '91', '77');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000002', '1294174800', '99', '76', '1');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000002', '1294178400', '83', '78', '85');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000002', '1294182000', '94', '73', '81');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000002', '1294185600', '99', '67', '95');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000002', '1294189200', '88', '85', '81');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000002', '1294192800', '93', '74', '69');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000003', '1294117200', '137', '212', '154');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000003', '1294120800', '342', '278', '106');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000003', '1294124400', '182', '145', '245');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000003', '1294128000', '42', '73', '84');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000003', '1294131600', '115', '128', '187');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000003', '1294135200', '128', '183', '1');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000003', '1294138800', '32', '102', '97');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000003', '1294142400', '12', '83', '79');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000003', '1294146000', '137', '124', '102');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000003', '1294149600', '37', '17', '70');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000003', '1294153200', '94', '90', '97');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000003', '1294156800', '29', '6', '74');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000003', '1294160400', '101', '81', '77');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000003', '1294164000', '94', '75', '80');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000003', '1294167600', '103', '93', '73');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000003', '1294171200', '79', '84', '80');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000003', '1294174800', '96', '72', '88');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000003', '1294178400', '91', '77', '96');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000003', '1294182000', '103', '78', '82');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000003', '1294185600', '100', '76', '3');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000003', '1294189200', '72', '12', '79');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000003', '1294192800', '107', '85', '75');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000004', '1294117200', '145', '282', '272');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000004', '1294120800', '218', '9', '162');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000004', '1294124400', '343', '146', '108');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000004', '1294128000', '179', '152', '72');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000004', '1294131600', '176', '143', '195');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000004', '1294135200', '112', '128', '179');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000004', '1294138800', '105', '147', '121');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000004', '1294142400', '141', '127', '110');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000004', '1294146000', '12', '102', '82');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000004', '1294149600', '95', '90', '89');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000004', '1294153200', '106', '68', '60');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000004', '1294156800', '93', '77', '92');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000004', '1294160400', '97', '12', '94');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000004', '1294164000', '93', '2', '91');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000004', '1294167600', '34', '82', '71');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000004', '1294171200', '91', '97', '88');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000004', '1294174800', '90', '76', '90');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000004', '1294178400', '93', '71', '89');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000004', '1294182000', '30', '89', '6');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000004', '1294185600', '99', '74', '71');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000004', '1294189200', '28', '73', '64');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000004', '1294192800', '35', '80', '69');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000005', '1294117200', '342', '215', '255');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000005', '1294120800', '403', '164', '132');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000005', '1294124400', '133', '123', '254');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000005', '1294128000', '150', '133', '180');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000005', '1294131600', '168', '163', '193');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000005', '1294135200', '100', '145', '143');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000005', '1294138800', '101', '96', '142');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000005', '1294142400', '143', '143', '125');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000005', '1294146000', '124', '107', '148');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000005', '1294149600', '91', '68', '72');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000005', '1294153200', '102', '77', '78');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000005', '1294156800', '100', '18', '85');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000005', '1294160400', '107', '89', '85');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000005', '1294164000', '90', '86', '85');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000005', '1294167600', '94', '1', '91');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000005', '1294171200', '92', '83', '96');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000005', '1294174800', '98', '91', '91');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000005', '1294178400', '27', '96', '75');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000005', '1294182000', '88', '14', '87');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000005', '1294185600', '100', '94', '85');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000005', '1294189200', '90', '89', '86');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000005', '1294192800', '33', '73', '82');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000006', '1294117200', '184', '184', '148');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000006', '1294120800', '214', '216', '240');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000006', '1294124400', '413', '137', '107');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000006', '1294128000', '4', '134', '97');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000006', '1294131600', '140', '18', '97');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000006', '1294135200', '147', '122', '101');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000006', '1294138800', '114', '130', '78');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000006', '1294142400', '120', '136', '13');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000006', '1294149600', '31', '87', '84');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000006', '1294153200', '99', '97', '79');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000006', '1294156800', '103', '81', '77');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000006', '1294160400', '86', '59', '85');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000006', '1294164000', '94', '69', '94');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000006', '1294167600', '91', '70', '96');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000006', '1294171200', '94', '81', '71');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000006', '1294174800', '102', '11', '26');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000006', '1294178400', '104', '93', '76');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000006', '1294182000', '91', '89', '79');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000006', '1294185600', '93', '3', '94');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000006', '1294189200', '93', '77', '76');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000006', '1294192800', '85', '79', '97');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000007', '1294113600', '381', '164', '97');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000007', '1294117200', '194', '110', '115');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000007', '1294120800', '182', '91', '132');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000007', '1294124400', '306', '121', '144');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000007', '1294128000', '19', '128', '100');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000007', '1294131600', '4', '79', '129');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000007', '1294135200', '126', '82', '125');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000007', '1294138800', '137', '147', '80');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000007', '1294142400', '101', '79', '137');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000007', '1294146000', '89', '83', '83');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000007', '1294149600', '101', '92', '68');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000007', '1294153200', '100', '17', '6');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000007', '1294156800', '96', '88', '12');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000007', '1294160400', '106', '83', '92');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000007', '1294164000', '28', '7', '89');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000007', '1294167600', '98', '85', '71');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000007', '1294171200', '78', '84', '77');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000007', '1294174800', '37', '81', '77');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000007', '1294178400', '94', '89', '70');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000007', '1294182000', '29', '83', '89');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000007', '1294185600', '85', '83', '74');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000007', '1294189200', '96', '75', '67');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000007', '1294192800', '89', '69', '87');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000008', '1294113600', '169', '283', '112');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000008', '1294117200', '304', '161', '122');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000008', '1294120800', '209', '259', '223');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000008', '1294124400', '197', '113', '193');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000008', '1294128000', '95', '149', '104');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000008', '1294131600', '133', '99', '168');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000008', '1294135200', '131', '120', '83');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000008', '1294138800', '99', '71', '130');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000008', '1294142400', '96', '8', '91');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000008', '1294146000', '106', '95', '95');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000008', '1294149600', '88', '90', '79');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000008', '1294153200', '78', '78', '19');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000008', '1294156800', '97', '94', '79');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000008', '1294160400', '98', '82', '72');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000008', '1294164000', '90', '74', '92');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000008', '1294167600', '92', '91', '81');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000008', '1294171200', '92', '73', '64');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000008', '1294174800', '97', '71', '1');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000008', '1294178400', '93', '73', '91');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000008', '1294182000', '34', '81', '71');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000008', '1294185600', '40', '76', '71');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000008', '1294189200', '100', '75', '79');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000008', '1294192800', '93', '1', '92');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000009', '1294113600', '325', '111', '98');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000009', '1294117200', '315', '256', '233');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000009', '1294120800', '262', '116', '168');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000009', '1294124400', '372', '100', '195');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000009', '1294128000', '177', '14', '85');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000009', '1294131600', '29', '93', '142');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000009', '1294135200', '99', '143', '126');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000009', '1294138800', '116', '113', '92');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000009', '1294142400', '116', '93', '74');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000009', '1294146000', '32', '5', '97');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000009', '1294149600', '99', '80', '75');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000009', '1294153200', '105', '90', '2');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000009', '1294156800', '100', '97', '72');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000009', '1294160400', '92', '72', '90');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000009', '1294164000', '34', '75', '81');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000009', '1294167600', '94', '86', '77');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000009', '1294171200', '39', '83', '96');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000009', '1294174800', '103', '75', '94');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000009', '1294178400', '103', '71', '94');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000009', '1294182000', '87', '82', '72');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000009', '1294185600', '88', '97', '88');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000009', '1294189200', '30', '69', '78');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000009', '1294192800', '91', '64', '93');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000010', '1294113600', '145', '245', '208');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000010', '1294117200', '341', '267', '273');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000010', '1294120800', '398', '133', '251');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000010', '1294124400', '245', '124', '155');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000010', '1294128000', '106', '172', '192');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000010', '1294131600', '129', '159', '101');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000010', '1294135200', '133', '96', '22');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000010', '1294138800', '91', '110', '93');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000010', '1294142400', '92', '20', '75');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000010', '1294146000', '29', '73', '74');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000010', '1294149600', '93', '89', '67');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000010', '1294153200', '92', '73', '76');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000010', '1294156800', '41', '80', '76');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000010', '1294160400', '96', '74', '94');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000010', '1294164000', '106', '7', '82');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000010', '1294167600', '86', '93', '84');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000010', '1294171200', '95', '86', '67');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000010', '1294174800', '96', '76', '72');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000010', '1294178400', '91', '93', '3');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000010', '1294182000', '86', '89', '80');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000010', '1294185600', '88', '94', '85');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000010', '1294189200', '86', '85', '75');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000010', '1294192800', '87', '8', '79');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000011', '1294113600', '319', '188', '214');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000011', '1294117200', '161', '162', '131');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000011', '1294120800', '252', '128', '146');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000011', '1294124400', '195', '96', '219');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000011', '1294128000', '14', '13', '81');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000011', '1294131600', '48', '84', '157');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000011', '1294135200', '104', '93', '73');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000011', '1294138800', '119', '80', '86');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000011', '1294142400', '19', '75', '109');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000011', '1294146000', '91', '71', '93');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000011', '1294149600', '95', '72', '59');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000011', '1294153200', '29', '76', '59');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000011', '1294156800', '93', '3', '13');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000011', '1294160400', '90', '14', '80');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000011', '1294164000', '96', '76', '91');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000011', '1294167600', '98', '70', '74');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000011', '1294171200', '89', '81', '72');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000011', '1294174800', '37', '77', '63');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000011', '1294178400', '88', '92', '80');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000011', '1294182000', '100', '93', '92');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000011', '1294185600', '93', '91', '82');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000011', '1294189200', '89', '91', '82');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000011', '1294192800', '106', '93', '5');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000012', '1294113600', '340', '207', '274');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000012', '1294117200', '335', '78', '278');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000012', '1294120800', '326', '234', '2');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000012', '1294124400', '129', '103', '75');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000012', '1294128000', '116', '189', '198');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000012', '1294131600', '173', '169', '149');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000012', '1294135200', '111', '102', '95');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000012', '1294138800', '127', '139', '6');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000012', '1294142400', '28', '89', '125');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000012', '1294146000', '92', '60', '80');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000012', '1294149600', '92', '71', '96');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000012', '1294153200', '42', '81', '93');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000012', '1294156800', '105', '76', '86');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000012', '1294160400', '94', '94', '87');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000012', '1294164000', '96', '73', '96');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000012', '1294167600', '101', '80', '70');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000012', '1294171200', '43', '70', '96');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000012', '1294174800', '30', '68', '75');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000012', '1294178400', '87', '69', '84');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000012', '1294182000', '93', '72', '89');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000012', '1294185600', '94', '71', '90');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000012', '1294189200', '51', '95', '71');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000012', '1294192800', '44', '71', '63');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000013', '1294113600', '270', '277', '107');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000013', '1294117200', '192', '140', '237');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000013', '1294120800', '198', '218', '99');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000013', '1294124400', '127', '86', '78');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000013', '1294128000', '1', '122', '108');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000013', '1294131600', '18', '124', '95');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000013', '1294135200', '23', '74', '105');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000013', '1294138800', '33', '76', '115');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000013', '1294142400', '27', '84', '141');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000013', '1294146000', '93', '68', '60');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000013', '1294149600', '96', '77', '93');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000013', '1294153200', '107', '97', '2');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000013', '1294156800', '39', '76', '86');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000013', '1294160400', '96', '71', '58');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000013', '1294164000', '91', '97', '74');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000013', '1294167600', '32', '2', '69');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000013', '1294171200', '95', '73', '87');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000013', '1294174800', '90', '90', '81');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000013', '1294178400', '90', '91', '70');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000013', '1294182000', '41', '83', '70');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000013', '1294185600', '104', '15', '84');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000013', '1294189200', '90', '1', '84');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000013', '1294192800', '104', '18', '1');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000014', '1294113600', '351', '233', '145');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000014', '1294117200', '11', '123', '165');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000014', '1294120800', '183', '102', '160');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000014', '1294124400', '12', '101', '107');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000014', '1294128000', '130', '136', '112');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000014', '1294131600', '162', '83', '142');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000014', '1294135200', '113', '90', '118');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000014', '1294138800', '115', '107', '148');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000014', '1294142400', '91', '121', '79');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000014', '1294146000', '99', '85', '89');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000014', '1294149600', '30', '91', '80');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000014', '1294153200', '39', '86', '73');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000014', '1294156800', '105', '93', '87');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000014', '1294160400', '98', '2', '95');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000014', '1294164000', '97', '5', '1');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000014', '1294167600', '31', '71', '89');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000014', '1294171200', '94', '89', '71');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000014', '1294174800', '104', '86', '82');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000014', '1294178400', '98', '78', '95');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000014', '1294182000', '104', '70', '94');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000014', '1294185600', '37', '74', '79');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000014', '1294189200', '42', '0', '71');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000015', '1294113600', '231', '127', '215');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000015', '1294117200', '148', '209', '173');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000015', '1294120800', '365', '247', '197');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000015', '1294124400', '41', '100', '167');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000015', '1294128000', '27', '88', '135');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000015', '1294131600', '24', '83', '3');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000015', '1294135200', '17', '93', '83');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000015', '1294138800', '23', '10', '9');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000015', '1294142400', '27', '5', '91');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000015', '1294146000', '89', '87', '76');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000015', '1294149600', '103', '74', '92');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000015', '1294153200', '97', '93', '3');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000015', '1294156800', '98', '77', '94');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000015', '1294160400', '38', '86', '76');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000015', '1294164000', '28', '15', '81');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000015', '1294167600', '29', '11', '93');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000015', '1294171200', '100', '84', '92');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000015', '1294174800', '78', '3', '77');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000015', '1294178400', '30', '76', '67');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000015', '1294182000', '100', '96', '82');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000015', '1294185600', '95', '68', '74');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000015', '1294189200', '89', '77', '94');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000016', '1294113600', '187', '197', '124');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000016', '1294117200', '416', '124', '94');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000016', '1294120800', '315', '14', '125');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000016', '1294124400', '18', '131', '139');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000016', '1294128000', '147', '104', '69');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000016', '1294131600', '143', '118', '136');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000016', '1294135200', '140', '103', '77');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000016', '1294138800', '49', '109', '102');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000016', '1294142400', '7', '112', '93');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000016', '1294146000', '89', '85', '90');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000016', '1294149600', '35', '71', '92');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000016', '1294153200', '88', '93', '72');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000016', '1294156800', '100', '77', '67');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000016', '1294160400', '107', '80', '70');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000016', '1294164000', '97', '72', '59');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000016', '1294167600', '96', '9', '90');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000016', '1294171200', '97', '13', '95');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000016', '1294174800', '95', '78', '95');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000016', '1294178400', '98', '6', '86');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000016', '1294182000', '87', '94', '85');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000016', '1294185600', '89', '97', '87');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000016', '1294189200', '94', '96', '88');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000017', '1294113600', '338', '68', '164');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000017', '1294117200', '320', '104', '170');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000017', '1294120800', '237', '249', '216');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000017', '1294124400', '156', '88', '84');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000017', '1294128000', '153', '84', '164');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000017', '1294131600', '89', '133', '101');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000017', '1294135200', '119', '108', '81');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000017', '1294138800', '102', '74', '129');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000017', '1294142400', '116', '76', '129');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000017', '1294146000', '75', '97', '80');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000017', '1294149600', '91', '72', '87');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000017', '1294153200', '91', '68', '94');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000017', '1294156800', '96', '88', '69');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000017', '1294160400', '28', '82', '87');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000017', '1294164000', '90', '95', '84');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000017', '1294167600', '87', '91', '81');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000017', '1294171200', '98', '77', '94');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000017', '1294174800', '29', '18', '76');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000017', '1294178400', '100', '87', '77');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000017', '1294182000', '104', '90', '82');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000017', '1294185600', '76', '82', '81');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000017', '1294189200', '100', '8', '15');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000018', '1294113600', '316', '213', '195');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000018', '1294117200', '17', '117', '204');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000018', '1294120800', '284', '228', '161');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000018', '1294124400', '149', '192', '126');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000018', '1294128000', '171', '2', '134');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000018', '1294131600', '180', '75', '11');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000018', '1294135200', '93', '84', '131');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000018', '1294138800', '34', '89', '122');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000018', '1294142400', '123', '130', '78');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000018', '1294146000', '84', '82', '67');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000018', '1294149600', '97', '72', '75');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000018', '1294153200', '86', '92', '91');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000018', '1294156800', '104', '85', '80');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000018', '1294160400', '97', '89', '92');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000018', '1294164000', '29', '9', '97');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000018', '1294167600', '79', '75', '95');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000018', '1294171200', '88', '64', '85');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000018', '1294174800', '32', '87', '67');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000018', '1294178400', '92', '87', '67');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000018', '1294182000', '102', '88', '77');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000018', '1294185600', '43', '68', '77');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000018', '1294189200', '98', '94', '7');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000019', '1294113600', '199', '145', '213');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000019', '1294117200', '220', '270', '147');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000019', '1294120800', '154', '151', '222');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000019', '1294124400', '162', '1', '6');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000019', '1294128000', '121', '196', '73');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000019', '1294131600', '7', '9', '88');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000019', '1294135200', '129', '131', '2');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000019', '1294138800', '91', '119', '79');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000019', '1294142400', '24', '86', '77');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000019', '1294146000', '29', '92', '83');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000019', '1294149600', '88', '89', '83');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000019', '1294153200', '92', '70', '83');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000019', '1294156800', '98', '76', '93');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000019', '1294160400', '79', '91', '77');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000019', '1294164000', '88', '66', '95');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000019', '1294167600', '105', '85', '77');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000019', '1294171200', '96', '84', '96');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000019', '1294174800', '28', '1', '71');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000019', '1294178400', '88', '82', '74');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000019', '1294182000', '92', '86', '76');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000019', '1294185600', '97', '88', '86');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000019', '1294189200', '34', '74', '79');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000020', '1294113600', '362', '186', '111');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000020', '1294117200', '178', '200', '277');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000020', '1294120800', '210', '102', '158');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000020', '1294124400', '137', '6', '111');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000020', '1294128000', '21', '80', '130');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000020', '1294131600', '4', '163', '144');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000020', '1294135200', '113', '130', '113');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000020', '1294138800', '33', '118', '6');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000020', '1294142400', '56', '0', '23');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000020', '1294146000', '92', '69', '86');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000020', '1294149600', '29', '88', '71');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000020', '1294153200', '97', '71', '84');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000020', '1294156800', '101', '87', '76');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000020', '1294160400', '100', '81', '86');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000020', '1294164000', '31', '70', '79');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000020', '1294167600', '40', '74', '75');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000020', '1294171200', '88', '91', '82');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000020', '1294174800', '90', '77', '70');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000020', '1294178400', '42', '72', '81');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000020', '1294182000', '88', '80', '70');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000020', '1294185600', '97', '71', '77');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000020', '1294189200', '30', '80', '72');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000021', '1294113600', '193', '199', '171');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000021', '1294117200', '374', '199', '182');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000021', '1294120800', '143', '186', '134');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000021', '1294124400', '49', '82', '146');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000021', '1294128000', '12', '7', '17');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000021', '1294131600', '91', '72', '138');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000021', '1294135200', '90', '8', '115');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000021', '1294138800', '25', '71', '99');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000021', '1294142400', '29', '65', '76');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000021', '1294146000', '87', '88', '87');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000021', '1294149600', '43', '70', '91');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000021', '1294153200', '105', '77', '62');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000021', '1294156800', '89', '70', '79');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000021', '1294160400', '88', '96', '68');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000021', '1294164000', '90', '96', '93');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000021', '1294167600', '42', '79', '69');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000021', '1294171200', '90', '90', '89');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000021', '1294174800', '94', '74', '72');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000021', '1294178400', '84', '73', '68');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000021', '1294182000', '30', '16', '2');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000021', '1294185600', '84', '83', '73');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000021', '1294189200', '96', '92', '83');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000022', '1294113600', '115', '252', '214');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000022', '1294117200', '186', '199', '251');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000022', '1294120800', '133', '236', '183');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000022', '1294124400', '5', '84', '122');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000022', '1294128000', '143', '162', '112');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000022', '1294131600', '92', '137', '123');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000022', '1294135200', '137', '121', '103');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000022', '1294138800', '142', '3', '107');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000022', '1294142400', '85', '93', '97');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000022', '1294146000', '93', '69', '86');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000022', '1294149600', '107', '78', '77');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000022', '1294153200', '99', '1', '78');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000022', '1294156800', '106', '81', '72');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000022', '1294160400', '102', '1', '69');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000022', '1294164000', '95', '75', '73');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000022', '1294167600', '97', '0', '91');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000022', '1294171200', '92', '75', '92');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000022', '1294174800', '94', '73', '86');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000022', '1294178400', '85', '93', '84');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000022', '1294182000', '104', '8', '92');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000022', '1294185600', '90', '82', '72');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000022', '1294189200', '85', '95', '86');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000023', '1294113600', '291', '189', '147');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000023', '1294117200', '145', '181', '246');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000023', '1294120800', '234', '102', '225');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000023', '1294124400', '104', '170', '105');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000023', '1294128000', '12', '116', '84');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000023', '1294131600', '30', '100', '125');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000023', '1294135200', '121', '102', '84');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000023', '1294138800', '118', '115', '96');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000023', '1294142400', '91', '69', '90');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000023', '1294146000', '106', '33', '10');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000023', '1294149600', '88', '92', '3');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000023', '1294153200', '106', '89', '79');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000023', '1294156800', '86', '82', '71');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000023', '1294160400', '95', '72', '89');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000023', '1294164000', '86', '72', '70');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000023', '1294167600', '88', '92', '83');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000023', '1294171200', '106', '71', '88');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000023', '1294174800', '101', '73', '63');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000023', '1294178400', '89', '83', '95');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000023', '1294182000', '86', '82', '72');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000023', '1294185600', '91', '80', '70');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000024', '1294113600', '354', '166', '261');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000024', '1294117200', '425', '115', '216');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000024', '1294120800', '159', '205', '159');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000024', '1294124400', '156', '186', '91');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000024', '1294128000', '117', '86', '126');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000024', '1294131600', '6', '96', '100');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000024', '1294135200', '38', '103', '84');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000024', '1294138800', '134', '8', '81');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000024', '1294142400', '77', '85', '84');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000024', '1294146000', '44', '3', '8');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000024', '1294149600', '92', '69', '91');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000024', '1294153200', '38', '73', '76');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000024', '1294156800', '98', '4', '87');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000024', '1294160400', '39', '86', '71');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000024', '1294164000', '32', '76', '70');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000024', '1294167600', '85', '79', '71');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000024', '1294171200', '81', '88', '84');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000024', '1294174800', '89', '95', '85');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000024', '1294178400', '89', '80', '72');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000024', '1294182000', '104', '79', '85');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000024', '1294185600', '90', '94', '72');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000025', '1294113600', '241', '250', '272');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000025', '1294117200', '250', '231', '90');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000025', '1294120800', '399', '283', '121');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000025', '1294124400', '20', '80', '149');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000025', '1294128000', '147', '135', '108');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000025', '1294131600', '32', '83', '104');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000025', '1294135200', '24', '87', '62');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000025', '1294138800', '102', '128', '127');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000025', '1294142400', '88', '96', '92');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000025', '1294146000', '42', '73', '76');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000025', '1294149600', '97', '94', '89');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000025', '1294153200', '29', '18', '68');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000025', '1294156800', '92', '72', '97');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000025', '1294160400', '96', '84', '83');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000025', '1294164000', '87', '81', '80');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000025', '1294167600', '90', '80', '69');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000025', '1294171200', '85', '95', '69');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000025', '1294174800', '102', '84', '15');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000025', '1294178400', '89', '95', '86');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000025', '1294182000', '87', '92', '12');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000025', '1294185600', '95', '68', '96');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000026', '1294113600', '414', '4', '234');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000026', '1294117200', '187', '158', '157');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000026', '1294120800', '217', '246', '238');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000026', '1294124400', '7', '9', '78');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000026', '1294128000', '109', '122', '173');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000026', '1294131600', '34', '105', '133');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000026', '1294135200', '102', '78', '12');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000026', '1294138800', '88', '85', '85');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000026', '1294142400', '105', '71', '83');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000026', '1294146000', '105', '19', '17');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000026', '1294149600', '96', '73', '84');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000026', '1294153200', '36', '71', '77');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000026', '1294156800', '35', '90', '89');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000026', '1294160400', '99', '93', '92');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000026', '1294164000', '98', '97', '77');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000026', '1294167600', '89', '77', '67');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000026', '1294171200', '84', '75', '91');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000026', '1294174800', '98', '72', '63');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000026', '1294178400', '41', '88', '75');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000026', '1294182000', '106', '17', '74');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000026', '1294185600', '32', '89', '59');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000027', '1294113600', '259', '220', '95');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000027', '1294117200', '357', '112', '215');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000027', '1294120800', '178', '264', '216');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000027', '1294124400', '179', '129', '158');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000027', '1294128000', '186', '152', '3');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000027', '1294131600', '55', '127', '99');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000027', '1294135200', '138', '116', '8');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000027', '1294138800', '88', '141', '127');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000027', '1294142400', '90', '88', '83');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000027', '1294146000', '88', '15', '80');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000027', '1294149600', '94', '94', '78');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000027', '1294153200', '89', '95', '84');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000027', '1294156800', '33', '96', '72');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000027', '1294160400', '29', '87', '84');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000027', '1294164000', '92', '0', '70');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000027', '1294167600', '41', '74', '93');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000027', '1294171200', '45', '70', '84');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000027', '1294174800', '101', '87', '78');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000027', '1294178400', '93', '73', '91');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000027', '1294182000', '103', '90', '73');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000027', '1294185600', '88', '80', '71');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000028', '1294113600', '369', '184', '242');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000028', '1294117200', '293', '278', '132');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000028', '1294120800', '165', '142', '78');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000028', '1294124400', '116', '192', '165');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000028', '1294128000', '186', '89', '141');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000028', '1294131600', '142', '111', '129');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000028', '1294135200', '1', '80', '78');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000028', '1294138800', '93', '86', '118');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000028', '1294142400', '29', '89', '84');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000028', '1294146000', '96', '13', '74');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000028', '1294149600', '87', '90', '79');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000028', '1294153200', '97', '70', '96');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000028', '1294156800', '79', '82', '76');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000028', '1294160400', '80', '83', '93');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000028', '1294164000', '100', '84', '75');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000028', '1294167600', '105', '75', '66');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000028', '1294171200', '91', '5', '78');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000028', '1294174800', '100', '2', '90');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000028', '1294178400', '93', '88', '93');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000028', '1294182000', '107', '80', '72');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000028', '1294185600', '102', '74', '88');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000029', '1294110000', '126', '275', '91');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000029', '1294113600', '255', '98', '204');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000029', '1294117200', '383', '169', '89');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000029', '1294120800', '26', '102', '152');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000029', '1294124400', '129', '87', '194');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000029', '1294128000', '121', '109', '85');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000029', '1294131600', '96', '120', '119');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000029', '1294135200', '30', '87', '123');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000029', '1294138800', '102', '79', '26');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000029', '1294142400', '83', '88', '77');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000029', '1294146000', '87', '90', '74');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000029', '1294149600', '30', '83', '86');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000029', '1294153200', '105', '81', '78');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000029', '1294156800', '94', '73', '91');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000029', '1294160400', '85', '83', '72');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000029', '1294164000', '84', '75', '97');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000029', '1294167600', '28', '91', '5');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000029', '1294171200', '92', '84', '74');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000029', '1294174800', '99', '91', '81');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000029', '1294178400', '96', '73', '63');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000029', '1294182000', '30', '84', '86');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000030', '1294110000', '145', '129', '103');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000030', '1294113600', '413', '100', '157');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000030', '1294117200', '305', '131', '143');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000030', '1294120800', '137', '180', '5');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000030', '1294124400', '27', '135', '108');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000030', '1294128000', '6', '80', '124');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000030', '1294131600', '115', '104', '137');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000030', '1294135200', '106', '72', '102');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000030', '1294138800', '90', '62', '83');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000030', '1294142400', '34', '75', '80');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000030', '1294146000', '97', '71', '73');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000030', '1294149600', '78', '16', '95');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000030', '1294153200', '91', '87', '78');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000030', '1294156800', '92', '70', '98');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000030', '1294160400', '29', '74', '65');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000030', '1294164000', '85', '88', '79');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000030', '1294167600', '92', '71', '98');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000030', '1294171200', '85', '89', '69');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000030', '1294174800', '42', '7', '74');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000030', '1294178400', '95', '88', '68');
INSERT INTO `soilhumi` VALUES ('chongq_fuling_000030', '1294182000', '97', '97', '80');

-- ----------------------------
-- Table structure for `soilprop`
-- ----------------------------
DROP TABLE IF EXISTS `soilprop`;
CREATE TABLE `soilprop` (
  `soilProp` char(4) NOT NULL,
  `seas` char(4) NOT NULL,
  `minCont` int(32) DEFAULT NULL,
  `maxCont` int(32) NOT NULL,
  `expeSugg` char(20) DEFAULT NULL,
  PRIMARY KEY (`seas`,`soilProp`,`maxCont`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of soilprop
-- ----------------------------
INSERT INTO `soilprop` VALUES ('壤土', '冬季', '0', '15', 'suggest2');
INSERT INTO `soilprop` VALUES ('壤土', '冬季', '15', '22', 'suggest5');
INSERT INTO `soilprop` VALUES ('沙土', '冬季', '0', '16', 'suggest2');
INSERT INTO `soilprop` VALUES ('沙土', '冬季', '16', '20', 'suggest5');
INSERT INTO `soilprop` VALUES ('粘土', '冬季', '0', '14', 'suggest2');
INSERT INTO `soilprop` VALUES ('粘土', '冬季', '14', '24', 'suggest5');
INSERT INTO `soilprop` VALUES ('壤土', '周年', '22', '85', 'suggest7');
INSERT INTO `soilprop` VALUES ('壤土', '周年', '85', '1000', 'suggest8');
INSERT INTO `soilprop` VALUES ('沙土', '周年', '22', '85', 'suggest7');
INSERT INTO `soilprop` VALUES ('沙土', '周年', '80', '1000', 'suggest8');
INSERT INTO `soilprop` VALUES ('粘土', '周年', '24', '90', 'suggest7');
INSERT INTO `soilprop` VALUES ('粘土', '周年', '90', '1000', 'suggest8');
INSERT INTO `soilprop` VALUES ('壤土', '夏季', '0', '17', 'suggest3');
INSERT INTO `soilprop` VALUES ('壤土', '夏季', '17', '22', 'suggest6');
INSERT INTO `soilprop` VALUES ('沙土', '夏季', '0', '18', 'suggest3');
INSERT INTO `soilprop` VALUES ('沙土', '夏季', '18', '20', 'suggest6');
INSERT INTO `soilprop` VALUES ('粘土', '夏季', '0', '16', 'suggest3');
INSERT INTO `soilprop` VALUES ('粘土', '夏季', '16', '24', 'suggest6');
INSERT INTO `soilprop` VALUES ('壤土', '春季', '0', '16', 'suggest1');
INSERT INTO `soilprop` VALUES ('壤土', '春季', '16', '22', 'suggest4');
INSERT INTO `soilprop` VALUES ('沙土', '春季', '0', '15', 'suggest1');
INSERT INTO `soilprop` VALUES ('沙土', '春季', '17', '20', 'suggest4');
INSERT INTO `soilprop` VALUES ('粘土', '春季', '0', '15', 'suggest1');
INSERT INTO `soilprop` VALUES ('粘土', '春季', '15', '24', 'suggest4');
INSERT INTO `soilprop` VALUES ('壤土', '秋季', '0', '15', 'suggest2');
INSERT INTO `soilprop` VALUES ('壤土', '秋季', '15', '22', 'suggest5');
INSERT INTO `soilprop` VALUES ('沙土', '秋季', '0', '16', 'suggest2');
INSERT INTO `soilprop` VALUES ('沙土', '秋季', '16', '20', 'suggest5');
INSERT INTO `soilprop` VALUES ('粘土', '秋季', '0', '14', 'suggest2');
INSERT INTO `soilprop` VALUES ('粘土', '秋季', '14', '24', 'suggest5');

-- ----------------------------
-- Table structure for `soiltemp`
-- ----------------------------
DROP TABLE IF EXISTS `soiltemp`;
CREATE TABLE `soiltemp` (
  `ID` char(20) NOT NULL,
  `TimeStam` int(64) NOT NULL,
  `Temp1` double(32,0) NOT NULL,
  `Temp2` double(32,0) NOT NULL,
  `Temp3` double(32,0) NOT NULL,
  PRIMARY KEY (`ID`,`TimeStam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of soiltemp
-- ----------------------------
