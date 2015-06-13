/*
MySQL Data Transfer
Source Host: localhost
Source Database: onlinebuy
Target Host: localhost
Target Database: onlinebuy
Date: 2011/9/11/���� 20:43:17
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for add
-- ----------------------------
CREATE TABLE `add` (
  `AddId` int(11) NOT NULL AUTO_INCREMENT COMMENT '充值记录id',
  `Type` varchar(255) DEFAULT NULL COMMENT '充值类型',
  `Coin` int(11) DEFAULT NULL COMMENT '充值金额',
  `Datetime` date DEFAULT NULL COMMENT '充值日期',
  `Userid` int(11) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`AddId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for consume
-- ----------------------------
CREATE TABLE `consume` (
  `ConsumeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '消费记录ID',
  `Price` int(11) DEFAULT NULL COMMENT '消费金额',
  `Datetime` date DEFAULT NULL COMMENT '消费时间',
  `Userid` int(11) DEFAULT NULL COMMENT '用户id',
  `ProductName` varchar(255) DEFAULT NULL COMMENT '商品名称',
  PRIMARY KEY (`ConsumeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order
-- ----------------------------
CREATE TABLE `order` (
  `OrderId` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `Type` varchar(255) DEFAULT NULL COMMENT '订单类型',
  `Price` int(11) DEFAULT NULL COMMENT '订单金额',
  `Datetime` date DEFAULT NULL COMMENT '添加时间',
  `Userid` int(11) DEFAULT NULL COMMENT '用户ID',
  `ProductName` varchar(255) DEFAULT NULL COMMENT '商品名称',
  PRIMARY KEY (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户Id',
  `Name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `Password` varchar(255) DEFAULT NULL COMMENT '密码',
  `Price` double DEFAULT NULL COMMENT '电子货币余额',
  `Consume` int(11) DEFAULT NULL COMMENT '消费的电子货币',
  `Type` varchar(255) DEFAULT NULL COMMENT '用户类型',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
