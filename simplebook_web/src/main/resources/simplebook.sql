/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : simplebook

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 23/09/2019 22:14:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `adminid` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `aname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员昵称',
  `apassword` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员密码',
  `power` int(255) NULL DEFAULT NULL COMMENT '管理员权限',
  PRIMARY KEY (`adminid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '1234', 0);

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `articleid` int(11) NOT NULL COMMENT '文章id',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `head` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章标题',
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `releasedate` datetime(0) NULL DEFAULT NULL COMMENT '发布日期',
  `fontcount` int(255) NULL DEFAULT NULL COMMENT '文章字数',
  `view` bigint(255) NULL DEFAULT NULL COMMENT '浏览量',
  `good` int(255) NULL DEFAULT NULL COMMENT '点赞数',
  `articlestate` int(255) NULL DEFAULT NULL COMMENT '文章状态，0代表不可显示，1代表正常，2代表敏感',
  `report` int(255) NULL DEFAULT NULL COMMENT '举报量',
  `classid` int(11) NULL DEFAULT NULL COMMENT '分类id',
  PRIMARY KEY (`articleid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, 2, '哈哈哈', NULL, '2019-09-03 15:41:47', 50, 50, 100, 1, 0, 1);

-- ----------------------------
-- Table structure for articlecontent
-- ----------------------------
DROP TABLE IF EXISTS `articlecontent`;
CREATE TABLE `articlecontent`  (
  `articlecontentid` int(11) NOT NULL COMMENT '文章内容id',
  `articleid` int(11) NULL DEFAULT NULL COMMENT '文章id',
  `articleimgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章图片路径',
  `articlecontent` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章内容',
  PRIMARY KEY (`articlecontentid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of articlecontent
-- ----------------------------
INSERT INTO `articlecontent` VALUES (1, 1, 'img/user.jpg', '1sdaffffffffffffffffff韩国撒偶uu链接看看喀喀喀喀喀喀喀喀喀喀喀喀喀喀喀斤斤计较斤斤计较急急急急急急急急急急急急急急急急急急');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commentid` int(11) NOT NULL COMMENT '评论id',
  `articleid` int(11) NULL DEFAULT NULL COMMENT '文章id',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `parentid` int(11) NULL DEFAULT NULL COMMENT '父评论id',
  `floor` int(255) NULL DEFAULT NULL COMMENT '评论楼层',
  `commentdate` datetime(0) NULL DEFAULT NULL COMMENT '评论日期',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '评论内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 1, 1, 2, NULL, 1, '2019-09-18 15:46:02', '啊的说法烦烦烦烦烦烦烦烦烦');
INSERT INTO `comment` VALUES (2, 2, 1, 2, NULL, 2, '2019-09-22 15:46:53', '的撒烦烦烦烦烦烦发');

-- ----------------------------
-- Table structure for favor
-- ----------------------------
DROP TABLE IF EXISTS `favor`;
CREATE TABLE `favor`  (
  `favorid` int(11) NOT NULL COMMENT '收藏id',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `articleid` int(11) NULL DEFAULT NULL COMMENT '文章id',
  PRIMARY KEY (`favorid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favor
-- ----------------------------
INSERT INTO `favor` VALUES (1, 2, 1);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `typeid` int(11) NOT NULL COMMENT '分类主键',
  `typename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `parentid` int(11) NULL DEFAULT NULL COMMENT '父分类id',
  PRIMARY KEY (`typeid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `upassword` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `sex` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `about` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人简介',
  `headimgs` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '头像图片',
  `userstate` int(255) NULL DEFAULT NULL COMMENT '用户状态，0代表冻结，1代表正常，2代表不可用',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'user', '8520', '12345678911', '258@163.com', '男', '哈哈哈', NULL, 0);
INSERT INTO `user` VALUES (2, 'admin', '1234', NULL, '2472385260@qq.com', NULL, NULL, NULL, 1);
INSERT INTO `user` VALUES (8, 'test', '7410', NULL, '1530613365@qq.com', NULL, NULL, NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;
