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

 Date: 31/03/2022 13:54:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for meterial
-- ----------------------------
DROP TABLE IF EXISTS `meterial`;
CREATE TABLE `meterial`  (
  `id` int NOT NULL COMMENT '物品id',
  `name` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '物品名称',
  `quantity` int NULL DEFAULT NULL COMMENT '数量',
  `speicfication` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '规格',
  `source` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '来源',
  `remark` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of meterial
-- ----------------------------
INSERT INTO `meterial` VALUES (101, '口罩', 3000, '普通', '淘宝购买', '无');
INSERT INTO `meterial` VALUES (102, '医用手套', 4000, '普通', '淘宝购买', '无');

SET FOREIGN_KEY_CHECKS = 1;
