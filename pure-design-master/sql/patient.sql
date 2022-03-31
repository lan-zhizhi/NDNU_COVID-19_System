/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : ndnu-covid-system

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 31/03/2022 13:53:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '姓名',
  `identification_number` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '身份证号',
  `sex` char(1) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `address` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '住址',
  `hospitalization_date` date NULL DEFAULT NULL COMMENT '入院日期',
  `infection_source` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '感染来源',
  `death_date` date NULL DEFAULT NULL COMMENT '死亡日期',
  `discharge_date` date NULL DEFAULT NULL COMMENT '治愈日期',
  `category` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '患者类别（确诊，疑似，治愈，死亡）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient
-- ----------------------------
INSERT INTO `patient` VALUES (1, '李四', '123456789123456789', '男', 30, '宁德师范学院', '2022-01-22', '宁德火车站', NULL, NULL, 'diagnose');
INSERT INTO `patient` VALUES (2, '王五', '123456789123456789', '男', 20, '宁德师范学院', '2022-01-22', '宁德火车站', NULL, NULL, 'diagnose');

SET FOREIGN_KEY_CHECKS = 1;
