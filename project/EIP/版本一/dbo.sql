/*
Navicat SQL Server Data Transfer

Source Server         : sqlserver
Source Server Version : 90000
Source Host           : localhost:1433
Source Database       : AirQuality
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 90000
File Encoding         : 65001

Date: 2014-01-21 15:14:59
*/


-- ----------------------------
-- Table structure for [dbo].[AQI]
-- ----------------------------
DROP TABLE [dbo].[AQI]
GO
CREATE TABLE [dbo].[AQI] (
[id] int NOT NULL IDENTITY(1,1) ,
[areaName] varchar(50) NULL ,
[AQI] int NULL ,
[quality] varchar(10) NULL ,
[comment] varchar(50) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[AQI]', RESEED, 190)
GO

-- ----------------------------
-- Records of AQI
-- ----------------------------
SET IDENTITY_INSERT [dbo].[AQI] ON
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'1', N'威海', N'39', N'优', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'2', N'拉萨', N'36', N'优', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'3', N'厦门', N'111', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'4', N'鄂尔多斯', N'40', N'优', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'5', N'泉州', N'126', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'6', N'汕头', N'132', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'7', N'福州', N'103', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'8', N'海口', N'121', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'9', N'玉溪', N'83', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'10', N'清远', N'83', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'11', N'烟台', N'26', N'优', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'12', N'昆明', N'68', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'13', N'舟山', N'62', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'14', N'丹东', N'35', N'优', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'15', N'大连', N'42', N'优', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'16', N'河源', N'93', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'17', N'肇庆', N'134', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'18', N'广州', N'90', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'19', N'惠州', N'79', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'20', N'韶关', N'75', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'21', N'江门', N'85', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'22', N'东莞', N'80', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'23', N'深圳', N'83', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'24', N'温州', N'72', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'25', N'青岛', N'62', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'26', N'珠海', N'99', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'27', N'佛山', N'94', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'28', N'中山', N'89', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'29', N'葫芦岛', N'65', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'30', N'兰州', N'161', N'中度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'31', N'台州', N'69', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'32', N'张家口', N'62', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'33', N'南昌', N'82', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'34', N'北海', N'102', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'35', N'西宁', N'61', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'36', N'营口', N'46', N'优', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'37', N'潍坊', N'73', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'38', N'秦皇岛', N'55', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'39', N'贵阳', N'172', N'中度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'40', N'柳州', N'111', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'41', N'承德', N'29', N'优', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'42', N'乌鲁木齐', N'172', N'中度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'43', N'衢州', N'81', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'44', N'延安', N'71', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'45', N'日照', N'55', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'46', N'长春', N'148', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'47', N'阳泉', N'58', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'48', N'丽水', N'86', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'49', N'上海', N'57', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'50', N'唐山', N'39', N'优', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'51', N'银川', N'87', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'52', N'株洲', N'83', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'53', N'宁波', N'69', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'54', N'东营', N'52', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'55', N'湘潭', N'94', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'56', N'呼和浩特', N'69', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'57', N'南宁', N'94', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'58', N'大同', N'119', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'59', N'长沙', N'80', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'60', N'杭州', N'93', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'61', N'金华', N'97', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'62', N'天津', N'29', N'优', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'63', N'滨州', N'32', N'优', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'64', N'盘锦', N'60', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'65', N'哈尔滨', N'224', N'重度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'66', N'重庆', N'185', N'中度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'67', N'包头', N'134', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'68', N'武汉', N'107', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'69', N'南通', N'72', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'70', N'成都', N'157', N'中度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'71', N'湖州', N'75', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'72', N'太原', N'77', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'73', N'嘉兴', N'73', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'74', N'盐城', N'69', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'75', N'临汾', N'106', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'76', N'长治', N'87', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'77', N'连云港', N'74', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'78', N'苏州', N'63', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'79', N'绍兴', N'101', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'80', N'沧州', N'64', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'81', N'常州', N'67', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'82', N'莱芜', N'40', N'优', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'83', N'镇江', N'44', N'优', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'84', N'无锡', N'68', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'85', N'徐州', N'61', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'86', N'南京', N'81', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'87', N'沈阳', N'175', N'中度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'88', N'泰州', N'70', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'89', N'淄博', N'59', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'90', N'北京', N'43', N'优', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'91', N'扬州', N'71', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'92', N'合肥', N'67', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'93', N'铜川', N'57', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'94', N'宿迁', N'52', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'95', N'济南', N'56', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'96', N'淮安', N'68', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'97', N'菏泽', N'67', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'98', N'泰安', N'48', N'优', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'99', N'宝鸡', N'112', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'100', N'咸阳', N'138', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'101', N'廊坊', N'53', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'102', N'郑州', N'78', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'103', N'保定', N'91', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'104', N'渭南', N'105', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'105', N'德州', N'62', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'106', N'济宁', N'59', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'107', N'邢台', N'149', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'108', N'衡水', N'54', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'109', N'临沂', N'52', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'110', N'西安', N'129', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'111', N'石家庄', N'117', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'112', N'聊城', N'53', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'113', N'枣庄', N'59', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'114', N'邯郸', N'89', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'115', N'曲靖', N'148', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'116', N'金昌', N'187', N'中度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'117', N'嘉峪关', N'76', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'118', N'海门', N'68', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'119', N'蓬莱', N'39', N'优', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'120', N'湛江', N'91', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'121', N'攀枝花', N'75', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'122', N'洛阳', N'73', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'123', N'岳阳', N'117', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'124', N'抚顺', N'239', N'重度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'125', N'大庆', N'55', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'126', N'本溪', N'105', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'127', N'石嘴山', N'116', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'128', N'三亚', N'121', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'129', N'九江', N'67', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'130', N'焦作', N'51', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'131', N'三门峡', N'59', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'132', N'克拉玛依', N'93', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'133', N'库尔勒', N'110', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'134', N'齐齐哈尔', N'56', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'135', N'义乌', N'56', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'136', N'茂名', N'175', N'中度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'137', N'梅州', N'87', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'138', N'德阳', N'140', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'139', N'阳江', N'96', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'140', N'太仓', N'67', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'141', N'云浮', N'82', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'142', N'绵阳', N'119', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'143', N'自贡', N'145', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'144', N'荣成', N'55', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'145', N'赤峰', N'114', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'146', N'寿光', N'66', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'147', N'常熟', N'50', N'优', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'148', N'汕尾', N'99', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'149', N'胶南', N'41', N'优', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'150', N'即墨', N'38', N'优', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'151', N'瓦房店', N'47', N'优', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'152', N'安阳', N'71', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'153', N'遵义', N'169', N'中度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'154', N'桂林', N'82', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'155', N'鞍山', N'179', N'中度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'156', N'张家港', N'70', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'157', N'吴江', N'67', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'158', N'昆山', N'64', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'159', N'南充', N'200', N'中度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'160', N'锦州', N'71', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'161', N'常德', N'152', N'中度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'162', N'荆州', N'112', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'163', N'宜宾', N'126', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'164', N'平顶山', N'72', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'165', N'马鞍山', N'70', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'166', N'诸暨', N'87', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'167', N'文登', N'41', N'优', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'168', N'潮州', N'105', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'169', N'江阴', N'55', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'170', N'芜湖', N'91', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'171', N'胶州', N'65', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'172', N'章丘', N'29', N'优', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'173', N'牡丹江', N'110', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'174', N'富阳', N'72', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'175', N'招远', N'52', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'176', N'乳山', N'35', N'优', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'177', N'揭阳', N'112', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'178', N'莱州', N'54', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'179', N'临安', N'90', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'180', N'句容', N'46', N'优', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'181', N'开封', N'53', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'182', N'金坛', N'63', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'183', N'张家界', N'139', N'轻度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'184', N'莱西', N'45', N'优', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'185', N'泸州', N'182', N'中度污染', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'186', N'宜昌', N'99', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'187', N'溧阳', N'85', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'188', N'宜兴', N'58', N'良', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'189', N'平度', N'49', N'优', null);
GO
INSERT INTO [dbo].[AQI] ([id], [areaName], [AQI], [quality], [comment]) VALUES (N'190', N'吉林', N'106', N'轻度污染', null);
GO
SET IDENTITY_INSERT [dbo].[AQI] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[weather]
-- ----------------------------
DROP TABLE [dbo].[weather]
GO
CREATE TABLE [dbo].[weather] (
[id] int NOT NULL IDENTITY(1,1) ,
[cityName] varchar(30) NULL ,
[weatherCode] varchar(10) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[weather]', RESEED, 2586)
GO

-- ----------------------------
-- Records of weather
-- ----------------------------
SET IDENTITY_INSERT [dbo].[weather] ON
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1', N'北京', N'101010100');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2', N'海淀', N'101010200');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'3', N'朝阳', N'101010300');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'4', N'顺义', N'101010400');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'5', N'怀柔', N'101010500');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'6', N'通州', N'101010600');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'7', N'昌平', N'101010700');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'8', N'延庆', N'101010800');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'9', N'丰台', N'101010900');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'10', N'石景山', N'101011000');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'11', N'大兴', N'101011100');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'12', N'房山', N'101011200');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'13', N'密云', N'101011300');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'14', N'门头沟', N'101011400');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'15', N'平谷', N'101011500');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'16', N'八达岭', N'101011600');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'17', N'佛爷顶', N'101011700');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'18', N'汤河口', N'101011800');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'19', N'密云上甸子', N'101011900');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'20', N'斋堂', N'101012000');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'21', N'霞云岭', N'101012100');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'22', N'上海', N'101020100');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'23', N'闵行', N'101020200');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'24', N'宝山', N'101020300');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'25', N'川沙', N'101020400');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'26', N'嘉定', N'101020500');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'27', N'南汇', N'101020600');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'28', N'金山', N'101020700');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'29', N'青浦', N'101020800');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'30', N'松江', N'101020900');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'31', N'奉贤', N'101021000');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'32', N'崇明', N'101021100');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'33', N'陈家镇', N'101021101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'34', N'引水船', N'101021102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'35', N'徐家汇', N'101021200');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'36', N'浦东', N'101021300');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'37', N'天津', N'101030100');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'38', N'武清', N'101030200');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'39', N'宝坻', N'101030300');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'40', N'东丽', N'101030400');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'41', N'西青', N'101030500');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'42', N'北辰', N'101030600');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'43', N'宁河', N'101030700');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'44', N'汉沽', N'101030800');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'45', N'静海', N'101030900');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'46', N'津南', N'101031000');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'47', N'塘沽', N'101031100');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'48', N'大港', N'101031200');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'49', N'平台', N'101031300');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'50', N'蓟县', N'101031400');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'51', N'重庆', N'101040100');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'52', N'永川', N'101040200');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'53', N'合川', N'101040300');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'54', N'南川', N'101040400');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'55', N'江津', N'101040500');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'56', N'万盛', N'101040600');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'57', N'渝北', N'101040700');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'58', N'北碚', N'101040800');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'59', N'巴南', N'101040900');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'60', N'长寿', N'101041000');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'61', N'黔江', N'101041100');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'62', N'万州天城', N'101041200');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'63', N'万州龙宝', N'101041300');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'64', N'涪陵', N'101041400');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'65', N'开县', N'101041500');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'66', N'城口', N'101041600');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'67', N'云阳', N'101041700');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'68', N'巫溪', N'101041800');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'69', N'奉节', N'101041900');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'70', N'巫山', N'101042000');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'71', N'潼南', N'101042100');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'72', N'垫江', N'101042200');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'73', N'梁平', N'101042300');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'74', N'忠县', N'101042400');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'75', N'石柱', N'101042500');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'76', N'大足', N'101042600');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'77', N'荣昌', N'101042700');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'78', N'铜梁', N'101042800');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'79', N'璧山', N'101042900');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'80', N'丰都', N'101043000');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'81', N'武隆', N'101043100');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'82', N'彭水', N'101043200');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'83', N'綦江', N'101043300');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'84', N'酉阳', N'101043400');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'85', N'金佛山', N'101043500');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'86', N'秀山', N'101043600');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'87', N'沙坪坝', N'101043700');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'88', N'哈尔滨', N'101050101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'89', N'双城', N'101050102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'90', N'呼兰', N'101050103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'91', N'阿城', N'101050104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'92', N'宾县', N'101050105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'93', N'依兰', N'101050106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'94', N'巴彦', N'101050107');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'95', N'通河', N'101050108');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'96', N'方正', N'101050109');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'97', N'延寿', N'101050110');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'98', N'尚志', N'101050111');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'99', N'五常', N'101050112');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'100', N'木兰', N'101050113');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'101', N'齐齐哈尔', N'101050201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'102', N'讷河', N'101050202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'103', N'龙江', N'101050203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'104', N'甘南', N'101050204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'105', N'富裕', N'101050205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'106', N'依安', N'101050206');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'107', N'拜泉', N'101050207');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'108', N'克山', N'101050208');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'109', N'克东', N'101050209');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'110', N'泰来', N'101050210');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'111', N'牡丹江', N'101050301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'112', N'海林', N'101050302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'113', N'穆棱', N'101050303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'114', N'林口', N'101050304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'115', N'绥芬河', N'101050305');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'116', N'宁安', N'101050306');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'117', N'东宁', N'101050307');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'118', N'佳木斯', N'101050401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'119', N'汤原', N'101050402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'120', N'抚远', N'101050403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'121', N'桦川', N'101050404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'122', N'桦南', N'101050405');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'123', N'同江', N'101050406');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'124', N'富锦', N'101050407');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'125', N'绥化', N'101050501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'126', N'肇东', N'101050502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'127', N'安达', N'101050503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'128', N'海伦', N'101050504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'129', N'明水', N'101050505');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'130', N'望奎', N'101050506');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'131', N'兰西', N'101050507');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'132', N'青冈', N'101050508');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'133', N'庆安', N'101050509');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'134', N'绥棱', N'101050510');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'135', N'黑河', N'101050601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'136', N'嫩江', N'101050602');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'137', N'孙吴', N'101050603');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'138', N'逊克', N'101050604');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'139', N'五大连池', N'101050605');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'140', N'北安', N'101050606');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'141', N'大兴安岭', N'101050701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'142', N'塔河', N'101050702');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'143', N'漠河', N'101050703');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'144', N'呼玛', N'101050704');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'145', N'呼中', N'101050705');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'146', N'新林', N'101050706');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'147', N'阿木尔', N'101050707');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'148', N'加格达奇', N'101050708');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'149', N'伊春', N'101050801');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'150', N'乌伊岭', N'101050802');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'151', N'五营', N'101050803');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'152', N'铁力', N'101050804');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'153', N'嘉荫', N'101050805');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'154', N'大庆', N'101050901');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'155', N'林甸', N'101050902');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'156', N'肇州', N'101050903');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'157', N'肇源', N'101050904');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'158', N'杜蒙', N'101050905');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'159', N'七台河', N'101051002');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'160', N'勃利', N'101051003');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'161', N'鸡西', N'101051101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'162', N'虎林', N'101051102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'163', N'密山', N'101051103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'164', N'鸡东', N'101051104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'165', N'鹤岗', N'101051201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'166', N'绥滨', N'101051202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'167', N'萝北', N'101051203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'168', N'双鸭山', N'101051301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'169', N'集贤', N'101051302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'170', N'宝清', N'101051303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'171', N'饶河', N'101051304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'172', N'长春', N'101060101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'173', N'农安', N'101060102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'174', N'德惠', N'101060103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'175', N'九台', N'101060104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'176', N'榆树', N'101060105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'177', N'双阳', N'101060106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'178', N'吉林', N'101060201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'179', N'舒兰', N'101060202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'180', N'永吉', N'101060203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'181', N'蛟河', N'101060204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'182', N'磐石', N'101060205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'183', N'桦甸', N'101060206');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'184', N'烟筒山', N'101060207');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'185', N'延吉', N'101060301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'186', N'敦化', N'101060302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'187', N'安图', N'101060303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'188', N'汪清', N'101060304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'189', N'和龙', N'101060305');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'190', N'天池', N'101060306');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'191', N'龙井', N'101060307');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'192', N'珲春', N'101060308');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'193', N'图们', N'101060309');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'194', N'松江', N'101060310');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'195', N'罗子沟', N'101060311');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'196', N'延边', N'101060312');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'197', N'四平', N'101060401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'198', N'双辽', N'101060402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'199', N'梨树', N'101060403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'200', N'公主岭', N'101060404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'201', N'伊通', N'101060405');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'202', N'孤家子', N'101060406');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'203', N'通化', N'101060501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'204', N'梅河口', N'101060502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'205', N'柳河', N'101060503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'206', N'辉南', N'101060504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'207', N'集安', N'101060505');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'208', N'通化县', N'101060506');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'209', N'白城', N'101060601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'210', N'洮南', N'101060602');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'211', N'大安', N'101060603');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'212', N'镇赉', N'101060604');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'213', N'通榆', N'101060605');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'214', N'辽源', N'101060701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'215', N'东丰', N'101060702');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'216', N'松原', N'101060801');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'217', N'乾安', N'101060802');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'218', N'前郭', N'101060803');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'219', N'长岭', N'101060804');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'220', N'扶余', N'101060805');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'221', N'白山', N'101060901');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'222', N'靖宇', N'101060902');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'223', N'临江', N'101060903');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'224', N'东岗', N'101060904');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'225', N'长白', N'101060905');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'226', N'沈阳', N'101070101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'227', N'苏家屯', N'101070102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'228', N'辽中', N'101070103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'229', N'康平', N'101070104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'230', N'法库', N'101070105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'231', N'新民', N'101070106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'232', N'于洪', N'101070107');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'233', N'新城子', N'101070108');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'234', N'大连', N'101070201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'235', N'瓦房店', N'101070202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'236', N'金州', N'101070203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'237', N'普兰店', N'101070204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'238', N'旅顺', N'101070205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'239', N'长海', N'101070206');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'240', N'庄河', N'101070207');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'241', N'皮口', N'101070208');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'242', N'海洋岛', N'101070209');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'243', N'鞍山', N'101070301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'244', N'台安', N'101070302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'245', N'岫岩', N'101070303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'246', N'海城', N'101070304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'247', N'抚顺', N'101070401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'248', N'清原', N'101070403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'249', N'章党', N'101070404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'250', N'本溪', N'101070501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'251', N'本溪县', N'101070502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'252', N'草河口', N'101070503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'253', N'桓仁', N'101070504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'254', N'丹东', N'101070601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'255', N'凤城', N'101070602');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'256', N'宽甸', N'101070603');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'257', N'东港', N'101070604');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'258', N'东沟', N'101070605');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'259', N'锦州', N'101070701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'260', N'凌海', N'101070702');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'261', N'北宁', N'101070703');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'262', N'义县', N'101070704');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'263', N'黑山', N'101070705');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'264', N'北镇', N'101070706');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'265', N'营口', N'101070801');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'266', N'大石桥', N'101070802');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'267', N'盖州', N'101070803');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'268', N'阜新', N'101070901');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'269', N'彰武', N'101070902');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'270', N'辽阳', N'101071001');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'271', N'辽阳县', N'101071002');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'272', N'灯塔', N'101071003');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'273', N'铁岭', N'101071101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'274', N'开原', N'101071102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'275', N'昌图', N'101071103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'276', N'西丰', N'101071104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'277', N'朝阳', N'101071201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'278', N'建平', N'101071202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'279', N'凌源', N'101071203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'280', N'喀左', N'101071204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'281', N'北票', N'101071205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'282', N'羊山', N'101071206');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'283', N'建平县', N'101071207');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'284', N'盘锦', N'101071301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'285', N'大洼', N'101071302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'286', N'盘山', N'101071303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'287', N'葫芦岛', N'101071401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'288', N'建昌', N'101071402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'289', N'绥中', N'101071403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'290', N'兴城', N'101071404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'291', N'呼和浩特', N'101080101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'292', N'土默特左旗', N'101080102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'293', N'托克托', N'101080103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'294', N'和林格尔', N'101080104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'295', N'清水河', N'101080105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'296', N'呼和浩特市郊区', N'101080106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'297', N'武川', N'101080107');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'298', N'包头', N'101080201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'299', N'白云鄂博', N'101080202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'300', N'满都拉', N'101080203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'301', N'土默特右旗', N'101080204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'302', N'固阳', N'101080205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'303', N'达尔罕茂明安联合旗', N'101080206');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'304', N'石拐', N'101080207');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'305', N'乌海', N'101080301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'306', N'集宁', N'101080401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'307', N'卓资', N'101080402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'308', N'化德', N'101080403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'309', N'商都', N'101080404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'310', N'希拉穆仁', N'101080405');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'311', N'兴和', N'101080406');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'312', N'凉城', N'101080407');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'313', N'察哈尔右翼前旗', N'101080408');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'314', N'察哈尔右翼中旗', N'101080409');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'315', N'察哈尔右翼后旗', N'101080410');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'316', N'四子王旗', N'101080411');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'317', N'丰镇', N'101080412');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'318', N'通辽', N'101080501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'319', N'舍伯吐', N'101080502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'320', N'科尔沁左翼中旗', N'101080503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'321', N'科尔沁左翼后旗', N'101080504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'322', N'青龙山', N'101080505');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'323', N'开鲁', N'101080506');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'324', N'库伦旗', N'101080507');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'325', N'奈曼旗', N'101080508');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'326', N'扎鲁特旗', N'101080509');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'327', N'高力板', N'101080510');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'328', N'巴雅尔吐胡硕', N'101080511');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'329', N'通辽钱家店', N'101080512');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'330', N'赤峰', N'101080601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'331', N'赤峰郊区站', N'101080602');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'332', N'阿鲁科尔沁旗', N'101080603');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'333', N'浩尔吐', N'101080604');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'334', N'巴林左旗', N'101080605');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'335', N'巴林右旗', N'101080606');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'336', N'林西', N'101080607');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'337', N'克什克腾旗', N'101080608');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'338', N'翁牛特旗', N'101080609');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'339', N'岗子', N'101080610');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'340', N'喀喇沁旗', N'101080611');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'341', N'八里罕', N'101080612');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'342', N'宁城', N'101080613');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'343', N'敖汉旗', N'101080614');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'344', N'宝过图', N'101080615');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'345', N'鄂尔多斯', N'101080701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'346', N'达拉特旗', N'101080703');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'347', N'准格尔旗', N'101080704');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'348', N'鄂托克前旗', N'101080705');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'349', N'河南', N'101080706');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'350', N'伊克乌素', N'101080707');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'351', N'鄂托克旗', N'101080708');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'352', N'杭锦旗', N'101080709');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'353', N'乌审旗', N'101080710');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'354', N'伊金霍洛旗', N'101080711');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'355', N'乌审召', N'101080712');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'356', N'东胜', N'101080713');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'357', N'临河', N'101080801');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'358', N'五原', N'101080802');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'359', N'磴口', N'101080803');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'360', N'乌拉特前旗', N'101080804');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'361', N'大佘太', N'101080805');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'362', N'乌拉特中旗', N'101080806');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'363', N'乌拉特后旗', N'101080807');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'364', N'海力素', N'101080808');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'365', N'那仁宝力格', N'101080809');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'366', N'杭锦后旗', N'101080810');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'367', N'巴盟农试站', N'101080811');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'368', N'锡林浩特', N'101080901');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'369', N'朝克乌拉', N'101080902');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'370', N'二连浩特', N'101080903');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'371', N'阿巴嘎旗', N'101080904');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'372', N'伊和郭勒', N'101080905');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'373', N'苏尼特左旗', N'101080906');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'374', N'苏尼特右旗', N'101080907');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'375', N'朱日和', N'101080908');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'376', N'东乌珠穆沁旗', N'101080909');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'377', N'西乌珠穆沁旗', N'101080910');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'378', N'太仆寺旗', N'101080911');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'379', N'镶黄旗', N'101080912');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'380', N'正镶白旗', N'101080913');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'381', N'正兰旗', N'101080914');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'382', N'多伦', N'101080915');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'383', N'博克图', N'101080916');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'384', N'乌拉盖', N'101080917');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'385', N'白日乌拉', N'101080918');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'386', N'那日图', N'101080919');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'387', N'呼伦贝尔', N'101081000');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'388', N'海拉尔', N'101081001');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'389', N'小二沟', N'101081002');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'390', N'阿荣旗', N'101081003');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'391', N'莫力达瓦旗', N'101081004');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'392', N'鄂伦春旗', N'101081005');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'393', N'鄂温克旗', N'101081006');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'394', N'陈巴尔虎旗', N'101081007');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'395', N'新巴尔虎左旗', N'101081008');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'396', N'新巴尔虎右旗', N'101081009');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'397', N'满洲里', N'101081010');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'398', N'牙克石', N'101081011');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'399', N'扎兰屯', N'101081012');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'400', N'额尔古纳', N'101081014');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'401', N'根河', N'101081015');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'402', N'图里河', N'101081016');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'403', N'乌兰浩特', N'101081101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'404', N'阿尔山', N'101081102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'405', N'科尔沁右翼中旗', N'101081103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'406', N'胡尔勒', N'101081104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'407', N'扎赉特旗', N'101081105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'408', N'索伦', N'101081106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'409', N'突泉', N'101081107');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'410', N'霍林郭勒', N'101081108');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'411', N'阿拉善左旗', N'101081201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'412', N'阿拉善右旗', N'101081202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'413', N'额济纳旗', N'101081203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'414', N'拐子湖', N'101081204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'415', N'吉兰太', N'101081205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'416', N'锡林高勒', N'101081206');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'417', N'头道湖', N'101081207');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'418', N'中泉子', N'101081208');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'419', N'巴彦诺尔贡', N'101081209');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'420', N'雅布赖', N'101081210');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'421', N'乌斯太', N'101081211');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'422', N'孪井滩', N'101081212');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'423', N'石家庄', N'101090101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'424', N'井陉', N'101090102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'425', N'正定', N'101090103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'426', N'栾城', N'101090104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'427', N'行唐', N'101090105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'428', N'灵寿', N'101090106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'429', N'高邑', N'101090107');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'430', N'深泽', N'101090108');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'431', N'赞皇', N'101090109');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'432', N'无极', N'101090110');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'433', N'平山', N'101090111');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'434', N'元氏', N'101090112');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'435', N'赵县', N'101090113');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'436', N'辛集', N'101090114');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'437', N'藁城', N'101090115');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'438', N'晋洲', N'101090116');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'439', N'新乐', N'101090117');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'440', N'保定', N'101090201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'441', N'满城', N'101090202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'442', N'阜平', N'101090203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'443', N'徐水', N'101090204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'444', N'唐县', N'101090205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'445', N'高阳', N'101090206');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'446', N'容城', N'101090207');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'447', N'紫荆关', N'101090208');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'448', N'涞源', N'101090209');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'449', N'望都', N'101090210');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'450', N'安新', N'101090211');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'451', N'易县', N'101090212');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'452', N'涞水', N'101090213');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'453', N'曲阳', N'101090214');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'454', N'蠡县', N'101090215');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'455', N'顺平', N'101090216');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'456', N'雄县', N'101090217');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'457', N'涿州', N'101090218');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'458', N'定州', N'101090219');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'459', N'安国', N'101090220');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'460', N'高碑店', N'101090221');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'461', N'张家口', N'101090301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'462', N'宣化', N'101090302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'463', N'张北', N'101090303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'464', N'康保', N'101090304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'465', N'沽源', N'101090305');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'466', N'尚义', N'101090306');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'467', N'蔚县', N'101090307');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'468', N'阳原', N'101090308');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'469', N'怀安', N'101090309');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'470', N'万全', N'101090310');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'471', N'怀来', N'101090311');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'472', N'涿鹿', N'101090312');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'473', N'赤城', N'101090313');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'474', N'崇礼', N'101090314');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'475', N'承德', N'101090402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'476', N'承德县', N'101090403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'477', N'兴隆', N'101090404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'478', N'平泉', N'101090405');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'479', N'滦平', N'101090406');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'480', N'隆化', N'101090407');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'481', N'丰宁', N'101090408');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'482', N'宽城', N'101090409');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'483', N'围场', N'101090410');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'484', N'塞罕坎', N'101090411');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'485', N'唐山', N'101090501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'486', N'丰南', N'101090502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'487', N'丰润', N'101090503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'488', N'滦县', N'101090504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'489', N'滦南', N'101090505');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'490', N'乐亭', N'101090506');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'491', N'迁西', N'101090507');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'492', N'玉田', N'101090508');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'493', N'唐海', N'101090509');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'494', N'遵化', N'101090510');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'495', N'迁安', N'101090511');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'496', N'廊坊', N'101090601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'497', N'固安', N'101090602');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'498', N'永清', N'101090603');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'499', N'香河', N'101090604');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'500', N'大城', N'101090605');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'501', N'文安', N'101090606');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'502', N'大厂', N'101090607');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'503', N'霸州', N'101090608');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'504', N'三河', N'101090609');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'505', N'沧州', N'101090701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'506', N'青县', N'101090702');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'507', N'东光', N'101090703');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'508', N'海兴', N'101090704');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'509', N'盐山', N'101090705');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'510', N'肃宁', N'101090706');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'511', N'南皮', N'101090707');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'512', N'吴桥', N'101090708');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'513', N'献县', N'101090709');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'514', N'孟村', N'101090710');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'515', N'泊头', N'101090711');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'516', N'任丘', N'101090712');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'517', N'黄骅', N'101090713');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'518', N'河间', N'101090714');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'519', N'曹妃甸', N'101090715');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'520', N'衡水', N'101090801');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'521', N'枣强', N'101090802');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'522', N'武邑', N'101090803');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'523', N'武强', N'101090804');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'524', N'饶阳', N'101090805');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'525', N'安平', N'101090806');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'526', N'故城', N'101090807');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'527', N'景县', N'101090808');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'528', N'阜城', N'101090809');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'529', N'冀州', N'101090810');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'530', N'深州', N'101090811');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'531', N'邢台', N'101090901');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'532', N'临城', N'101090902');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'533', N'邢台县浆水', N'101090903');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'534', N'内邱', N'101090904');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'535', N'柏乡', N'101090905');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'536', N'隆尧', N'101090906');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'537', N'南和', N'101090907');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'538', N'宁晋', N'101090908');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'539', N'巨鹿', N'101090909');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'540', N'新河', N'101090910');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'541', N'广宗', N'101090911');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'542', N'平乡', N'101090912');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'543', N'威县', N'101090913');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'544', N'清河', N'101090914');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'545', N'临西', N'101090915');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'546', N'南宫', N'101090916');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'547', N'沙河', N'101090917');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'548', N'任县', N'101090918');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'549', N'邯郸', N'101091001');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'550', N'峰峰', N'101091002');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'551', N'临漳', N'101091003');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'552', N'成安', N'101091004');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'553', N'大名', N'101091005');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'554', N'涉县', N'101091006');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'555', N'磁县', N'101091007');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'556', N'肥乡', N'101091008');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'557', N'永年', N'101091009');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'558', N'邱县', N'101091010');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'559', N'鸡泽', N'101091011');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'560', N'广平', N'101091012');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'561', N'馆陶', N'101091013');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'562', N'魏县', N'101091014');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'563', N'曲周', N'101091015');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'564', N'武安', N'101091016');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'565', N'秦皇岛', N'101091101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'566', N'青龙', N'101091102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'567', N'昌黎', N'101091103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'568', N'抚宁', N'101091104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'569', N'卢龙', N'101091105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'570', N'北戴河', N'101091106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'571', N'太原', N'101100101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'572', N'清徐', N'101100102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'573', N'阳曲', N'101100103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'574', N'娄烦', N'101100104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'575', N'太原古交区', N'101100105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'576', N'太原北郊', N'101100106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'577', N'太原南郊', N'101100107');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'578', N'大同', N'101100201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'579', N'阳高', N'101100202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'580', N'大同县', N'101100203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'581', N'天镇', N'101100204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'582', N'广灵', N'101100205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'583', N'灵邱', N'101100206');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'584', N'浑源', N'101100207');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'585', N'左云', N'101100208');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'586', N'阳泉', N'101100301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'587', N'盂县', N'101100302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'588', N'平定', N'101100303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'589', N'晋中', N'101100401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'590', N'榆次', N'101100402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'591', N'榆社', N'101100403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'592', N'左权', N'101100404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'593', N'和顺', N'101100405');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'594', N'昔阳', N'101100406');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'595', N'寿阳', N'101100407');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'596', N'太谷', N'101100408');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'597', N'祁县', N'101100409');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'598', N'平遥', N'101100410');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'599', N'灵石', N'101100411');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'600', N'介休', N'101100412');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'601', N'长治', N'101100501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'602', N'黎城', N'101100502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'603', N'屯留', N'101100503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'604', N'潞城', N'101100504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'605', N'襄垣', N'101100505');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'606', N'平顺', N'101100506');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'607', N'武乡', N'101100507');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'608', N'沁县', N'101100508');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'609', N'长子', N'101100509');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'610', N'沁源', N'101100510');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'611', N'壶关', N'101100511');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'612', N'晋城', N'101100601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'613', N'沁水', N'101100602');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'614', N'阳城', N'101100603');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'615', N'陵川', N'101100604');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'616', N'高平', N'101100605');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'617', N'临汾', N'101100701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'618', N'曲沃', N'101100702');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'619', N'永和', N'101100703');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'620', N'隰县', N'101100704');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'621', N'大宁', N'101100705');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'622', N'吉县', N'101100706');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'623', N'襄汾', N'101100707');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'624', N'蒲县', N'101100708');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'625', N'汾西', N'101100709');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'626', N'洪洞', N'101100710');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'627', N'霍州', N'101100711');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'628', N'乡宁', N'101100712');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'629', N'翼城', N'101100713');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'630', N'侯马', N'101100714');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'631', N'浮山', N'101100715');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'632', N'安泽', N'101100716');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'633', N'古县', N'101100717');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'634', N'运城', N'101100801');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'635', N'临猗', N'101100802');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'636', N'稷山', N'101100803');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'637', N'万荣', N'101100804');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'638', N'河津', N'101100805');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'639', N'新绛', N'101100806');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'640', N'绛县', N'101100807');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'641', N'闻喜', N'101100808');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'642', N'垣曲', N'101100809');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'643', N'永济', N'101100810');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'644', N'芮城', N'101100811');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'645', N'夏县', N'101100812');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'646', N'平陆', N'101100813');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'647', N'朔州', N'101100901');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'648', N'平鲁', N'101100902');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'649', N'山阴', N'101100903');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'650', N'右玉', N'101100904');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'651', N'应县', N'101100905');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'652', N'怀仁', N'101100906');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'653', N'忻州', N'101101001');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'654', N'定襄', N'101101002');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'655', N'五台县豆村', N'101101003');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'656', N'河曲', N'101101004');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'657', N'偏关', N'101101005');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'658', N'神池', N'101101006');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'659', N'宁武', N'101101007');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'660', N'代县', N'101101008');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'661', N'繁峙', N'101101009');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'662', N'五台山', N'101101010');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'663', N'保德', N'101101011');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'664', N'静乐', N'101101012');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'665', N'岢岚', N'101101013');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'666', N'五寨', N'101101014');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'667', N'原平', N'101101015');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'668', N'吕梁', N'101101100');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'669', N'离石', N'101101101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'670', N'临县', N'101101102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'671', N'兴县', N'101101103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'672', N'岚县', N'101101104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'673', N'柳林', N'101101105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'674', N'石楼', N'101101106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'675', N'方山', N'101101107');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'676', N'交口', N'101101108');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'677', N'中阳', N'101101109');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'678', N'孝义', N'101101110');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'679', N'汾阳', N'101101111');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'680', N'文水', N'101101112');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'681', N'交城', N'101101113');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'682', N'西安', N'101110101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'683', N'长安', N'101110102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'684', N'临潼', N'101110103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'685', N'蓝田', N'101110104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'686', N'周至', N'101110105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'687', N'户县', N'101110106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'688', N'高陵', N'101110107');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'689', N'杨凌', N'101110108');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'690', N'咸阳', N'101110200');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'691', N'三原', N'101110201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'692', N'礼泉', N'101110202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'693', N'永寿', N'101110203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'694', N'淳化', N'101110204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'695', N'泾阳', N'101110205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'696', N'武功', N'101110206');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'697', N'乾县', N'101110207');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'698', N'彬县', N'101110208');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'699', N'长武', N'101110209');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'700', N'旬邑', N'101110210');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'701', N'兴平', N'101110211');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'702', N'延安', N'101110300');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'703', N'延长', N'101110301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'704', N'延川', N'101110302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'705', N'子长', N'101110303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'706', N'宜川', N'101110304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'707', N'富县', N'101110305');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'708', N'志丹', N'101110306');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'709', N'安塞', N'101110307');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'710', N'甘泉', N'101110308');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'711', N'洛川', N'101110309');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'712', N'黄陵', N'101110310');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'713', N'黄龙', N'101110311');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'714', N'吴起', N'101110312');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'715', N'榆林', N'101110401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'716', N'府谷', N'101110402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'717', N'神木', N'101110403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'718', N'佳县', N'101110404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'719', N'定边', N'101110405');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'720', N'靖边', N'101110406');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'721', N'横山', N'101110407');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'722', N'米脂', N'101110408');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'723', N'子洲', N'101110409');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'724', N'绥德', N'101110410');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'725', N'吴堡', N'101110411');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'726', N'清涧', N'101110412');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'727', N'渭南', N'101110501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'728', N'华县', N'101110502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'729', N'潼关', N'101110503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'730', N'大荔', N'101110504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'731', N'白水', N'101110505');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'732', N'富平', N'101110506');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'733', N'蒲城', N'101110507');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'734', N'澄城', N'101110508');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'735', N'合阳', N'101110509');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'736', N'韩城', N'101110510');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'737', N'华阴', N'101110511');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'738', N'华山', N'101110512');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'739', N'商洛', N'101110601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'740', N'洛南', N'101110602');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'741', N'柞水', N'101110603');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'742', N'镇安', N'101110605');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'743', N'丹凤', N'101110606');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'744', N'商南', N'101110607');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'745', N'山阳', N'101110608');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'746', N'安康', N'101110701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'747', N'紫阳', N'101110702');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'748', N'石泉', N'101110703');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'749', N'汉阴', N'101110704');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'750', N'旬阳', N'101110705');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'751', N'岚皋', N'101110706');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'752', N'平利', N'101110707');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'753', N'白河', N'101110708');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'754', N'镇坪', N'101110709');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'755', N'宁陕', N'101110710');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'756', N'汉中', N'101110801');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'757', N'略阳', N'101110802');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'758', N'勉县', N'101110803');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'759', N'留坝', N'101110804');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'760', N'洋县', N'101110805');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'761', N'城固', N'101110806');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'762', N'西乡', N'101110807');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'763', N'佛坪', N'101110808');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'764', N'宁强', N'101110809');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'765', N'南郑', N'101110810');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'766', N'镇巴', N'101110811');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'767', N'宝鸡', N'101110901');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'768', N'宝鸡县', N'101110902');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'769', N'千阳', N'101110903');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'770', N'麟游', N'101110904');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'771', N'岐山', N'101110905');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'772', N'凤翔', N'101110906');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'773', N'扶风', N'101110907');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'774', N'眉县', N'101110908');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'775', N'太白', N'101110909');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'776', N'凤县', N'101110910');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'777', N'陇县', N'101110911');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'778', N'铜川', N'101111001');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'779', N'耀县', N'101111002');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'780', N'宜君', N'101111003');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'781', N'济南', N'101120101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'782', N'长清', N'101120102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'783', N'商河', N'101120103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'784', N'章丘', N'101120104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'785', N'平阴', N'101120105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'786', N'济阳', N'101120106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'787', N'青岛', N'101120201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'788', N'崂山', N'101120202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'789', N'潮连岛', N'101120203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'790', N'即墨', N'101120204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'791', N'胶州', N'101120205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'792', N'胶南', N'101120206');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'793', N'莱西', N'101120207');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'794', N'平度', N'101120208');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'795', N'淄博', N'101120301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'796', N'淄川', N'101120302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'797', N'博山', N'101120303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'798', N'高青', N'101120304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'799', N'周村', N'101120305');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'800', N'沂源', N'101120306');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'801', N'桓台', N'101120307');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'802', N'临淄', N'101120308');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'803', N'德州', N'101120401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'804', N'武城', N'101120402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'805', N'临邑', N'101120403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'806', N'陵县', N'101120404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'807', N'齐河', N'101120405');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'808', N'乐陵', N'101120406');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'809', N'庆云', N'101120407');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'810', N'平原', N'101120408');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'811', N'宁津', N'101120409');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'812', N'夏津', N'101120410');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'813', N'禹城', N'101120411');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'814', N'烟台', N'101120501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'815', N'莱州', N'101120502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'816', N'长岛', N'101120503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'817', N'蓬莱', N'101120504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'818', N'龙口', N'101120505');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'819', N'招远', N'101120506');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'820', N'栖霞', N'101120507');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'821', N'福山', N'101120508');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'822', N'牟平', N'101120509');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'823', N'莱阳', N'101120510');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'824', N'海阳', N'101120511');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'825', N'千里岩', N'101120512');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'826', N'潍坊', N'101120601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'827', N'青州', N'101120602');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'828', N'寿光', N'101120603');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'829', N'临朐', N'101120604');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'830', N'昌乐', N'101120605');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'831', N'昌邑', N'101120606');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'832', N'安丘', N'101120607');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'833', N'高密', N'101120608');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'834', N'诸城', N'101120609');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'835', N'济宁', N'101120701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'836', N'嘉祥', N'101120702');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'837', N'微山', N'101120703');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'838', N'鱼台', N'101120704');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'839', N'兖州', N'101120705');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'840', N'金乡', N'101120706');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'841', N'汶上', N'101120707');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'842', N'泗水', N'101120708');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'843', N'梁山', N'101120709');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'844', N'曲阜', N'101120710');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'845', N'邹城', N'101120711');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'846', N'泰安', N'101120801');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'847', N'新泰', N'101120802');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'848', N'泰山', N'101120803');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'849', N'肥城', N'101120804');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'850', N'东平', N'101120805');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'851', N'宁阳', N'101120806');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'852', N'临沂', N'101120901');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'853', N'莒南', N'101120902');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'854', N'沂南', N'101120903');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'855', N'苍山', N'101120904');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'856', N'临沭', N'101120905');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'857', N'郯城', N'101120906');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'858', N'蒙阴', N'101120907');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'859', N'平邑', N'101120908');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'860', N'费县', N'101120909');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'861', N'沂水', N'101120910');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'862', N'马站', N'101120911');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'863', N'菏泽', N'101121001');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'864', N'鄄城', N'101121002');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'865', N'郓城', N'101121003');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'866', N'东明', N'101121004');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'867', N'定陶', N'101121005');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'868', N'巨野', N'101121006');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'869', N'曹县', N'101121007');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'870', N'成武', N'101121008');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'871', N'单县', N'101121009');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'872', N'滨州', N'101121101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'873', N'博兴', N'101121102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'874', N'无棣', N'101121103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'875', N'阳信', N'101121104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'876', N'惠民', N'101121105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'877', N'沾化', N'101121106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'878', N'邹平', N'101121107');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'879', N'东营', N'101121201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'880', N'河口', N'101121202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'881', N'垦利', N'101121203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'882', N'利津', N'101121204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'883', N'广饶', N'101121205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'884', N'威海', N'101121301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'885', N'文登', N'101121302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'886', N'荣成', N'101121303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'887', N'乳山', N'101121304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'888', N'成山头', N'101121305');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'889', N'石岛', N'101121306');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'890', N'枣庄', N'101121401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'891', N'薛城', N'101121402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'892', N'峄城', N'101121403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'893', N'台儿庄', N'101121404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'894', N'滕州', N'101121405');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'895', N'日照', N'101121501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'896', N'五莲', N'101121502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'897', N'莒县', N'101121503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'898', N'莱芜', N'101121601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'899', N'聊城', N'101121701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'900', N'冠县', N'101121702');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'901', N'阳谷', N'101121703');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'902', N'高唐', N'101121704');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'903', N'茌平', N'101121705');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'904', N'东阿', N'101121706');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'905', N'临清', N'101121707');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'906', N'朝城', N'101121708');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'907', N'莘县', N'101121709');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'908', N'乌鲁木齐', N'101130101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'909', N'蔡家湖', N'101130102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'910', N'小渠子', N'101130103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'911', N'巴仑台', N'101130104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'912', N'达坂城', N'101130105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'913', N'十三间房气象站', N'101130106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'914', N'天山大西沟', N'101130107');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'915', N'乌鲁木齐牧试站', N'101130108');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'916', N'天池', N'101130109');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'917', N'白杨沟', N'101130110');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'918', N'克拉玛依', N'101130201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'919', N'石河子', N'101130301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'920', N'炮台', N'101130302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'921', N'莫索湾', N'101130303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'922', N'乌兰乌苏', N'101130304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'923', N'昌吉', N'101130401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'924', N'呼图壁', N'101130402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'925', N'米泉', N'101130403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'926', N'阜康', N'101130404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'927', N'吉木萨尔', N'101130405');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'928', N'奇台', N'101130406');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'929', N'玛纳斯', N'101130407');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'930', N'木垒', N'101130408');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'931', N'北塔山', N'101130409');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'932', N'吐鲁番', N'101130501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'933', N'托克逊', N'101130502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'934', N'吐鲁番东坎', N'101130503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'935', N'鄯善', N'101130504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'936', N'红柳河', N'101130505');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'937', N'库尔勒', N'101130601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'938', N'轮台', N'101130602');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'939', N'尉犁', N'101130603');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'940', N'若羌', N'101130604');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'941', N'且末', N'101130605');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'942', N'和静', N'101130606');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'943', N'焉耆', N'101130607');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'944', N'和硕', N'101130608');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'945', N'库米什', N'101130609');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'946', N'巴音布鲁克', N'101130610');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'947', N'铁干里克', N'101130611');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'948', N'博湖', N'101130612');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'949', N'塔中', N'101130613');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'950', N'阿拉尔', N'101130701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'951', N'阿克苏', N'101130801');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'952', N'乌什', N'101130802');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'953', N'温宿', N'101130803');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'954', N'拜城', N'101130804');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'955', N'新和', N'101130805');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'956', N'沙雅', N'101130806');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'957', N'库车', N'101130807');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'958', N'柯坪', N'101130808');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'959', N'阿瓦提', N'101130809');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'960', N'喀什', N'101130901');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'961', N'英吉沙', N'101130902');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'962', N'塔什库尔干', N'101130903');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'963', N'麦盖提', N'101130904');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'964', N'莎车', N'101130905');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'965', N'叶城', N'101130906');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'966', N'泽普', N'101130907');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'967', N'巴楚', N'101130908');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'968', N'岳普湖', N'101130909');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'969', N'伽师', N'101130910');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'970', N'伊宁', N'101131001');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'971', N'察布查尔', N'101131002');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'972', N'尼勒克', N'101131003');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'973', N'伊宁县', N'101131004');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'974', N'巩留', N'101131005');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'975', N'新源', N'101131006');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'976', N'昭苏', N'101131007');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'977', N'特克斯', N'101131008');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'978', N'霍城', N'101131009');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'979', N'霍尔果斯', N'101131010');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'980', N'塔城', N'101131101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'981', N'裕民', N'101131102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'982', N'额敏', N'101131103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'983', N'和布克赛尔', N'101131104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'984', N'托里', N'101131105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'985', N'乌苏', N'101131106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'986', N'沙湾', N'101131107');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'987', N'和丰', N'101131108');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'988', N'哈密', N'101131201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'989', N'沁城', N'101131202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'990', N'巴里坤', N'101131203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'991', N'伊吾', N'101131204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'992', N'淖毛湖', N'101131205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'993', N'和田', N'101131301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'994', N'皮山', N'101131302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'995', N'策勒', N'101131303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'996', N'墨玉', N'101131304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'997', N'洛浦', N'101131305');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'998', N'民丰', N'101131306');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'999', N'于田', N'101131307');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1000', N'阿勒泰', N'101131401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1001', N'哈巴河', N'101131402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1002', N'一八五团', N'101131403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1003', N'黑山头', N'101131404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1004', N'吉木乃', N'101131405');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1005', N'布尔津', N'101131406');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1006', N'福海', N'101131407');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1007', N'富蕴', N'101131408');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1008', N'青河', N'101131409');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1009', N'安德河', N'101131410');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1010', N'阿图什', N'101131501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1011', N'乌恰', N'101131502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1012', N'阿克陶', N'101131503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1013', N'阿合奇', N'101131504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1014', N'吐尔尕特', N'101131505');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1015', N'博乐', N'101131601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1016', N'温泉', N'101131602');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1017', N'精河', N'101131603');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1018', N'阿拉山口', N'101131606');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1019', N'拉萨', N'101140101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1020', N'当雄', N'101140102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1021', N'尼木', N'101140103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1022', N'墨竹贡卡', N'101140104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1023', N'日喀则', N'101140201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1024', N'拉孜', N'101140202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1025', N'南木林', N'101140203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1026', N'聂拉木', N'101140204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1027', N'定日', N'101140205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1028', N'江孜', N'101140206');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1029', N'帕里', N'101140207');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1030', N'山南', N'101140301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1031', N'贡嘎', N'101140302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1032', N'琼结', N'101140303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1033', N'加查', N'101140304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1034', N'浪卡子', N'101140305');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1035', N'错那', N'101140306');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1036', N'隆子', N'101140307');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1037', N'泽当', N'101140308');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1038', N'林芝', N'101140401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1039', N'波密', N'101140402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1040', N'米林', N'101140403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1041', N'察隅', N'101140404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1042', N'昌都', N'101140501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1043', N'丁青', N'101140502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1044', N'类乌齐', N'101140503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1045', N'洛隆', N'101140504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1046', N'左贡', N'101140505');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1047', N'芒康', N'101140506');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1048', N'八宿', N'101140507');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1049', N'那曲', N'101140601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1050', N'嘉黎', N'101140603');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1051', N'班戈', N'101140604');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1052', N'安多', N'101140605');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1053', N'索县', N'101140606');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1054', N'比如', N'101140607');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1055', N'阿里', N'101140701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1056', N'改则', N'101140702');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1057', N'申扎', N'101140703');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1058', N'狮泉河', N'101140704');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1059', N'普兰', N'101140705');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1060', N'西宁', N'101150101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1061', N'大通', N'101150102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1062', N'湟源', N'101150103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1063', N'湟中', N'101150104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1064', N'铁卜加', N'101150105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1065', N'铁卜加寺', N'101150106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1066', N'中心站', N'101150107');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1067', N'海东', N'101150201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1068', N'乐都', N'101150202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1069', N'民和', N'101150203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1070', N'互助', N'101150204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1071', N'化隆', N'101150205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1072', N'循化', N'101150206');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1073', N'冷湖', N'101150207');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1074', N'平安', N'101150208');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1075', N'黄南', N'101150301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1076', N'尖扎', N'101150302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1077', N'泽库', N'101150303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1078', N'河南', N'101150304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1079', N'海南', N'101150401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1080', N'江西沟', N'101150402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1081', N'贵德', N'101150404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1082', N'河卡', N'101150405');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1083', N'兴海', N'101150406');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1084', N'贵南', N'101150407');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1085', N'同德', N'101150408');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1086', N'共和', N'101150409');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1087', N'果洛', N'101150501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1088', N'班玛', N'101150502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1089', N'甘德', N'101150503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1090', N'达日', N'101150504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1091', N'久治', N'101150505');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1092', N'玛多', N'101150506');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1093', N'清水河', N'101150507');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1094', N'玛沁', N'101150508');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1095', N'玉树', N'101150601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1096', N'托托河', N'101150602');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1097', N'治多', N'101150603');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1098', N'杂多', N'101150604');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1099', N'囊谦', N'101150605');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1100', N'曲麻莱', N'101150606');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1101', N'海西', N'101150701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1102', N'格尔木', N'101150702');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1103', N'察尔汉', N'101150703');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1104', N'野牛沟', N'101150704');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1105', N'五道梁', N'101150705');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1106', N'小灶火', N'101150706');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1107', N'天峻', N'101150708');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1108', N'乌兰', N'101150709');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1109', N'都兰', N'101150710');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1110', N'诺木洪', N'101150711');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1111', N'茫崖', N'101150712');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1112', N'大柴旦', N'101150713');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1113', N'茶卡', N'101150714');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1114', N'香日德', N'101150715');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1115', N'德令哈', N'101150716');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1116', N'海北', N'101150801');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1117', N'门源', N'101150802');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1118', N'祁连', N'101150803');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1119', N'海晏', N'101150804');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1120', N'托勒', N'101150805');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1121', N'刚察', N'101150806');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1122', N'兰州', N'101160101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1123', N'皋兰', N'101160102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1124', N'永登', N'101160103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1125', N'榆中', N'101160104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1126', N'定西', N'101160201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1127', N'通渭', N'101160202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1128', N'陇西', N'101160203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1129', N'渭源', N'101160204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1130', N'临洮', N'101160205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1131', N'漳县', N'101160206');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1132', N'岷县', N'101160207');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1133', N'安定', N'101160208');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1134', N'平凉', N'101160301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1135', N'泾川', N'101160302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1136', N'灵台', N'101160303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1137', N'崇信', N'101160304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1138', N'华亭', N'101160305');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1139', N'庄浪', N'101160306');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1140', N'静宁', N'101160307');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1141', N'崆峒', N'101160308');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1142', N'庆阳', N'101160401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1143', N'西峰', N'101160402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1144', N'环县', N'101160403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1145', N'华池', N'101160404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1146', N'合水', N'101160405');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1147', N'正宁', N'101160406');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1148', N'宁县', N'101160407');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1149', N'镇原', N'101160408');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1150', N'庆城', N'101160409');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1151', N'武威', N'101160501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1152', N'民勤', N'101160502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1153', N'古浪', N'101160503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1154', N'乌鞘岭', N'101160504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1155', N'天祝', N'101160505');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1156', N'金昌', N'101160601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1157', N'永昌', N'101160602');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1158', N'张掖', N'101160701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1159', N'肃南', N'101160702');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1160', N'民乐', N'101160703');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1161', N'临泽', N'101160704');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1162', N'高台', N'101160705');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1163', N'山丹', N'101160706');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1164', N'酒泉', N'101160801');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1165', N'鼎新', N'101160802');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1166', N'金塔', N'101160803');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1167', N'马鬃山', N'101160804');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1168', N'瓜州', N'101160805');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1169', N'肃北', N'101160806');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1170', N'玉门镇', N'101160807');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1171', N'敦煌', N'101160808');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1172', N'天水', N'101160901');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1173', N'北道区', N'101160902');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1174', N'清水', N'101160903');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1175', N'秦安', N'101160904');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1176', N'甘谷', N'101160905');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1177', N'武山', N'101160906');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1178', N'张家川', N'101160907');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1179', N'麦积', N'101160908');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1180', N'武都', N'101161001');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1181', N'成县', N'101161002');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1182', N'文县', N'101161003');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1183', N'宕昌', N'101161004');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1184', N'康县', N'101161005');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1185', N'西和', N'101161006');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1186', N'礼县', N'101161007');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1187', N'徽县', N'101161008');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1188', N'两当', N'101161009');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1189', N'临夏', N'101161101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1190', N'康乐', N'101161102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1191', N'永靖', N'101161103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1192', N'广河', N'101161104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1193', N'和政', N'101161105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1194', N'东乡', N'101161106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1195', N'合作', N'101161201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1196', N'临潭', N'101161202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1197', N'卓尼', N'101161203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1198', N'舟曲', N'101161204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1199', N'迭部', N'101161205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1200', N'玛曲', N'101161206');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1201', N'碌曲', N'101161207');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1202', N'夏河', N'101161208');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1203', N'白银', N'101161301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1204', N'靖远', N'101161302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1205', N'会宁', N'101161303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1206', N'华家岭', N'101161304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1207', N'景泰', N'101161305');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1208', N'银川', N'101170101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1209', N'永宁', N'101170102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1210', N'灵武', N'101170103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1211', N'贺兰', N'101170104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1212', N'石嘴山', N'101170201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1213', N'惠农', N'101170202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1214', N'平罗', N'101170203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1215', N'陶乐', N'101170204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1216', N'石炭井', N'101170205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1217', N'大武口', N'101170206');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1218', N'吴忠', N'101170301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1219', N'同心', N'101170302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1220', N'盐池', N'101170303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1221', N'韦州', N'101170304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1222', N'麻黄山', N'101170305');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1223', N'青铜峡', N'101170306');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1224', N'固原', N'101170401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1225', N'西吉', N'101170402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1226', N'隆德', N'101170403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1227', N'泾源', N'101170404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1228', N'六盘山', N'101170405');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1229', N'彭阳', N'101170406');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1230', N'中卫', N'101170501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1231', N'中宁', N'101170502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1232', N'兴仁堡', N'101170503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1233', N'海原', N'101170504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1234', N'郑州', N'101180101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1235', N'巩义', N'101180102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1236', N'荥阳', N'101180103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1237', N'登封', N'101180104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1238', N'新密', N'101180105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1239', N'新郑', N'101180106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1240', N'中牟', N'101180107');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1241', N'郑州农试站', N'101180108');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1242', N'安阳', N'101180201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1243', N'汤阴', N'101180202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1244', N'滑县', N'101180203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1245', N'内黄', N'101180204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1246', N'林州', N'101180205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1247', N'新乡', N'101180301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1248', N'获嘉', N'101180302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1249', N'原阳', N'101180303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1250', N'辉县', N'101180304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1251', N'卫辉', N'101180305');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1252', N'延津', N'101180306');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1253', N'封丘', N'101180307');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1254', N'长垣', N'101180308');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1255', N'许昌', N'101180401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1256', N'鄢陵', N'101180402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1257', N'襄城', N'101180403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1258', N'长葛', N'101180404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1259', N'禹州', N'101180405');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1260', N'平顶山', N'101180501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1261', N'郏县', N'101180502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1262', N'宝丰', N'101180503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1263', N'汝州', N'101180504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1264', N'叶县', N'101180505');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1265', N'舞钢', N'101180506');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1266', N'鲁山', N'101180507');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1267', N'信阳', N'101180601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1268', N'息县', N'101180602');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1269', N'罗山', N'101180603');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1270', N'光山', N'101180604');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1271', N'新县', N'101180605');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1272', N'淮滨', N'101180606');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1273', N'潢川', N'101180607');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1274', N'固始', N'101180608');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1275', N'商城', N'101180609');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1276', N'鸡公山', N'101180610');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1277', N'信阳地区农试站', N'101180611');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1278', N'南阳', N'101180701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1279', N'南召', N'101180702');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1280', N'方城', N'101180703');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1281', N'社旗', N'101180704');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1282', N'西峡', N'101180705');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1283', N'内乡', N'101180706');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1284', N'镇平', N'101180707');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1285', N'淅川', N'101180708');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1286', N'新野', N'101180709');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1287', N'唐河', N'101180710');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1288', N'邓州', N'101180711');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1289', N'桐柏', N'101180712');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1290', N'开封', N'101180801');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1291', N'杞县', N'101180802');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1292', N'尉氏', N'101180803');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1293', N'通许', N'101180804');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1294', N'兰考', N'101180805');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1295', N'洛阳', N'101180901');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1296', N'新安', N'101180902');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1297', N'孟津', N'101180903');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1298', N'宜阳', N'101180904');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1299', N'洛宁', N'101180905');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1300', N'伊川', N'101180906');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1301', N'嵩县', N'101180907');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1302', N'偃师', N'101180908');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1303', N'栾川', N'101180909');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1304', N'汝阳', N'101180910');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1305', N'商丘', N'101181001');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1306', N'睢阳区', N'101181002');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1307', N'睢县', N'101181003');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1308', N'民权', N'101181004');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1309', N'虞城', N'101181005');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1310', N'柘城', N'101181006');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1311', N'宁陵', N'101181007');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1312', N'夏邑', N'101181008');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1313', N'永城', N'101181009');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1314', N'焦作', N'101181101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1315', N'修武', N'101181102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1316', N'武陟', N'101181103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1317', N'沁阳', N'101181104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1318', N'博爱', N'101181106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1319', N'温县', N'101181107');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1320', N'孟州', N'101181108');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1321', N'鹤壁', N'101181201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1322', N'浚县', N'101181202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1323', N'淇县', N'101181203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1324', N'濮阳', N'101181301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1325', N'台前', N'101181302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1326', N'南乐', N'101181303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1327', N'清丰', N'101181304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1328', N'范县', N'101181305');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1329', N'周口', N'101181401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1330', N'扶沟', N'101181402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1331', N'太康', N'101181403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1332', N'淮阳', N'101181404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1333', N'西华', N'101181405');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1334', N'商水', N'101181406');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1335', N'项城', N'101181407');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1336', N'郸城', N'101181408');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1337', N'鹿邑', N'101181409');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1338', N'沈丘', N'101181410');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1339', N'黄泛区', N'101181411');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1340', N'漯河', N'101181501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1341', N'临颍', N'101181502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1342', N'舞阳', N'101181503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1343', N'驻马店', N'101181601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1344', N'西平', N'101181602');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1345', N'遂平', N'101181603');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1346', N'上蔡', N'101181604');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1347', N'汝南', N'101181605');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1348', N'泌阳', N'101181606');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1349', N'平舆', N'101181607');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1350', N'新蔡', N'101181608');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1351', N'确山', N'101181609');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1352', N'正阳', N'101181610');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1353', N'三门峡', N'101181701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1354', N'灵宝', N'101181702');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1355', N'渑池', N'101181703');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1356', N'卢氏', N'101181704');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1357', N'济源', N'101181801');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1358', N'南京', N'101190101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1359', N'溧水', N'101190102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1360', N'高淳', N'101190103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1361', N'江宁', N'101190104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1362', N'六合', N'101190105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1363', N'江浦', N'101190106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1364', N'浦口', N'101190107');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1365', N'无锡', N'101190201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1366', N'江阴', N'101190202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1367', N'宜兴', N'101190203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1368', N'镇江', N'101190301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1369', N'丹阳', N'101190302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1370', N'扬中', N'101190303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1371', N'句容', N'101190304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1372', N'丹徒', N'101190305');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1373', N'苏州', N'101190401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1374', N'常熟', N'101190402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1375', N'张家港', N'101190403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1376', N'昆山', N'101190404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1377', N'吴县东山', N'101190405');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1378', N'吴县', N'101190406');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1379', N'吴江', N'101190407');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1380', N'太仓', N'101190408');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1381', N'南通', N'101190501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1382', N'海安', N'101190502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1383', N'如皋', N'101190503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1384', N'如东', N'101190504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1385', N'吕泗', N'101190505');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1386', N'吕泗渔场', N'101190506');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1387', N'启东', N'101190507');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1388', N'海门', N'101190508');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1389', N'通州', N'101190509');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1390', N'扬州', N'101190601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1391', N'宝应', N'101190602');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1392', N'仪征', N'101190603');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1393', N'高邮', N'101190604');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1394', N'江都', N'101190605');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1395', N'邗江', N'101190606');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1396', N'盐城', N'101190701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1397', N'响水', N'101190702');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1398', N'滨海', N'101190703');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1399', N'阜宁', N'101190704');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1400', N'射阳', N'101190705');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1401', N'建湖', N'101190706');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1402', N'东台', N'101190707');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1403', N'大丰', N'101190708');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1404', N'盐都', N'101190709');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1405', N'徐州', N'101190801');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1406', N'徐州农试站', N'101190802');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1407', N'丰县', N'101190803');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1408', N'沛县', N'101190804');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1409', N'邳州', N'101190805');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1410', N'睢宁', N'101190806');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1411', N'新沂', N'101190807');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1412', N'淮安', N'101190901');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1413', N'金湖', N'101190902');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1414', N'盱眙', N'101190903');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1415', N'洪泽', N'101190904');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1416', N'涟水', N'101190905');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1417', N'淮阴县', N'101190906');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1418', N'淮阴', N'101190907');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1419', N'楚州', N'101190908');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1420', N'连云港', N'101191001');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1421', N'东海', N'101191002');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1422', N'赣榆', N'101191003');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1423', N'灌云', N'101191004');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1424', N'灌南', N'101191005');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1425', N'西连岛', N'101191006');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1426', N'燕尾港', N'101191007');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1427', N'常州', N'101191101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1428', N'溧阳', N'101191102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1429', N'金坛', N'101191103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1430', N'泰州', N'101191201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1431', N'兴化', N'101191202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1432', N'泰兴', N'101191203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1433', N'姜堰', N'101191204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1434', N'靖江', N'101191205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1435', N'宿迁', N'101191301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1436', N'沭阳', N'101191302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1437', N'泗阳', N'101191303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1438', N'泗洪', N'101191304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1439', N'武汉', N'101200101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1440', N'蔡甸', N'101200102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1441', N'黄陂', N'101200103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1442', N'新洲', N'101200104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1443', N'江夏', N'101200105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1444', N'襄樊', N'101200201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1445', N'襄阳', N'101200202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1446', N'保康', N'101200203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1447', N'南漳', N'101200204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1448', N'宜城', N'101200205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1449', N'老河口', N'101200206');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1450', N'谷城', N'101200207');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1451', N'枣阳', N'101200208');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1452', N'鄂州', N'101200301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1453', N'孝感', N'101200401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1454', N'安陆', N'101200402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1455', N'云梦', N'101200403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1456', N'大悟', N'101200404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1457', N'应城', N'101200405');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1458', N'汉川', N'101200406');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1459', N'黄冈', N'101200501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1460', N'红安', N'101200502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1461', N'麻城', N'101200503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1462', N'罗田', N'101200504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1463', N'英山', N'101200505');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1464', N'浠水', N'101200506');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1465', N'蕲春', N'101200507');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1466', N'黄梅', N'101200508');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1467', N'武穴', N'101200509');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1468', N'黄石', N'101200601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1469', N'大冶', N'101200602');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1470', N'阳新', N'101200603');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1471', N'咸宁', N'101200701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1472', N'赤壁', N'101200702');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1473', N'嘉鱼', N'101200703');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1474', N'崇阳', N'101200704');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1475', N'通城', N'101200705');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1476', N'通山', N'101200706');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1477', N'荆州', N'101200801');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1478', N'江陵', N'101200802');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1479', N'公安', N'101200803');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1480', N'石首', N'101200804');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1481', N'监利', N'101200805');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1482', N'洪湖', N'101200806');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1483', N'松滋', N'101200807');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1484', N'宜昌', N'101200901');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1485', N'远安', N'101200902');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1486', N'秭归', N'101200903');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1487', N'兴山', N'101200904');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1488', N'宜昌县', N'101200905');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1489', N'五峰', N'101200906');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1490', N'当阳', N'101200907');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1491', N'长阳', N'101200908');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1492', N'宜都', N'101200909');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1493', N'枝江', N'101200910');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1494', N'三峡', N'101200911');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1495', N'夷陵', N'101200912');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1496', N'恩施', N'101201001');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1497', N'利川', N'101201002');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1498', N'建始', N'101201003');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1499', N'咸丰', N'101201004');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1500', N'宣恩', N'101201005');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1501', N'鹤峰', N'101201006');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1502', N'来凤', N'101201007');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1503', N'巴东', N'101201008');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1504', N'绿葱坡', N'101201009');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1505', N'十堰', N'101201101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1506', N'竹溪', N'101201102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1507', N'郧西', N'101201103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1508', N'郧县', N'101201104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1509', N'竹山', N'101201105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1510', N'房县', N'101201106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1511', N'丹江口', N'101201107');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1512', N'神农架', N'101201201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1513', N'随州', N'101201301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1514', N'广水', N'101201302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1515', N'荆门', N'101201401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1516', N'钟祥', N'101201402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1517', N'京山', N'101201403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1518', N'天门', N'101201501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1519', N'仙桃', N'101201601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1520', N'潜江', N'101201701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1521', N'杭州', N'101210101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1522', N'萧山', N'101210102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1523', N'桐庐', N'101210103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1524', N'淳安', N'101210104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1525', N'建德', N'101210105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1526', N'余杭', N'101210106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1527', N'临安', N'101210107');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1528', N'富阳', N'101210108');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1529', N'湖州', N'101210201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1530', N'长兴', N'101210202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1531', N'安吉', N'101210203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1532', N'德清', N'101210204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1533', N'嘉兴', N'101210301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1534', N'嘉善', N'101210302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1535', N'海宁', N'101210303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1536', N'桐乡', N'101210304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1537', N'平湖', N'101210305');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1538', N'海盐', N'101210306');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1539', N'宁波', N'101210401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1540', N'慈溪', N'101210403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1541', N'余姚', N'101210404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1542', N'奉化', N'101210405');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1543', N'象山', N'101210406');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1544', N'石浦', N'101210407');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1545', N'宁海', N'101210408');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1546', N'鄞县', N'101210409');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1547', N'北仑', N'101210410');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1548', N'鄞州', N'101210411');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1549', N'镇海', N'101210412');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1550', N'绍兴', N'101210501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1551', N'诸暨', N'101210502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1552', N'上虞', N'101210503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1553', N'新昌', N'101210504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1554', N'嵊州', N'101210505');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1555', N'台州', N'101210601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1556', N'括苍山', N'101210602');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1557', N'玉环', N'101210603');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1558', N'三门', N'101210604');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1559', N'天台', N'101210605');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1560', N'仙居', N'101210606');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1561', N'温岭', N'101210607');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1562', N'大陈', N'101210608');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1563', N'洪家', N'101210609');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1564', N'温州', N'101210701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1565', N'泰顺', N'101210702');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1566', N'文成', N'101210703');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1567', N'平阳', N'101210704');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1568', N'瑞安', N'101210705');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1569', N'洞头', N'101210706');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1570', N'乐清', N'101210707');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1571', N'永嘉', N'101210708');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1572', N'苍南', N'101210709');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1573', N'丽水', N'101210801');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1574', N'遂昌', N'101210802');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1575', N'龙泉', N'101210803');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1576', N'缙云', N'101210804');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1577', N'青田', N'101210805');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1578', N'云和', N'101210806');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1579', N'庆元', N'101210807');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1580', N'金华', N'101210901');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1581', N'浦江', N'101210902');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1582', N'兰溪', N'101210903');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1583', N'义乌', N'101210904');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1584', N'东阳', N'101210905');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1585', N'武义', N'101210906');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1586', N'永康', N'101210907');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1587', N'磐安', N'101210908');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1588', N'衢州', N'101211001');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1589', N'常山', N'101211002');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1590', N'开化', N'101211003');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1591', N'龙游', N'101211004');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1592', N'江山', N'101211005');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1593', N'舟山', N'101211101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1594', N'嵊泗', N'101211102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1595', N'嵊山', N'101211103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1596', N'岱山', N'101211104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1597', N'普陀', N'101211105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1598', N'定海', N'101211106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1599', N'合肥', N'101220101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1600', N'长丰', N'101220102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1601', N'肥东', N'101220103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1602', N'肥西', N'101220104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1603', N'蚌埠', N'101220201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1604', N'怀远', N'101220202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1605', N'固镇', N'101220203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1606', N'五河', N'101220204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1607', N'芜湖', N'101220301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1608', N'繁昌', N'101220302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1609', N'芜湖县', N'101220303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1610', N'南陵', N'101220304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1611', N'淮南', N'101220401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1612', N'凤台', N'101220402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1613', N'马鞍山', N'101220501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1614', N'当涂', N'101220502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1615', N'安庆', N'101220601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1616', N'枞阳', N'101220602');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1617', N'太湖', N'101220603');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1618', N'潜山', N'101220604');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1619', N'怀宁', N'101220605');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1620', N'宿松', N'101220606');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1621', N'望江', N'101220607');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1622', N'岳西', N'101220608');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1623', N'桐城', N'101220609');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1624', N'宿州', N'101220701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1625', N'砀山', N'101220702');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1626', N'灵璧', N'101220703');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1627', N'泗县', N'101220704');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1628', N'萧县', N'101220705');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1629', N'阜阳', N'101220801');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1630', N'阜南', N'101220802');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1631', N'颍上', N'101220803');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1632', N'临泉', N'101220804');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1633', N'界首', N'101220805');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1634', N'太和', N'101220806');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1635', N'亳州', N'101220901');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1636', N'涡阳', N'101220902');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1637', N'利辛', N'101220903');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1638', N'蒙城', N'101220904');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1639', N'黄山站', N'101221001');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1640', N'黄山区', N'101221002');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1641', N'屯溪', N'101221003');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1642', N'祁门', N'101221004');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1643', N'黟县', N'101221005');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1644', N'歙县', N'101221006');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1645', N'休宁', N'101221007');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1646', N'黄山市', N'101221008');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1647', N'滁州', N'101221101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1648', N'凤阳', N'101221102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1649', N'明光', N'101221103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1650', N'定远', N'101221104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1651', N'全椒', N'101221105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1652', N'来安', N'101221106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1653', N'天长', N'101221107');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1654', N'淮北', N'101221201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1655', N'濉溪', N'101221202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1656', N'铜陵', N'101221301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1657', N'宣城', N'101221401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1658', N'泾县', N'101221402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1659', N'旌德', N'101221403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1660', N'宁国', N'101221404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1661', N'绩溪', N'101221405');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1662', N'广德', N'101221406');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1663', N'郎溪', N'101221407');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1664', N'六安', N'101221501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1665', N'霍邱', N'101221502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1666', N'寿县', N'101221503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1667', N'南溪', N'101221504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1668', N'金寨', N'101221505');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1669', N'霍山', N'101221506');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1670', N'舒城', N'101221507');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1671', N'巢湖', N'101221601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1672', N'庐江', N'101221602');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1673', N'无为', N'101221603');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1674', N'含山', N'101221604');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1675', N'和县', N'101221605');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1676', N'池州', N'101221701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1677', N'东至', N'101221702');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1678', N'青阳', N'101221703');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1679', N'九华山', N'101221704');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1680', N'石台', N'101221705');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1681', N'福州', N'101230101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1682', N'闽清', N'101230102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1683', N'闽侯', N'101230103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1684', N'罗源', N'101230104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1685', N'连江', N'101230105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1686', N'马祖', N'101230106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1687', N'永泰', N'101230107');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1688', N'平潭', N'101230108');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1689', N'福州郊区', N'101230109');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1690', N'长乐', N'101230110');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1691', N'福清', N'101230111');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1692', N'平潭海峡大桥', N'101230112');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1693', N'厦门', N'101230201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1694', N'同安', N'101230202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1695', N'宁德', N'101230301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1696', N'古田', N'101230302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1697', N'霞浦', N'101230303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1698', N'寿宁', N'101230304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1699', N'周宁', N'101230305');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1700', N'福安', N'101230306');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1701', N'柘荣', N'101230307');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1702', N'福鼎', N'101230308');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1703', N'屏南', N'101230309');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1704', N'莆田', N'101230401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1705', N'仙游', N'101230402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1706', N'秀屿港', N'101230403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1707', N'泉州', N'101230501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1708', N'安溪', N'101230502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1709', N'九仙山', N'101230503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1710', N'永春', N'101230504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1711', N'德化', N'101230505');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1712', N'南安', N'101230506');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1713', N'崇武', N'101230507');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1714', N'金山', N'101230508');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1715', N'晋江', N'101230509');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1716', N'漳州', N'101230601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1717', N'长泰', N'101230602');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1718', N'南靖', N'101230603');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1719', N'平和', N'101230604');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1720', N'龙海', N'101230605');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1721', N'漳浦', N'101230606');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1722', N'诏安', N'101230607');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1723', N'东山', N'101230608');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1724', N'云霄', N'101230609');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1725', N'华安', N'101230610');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1726', N'龙岩', N'101230701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1727', N'长汀', N'101230702');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1728', N'连城', N'101230703');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1729', N'武平', N'101230704');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1730', N'上杭', N'101230705');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1731', N'永定', N'101230706');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1732', N'漳平', N'101230707');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1733', N'三明', N'101230801');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1734', N'宁化', N'101230802');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1735', N'清流', N'101230803');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1736', N'泰宁', N'101230804');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1737', N'将乐', N'101230805');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1738', N'建宁', N'101230806');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1739', N'明溪', N'101230807');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1740', N'沙县', N'101230808');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1741', N'尤溪', N'101230809');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1742', N'永安', N'101230810');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1743', N'大田', N'101230811');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1744', N'南平', N'101230901');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1745', N'顺昌', N'101230902');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1746', N'光泽', N'101230903');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1747', N'邵武', N'101230904');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1748', N'武夷山', N'101230905');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1749', N'浦城', N'101230906');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1750', N'建阳', N'101230907');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1751', N'松溪', N'101230908');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1752', N'政和', N'101230909');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1753', N'建瓯', N'101230910');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1754', N'南昌', N'101240101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1755', N'新建', N'101240102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1756', N'南昌县', N'101240103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1757', N'安义', N'101240104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1758', N'进贤', N'101240105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1759', N'莲塘', N'101240106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1760', N'九江', N'101240201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1761', N'瑞昌', N'101240202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1762', N'庐山', N'101240203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1763', N'武宁', N'101240204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1764', N'德安', N'101240205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1765', N'永修', N'101240206');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1766', N'湖口', N'101240207');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1767', N'彭泽', N'101240208');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1768', N'星子', N'101240209');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1769', N'都昌', N'101240210');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1770', N'棠荫', N'101240211');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1771', N'修水', N'101240212');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1772', N'上饶', N'101240301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1773', N'鄱阳', N'101240302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1774', N'婺源', N'101240303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1775', N'康山', N'101240304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1776', N'余干', N'101240305');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1777', N'万年', N'101240306');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1778', N'德兴', N'101240307');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1779', N'上饶县', N'101240308');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1780', N'弋阳', N'101240309');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1781', N'横峰', N'101240310');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1782', N'铅山', N'101240311');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1783', N'玉山', N'101240312');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1784', N'广丰', N'101240313');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1785', N'波阳', N'101240314');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1786', N'抚州', N'101240401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1787', N'广昌', N'101240402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1788', N'乐安', N'101240403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1789', N'崇仁', N'101240404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1790', N'金溪', N'101240405');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1791', N'资溪', N'101240406');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1792', N'宜黄', N'101240407');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1793', N'南城', N'101240408');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1794', N'南丰', N'101240409');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1795', N'黎川', N'101240410');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1796', N'东乡', N'101240411');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1797', N'宜春', N'101240501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1798', N'铜鼓', N'101240502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1799', N'宜丰', N'101240503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1800', N'万载', N'101240504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1801', N'上高', N'101240505');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1802', N'靖安', N'101240506');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1803', N'奉新', N'101240507');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1804', N'高安', N'101240508');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1805', N'樟树', N'101240509');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1806', N'丰城', N'101240510');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1807', N'吉安', N'101240601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1808', N'吉安县', N'101240602');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1809', N'吉水', N'101240603');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1810', N'新干', N'101240604');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1811', N'峡江', N'101240605');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1812', N'永丰', N'101240606');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1813', N'永新', N'101240607');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1814', N'井冈山', N'101240608');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1815', N'万安', N'101240609');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1816', N'遂川', N'101240610');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1817', N'泰和', N'101240611');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1818', N'安福', N'101240612');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1819', N'宁冈', N'101240613');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1820', N'赣州', N'101240701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1821', N'崇义', N'101240702');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1822', N'上犹', N'101240703');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1823', N'南康', N'101240704');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1824', N'大余', N'101240705');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1825', N'信丰', N'101240706');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1826', N'宁都', N'101240707');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1827', N'石城', N'101240708');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1828', N'瑞金', N'101240709');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1829', N'于都', N'101240710');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1830', N'会昌', N'101240711');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1831', N'安远', N'101240712');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1832', N'全南', N'101240713');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1833', N'龙南', N'101240714');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1834', N'定南', N'101240715');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1835', N'寻乌', N'101240716');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1836', N'兴国', N'101240717');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1837', N'景德镇', N'101240801');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1838', N'乐平', N'101240802');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1839', N'萍乡', N'101240901');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1840', N'莲花', N'101240902');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1841', N'新余', N'101241001');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1842', N'分宜', N'101241002');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1843', N'鹰潭', N'101241101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1844', N'余江', N'101241102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1845', N'贵溪', N'101241103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1846', N'长沙', N'101250101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1847', N'宁乡', N'101250102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1848', N'浏阳', N'101250103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1849', N'马坡岭', N'101250104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1850', N'湘潭', N'101250201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1851', N'韶山', N'101250202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1852', N'湘乡', N'101250203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1853', N'株洲', N'101250301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1854', N'攸县', N'101250302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1855', N'醴陵', N'101250303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1856', N'株洲县', N'101250304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1857', N'茶陵', N'101250305');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1858', N'炎陵', N'101250306');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1859', N'衡阳', N'101250401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1860', N'衡山', N'101250402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1861', N'衡东', N'101250403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1862', N'祁东', N'101250404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1863', N'衡阳县', N'101250405');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1864', N'常宁', N'101250406');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1865', N'衡南', N'101250407');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1866', N'耒阳', N'101250408');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1867', N'南岳', N'101250409');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1868', N'郴州', N'101250501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1869', N'桂阳', N'101250502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1870', N'嘉禾', N'101250503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1871', N'宜章', N'101250504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1872', N'临武', N'101250505');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1873', N'桥口', N'101250506');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1874', N'资兴', N'101250507');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1875', N'汝城', N'101250508');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1876', N'安仁', N'101250509');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1877', N'永兴', N'101250510');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1878', N'桂东', N'101250511');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1879', N'常德', N'101250601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1880', N'安乡', N'101250602');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1881', N'桃源', N'101250603');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1882', N'汉寿', N'101250604');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1883', N'澧县', N'101250605');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1884', N'临澧', N'101250606');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1885', N'石门', N'101250607');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1886', N'益阳', N'101250700');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1887', N'赫山区', N'101250701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1888', N'南县', N'101250702');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1889', N'桃江', N'101250703');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1890', N'安化', N'101250704');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1891', N'沅江', N'101250705');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1892', N'娄底', N'101250801');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1893', N'双峰', N'101250802');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1894', N'冷水江', N'101250803');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1895', N'冷水滩', N'101250804');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1896', N'新化', N'101250805');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1897', N'涟源', N'101250806');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1898', N'邵阳', N'101250901');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1899', N'隆回', N'101250902');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1900', N'洞口', N'101250903');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1901', N'新邵', N'101250904');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1902', N'邵东', N'101250905');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1903', N'绥宁', N'101250906');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1904', N'新宁', N'101250907');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1905', N'武冈', N'101250908');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1906', N'城步', N'101250909');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1907', N'邵阳县', N'101250910');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1908', N'岳阳', N'101251001');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1909', N'华容', N'101251002');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1910', N'湘阴', N'101251003');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1911', N'汨罗', N'101251004');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1912', N'平江', N'101251005');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1913', N'临湘', N'101251006');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1914', N'张家界', N'101251101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1915', N'桑植', N'101251102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1916', N'慈利', N'101251103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1917', N'怀化', N'101251201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1918', N'鹤城区', N'101251202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1919', N'沅陵', N'101251203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1920', N'辰溪', N'101251204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1921', N'靖州', N'101251205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1922', N'会同', N'101251206');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1923', N'通道', N'101251207');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1924', N'麻阳', N'101251208');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1925', N'新晃', N'101251209');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1926', N'芷江', N'101251210');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1927', N'溆浦', N'101251211');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1928', N'黔阳', N'101251301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1929', N'洪江', N'101251302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1930', N'永州', N'101251401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1931', N'祁阳', N'101251402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1932', N'东安', N'101251403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1933', N'双牌', N'101251404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1934', N'道县', N'101251405');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1935', N'宁远', N'101251406');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1936', N'江永', N'101251407');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1937', N'蓝山', N'101251408');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1938', N'新田', N'101251409');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1939', N'江华', N'101251410');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1940', N'吉首', N'101251501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1941', N'保靖', N'101251502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1942', N'永顺', N'101251503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1943', N'古丈', N'101251504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1944', N'凤凰', N'101251505');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1945', N'泸溪', N'101251506');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1946', N'龙山', N'101251507');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1947', N'花垣', N'101251508');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1948', N'贵阳', N'101260101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1949', N'白云', N'101260102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1950', N'花溪', N'101260103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1951', N'乌当', N'101260104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1952', N'息烽', N'101260105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1953', N'开阳', N'101260106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1954', N'修文', N'101260107');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1955', N'清镇', N'101260108');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1956', N'遵义', N'101260201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1957', N'遵义县', N'101260202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1958', N'仁怀', N'101260203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1959', N'绥阳', N'101260204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1960', N'湄潭', N'101260205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1961', N'凤冈', N'101260206');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1962', N'桐梓', N'101260207');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1963', N'赤水', N'101260208');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1964', N'习水', N'101260209');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1965', N'道真', N'101260210');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1966', N'正安', N'101260211');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1967', N'务川', N'101260212');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1968', N'余庆', N'101260213');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1969', N'汇川', N'101260214');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1970', N'安顺', N'101260301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1971', N'普定', N'101260302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1972', N'镇宁', N'101260303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1973', N'平坝', N'101260304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1974', N'紫云', N'101260305');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1975', N'关岭', N'101260306');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1976', N'都匀', N'101260401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1977', N'贵定', N'101260402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1978', N'瓮安', N'101260403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1979', N'长顺', N'101260404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1980', N'福泉', N'101260405');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1981', N'惠水', N'101260406');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1982', N'龙里', N'101260407');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1983', N'罗甸', N'101260408');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1984', N'平塘', N'101260409');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1985', N'独山', N'101260410');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1986', N'三都', N'101260411');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1987', N'荔波', N'101260412');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1988', N'凯里', N'101260501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1989', N'岑巩', N'101260502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1990', N'施秉', N'101260503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1991', N'镇远', N'101260504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1992', N'黄平', N'101260505');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1993', N'黄平旧洲', N'101260506');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1994', N'麻江', N'101260507');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1995', N'丹寨', N'101260508');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1996', N'三穗', N'101260509');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1997', N'台江', N'101260510');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1998', N'剑河', N'101260511');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'1999', N'雷山', N'101260512');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2000', N'黎平', N'101260513');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2001', N'天柱', N'101260514');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2002', N'锦屏', N'101260515');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2003', N'榕江', N'101260516');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2004', N'从江', N'101260517');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2005', N'炉山', N'101260518');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2006', N'铜仁', N'101260601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2007', N'江口', N'101260602');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2008', N'玉屏', N'101260603');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2009', N'万山', N'101260604');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2010', N'思南', N'101260605');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2011', N'塘头', N'101260606');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2012', N'印江', N'101260607');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2013', N'石阡', N'101260608');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2014', N'沿河', N'101260609');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2015', N'德江', N'101260610');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2016', N'松桃', N'101260611');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2017', N'毕节', N'101260701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2018', N'赫章', N'101260702');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2019', N'金沙', N'101260703');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2020', N'威宁', N'101260704');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2021', N'大方', N'101260705');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2022', N'纳雍', N'101260706');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2023', N'织金', N'101260707');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2024', N'六盘水', N'101260801');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2025', N'六枝', N'101260802');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2026', N'水城', N'101260803');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2027', N'盘县', N'101260804');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2028', N'黔西', N'101260901');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2029', N'晴隆', N'101260902');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2030', N'兴仁', N'101260903');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2031', N'贞丰', N'101260904');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2032', N'望谟', N'101260905');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2033', N'兴义', N'101260906');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2034', N'安龙', N'101260907');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2035', N'册亨', N'101260908');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2036', N'普安', N'101260909');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2037', N'成都', N'101270101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2038', N'龙泉驿', N'101270102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2039', N'新都', N'101270103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2040', N'温江', N'101270104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2041', N'金堂', N'101270105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2042', N'双流', N'101270106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2043', N'郫县', N'101270107');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2044', N'大邑', N'101270108');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2045', N'蒲江', N'101270109');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2046', N'新津', N'101270110');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2047', N'都江堰', N'101270111');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2048', N'彭州', N'101270112');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2049', N'邛崃', N'101270113');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2050', N'崇州', N'101270114');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2051', N'崇庆', N'101270115');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2052', N'彭县', N'101270116');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2053', N'攀枝花', N'101270201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2054', N'仁和', N'101270202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2055', N'米易', N'101270203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2056', N'盐边', N'101270204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2057', N'自贡', N'101270301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2058', N'富顺', N'101270302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2059', N'荣县', N'101270303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2060', N'绵阳', N'101270401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2061', N'三台', N'101270402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2062', N'盐亭', N'101270403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2063', N'安县', N'101270404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2064', N'梓潼', N'101270405');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2065', N'北川', N'101270406');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2066', N'平武', N'101270407');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2067', N'江油', N'101270408');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2068', N'南充', N'101270501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2069', N'南部', N'101270502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2070', N'营山', N'101270503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2071', N'蓬安', N'101270504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2072', N'仪陇', N'101270505');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2073', N'西充', N'101270506');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2074', N'阆中', N'101270507');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2075', N'达州', N'101270601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2076', N'宣汉', N'101270602');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2077', N'开江', N'101270603');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2078', N'大竹', N'101270604');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2079', N'渠县', N'101270605');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2080', N'万源', N'101270606');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2081', N'达川', N'101270607');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2082', N'遂宁', N'101270701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2083', N'蓬溪', N'101270702');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2084', N'射洪', N'101270703');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2085', N'广安', N'101270801');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2086', N'岳池', N'101270802');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2087', N'武胜', N'101270803');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2088', N'邻水', N'101270804');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2089', N'华蓥山', N'101270805');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2090', N'巴中', N'101270901');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2091', N'通江', N'101270902');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2092', N'南江', N'101270903');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2093', N'平昌', N'101270904');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2094', N'泸州', N'101271001');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2095', N'泸县', N'101271003');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2096', N'合江', N'101271004');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2097', N'叙永', N'101271005');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2098', N'古蔺', N'101271006');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2099', N'纳溪', N'101271007');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2100', N'宜宾', N'101271101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2101', N'宜宾农试站', N'101271102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2102', N'宜宾县', N'101271103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2103', N'南溪', N'101271104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2104', N'江安', N'101271105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2105', N'长宁', N'101271106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2106', N'高县', N'101271107');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2107', N'珙县', N'101271108');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2108', N'筠连', N'101271109');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2109', N'兴文', N'101271110');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2110', N'屏山', N'101271111');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2111', N'内江', N'101271201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2112', N'东兴', N'101271202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2113', N'威远', N'101271203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2114', N'资中', N'101271204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2115', N'隆昌', N'101271205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2116', N'资阳', N'101271301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2117', N'安岳', N'101271302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2118', N'乐至', N'101271303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2119', N'简阳', N'101271304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2120', N'乐山', N'101271401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2121', N'犍为', N'101271402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2122', N'井研', N'101271403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2123', N'夹江', N'101271404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2124', N'沐川', N'101271405');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2125', N'峨边', N'101271406');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2126', N'马边', N'101271407');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2127', N'峨眉', N'101271408');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2128', N'峨眉山', N'101271409');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2129', N'眉山', N'101271501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2130', N'仁寿', N'101271502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2131', N'彭山', N'101271503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2132', N'洪雅', N'101271504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2133', N'丹棱', N'101271505');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2134', N'青神', N'101271506');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2135', N'凉山', N'101271601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2136', N'木里', N'101271603');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2137', N'盐源', N'101271604');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2138', N'德昌', N'101271605');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2139', N'会理', N'101271606');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2140', N'会东', N'101271607');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2141', N'宁南', N'101271608');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2142', N'普格', N'101271609');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2143', N'西昌', N'101271610');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2144', N'金阳', N'101271611');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2145', N'昭觉', N'101271612');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2146', N'喜德', N'101271613');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2147', N'冕宁', N'101271614');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2148', N'越西', N'101271615');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2149', N'甘洛', N'101271616');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2150', N'雷波', N'101271617');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2151', N'美姑', N'101271618');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2152', N'布拖', N'101271619');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2153', N'雅安', N'101271701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2154', N'名山', N'101271702');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2155', N'荣经', N'101271703');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2156', N'汉源', N'101271704');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2157', N'石棉', N'101271705');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2158', N'天全', N'101271706');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2159', N'芦山', N'101271707');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2160', N'宝兴', N'101271708');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2161', N'甘孜', N'101271801');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2162', N'康定', N'101271802');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2163', N'泸定', N'101271803');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2164', N'丹巴', N'101271804');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2165', N'九龙', N'101271805');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2166', N'雅江', N'101271806');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2167', N'道孚', N'101271807');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2168', N'炉霍', N'101271808');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2169', N'新龙', N'101271809');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2170', N'德格', N'101271810');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2171', N'白玉', N'101271811');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2172', N'石渠', N'101271812');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2173', N'色达', N'101271813');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2174', N'理塘', N'101271814');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2175', N'巴塘', N'101271815');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2176', N'乡城', N'101271816');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2177', N'稻城', N'101271817');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2178', N'得荣', N'101271818');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2179', N'阿坝', N'101271901');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2180', N'汶川', N'101271902');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2181', N'理县', N'101271903');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2182', N'茂县', N'101271904');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2183', N'松潘', N'101271905');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2184', N'九寨沟', N'101271906');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2185', N'金川', N'101271907');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2186', N'小金', N'101271908');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2187', N'黑水', N'101271909');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2188', N'马尔康', N'101271910');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2189', N'壤塘', N'101271911');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2190', N'若尔盖', N'101271912');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2191', N'红原', N'101271913');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2192', N'南坪', N'101271914');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2193', N'德阳', N'101272001');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2194', N'中江', N'101272002');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2195', N'广汉', N'101272003');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2196', N'什邡', N'101272004');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2197', N'绵竹', N'101272005');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2198', N'罗江', N'101272006');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2199', N'广元', N'101272101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2200', N'旺苍', N'101272102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2201', N'青川', N'101272103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2202', N'剑阁', N'101272104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2203', N'苍溪', N'101272105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2204', N'广州', N'101280101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2205', N'番禺', N'101280102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2206', N'从化', N'101280103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2207', N'增城', N'101280104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2208', N'花都', N'101280105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2209', N'天河', N'101280106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2210', N'韶关', N'101280201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2211', N'乳源', N'101280202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2212', N'始兴', N'101280203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2213', N'翁源', N'101280204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2214', N'乐昌', N'101280205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2215', N'仁化', N'101280206');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2216', N'南雄', N'101280207');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2217', N'新丰', N'101280208');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2218', N'曲江', N'101280209');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2219', N'惠州', N'101280301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2220', N'博罗', N'101280302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2221', N'惠阳', N'101280303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2222', N'惠东', N'101280304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2223', N'龙门', N'101280305');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2224', N'梅州', N'101280401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2225', N'兴宁', N'101280402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2226', N'蕉岭', N'101280403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2227', N'大埔', N'101280404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2228', N'丰顺', N'101280406');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2229', N'平远', N'101280407');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2230', N'五华', N'101280408');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2231', N'梅县', N'101280409');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2232', N'汕头', N'101280501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2233', N'潮阳', N'101280502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2234', N'澄海', N'101280503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2235', N'南澳', N'101280504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2236', N'云澳', N'101280505');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2237', N'南澎岛', N'101280506');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2238', N'深圳', N'101280601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2239', N'珠海', N'101280701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2240', N'斗门', N'101280702');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2241', N'黄茅洲', N'101280703');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2242', N'佛山', N'101280800');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2243', N'顺德', N'101280801');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2244', N'三水', N'101280802');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2245', N'南海', N'101280803');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2246', N'肇庆', N'101280901');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2247', N'广宁', N'101280902');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2248', N'四会', N'101280903');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2249', N'德庆', N'101280905');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2250', N'怀集', N'101280906');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2251', N'封开', N'101280907');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2252', N'高要', N'101280908');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2253', N'湛江', N'101281001');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2254', N'吴川', N'101281002');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2255', N'雷州', N'101281003');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2256', N'徐闻', N'101281004');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2257', N'廉江', N'101281005');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2258', N'硇洲', N'101281006');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2259', N'遂溪', N'101281007');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2260', N'江门', N'101281101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2261', N'开平', N'101281103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2262', N'新会', N'101281104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2263', N'恩平', N'101281105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2264', N'台山', N'101281106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2265', N'上川岛', N'101281107');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2266', N'鹤山', N'101281108');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2267', N'河源', N'101281201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2268', N'紫金', N'101281202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2269', N'连平', N'101281203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2270', N'和平', N'101281204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2271', N'龙川', N'101281205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2272', N'清远', N'101281301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2273', N'连南', N'101281302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2274', N'连州', N'101281303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2275', N'连山', N'101281304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2276', N'阳山', N'101281305');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2277', N'佛冈', N'101281306');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2278', N'英德', N'101281307');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2279', N'云浮', N'101281401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2280', N'罗定', N'101281402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2281', N'新兴', N'101281403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2282', N'郁南', N'101281404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2283', N'潮州', N'101281501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2284', N'饶平', N'101281502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2285', N'东莞', N'101281601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2286', N'中山', N'101281701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2287', N'阳江', N'101281801');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2288', N'阳春', N'101281802');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2289', N'揭阳', N'101281901');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2290', N'揭西', N'101281902');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2291', N'普宁', N'101281903');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2292', N'惠来', N'101281904');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2293', N'茂名', N'101282001');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2294', N'高州', N'101282002');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2295', N'化州', N'101282003');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2296', N'电白', N'101282004');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2297', N'信宜', N'101282005');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2298', N'汕尾', N'101282101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2299', N'海丰', N'101282102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2300', N'陆丰', N'101282103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2301', N'遮浪', N'101282104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2302', N'东沙岛', N'101282105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2303', N'昆明', N'101290101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2304', N'昆明农试站', N'101290102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2305', N'东川', N'101290103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2306', N'寻甸', N'101290104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2307', N'晋宁', N'101290105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2308', N'宜良', N'101290106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2309', N'石林', N'101290107');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2310', N'呈贡', N'101290108');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2311', N'富民', N'101290109');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2312', N'嵩明', N'101290110');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2313', N'禄劝', N'101290111');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2314', N'安宁', N'101290112');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2315', N'太华山', N'101290113');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2316', N'河口', N'101290114');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2317', N'大理', N'101290201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2318', N'云龙', N'101290202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2319', N'漾鼻', N'101290203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2320', N'永平', N'101290204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2321', N'宾川', N'101290205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2322', N'弥渡', N'101290206');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2323', N'祥云', N'101290207');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2324', N'魏山', N'101290208');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2325', N'剑川', N'101290209');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2326', N'洱源', N'101290210');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2327', N'鹤庆', N'101290211');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2328', N'南涧', N'101290212');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2329', N'红河', N'101290301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2330', N'石屏', N'101290302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2331', N'建水', N'101290303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2332', N'弥勒', N'101290304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2333', N'元阳', N'101290305');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2334', N'绿春', N'101290306');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2335', N'开远', N'101290307');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2336', N'个旧', N'101290308');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2337', N'蒙自', N'101290309');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2338', N'屏边', N'101290310');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2339', N'泸西', N'101290311');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2340', N'金平', N'101290312');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2341', N'曲靖', N'101290401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2342', N'沾益', N'101290402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2343', N'陆良', N'101290403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2344', N'富源', N'101290404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2345', N'马龙', N'101290405');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2346', N'师宗', N'101290406');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2347', N'罗平', N'101290407');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2348', N'会泽', N'101290408');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2349', N'宣威', N'101290409');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2350', N'保山', N'101290501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2351', N'富宁', N'101290502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2352', N'龙陵', N'101290503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2353', N'施甸', N'101290504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2354', N'昌宁', N'101290505');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2355', N'腾冲', N'101290506');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2356', N'文山', N'101290601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2357', N'西畴', N'101290602');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2358', N'马关', N'101290603');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2359', N'麻栗坡', N'101290604');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2360', N'砚山', N'101290605');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2361', N'邱北', N'101290606');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2362', N'广南', N'101290607');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2363', N'玉溪', N'101290701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2364', N'澄江', N'101290702');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2365', N'江川', N'101290703');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2366', N'通海', N'101290704');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2367', N'华宁', N'101290705');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2368', N'新平', N'101290706');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2369', N'易门', N'101290707');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2370', N'峨山', N'101290708');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2371', N'元江', N'101290709');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2372', N'楚雄', N'101290801');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2373', N'大姚', N'101290802');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2374', N'元谋', N'101290803');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2375', N'姚安', N'101290804');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2376', N'牟定', N'101290805');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2377', N'南华', N'101290806');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2378', N'武定', N'101290807');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2379', N'禄丰', N'101290808');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2380', N'双柏', N'101290809');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2381', N'永仁', N'101290810');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2382', N'普洱', N'101290901');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2383', N'景谷', N'101290902');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2384', N'景东', N'101290903');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2385', N'澜沧', N'101290904');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2386', N'普洱', N'101290905');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2387', N'墨江', N'101290906');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2388', N'江城', N'101290907');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2389', N'孟连', N'101290908');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2390', N'西盟', N'101290909');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2391', N'镇源', N'101290910');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2392', N'镇沅', N'101290911');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2393', N'宁洱', N'101290912');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2394', N'昭通', N'101291001');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2395', N'鲁甸', N'101291002');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2396', N'彝良', N'101291003');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2397', N'镇雄', N'101291004');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2398', N'威信', N'101291005');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2399', N'巧家', N'101291006');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2400', N'绥江', N'101291007');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2401', N'永善', N'101291008');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2402', N'盐津', N'101291009');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2403', N'大关', N'101291010');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2404', N'临沧', N'101291101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2405', N'沧源', N'101291102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2406', N'耿马', N'101291103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2407', N'双江', N'101291104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2408', N'凤庆', N'101291105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2409', N'永德', N'101291106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2410', N'云县', N'101291107');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2411', N'镇康', N'101291108');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2412', N'怒江', N'101291201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2413', N'福贡', N'101291203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2414', N'兰坪', N'101291204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2415', N'泸水', N'101291205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2416', N'六库', N'101291206');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2417', N'贡山', N'101291207');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2418', N'香格里拉', N'101291301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2419', N'德钦', N'101291302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2420', N'维西', N'101291303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2421', N'中甸', N'101291304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2422', N'丽江', N'101291401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2423', N'永胜', N'101291402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2424', N'华坪', N'101291403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2425', N'宁蒗', N'101291404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2426', N'德宏', N'101291501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2427', N'潞江坝', N'101291502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2428', N'陇川', N'101291503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2429', N'盈江', N'101291504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2430', N'畹町镇', N'101291505');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2431', N'瑞丽', N'101291506');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2432', N'梁河', N'101291507');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2433', N'潞西', N'101291508');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2434', N'景洪', N'101291601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2435', N'大勐龙', N'101291602');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2436', N'勐海', N'101291603');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2437', N'景洪电站', N'101291604');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2438', N'勐腊', N'101291605');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2439', N'南宁', N'101300101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2440', N'南宁城区', N'101300102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2441', N'邕宁', N'101300103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2442', N'横县', N'101300104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2443', N'隆安', N'101300105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2444', N'马山', N'101300106');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2445', N'上林', N'101300107');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2446', N'武鸣', N'101300108');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2447', N'宾阳', N'101300109');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2448', N'硕龙', N'101300110');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2449', N'崇左', N'101300201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2450', N'天等', N'101300202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2451', N'龙州', N'101300203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2452', N'凭祥', N'101300204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2453', N'大新', N'101300205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2454', N'扶绥', N'101300206');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2455', N'宁明', N'101300207');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2456', N'海渊', N'101300208');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2457', N'柳州', N'101300301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2458', N'柳城', N'101300302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2459', N'沙塘', N'101300303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2460', N'鹿寨', N'101300304');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2461', N'柳江', N'101300305');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2462', N'融安', N'101300306');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2463', N'融水', N'101300307');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2464', N'三江', N'101300308');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2465', N'来宾', N'101300401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2466', N'忻城', N'101300402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2467', N'金秀', N'101300403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2468', N'象州', N'101300404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2469', N'武宣', N'101300405');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2470', N'桂林', N'101300501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2471', N'桂林农试站', N'101300502');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2472', N'龙胜', N'101300503');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2473', N'永福', N'101300504');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2474', N'临桂', N'101300505');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2475', N'兴安', N'101300506');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2476', N'灵川', N'101300507');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2477', N'全州', N'101300508');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2478', N'灌阳', N'101300509');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2479', N'阳朔', N'101300510');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2480', N'恭城', N'101300511');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2481', N'平乐', N'101300512');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2482', N'荔浦', N'101300513');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2483', N'资源', N'101300514');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2484', N'梧州', N'101300601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2485', N'藤县', N'101300602');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2486', N'太平', N'101300603');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2487', N'苍梧', N'101300604');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2488', N'蒙山', N'101300605');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2489', N'岑溪', N'101300606');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2490', N'贺州', N'101300701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2491', N'昭平', N'101300702');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2492', N'富川', N'101300703');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2493', N'钟山', N'101300704');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2494', N'信都', N'101300705');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2495', N'贵港', N'101300801');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2496', N'桂平', N'101300802');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2497', N'平南', N'101300803');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2498', N'玉林', N'101300901');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2499', N'博白', N'101300902');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2500', N'北流', N'101300903');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2501', N'容县', N'101300904');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2502', N'陆川', N'101300905');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2503', N'百色', N'101301001');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2504', N'那坡', N'101301002');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2505', N'田阳', N'101301003');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2506', N'德保', N'101301004');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2507', N'靖西', N'101301005');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2508', N'田东', N'101301006');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2509', N'平果', N'101301007');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2510', N'隆林', N'101301008');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2511', N'西林', N'101301009');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2512', N'乐业', N'101301010');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2513', N'凌云', N'101301011');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2514', N'田林', N'101301012');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2515', N'钦州', N'101301101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2516', N'浦北', N'101301102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2517', N'灵山', N'101301103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2518', N'河池', N'101301201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2519', N'天峨', N'101301202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2520', N'东兰', N'101301203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2521', N'巴马', N'101301204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2522', N'环江', N'101301205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2523', N'罗城', N'101301206');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2524', N'宜州', N'101301207');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2525', N'凤山', N'101301208');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2526', N'南丹', N'101301209');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2527', N'都安', N'101301210');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2528', N'北海', N'101301301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2529', N'合浦', N'101301302');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2530', N'涠洲岛', N'101301303');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2531', N'防城港', N'101301401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2532', N'上思', N'101301402');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2533', N'东兴', N'101301403');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2534', N'板栏', N'101301404');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2535', N'防城', N'101301405');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2536', N'海口', N'101310101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2537', N'琼山', N'101310102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2538', N'三亚', N'101310201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2539', N'东方', N'101310202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2540', N'临高', N'101310203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2541', N'澄迈', N'101310204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2542', N'儋州', N'101310205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2543', N'昌江', N'101310206');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2544', N'白沙', N'101310207');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2545', N'琼中', N'101310208');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2546', N'定安', N'101310209');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2547', N'屯昌', N'101310210');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2548', N'琼海', N'101310211');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2549', N'文昌', N'101310212');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2550', N'清兰', N'101310213');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2551', N'保亭', N'101310214');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2552', N'万宁', N'101310215');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2553', N'陵水', N'101310216');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2554', N'西沙', N'101310217');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2555', N'珊瑚岛', N'101310218');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2556', N'永署礁', N'101310219');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2557', N'南沙岛', N'101310220');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2558', N'乐东', N'101310221');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2559', N'五指山', N'101310222');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2560', N'通什', N'101310223');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2561', N'香港', N'101320101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2562', N'九龙', N'101320102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2563', N'新界', N'101320103');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2564', N'中环', N'101320104');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2565', N'铜锣湾', N'101320105');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2566', N'澳门', N'101330101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2567', N'台北县', N'101340101');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2568', N'台北市', N'101340102');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2569', N'高雄', N'101340201');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2570', N'东港', N'101340202');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2571', N'大武', N'101340203');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2572', N'恒春', N'101340204');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2573', N'兰屿', N'101340205');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2574', N'台南', N'101340301');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2575', N'台中', N'101340401');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2576', N'桃园', N'101340501');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2577', N'新竹县', N'101340601');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2578', N'新竹市', N'101340602');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2579', N'公馆', N'101340603');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2580', N'宜兰', N'101340701');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2581', N'马公', N'101340801');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2582', N'东吉屿', N'101340802');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2583', N'嘉义', N'101340901');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2584', N'阿里山', N'101340902');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2585', N'玉山', N'101340903');
GO
INSERT INTO [dbo].[weather] ([id], [cityName], [weatherCode]) VALUES (N'2586', N'新港', N'101340904');
GO
SET IDENTITY_INSERT [dbo].[weather] OFF
GO

-- ----------------------------
-- Indexes structure for table AQI
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[AQI]
-- ----------------------------
ALTER TABLE [dbo].[AQI] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table weather
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[weather]
-- ----------------------------
ALTER TABLE [dbo].[weather] ADD PRIMARY KEY ([id])
GO
