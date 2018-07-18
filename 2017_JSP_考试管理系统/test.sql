/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-01-18 14:07:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `courses`
-- ----------------------------
DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses` (
  `CID` int(11) NOT NULL,
  `TID` int(11) NOT NULL,
  `NAME` varchar(64) DEFAULT NULL,
  `TYPE` varchar(8) DEFAULT NULL,
  `MAJOR` varchar(64) DEFAULT NULL,
  `POINT` int(5) DEFAULT NULL,
  PRIMARY KEY (`CID`),
  KEY `FK_Reference_1` (`TID`),
  KEY `TYPE` (`TYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses
-- ----------------------------
INSERT INTO `courses` VALUES ('2009001', '2008002', '信息分析与设计', '大作业', '信息管理学院', '2');
INSERT INTO `courses` VALUES ('2009002', '2008002', '管理信息系统', '考试', '信息管理学院', '2');
INSERT INTO `courses` VALUES ('2009003', '2008002', '凸优化', '考试', '信息管理学院', '6');

-- ----------------------------
-- Table structure for `kplace`
-- ----------------------------
DROP TABLE IF EXISTS `kplace`;
CREATE TABLE `kplace` (
  `placeID` int(8) NOT NULL,
  `placeName` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`placeID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kplace
-- ----------------------------
INSERT INTO `kplace` VALUES ('1', '8101');
INSERT INTO `kplace` VALUES ('2', '8012');
INSERT INTO `kplace` VALUES ('3', '8312');
INSERT INTO `kplace` VALUES ('4', '9-11');
INSERT INTO `kplace` VALUES ('5', '9401');

-- ----------------------------
-- Table structure for `ktest`
-- ----------------------------
DROP TABLE IF EXISTS `ktest`;
CREATE TABLE `ktest` (
  `Kid` int(16) NOT NULL,
  `CID` int(16) NOT NULL,
  `TYPE` varchar(8) CHARACTER SET utf8 NOT NULL,
  `Ktype` varchar(16) CHARACTER SET utf8 NOT NULL,
  `PlaceID` int(8) DEFAULT NULL,
  `Day` int(8) DEFAULT NULL,
  `Time` int(8) DEFAULT NULL,
  PRIMARY KEY (`Kid`,`CID`),
  KEY `Ktest` (`CID`),
  KEY `typetest` (`TYPE`),
  KEY `Kid` (`Kid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ktest
-- ----------------------------
INSERT INTO `ktest` VALUES ('9001', '2009001', '大作业', '', '3', '1', '2');
INSERT INTO `ktest` VALUES ('9002', '2009003', '考试', 'closed', '3', '10', '8');
INSERT INTO `ktest` VALUES ('9003', '2009002', '考试', 'closed', '3', '5', '5');

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `MID` int(16) NOT NULL,
  `Password` varchar(16) NOT NULL,
  `Rank` char(4) NOT NULL,
  PRIMARY KEY (`MID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('101', '123456', 'A');
INSERT INTO `manager` VALUES ('201', '123456', 'B');
INSERT INTO `manager` VALUES ('202', '123456', 'B');
INSERT INTO `manager` VALUES ('203', '123456', 'B');
INSERT INTO `manager` VALUES ('301', '123456', 'C');

-- ----------------------------
-- Table structure for `place_time`
-- ----------------------------
DROP TABLE IF EXISTS `place_time`;
CREATE TABLE `place_time` (
  `PlaceID` int(8) NOT NULL DEFAULT '0',
  `Ktime` int(2) NOT NULL DEFAULT '0',
  `Kday` varchar(16) NOT NULL,
  `Kid` int(16) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Kid`),
  KEY `save` (`Ktime`,`Kday`,`Kid`,`PlaceID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of place_time
-- ----------------------------
INSERT INTO `place_time` VALUES ('3', '2', '1', '9001');
INSERT INTO `place_time` VALUES ('3', '5', '5', '9003');
INSERT INTO `place_time` VALUES ('3', '8', '10', '9002');

-- ----------------------------
-- Table structure for `studentcourses`
-- ----------------------------
DROP TABLE IF EXISTS `studentcourses`;
CREATE TABLE `studentcourses` (
  `SID` int(11) NOT NULL,
  `CID` int(11) NOT NULL,
  `SCORE` float DEFAULT NULL,
  PRIMARY KEY (`SID`,`CID`),
  KEY `FK_Reference_3` (`CID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studentcourses
-- ----------------------------
INSERT INTO `studentcourses` VALUES ('2014001', '2009001', '96');
INSERT INTO `studentcourses` VALUES ('2014001', '2009002', null);
INSERT INTO `studentcourses` VALUES ('2014002', '2009001', '96');
INSERT INTO `studentcourses` VALUES ('123131', '13213321', null);
INSERT INTO `studentcourses` VALUES ('2014002', '2009002', '0');
INSERT INTO `studentcourses` VALUES ('2014003', '2009002', '0');

-- ----------------------------
-- Table structure for `students`
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `SID` int(11) NOT NULL,
  `NAME` varchar(64) DEFAULT NULL,
  `AGE` int(11) DEFAULT NULL,
  `MAJOR` varchar(64) DEFAULT NULL,
  `GRADE` int(11) DEFAULT NULL,
  `GENDER` char(8) DEFAULT NULL,
  `PASSWORD` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`SID`),
  KEY `NAME` (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES ('2014001', '张三', '20', '信息管理学院', '2014', 'male', '123456');
INSERT INTO `students` VALUES ('2014002', '李四', '21', '信息管理学院', '2014', 'female', '234567');
INSERT INTO `students` VALUES ('2014003', 'test', '59', '信息管理学院', '2014', null, '123456');
INSERT INTO `students` VALUES ('2014004', 'test2', null, 'math', '2014', 'female', '123456');

-- ----------------------------
-- Table structure for `teachers`
-- ----------------------------
DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers` (
  `TID` int(11) NOT NULL,
  `NAME` varchar(64) DEFAULT NULL,
  `AGE` int(11) DEFAULT NULL,
  `MAJOR` varchar(64) DEFAULT NULL,
  `TITLE` varchar(32) DEFAULT NULL,
  `PASSWORD` varchar(64) DEFAULT NULL,
  `GENDER` char(1) DEFAULT NULL,
  PRIMARY KEY (`TID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teachers
-- ----------------------------
INSERT INTO `teachers` VALUES ('2006001', 'LTEST', '42', '信息管理学院', '教授', '123456', 'm');
INSERT INTO `teachers` VALUES ('2008002', 'STEST', '30', '信息管理学院', '讲师', '123456', 'm');
