/*
MySQL Data Transfer
Source Host: localhost
Source Database: aes
Target Host: localhost
Target Database: aes
Date: 2013/9/1 10:35:09
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
  `admissionId` varchar(16) NOT NULL COMMENT '准考证ID',
  `userId` varchar(16) DEFAULT NULL,
  `inputTime` varchar(32) DEFAULT NULL,
  `isInuse` int(8) DEFAULT NULL,
  PRIMARY KEY (`admissionId`)
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
  `questionName` varchar(64) DEFAULT NULL,
  `content` varchar(512) DEFAULT NULL,
  `answer` varchar(64) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL COMMENT '试题类型',
  `topicRange` varchar(32) DEFAULT NULL COMMENT '试题考点',
  `optionNum` int(8) DEFAULT NULL,
  `accuracyRate` varchar(16) DEFAULT NULL COMMENT '正确率',
  `sortNo` varchar(16) DEFAULT NULL,
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
  `optionId` int(8) NOT NULL,
  `optionContent` varchar(256) DEFAULT '0' COMMENT '选项内容不超过128个中文汉字',
  `sortNo` int(8) DEFAULT NULL,
  PRIMARY KEY (`questionId`,`optionId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for topic_major_answer
-- ----------------------------
CREATE TABLE `topic_major_answer` (
  `questionId` varchar(16) NOT NULL,
  `answer` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`questionId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for topic_range
-- ----------------------------
CREATE TABLE `topic_range` (
  `topicRangeId` varchar(32) NOT NULL,
  `topicRangeName` varchar(32) DEFAULT NULL,
  `parentId` varchar(32) DEFAULT NULL,
  `sortNo` varchar(16) DEFAULT NULL,
  `inputTime` varchar(32) DEFAULT NULL,
  `isInUse` int(8) DEFAULT NULL,
  PRIMARY KEY (`topicRangeId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for topic_type
-- ----------------------------
CREATE TABLE `topic_type` (
  `topicTypeId` varchar(32) NOT NULL,
  `topicTypeName` varchar(32) DEFAULT NULL,
  `sortNo` varchar(16) DEFAULT NULL,
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
  `sex` varchar(8) DEFAULT NULL,
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
  `updateTime` varchar(32) DEFAULT NULL,
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
INSERT INTO `topic_catalog` VALUES ('2013081200000009', '第1题', '西南大学2005年7月经教育部批准由西南师范大学、西南农业大学合并组建而成。原两校发轫于1906年在西南地区开中国新学的（ ）。', 'B', 'SingleChoice', '001001', '4', null, '', 'cdzhai', '2013-08-12 16:01:13', null, '1');
INSERT INTO `topic_catalog` VALUES ('2013082000000001', '主观题demo01', '试题内容', null, 'Subjective', '001001', null, null, '', 'cdzhai', '2013-08-20 17:11:46', null, '1');
INSERT INTO `topic_library` VALUES ('2013081200000009', '1', '国立女子师范学院 ', '1');
INSERT INTO `topic_library` VALUES ('2013081200000009', '2', '相辉学院 ', '2');
INSERT INTO `topic_library` VALUES ('2013081200000009', '3', '川东师范学院', '3');
INSERT INTO `topic_library` VALUES ('2013081200000009', '4', '四川省立教育学院', '4');
INSERT INTO `topic_major_answer` VALUES ('2013082000000001', '试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案试题答案');
INSERT INTO `topic_range` VALUES ('0010', '业务类型', '0010', '0010', '2013-08-11', '1');
INSERT INTO `topic_range` VALUES ('001001', '公共基础', '0010', '001001', '2013-08-11', '1');
INSERT INTO `topic_range` VALUES ('001002', '个人贷款', '0010', '001002', '2013-08-11', '1');
INSERT INTO `topic_range` VALUES ('001003', '公司信贷', '0010', '001003', '2013-08-11', '1');
INSERT INTO `topic_range` VALUES ('001004', '风险管理', '0010', '001004', '2013-08-11', '1');
INSERT INTO `topic_range` VALUES ('0020', '技术类型', '0020', '0020', '2013-08-11', '1');
INSERT INTO `topic_range` VALUES ('002001', 'java基础', '0020', '002001', '2013-08-11', '1');
INSERT INTO `topic_range` VALUES ('002002', '数据库基础', '0020', '002002', '2013-08-11', '1');
INSERT INTO `topic_range` VALUES ('002003', 'jsp技术', '0020', '002003', '2013-08-11', '1');
INSERT INTO `topic_range` VALUES ('002004', 'A3WEB', '0020', '002004', '2013-08-11', '1');
INSERT INTO `topic_range` VALUES ('002005', 'ALS', '0020', '002005', '2013-08-11', '1');
INSERT INTO `topic_type` VALUES ('Blank', '填空题', '0003', '2013-08-11', '1');
INSERT INTO `topic_type` VALUES ('Judge', '判断题', '0004', '2013-08-11', '1');
INSERT INTO `topic_type` VALUES ('MultipleChoice', '多项选择题', '0002', '2013-08-11', '1');
INSERT INTO `topic_type` VALUES ('SingleChoice', '单项选择题', '0001', '2013-08-11', '1');
INSERT INTO `topic_type` VALUES ('Subjective', '主观题', '0005', '2013-08-11', '1');
INSERT INTO `user_info` VALUES ('cdzhai', '123456', '翟灿东', '小翟', '男', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null);
