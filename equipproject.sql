/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : 127.0.0.1:3306
 Source Schema         : equipproject

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 29/03/2020 11:49:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auditing
-- ----------------------------
DROP TABLE IF EXISTS `auditing`;
CREATE TABLE `auditing`  (
  `a_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `p_id` int(11) NULL DEFAULT NULL COMMENT '部件的id',
  `u_username1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请人的用户名',
  `a_flag` int(20) NULL DEFAULT NULL COMMENT '审核状态（0为待审核，1为审核通过，2为审核不通过）',
  `u_username2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人的用户名',
  `a_time` datetime(0) NULL DEFAULT NULL COMMENT '申请的时间',
  PRIMARY KEY (`a_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auditing
-- ----------------------------
INSERT INTO `auditing` VALUES (1, 15, 'admin', 2, 'aaaadd', '2020-03-29 03:03:12');
INSERT INTO `auditing` VALUES (2, 15, 'aaaadd', 1, 'admin', '2020-03-29 03:04:35');
INSERT INTO `auditing` VALUES (3, 6, 'aaaadd', 1, 'admin', '2020-03-29 03:04:40');
INSERT INTO `auditing` VALUES (4, 5, 'admin', 1, 'aaaadd', '2020-03-29 03:06:42');

-- ----------------------------
-- Table structure for equip
-- ----------------------------
DROP TABLE IF EXISTS `equip`;
CREATE TABLE `equip`  (
  `eq_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `eq_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `eq_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备类型',
  `eq_model` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备型号',
  `eq_flag` int(11) NULL DEFAULT NULL COMMENT '设备状态（0为损坏，1为正常）',
  `f_id` int(11) NULL DEFAULT NULL COMMENT '厂商id（一对一关系）',
  `eq_delete` int(11) NULL DEFAULT NULL COMMENT '是否被删除（0为删除，1为存在）',
  PRIMARY KEY (`eq_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of equip
-- ----------------------------
INSERT INTO `equip` VALUES (1, 'a', 'a', 'a', 1, 1, 1);
INSERT INTO `equip` VALUES (2, 'b', 'b', 'b', 1, 1, 1);
INSERT INTO `equip` VALUES (3, 'c', 'c', 'c', 1, 1, 1);
INSERT INTO `equip` VALUES (4, 'd', 'd', 'd', 1, 2, 1);
INSERT INTO `equip` VALUES (5, 'f', 'f', 'f', 1, 2, 1);
INSERT INTO `equip` VALUES (6, 'g', 'g', 'g', 1, 3, 1);
INSERT INTO `equip` VALUES (9, 'cc', 'cc1', 'cc1', 1, 6, 1);
INSERT INTO `equip` VALUES (10, 'aa', 'aa1', 'aa1', 1, 2, 1);
INSERT INTO `equip` VALUES (11, 'rr', 'rr', 'rr', 1, 2, 0);

-- ----------------------------
-- Table structure for firm
-- ----------------------------
DROP TABLE IF EXISTS `firm`;
CREATE TABLE `firm`  (
  `f_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `f_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '厂商的名称',
  `f_address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '厂商的地址',
  `f_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '厂商的电话号码',
  `f_del` int(11) NOT NULL COMMENT '是否被删除（0为删除，1为存在）',
  PRIMARY KEY (`f_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of firm
-- ----------------------------
INSERT INTO `firm` VALUES (1, 'aaa', 'aaa', 'aaa', 1);
INSERT INTO `firm` VALUES (2, 'bbb', 'bbb', 'bbb', 1);
INSERT INTO `firm` VALUES (3, 'ccc', 'ccc', 'ccc', 1);
INSERT INTO `firm` VALUES (4, 'ddd', 'ddd', 'ddd', 1);
INSERT INTO `firm` VALUES (5, 'eee', 'eee', 'eee', 1);
INSERT INTO `firm` VALUES (6, 'fff', 'fff', 'fff', 0);
INSERT INTO `firm` VALUES (29, 'hhh', 'hhh11', 'hhh11', 0);
INSERT INTO `firm` VALUES (30, 'hhh', 'hhh11', 'hhh11', 0);

-- ----------------------------
-- Table structure for iplog
-- ----------------------------
DROP TABLE IF EXISTS `iplog`;
CREATE TABLE `iplog`  (
  `ip_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `ip_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作开始时间',
  `ip_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作记录',
  `ip_time2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作总时长',
  `ip_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作者',
  `ip_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作者地址',
  PRIMARY KEY (`ip_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of iplog
-- ----------------------------
INSERT INTO `iplog` VALUES (1, '2020-03-29 11:39:34', ' 执行了用户下的 用户登录操作!', '3288ms', 'admin', '127.0.0.1');

-- ----------------------------
-- Table structure for parts
-- ----------------------------
DROP TABLE IF EXISTS `parts`;
CREATE TABLE `parts`  (
  `p_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `p_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部件名称',
  `p_flag` int(1) NULL DEFAULT NULL COMMENT '部件状态（0为损坏，1为已经申请维修，2为正常）',
  `eq_id` int(11) NULL DEFAULT NULL COMMENT '设备的id（一对多关系）',
  `p_delete` int(11) NULL DEFAULT NULL COMMENT '是否被删除（0为删除，1为未删除）',
  PRIMARY KEY (`p_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of parts
-- ----------------------------
INSERT INTO `parts` VALUES (1, '111', 2, 1, 1);
INSERT INTO `parts` VALUES (2, '222', 2, 1, 1);
INSERT INTO `parts` VALUES (3, '333', 2, 1, 1);
INSERT INTO `parts` VALUES (4, '444', 2, 2, 1);
INSERT INTO `parts` VALUES (5, '555', 2, 2, 1);
INSERT INTO `parts` VALUES (6, '666', 2, 3, 1);
INSERT INTO `parts` VALUES (15, '777', 2, 2, 1);

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `u_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `u_username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `u_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES (1, 'admin', 'ff6f6dfffed48fc9f08ede4b08f4cc39bd0368c0d32ee7b2');
INSERT INTO `userinfo` VALUES (4, 'admin1', 'aabcbbbcfabeab4ef61a8fea7af848ceb66b417c869f69ac');
INSERT INTO `userinfo` VALUES (5, 'admin3', 'ff6f6dfffed48fc9f08ede4b08f4cc39bd0368c0d32ee7b2');
INSERT INTO `userinfo` VALUES (6, 'aaaadd', '88cfca2f28a2b2172de80a259b8c10170fd5fe01009ae75d');

SET FOREIGN_KEY_CHECKS = 1;
