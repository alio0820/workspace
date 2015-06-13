/*
MySQL Data Transfer
Source Host: localhost
Source Database: aes
Target Host: localhost
Target Database: aes
Date: 2013/8/3 22:17:17
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for answer
-- ----------------------------
CREATE TABLE `answer` (
  `userId` varchar(16) NOT NULL,
  `exampaperId` varchar(16) NOT NULL,
  `questionId` varchar(16) DEFAULT NULL,
  `answer` varchar(1024) DEFAULT NULL COMMENT '答案',
  `score` varchar(8) DEFAULT NULL COMMENT '得分',
  `submitTime` varchar(32) DEFAULT NULL COMMENT '提交时间',
  `markTime` varchar(32) DEFAULT NULL COMMENT '批改时间',
  PRIMARY KEY (`userId`,`exampaperId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for at_catalog
-- ----------------------------
CREATE TABLE `at_catalog` (
  `admissionId` varchar(16) DEFAULT NULL,
  `userId` varchar(16) DEFAULT NULL,
  `inputTime` varchar(32) DEFAULT NULL,
  `isInuse` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for business
-- ----------------------------
CREATE TABLE `business` (
  `businessId` varchar(16) NOT NULL,
  `businessName` varchar(32) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `inputUser` varchar(16) DEFAULT NULL,
  `inputTime` varchar(32) DEFAULT NULL,
  `isInUse` int(8) DEFAULT NULL,
  PRIMARY KEY (`businessId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for class
-- ----------------------------
CREATE TABLE `class` (
  `classId` varchar(16) NOT NULL COMMENT '班级Id',
  `className` varchar(32) DEFAULT NULL,
  `location` varchar(32) DEFAULT NULL COMMENT '培训地',
  `principal` varchar(32) DEFAULT NULL COMMENT '校长（负责人）',
  `periodId` int(8) DEFAULT NULL,
  `startTime` varchar(16) DEFAULT NULL,
  `finishTime` varchar(16) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`classId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for class_relative
-- ----------------------------
CREATE TABLE `class_relative` (
  `periodId` int(8) NOT NULL DEFAULT '0' COMMENT '期ID',
  `classId` int(8) NOT NULL,
  `userId` varchar(16) NOT NULL DEFAULT '',
  `MT` int(8) DEFAULT NULL COMMENT 'management trainee 管理培训生',
  `groupId` int(8) DEFAULT '1' COMMENT '分组',
  `groupName` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`periodId`,`classId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for component
-- ----------------------------
CREATE TABLE `component` (
  `componentId` varchar(16) NOT NULL,
  `componentName` varchar(32) DEFAULT NULL,
  `style` varchar(64) DEFAULT NULL,
  `isShow` int(8) DEFAULT NULL,
  `isInUse` int(8) DEFAULT NULL,
  PRIMARY KEY (`componentId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for department
-- ----------------------------
CREATE TABLE `department` (
  `departmentId` varchar(16) NOT NULL,
  `departmentName` varchar(32) DEFAULT NULL,
  `inputTime` varchar(32) DEFAULT NULL,
  `updateTime` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`departmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for exam
-- ----------------------------
CREATE TABLE `exam` (
  `examId` varchar(16) NOT NULL,
  `examName` varchar(32) DEFAULT NULL,
  `examPaperId` int(16) DEFAULT '1' COMMENT '试卷',
  `business` varchar(16) DEFAULT NULL COMMENT '业务点',
  `beginTime` varchar(32) DEFAULT NULL,
  `endTime` varchar(32) DEFAULT NULL,
  `inputUser` varchar(16) DEFAULT NULL,
  `updateTime` varchar(32) DEFAULT NULL,
  `inputTime` varchar(32) DEFAULT NULL,
  `isInUse` int(8) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`examId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for exam_relative
-- ----------------------------
CREATE TABLE `exam_relative` (
  `examId` varchar(16) NOT NULL,
  `classId` int(8) NOT NULL,
  `examNum` int(8) DEFAULT NULL COMMENT '第几次考试',
  `period` int(8) DEFAULT NULL,
  PRIMARY KEY (`examId`,`classId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for exampaper
-- ----------------------------
CREATE TABLE `exampaper` (
  `examPaperId` varchar(16) NOT NULL,
  `examPaperName` varchar(32) DEFAULT NULL,
  `questionNum` int(8) DEFAULT NULL,
  `inputTime` varchar(32) DEFAULT NULL,
  `inputUser` varchar(16) DEFAULT NULL,
  `updateTime` varchar(32) DEFAULT NULL,
  `isInUse` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`examPaperId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for exampaper_relative
-- ----------------------------
CREATE TABLE `exampaper_relative` (
  `exampaperId` varchar(16) NOT NULL,
  `topicId` varchar(16) NOT NULL,
  `type` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`exampaperId`,`topicId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for exampaper_test
-- ----------------------------
CREATE TABLE `exampaper_test` (
  `exampaperId` varchar(16) NOT NULL,
  `roleId` varchar(16) NOT NULL,
  `departmentId` varchar(16) DEFAULT NULL,
  `isInUse` int(8) DEFAULT NULL,
  PRIMARY KEY (`exampaperId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for examrecord_catalog
-- ----------------------------
CREATE TABLE `examrecord_catalog` (
  `examId` varchar(16) NOT NULL,
  `exampaperId` varchar(16) DEFAULT NULL,
  `questionNum` int(8) DEFAULT NULL,
  `factor` varchar(16) DEFAULT NULL COMMENT '系数',
  `highestScore` varchar(16) DEFAULT NULL,
  `accuracyRate` varchar(16) DEFAULT NULL COMMENT '平均分',
  `lowestScore` varchar(16) DEFAULT NULL,
  `highestUserId` varchar(16) DEFAULT NULL,
  `lowestUserId` varchar(16) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL COMMENT '备注不超过32个字',
  `inputTime` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`examId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for examrecord_library
-- ----------------------------
CREATE TABLE `examrecord_library` (
  `examId` varchar(16) DEFAULT NULL,
  `exampaperId` varchar(16) NOT NULL DEFAULT '',
  `questionId` varchar(16) NOT NULL DEFAULT '',
  `accuracyRate` varchar(16) DEFAULT NULL COMMENT '正确率',
  `factor` varchar(16) DEFAULT NULL COMMENT '系数',
  PRIMARY KEY (`exampaperId`,`questionId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for option
-- ----------------------------
CREATE TABLE `option` (
  `optionId` varchar(16) NOT NULL COMMENT '选项ID',
  `sortNo` int(8) DEFAULT NULL COMMENT '选项序号',
  `value` int(8) DEFAULT NULL COMMENT '选项的值',
  PRIMARY KEY (`optionId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for role_info
-- ----------------------------
CREATE TABLE `role_info` (
  `roleId` varchar(16) NOT NULL,
  `roleName` varchar(32) DEFAULT NULL,
  `isInUse` int(8) DEFAULT NULL,
  `inputTime` varchar(32) DEFAULT NULL,
  `inputUser` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for topic_catalog
-- ----------------------------
CREATE TABLE `topic_catalog` (
  `questionId` varchar(16) NOT NULL,
  `content` varchar(512) DEFAULT NULL,
  `answer` varchar(64) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `accuracyRate` varchar(16) DEFAULT NULL COMMENT '正确率',
  `inputUser` varchar(16) DEFAULT NULL,
  `inputTime` varchar(32) DEFAULT NULL,
  `updateTime` varchar(32) DEFAULT NULL,
  `isInUse` int(8) DEFAULT NULL COMMENT '0表示不可用1表示可用2表示审核中',
  PRIMARY KEY (`questionId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for topic_library
-- ----------------------------
CREATE TABLE `topic_library` (
  `questionId` varchar(16) NOT NULL,
  `optionId` varchar(16) NOT NULL DEFAULT '',
  `optionContent` varchar(256) DEFAULT NULL COMMENT '选项内容不超过128个中文汉字',
  PRIMARY KEY (`questionId`,`optionId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for topic_major
-- ----------------------------
CREATE TABLE `topic_major` (
  `questionId` varchar(16) NOT NULL,
  `content` varchar(512) DEFAULT NULL,
  `answer` varchar(1024) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `inputUser` varchar(16) DEFAULT NULL,
  `inputTime` varchar(32) DEFAULT NULL,
  `updateTime` varchar(32) DEFAULT NULL,
  `isInUse` int(8) DEFAULT NULL COMMENT '0表示不可用1表示可用2表示审核中',
  PRIMARY KEY (`questionId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for topic_type
-- ----------------------------
CREATE TABLE `topic_type` (
  `topicTypeId` varchar(16) NOT NULL,
  `topicTypeName` varchar(32) DEFAULT NULL,
  `inputTime` varchar(32) DEFAULT NULL,
  `isInUse` int(8) DEFAULT NULL,
  PRIMARY KEY (`topicTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
CREATE TABLE `user_info` (
  `userId` varchar(16) NOT NULL,
  `password` varchar(16) DEFAULT NULL,
  `userName` varchar(32) DEFAULT NULL,
  `nickName` varchar(32) DEFAULT NULL,
  `sex` int(8) DEFAULT NULL,
  `birthday` varchar(16) DEFAULT NULL,
  `cellphone` varchar(16) DEFAULT NULL,
  `graduateSchool` varchar(32) DEFAULT NULL COMMENT '毕业学校',
  `degree` varchar(16) DEFAULT NULL COMMENT '学历',
  `major` varchar(32) DEFAULT NULL COMMENT '主修',
  `minor` varchar(32) DEFAULT NULL COMMENT '辅修',
  `grade` varchar(16) DEFAULT NULL,
  `hobby` varchar(32) DEFAULT NULL,
  `QQ` varchar(16) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `MSN` varchar(16) DEFAULT NULL,
  `signLocation` varchar(32) DEFAULT NULL COMMENT '签约地',
  `position` varchar(32) DEFAULT NULL COMMENT '职位',
  `roleId` varchar(16) DEFAULT NULL COMMENT '角色id',
  `classId` int(8) DEFAULT NULL COMMENT '期',
  `registerTime` varchar(32) DEFAULT NULL,
  `registerIp` varchar(16) DEFAULT NULL,
  `recentTime` varchar(32) DEFAULT NULL,
  `recentIp` varchar(16) DEFAULT NULL,
  `updataTime` varchar(32) DEFAULT NULL,
  `valid` int(8) DEFAULT NULL COMMENT '0不可用1可用2审核中3锁定',
  `remark` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `option` VALUES ('A', '1', null);
INSERT INTO `option` VALUES ('B', '2', null);
INSERT INTO `option` VALUES ('C', '3', null);
INSERT INTO `option` VALUES ('D', '4', null);
INSERT INTO `option` VALUES ('E', '5', null);
INSERT INTO `option` VALUES ('F', '6', null);
INSERT INTO `option` VALUES ('G', '7', null);
INSERT INTO `option` VALUES ('H', '8', null);
INSERT INTO `option` VALUES ('I', '9', null);
INSERT INTO `option` VALUES ('J', '10', null);
INSERT INTO `option` VALUES ('K', '11', null);
INSERT INTO `option` VALUES ('L', '12', null);
INSERT INTO `option` VALUES ('M', '13', null);
INSERT INTO `option` VALUES ('N', '14', null);
INSERT INTO `option` VALUES ('T1', '15', null);
INSERT INTO `option` VALUES ('T10', '24', null);
INSERT INTO `option` VALUES ('T2', '16', null);
INSERT INTO `option` VALUES ('T3', '17', null);
INSERT INTO `option` VALUES ('T4', '18', null);
INSERT INTO `option` VALUES ('T5', '19', null);
INSERT INTO `option` VALUES ('T6', '20', null);
INSERT INTO `option` VALUES ('T7', '21', null);
INSERT INTO `option` VALUES ('T8', '22', null);
INSERT INTO `option` VALUES ('T9', '23', null);
