/*
MySQL Data Transfer
Source Host: localhost
Source Database: aes
Target Host: localhost
Target Database: aes
Date: 2013/10/1 19:52:24
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
  `updateUser` varchar(16) DEFAULT NULL,
  `updateContent` varchar(64) DEFAULT NULL COMMENT '更新内容',
  `relativeUser` varchar(16) DEFAULT NULL,
  `isInUse` int(8) DEFAULT NULL COMMENT '0未生效1表示可用2待审批3不可用',
  PRIMARY KEY (`examPaperId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for exampaper_relative
-- ----------------------------
CREATE TABLE `exampaper_relative` (
  `exampaperId` varchar(16) NOT NULL COMMENT '试卷ID',
  `questionId` varchar(16) NOT NULL COMMENT '题目Id',
  `type` varchar(16) DEFAULT NULL COMMENT '题目类型',
  `sortNo` varchar(16) DEFAULT NULL COMMENT '题目排序号',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`exampaperId`,`questionId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for exampaper_test
-- ----------------------------
CREATE TABLE `exampaper_test` (
  `exampaperId` varchar(16) NOT NULL,
  `roleId` varchar(16) NOT NULL,
  `departmentId` varchar(16) NOT NULL,
  `userId` varchar(16) NOT NULL,
  `isInUse` int(8) DEFAULT NULL,
  PRIMARY KEY (`exampaperId`,`roleId`,`departmentId`,`userId`)
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
  `updateUser` varchar(16) DEFAULT NULL,
  `isInUse` int(8) DEFAULT NULL COMMENT '0未生效1表示可用2待审批3不可用',
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
-- Function structure for getOptions
-- ----------------------------
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getOptions`(id VARCHAR(32)) RETURNS varchar(10000) CHARSET gbk
BEGIN
 DECLARE t VARCHAR(10000) ;
set t = '' ;
 SELECT  optionid into t  FROM aes.topic_library WHERE questionId=id order by sortNo asc limit 1;
 RETURN t;
    END;;
DELIMITER ;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `exampaper` VALUES ('2013092300000001', 'A3WEB测试1', '0', '2013-09-23', 'cdzhai', null, 'cdzhai', null, 'cdzhai;hxiao', '0');
INSERT INTO `exampaper` VALUES ('2013092300000003', '深度业务测试', '0', '2013-09-23', 'cdzhai', null, null, null, null, '0');
INSERT INTO `exampaper` VALUES ('2013092300000004', 'Amarsoft入职初级测验', '0', '2013-09-23', 'cdzhai', null, null, null, null, '0');
INSERT INTO `exampaper_relative` VALUES ('2013092300000001', '2013092900000001', 'SingleChoice', '001', null);
INSERT INTO `exampaper_relative` VALUES ('2013092300000001', '2013092900000002', 'SingleChoice', '002', null);
INSERT INTO `exampaper_relative` VALUES ('2013092300000001', '2013092900000003', 'SingleChoice', '003', null);
INSERT INTO `exampaper_relative` VALUES ('2013092300000001', '2013092900000004', 'SingleChoice', '004', null);
INSERT INTO `exampaper_relative` VALUES ('2013092300000001', '2013092900000005', 'SingleChoice', '005', null);
INSERT INTO `exampaper_relative` VALUES ('2013092300000001', '2013092900000008', 'SingleChoice', '008', null);
INSERT INTO `exampaper_relative` VALUES ('2013092300000001', '2013092900000012', 'Judge', '009', null);
INSERT INTO `exampaper_relative` VALUES ('2013092300000001', '2013092900000020', 'MultipleChoice', '006', null);
INSERT INTO `exampaper_relative` VALUES ('2013092300000001', '2013092900000021', 'MultipleChoice', '007', null);
INSERT INTO `exampaper_relative` VALUES ('2013092300000001', '2013092900000022', 'MultipleChoice', '010', null);
INSERT INTO `exampaper_relative` VALUES ('2013092300000001', '2013092900000024', 'Judge', '011', null);
INSERT INTO `exampaper_relative` VALUES ('2013092300000003', '2013092900000001', 'SingleChoice', '001', null);
INSERT INTO `exampaper_relative` VALUES ('2013092300000003', '2013092900000002', 'SingleChoice', '005', null);
INSERT INTO `exampaper_relative` VALUES ('2013092300000003', '2013092900000006', 'SingleChoice', '008', null);
INSERT INTO `exampaper_relative` VALUES ('2013092300000003', '2013092900000007', 'SingleChoice', '009', null);
INSERT INTO `exampaper_relative` VALUES ('2013092300000003', '2013092900000008', 'SingleChoice', '010', null);
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
INSERT INTO `topic_catalog` VALUES ('2013092900000001', '西大发源哪个学院', '西南大学2005年7月经教育部批准由西南师范大学、西南农业大学合并组建而成。原两校发轫于1906年在西南地区开中国新学的（ ）。', 'A', 'SingleChoice', '001001', '4', null, null, 'cdzhai', '2013-09-29 19:28:10', null, null, '1');
INSERT INTO `topic_catalog` VALUES ('2013092900000002', '普通高等学校学生安全教育及管理暂行规定', '根据《普通高等学校学生安全教育及管理暂行规定》，学生未经学校批准擅自离校不归发生意外事故的，学校不承担责任。（ ）不归且未说明原因，学校可张榜公布，按自动退学除名。', 'A', 'SingleChoice', '001001', '5', null, null, 'cdzhai', '2013-09-29 19:29:27', null, null, '1');
INSERT INTO `topic_catalog` VALUES ('2013092900000003', '请假期限', '学生因病或其它原因不能坚持学习，应当办理请假手续。达到（ ）个工作日的，由主管教学院长签署意见，报教务处审批。 ', 'B', 'SingleChoice', '001001', '4', null, null, 'cdzhai', '2013-09-29 19:30:35', null, null, '1');
INSERT INTO `topic_catalog` VALUES ('2013092900000004', '学雷锋纪念日', '每年3月5日定为学雷锋纪念日，是因为这天是（ ）。', 'B', 'SingleChoice', '001001', '3', null, null, 'cdzhai', '2013-09-29 19:32:08', null, null, '1');
INSERT INTO `topic_catalog` VALUES ('2013092900000005', '学雷锋纪念日', '在创先争优活动中开展基层组织建设年的主题是( )。 ', 'D', 'SingleChoice', '001001', '6', null, null, 'cdzhai', '2013-09-29 19:33:22', null, null, '1');
INSERT INTO `topic_catalog` VALUES ('2013092900000006', '党员组织生活频率', '学校党委组织部要求，党员组织生活（ ）。', 'C', 'SingleChoice', '001001', '5', null, null, 'cdzhai', '2013-09-29 19:34:34', null, null, '1');
INSERT INTO `topic_catalog` VALUES ('2013092900000007', '建团90周年', '今年是建团90周年，是因为( )。', 'D', 'SingleChoice', '001001', '8', null, null, 'cdzhai', '2013-09-29 19:35:52', null, null, '1');
INSERT INTO `topic_catalog` VALUES ('2013092900000008', '二级党组织委员候选人', '《西南大学二级党组织工作细则》规定，二级党组织委员候选人( )。 ', 'C', 'SingleChoice', '001001', '4', null, null, 'cdzhai', '2013-09-29 19:36:39', null, null, '1');
INSERT INTO `topic_catalog` VALUES ('2013092900000009', '有选举权的到会党员数量', '学校党委关于党员（党员代表）大会选举办法规定，有选举权的到会党员（代表）超过应到数的（ ），方可进行选举。 ', 'C', 'SingleChoice', '001001', '4', null, null, 'cdzhai', '2013-09-29 19:37:33', null, null, '1');
INSERT INTO `topic_catalog` VALUES ('2013092900000010', '有选举权的到会党员数量毕业生离校时无故将党组织关系滞留学校期限', '毕业生离校时无故将党组织关系滞留学校超过（ ）以上的，根据党章规定按照自动脱党处理，不再办理组织关系接转事宜。 ', 'A', 'SingleChoice', '001001', '6', null, null, 'cdzhai', '2013-09-29 19:39:34', null, null, '1');
INSERT INTO `topic_catalog` VALUES ('2013092900000011', '', '加强和改进大学生思想政治教育的基本原则有（ ）。 ', 'A@C@D', 'MultipleChoice', '001001', '6', null, null, 'cdzhai', '2013-09-29 19:42:30', null, null, '1');
INSERT INTO `topic_catalog` VALUES ('2013092900000012', '我国教育事业改革发展的工作方针', '今后一个时期我国教育事业改革发展的工作方针是：优先发展，育人为本，改革创新，促进公平，提高质量。', 'right', 'Judge', '001001', '0', null, null, 'cdzhai', '2013-09-29 19:43:18', null, null, '1');
INSERT INTO `topic_catalog` VALUES ('2013092900000013', '天宫一号目标飞行器与神舟七号飞船', '天宫一号目标飞行器与神舟七号飞船先后成功发射并顺利交会对接，成为我国载人航天发展史上新的里程碑。 ', 'wrong', 'Judge', '001001', '0', null, null, 'cdzhai', '2013-09-29 19:43:45', null, null, '1');
INSERT INTO `topic_catalog` VALUES ('2013092900000014', '办好中国的事情，关键在党', '回顾90年中国的发展进步，可以得出一个基本结论：办好中国的事情，关键在党。 ', 'right', 'Judge', '001001', '0', null, null, 'cdzhai', '2013-09-29 19:44:06', null, null, '1');
INSERT INTO `topic_catalog` VALUES ('2013092900000015', '干部就是决定因素', '政治路线确定之后干部就是决定因素。 ', 'right', 'Judge', '001001', '0', null, null, 'cdzhai', '2013-09-29 19:44:24', null, null, '1');
INSERT INTO `topic_catalog` VALUES ('2013092900000016', '党的十八大', '党的十八大于2012年下半年在北京召开。 ', 'right', 'Judge', '001001', '0', null, null, 'cdzhai', '2013-09-29 19:44:44', null, null, '1');
INSERT INTO `topic_catalog` VALUES ('2013092900000017', '每年对学生进行综合考评', '每年对学生进行综合考评，各学院应当成立综合考评工作领导小组和学生考评小组，学生考评小组须在辅导员（班主任）的指导下进行工作。其中学生考评小组的组成人员是（ ）。 ', 'A', 'SingleChoice', '001002', '4', null, null, 'cdzhai', '2013-09-29 19:46:21', null, null, '1');
INSERT INTO `topic_catalog` VALUES ('2013092900000018', '学生综合考评成绩', '根据学生手册规定，学生综合考评成绩由以下几部分组成（ ）。 ', 'A', 'SingleChoice', '001003', '4', null, null, 'cdzhai', '2013-09-29 19:47:23', null, null, '1');
INSERT INTO `topic_catalog` VALUES ('2013092900000019', '西南大学学生先进集体和个人评选表彰办法', '根据《西南大学学生先进集体和个人评选表彰办法》规定，三好学生和优秀学生干部的评选比例分别是按参评学生人数的（ ）评选。 ', 'B', 'SingleChoice', '001004', '4', null, null, 'cdzhai', '2013-09-29 19:48:28', null, null, '1');
INSERT INTO `topic_catalog` VALUES ('2013092900000020', '社会主义核心价值体系的基本内容', '社会主义核心价值体系的基本内容是（ ）。 ', 'A@C@D', 'MultipleChoice', '002001', '4', null, null, 'cdzhai', '2013-09-29 19:49:28', null, null, '1');
INSERT INTO `topic_catalog` VALUES ('2013092900000021', '高等学校教师职业道德规范主要内容', '高等学校教师职业道德规范的主要内容是（ ）。 ', 'A@C@D@B', 'MultipleChoice', '002002', '4', null, null, 'cdzhai', '2013-09-29 19:50:31', null, null, '1');
INSERT INTO `topic_catalog` VALUES ('2013092900000022', '胡锦涛总书记在清华大学百年校庆讲话', '胡锦涛总书记在清华大学百年校庆讲话中给青少年提出的希望是（ ）。 ', 'C@D', 'MultipleChoice', '002003', '4', null, null, 'cdzhai', '2013-09-29 19:51:32', null, null, '1');
INSERT INTO `topic_catalog` VALUES ('2013092900000023', '党的十七届六中全会', '党的十七届六中全会提出来要建设社会主义文化强国。 ', 'right', 'Judge', '002004', '0', null, null, 'cdzhai', '2013-09-29 19:52:05', null, null, '1');
INSERT INTO `topic_catalog` VALUES ('2013092900000024', '我校学科齐全', '我校学科齐全，涵盖了哲、经、法、文、史、教、理、工、农、医、管、艺等12个学科门类，并在教师教育和农业教育方面形成了鲜明特色。 ', 'right', 'Judge', '002005', '0', null, null, 'cdzhai', '2013-09-29 19:52:36', null, null, '1');
INSERT INTO `topic_library` VALUES ('2013092900000001', '1', '国立女子师范学院 ', '1');
INSERT INTO `topic_library` VALUES ('2013092900000001', '2', '相辉学院 ', '2');
INSERT INTO `topic_library` VALUES ('2013092900000001', '3', '川东师范学院', '3');
INSERT INTO `topic_library` VALUES ('2013092900000001', '4', '四川省立教育学院', '4');
INSERT INTO `topic_library` VALUES ('2013092900000002', '1', '7天', '1');
INSERT INTO `topic_library` VALUES ('2013092900000002', '2', '10天 ', '2');
INSERT INTO `topic_library` VALUES ('2013092900000002', '3', '半个月', '3');
INSERT INTO `topic_library` VALUES ('2013092900000002', '4', '一个月', '4');
INSERT INTO `topic_library` VALUES ('2013092900000002', '5', '两个月', '5');
INSERT INTO `topic_library` VALUES ('2013092900000003', '1', '3', '1');
INSERT INTO `topic_library` VALUES ('2013092900000003', '2', '5', '2');
INSERT INTO `topic_library` VALUES ('2013092900000003', '3', '7', '3');
INSERT INTO `topic_library` VALUES ('2013092900000003', '4', '10', '4');
INSERT INTO `topic_library` VALUES ('2013092900000004', '1', '雷锋同志生日 ', '1');
INSERT INTO `topic_library` VALUES ('2013092900000004', '2', '雷锋同志去世的日子 ', '2');
INSERT INTO `topic_library` VALUES ('2013092900000004', '3', '毛泽东主席题词“向雷锋同志学习”的日子', '3');
INSERT INTO `topic_library` VALUES ('2013092900000005', '1', '一讲二评三公示 ', '1');
INSERT INTO `topic_library` VALUES ('2013092900000005', '2', '抓党建、促三风、建三高', '2');
INSERT INTO `topic_library` VALUES ('2013092900000005', '3', '强组织、增活力，创先争优迎十八大', '3');
INSERT INTO `topic_library` VALUES ('2013092900000005', '4', '抓落实、全覆盖、求实效、受欢迎', '4');
INSERT INTO `topic_library` VALUES ('2013092900000005', '5', '五个进一步提升', '5');
INSERT INTO `topic_library` VALUES ('2013092900000005', '6', '三创六进', '6');
INSERT INTO `topic_library` VALUES ('2013092900000006', '1', '每周不少于一次', '1');
INSERT INTO `topic_library` VALUES ('2013092900000006', '2', '每月不少于两次 ', '2');
INSERT INTO `topic_library` VALUES ('2013092900000006', '3', '每月不少于一次', '3');
INSERT INTO `topic_library` VALUES ('2013092900000006', '4', '每季度不少于两次', '4');
INSERT INTO `topic_library` VALUES ('2013092900000006', '5', '每学期不少于两次', '5');
INSERT INTO `topic_library` VALUES ('2013092900000007', '1', '90年前爆发了反对帝国主义、封建主义的五四爱国运动 ', '1');
INSERT INTO `topic_library` VALUES ('2013092900000007', '2', '90年前社会主义青年团成立', '2');
INSERT INTO `topic_library` VALUES ('2013092900000007', '3', '90年前中国新民主主义青年团成立', '3');
INSERT INTO `topic_library` VALUES ('2013092900000007', '4', '90年前民主青年团成立', '4');
INSERT INTO `topic_library` VALUES ('2013092900000007', '5', '90年前中国新民主主义青年团召开第一次全国代表大会', '5');
INSERT INTO `topic_library` VALUES ('2013092900000007', '6', '90年前中国社会主义青年团召开第一次全国代表大会', '6');
INSERT INTO `topic_library` VALUES ('2013092900000007', '7', '90年前中国社会主义青年团改名为中国共产主义青年团', '7');
INSERT INTO `topic_library` VALUES ('2013092900000007', '8', '90年前中国社会主义青年团改名为中国共产主义青年团', '8');
INSERT INTO `topic_library` VALUES ('2013092900000008', '1', '应具有2年以上党龄', '1');
INSERT INTO `topic_library` VALUES ('2013092900000008', '2', '应具有3年以上党龄 ', '2');
INSERT INTO `topic_library` VALUES ('2013092900000008', '3', '应具有5年以上党龄', '3');
INSERT INTO `topic_library` VALUES ('2013092900000008', '4', '应具有副高以上职称或者科以上职务', '4');
INSERT INTO `topic_library` VALUES ('2013092900000009', '1', '五分之四', '1');
INSERT INTO `topic_library` VALUES ('2013092900000009', '2', '三分之二', '2');
INSERT INTO `topic_library` VALUES ('2013092900000009', '3', '二分之一', '3');
INSERT INTO `topic_library` VALUES ('2013092900000009', '4', '五分之三', '4');
INSERT INTO `topic_library` VALUES ('2013092900000010', '1', '两个月', '1');
INSERT INTO `topic_library` VALUES ('2013092900000010', '2', '三个月 ', '2');
INSERT INTO `topic_library` VALUES ('2013092900000010', '3', '六个月', '3');
INSERT INTO `topic_library` VALUES ('2013092900000010', '4', '一年', '4');
INSERT INTO `topic_library` VALUES ('2013092900000010', '5', '二年', '5');
INSERT INTO `topic_library` VALUES ('2013092900000010', '6', '三年', '6');
INSERT INTO `topic_library` VALUES ('2013092900000011', '1', '坚持教书与育人相结合', '1');
INSERT INTO `topic_library` VALUES ('2013092900000011', '2', '坚持教育与自我教育相结合', '2');
INSERT INTO `topic_library` VALUES ('2013092900000011', '3', '坚持政治理论教育与社会实践相结合', '3');
INSERT INTO `topic_library` VALUES ('2013092900000011', '4', '坚持解决思想问题与解决实际问题相结合', '4');
INSERT INTO `topic_library` VALUES ('2013092900000011', '5', '坚持教育与管理相结合', '5');
INSERT INTO `topic_library` VALUES ('2013092900000011', '6', '坚持继承优良传统与改进创新相结合', '6');
INSERT INTO `topic_library` VALUES ('2013092900000017', '1', '班、团干部 ', '1');
INSERT INTO `topic_library` VALUES ('2013092900000017', '2', '班、团干部及辅导员（班主任）', '2');
INSERT INTO `topic_library` VALUES ('2013092900000017', '3', '班、团干部及学生代表', '3');
INSERT INTO `topic_library` VALUES ('2013092900000017', '4', '班、团干部、学生代表和辅导员（班主任）', '4');
INSERT INTO `topic_library` VALUES ('2013092900000018', '1', '思想政治素质、学习成绩、工作表现 ', '1');
INSERT INTO `topic_library` VALUES ('2013092900000018', '2', '德育考评、课堂学习效果和拓展性素质评价 ', '2');
INSERT INTO `topic_library` VALUES ('2013092900000018', '3', '学习成绩、工作表现和参加集体活动表现', '3');
INSERT INTO `topic_library` VALUES ('2013092900000018', '4', '思想政治素质、学习成绩和参加活动情况', '4');
INSERT INTO `topic_library` VALUES ('2013092900000019', '1', '3%、7%', '1');
INSERT INTO `topic_library` VALUES ('2013092900000019', '2', '5%、9% ', '2');
INSERT INTO `topic_library` VALUES ('2013092900000019', '3', '7%、3%', '3');
INSERT INTO `topic_library` VALUES ('2013092900000019', '4', '9%、5%', '4');
INSERT INTO `topic_library` VALUES ('2013092900000020', '1', '马克思主义指导思想 ', '1');
INSERT INTO `topic_library` VALUES ('2013092900000020', '2', '中国特色社会主义共同理想 ', '2');
INSERT INTO `topic_library` VALUES ('2013092900000020', '3', '以爱国主义为核心的民族精神和以改革创新为核心的时代精神', '3');
INSERT INTO `topic_library` VALUES ('2013092900000020', '4', '以“八荣八耻”为主要内容的社会主义荣辱观', '4');
INSERT INTO `topic_library` VALUES ('2013092900000021', '1', '爱国守法,敬业爱生 ', '1');
INSERT INTO `topic_library` VALUES ('2013092900000021', '2', '教书育人,严谨治学 ', '2');
INSERT INTO `topic_library` VALUES ('2013092900000021', '3', '廉洁自律，淡薄名利', '3');
INSERT INTO `topic_library` VALUES ('2013092900000021', '4', '服务社会,为人师表', '4');
INSERT INTO `topic_library` VALUES ('2013092900000022', '1', '把文化知识学习和思想品德修养紧密结合起来 ', '1');
INSERT INTO `topic_library` VALUES ('2013092900000022', '2', '把创新能力和实践能力培养紧密结合起来', '2');
INSERT INTO `topic_library` VALUES ('2013092900000022', '3', '把创新思维和社会实践紧密结合起来', '3');
INSERT INTO `topic_library` VALUES ('2013092900000022', '4', '把全面发展和个性发展紧密结合起来', '4');
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
INSERT INTO `user_info` VALUES ('hxiao', '123456', '小红', '小红', '女', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null);
