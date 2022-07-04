/*
 Navicat MySQL Data Transfer

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : Museum

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 03/05/2021 20:41:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for author
-- ----------------------------
DROP TABLE IF EXISTS `author`;
CREATE TABLE `author` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Birth` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Death` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Country` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of author
-- ----------------------------
BEGIN;
INSERT INTO `author` VALUES (1, 'Kai', 'Male', '1999/04/29', 'N/A', 'China');
INSERT INTO `author` VALUES (2, 'Djedefra', 'Male', '2575 B.C', 'Unknown', 'Egypt');
INSERT INTO `author` VALUES (3, 'Jennifer', 'Female', '1875', '1933', 'UK');
COMMIT;

-- ----------------------------
-- Table structure for bluetoothbeacon
-- ----------------------------
DROP TABLE IF EXISTS `bluetoothbeacon`;
CREATE TABLE `bluetoothbeacon` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `UUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Major` int NOT NULL,
  `Minor` int DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of bluetoothbeacon
-- ----------------------------
BEGIN;
INSERT INTO `bluetoothbeacon` VALUES (1, 'fda50693a4e24fb1afcfc6eb07647825', 1, 1);
INSERT INTO `bluetoothbeacon` VALUES (2, 'fda50693a4e24fb1afcfc6eb07647825', 1, 2);
INSERT INTO `bluetoothbeacon` VALUES (3, 'fda50693a4e24fb1afcfc6eb07647825', 1, 3);
INSERT INTO `bluetoothbeacon` VALUES (4, 'fda50693a4e24fb1afcfc6eb07647825', 1, 4);
COMMIT;

-- ----------------------------
-- Table structure for exhibits
-- ----------------------------
DROP TABLE IF EXISTS `exhibits`;
CREATE TABLE `exhibits` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Author` int NOT NULL,
  `Date` varchar(255) COLLATE utf8_bin NOT NULL,
  `Type` int NOT NULL,
  `RoomId` int NOT NULL,
  `VoiceDescription` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BluetoothBeaconId` int NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `Type` (`Type`),
  KEY `Bluetooth_beacon_number` (`BluetoothBeaconId`),
  KEY `Author` (`Author`),
  KEY `roomid` (`RoomId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of exhibits
-- ----------------------------
BEGIN;
INSERT INTO `exhibits` VALUES (1, 'Yan', 1, '2020/7/11', 1, 1, 'This is the sculpture David, it is made by the student David from Beijing university of posts and telecommunications', 1);
INSERT INTO `exhibits` VALUES (2, 'William&Cindy', 3, '1894/2/01', 3, 2, 'This is a realistic painting by Jennifer, called William and Cindy', 2);
INSERT INTO `exhibits` VALUES (3, 'Sphinx', 2, '2600 B.C.', 5, 3, 'This is the Egyptian pharaoh Khafre of the fourth dynasty according to the image of the Sphinx built a stone statue, later known as the Sphinx.', 3);
COMMIT;

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Floor` int NOT NULL,
  `Location` int NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of room
-- ----------------------------
BEGIN;
INSERT INTO `room` VALUES (1, 1, 101);
INSERT INTO `room` VALUES (2, 1, 102);
INSERT INTO `room` VALUES (3, 1, 103);
INSERT INTO `room` VALUES (4, 1, 104);
COMMIT;

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `style` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `material` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pigment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of type
-- ----------------------------
BEGIN;
INSERT INTO `type` VALUES (1, 'Sculpture', 'Hellenistic', 'N/A', 'Marble', 'N/A');
INSERT INTO `type` VALUES (2, 'Sculpture', 'Roman', 'N/A', 'Marble', 'N/A');
INSERT INTO `type` VALUES (3, 'Paingting', 'Realism', 'Reality', 'N/A', 'inorganic');
INSERT INTO `type` VALUES (4, 'Paingting', 'Abstract', 'Abstract', 'N/A', 'inorganic');
INSERT INTO `type` VALUES (5, 'Other', 'N/A', 'N/A', 'N/A', 'N/A');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 'admin', '123456');
INSERT INTO `user` VALUES (2, 'ykpy314', '123456');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
