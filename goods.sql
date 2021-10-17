/*
 Navicat Premium Data Transfer

 Source Server         : wangzhe
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : blogverson1

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 18/10/2021 00:21:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int NOT NULL,
  `price` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, '399.9', '迪卡侬7号篮球 ');
INSERT INTO `goods` VALUES (2, '39', 'Butterfly乒乓球');
INSERT INTO `goods` VALUES (3, '749', 'adidas跑鞋');
INSERT INTO `goods` VALUES (4, '499', '卡西欧运动手表');
INSERT INTO `goods` VALUES (5, '49', '李宁运动短袖');
INSERT INTO `goods` VALUES (6, '129', 'arena泳镜');
INSERT INTO `goods` VALUES (7, '78', '李宁泳裤');
INSERT INTO `goods` VALUES (8, '1999', '华为智选跑步机');
INSERT INTO `goods` VALUES (9, ' 3298', 'GoPro9');
INSERT INTO `goods` VALUES (10, '3499', 'DJI Pocket2');
INSERT INTO `goods` VALUES (11, '449', '锐步(Reebok)哑铃');
INSERT INTO `goods` VALUES (12, '158', '军哥7号篮球');
INSERT INTO `goods` VALUES (13, '268', 'CUPPa 斯诺克比赛用球');
INSERT INTO `goods` VALUES (14, '14900', 'Kevin Deroo S1');
INSERT INTO `goods` VALUES (15, '199', '世达（star）足球');
INSERT INTO `goods` VALUES (16, '299', 'FIFA认证足球');

SET FOREIGN_KEY_CHECKS = 1;
