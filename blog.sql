/*
 Navicat Premium Data Transfer

 Source Server         : 个人博客
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : 101.200.192.10:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 01/03/2021 20:27:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence`  (
  `next_val` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES (1);

-- ----------------------------
-- Table structure for t_blog
-- ----------------------------
DROP TABLE IF EXISTS `t_blog`;
CREATE TABLE `t_blog`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `appreciation` bit(1) NOT NULL,
  `commentabled` bit(1) NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `first_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `published` bit(1) NOT NULL,
  `recommend` bit(1) NOT NULL,
  `share_statement` bit(1) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `update_time` datetime(6) NULL DEFAULT NULL,
  `views` int(11) NULL DEFAULT NULL,
  `type_id` bigint(20) NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK292449gwg5yf7ocdlmswv9w4j`(`type_id`) USING BTREE,
  INDEX `FK8ky5rrsxh01nkhctmo7d48p82`(`user_id`) USING BTREE,
  CONSTRAINT `FK292449gwg5yf7ocdlmswv9w4j` FOREIGN KEY (`type_id`) REFERENCES `t_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8ky5rrsxh01nkhctmo7d48p82` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_blog
-- ----------------------------
INSERT INTO `t_blog` VALUES (1, b'1', b'1', '# 概述\r\n个人博客功能：\r\n![](https://i.loli.net/2021/02/06/5B2k9iOGy3DWpnj.png)\r\n\r\n技术组合：\r\n>- 后端：Spring Boot(框架)+JPA+thymeleaf模板(前端渲染)\r\n>- 数据库：MySQL\r\n>- 前端UI：Semantic UI框架\r\n\r\n工具与环境：\r\n>- IDEA\r\n>- Maven3\r\n>- JDK\r\n>- Axure RP 8\r\n\r\n课程内容模板：\r\n>- 需求分析与功能规划\r\n>- 页面设计与开发\r\n>- 技术框架搭建\r\n>- 后端管理功能实现\r\n>- 前端功能管理实现\r\n\r\n写markdown获取图片路径!https://sm.ms/\r\n占位图：https://unsplash.com/\r\nhttps://picsum.photos/\r\naemantic：https://zijieke.com/semantic-ui/elements/container.php#/introduction\r\n图标库：http://www.fontawesome.com.cn/faicons/#brand\r\n背景图：https://www.toptal.com/designers/subtlepatterns/\r\n\r\n\r\n# 1.需求与功能\r\n## 1.1用户故事\r\n用户故事模板\r\n>- As a (role of user), I want (some feature) so that (some business value).\r\n>- 作为一个(某个角色)使用者，我可以做(某个功能)事情，如此可以有(某个商业价值)的好处\r\n\r\n角色、功能、商业价值\r\n\r\n举例：\r\n>- 作为一个招聘网站注册用户，我想查看最近三天发布的招聘信息，以便于了解最新的招聘信息。\r\n>- 作为公司、可以张贴新工作\r\n\r\n个人博客的用户故事：\r\n角色：普通访客、管理员（我）\r\n>- 访客：可以分页查看所有的博客\r\n>- 访客：可以快速查看博客数最多的6个分类\r\n>- 访客：可以查看所有的分类\r\n>- 访客：可以查看某个分类下的博客列表\r\n>- 访客：可以快速查看标记博客最多的10个标签\r\n>- 访客：可以查看所有的标签\r\n>- 访客：可以查看某个标签下的博客列表\r\n>- 访客：可以根据年度时间线查看博客列表\r\n>- 访客：可以快速查看最新的推荐博客\r\n>- 访客：可以用关键字全局搜索博客\r\n>- 访客：可以查看单个博客内容\r\n>- 访客：可以对博客内容进行评论\r\n>- 访客：可以赞赏博客内容;\r\n>- 访客：可以微信扫描阅读博客内容\r\n>- 访客：可以在首页扫描公众号二维码关注我\r\n>- 我：可以用户名和密码登录后台管理\r\n>- 我：可以管理博客\r\n	>- 我：可以发布新博客\r\n	>- 我：可以对博客进行分类\r\n	>- 我：可以对博客打标签\r\n	>- 我：可以修改博客\r\n	>- 我：可以删除博客\r\n	>- 我：可以根据标题，分类，标签查询博客\r\n>- 我：可以管理博客分类\r\n	>- 我：可以新增一个分类\r\n	>- 我：可以修改一个分类\r\n	>- 我：可以删除一个分类\r\n	>- 我：可以根据分类名称查询分类\r\n>- 我，可以管理标签\r\n	>- 我：可以新增一个标签\r\n	>- 我：可以修改-一个标签\r\n	>- 我：可以删除一个标签\r\n	>- 我：可以根据名称查询标签\r\n\r\n\r\n\r\n# 2.页面设计与开发 \r\n## 2.1设计\r\n![](https://i.loli.net/2021/02/06/5B2k9iOGy3DWpnj.png)\r\n\r\n>- 前端展示：首页、详情页、分类、标签、归档、关于我\r\n>- 后台管理：模板页\r\n\r\n\r\n\r\n', '2021-02-21 07:53:19.399000', 'Spring Boot开发小而美的个人博客', 'https://picsum.photos/seed/picsum/800/450', '原创', b'1', b'1', b'1', 'Spring Boot开发小而美的个人博客', '2021-02-21 07:53:19.399000', 1, 17, 1);
INSERT INTO `t_blog` VALUES (2, b'1', b'1', 'sdqwdwq', '2021-02-21 07:56:08.752000', 'wdqdqwd', 'https://picsum.photos/seed/picsum/800/450', '', b'1', b'1', b'1', 'da', '2021-02-21 07:56:08.752000', 0, 17, 1);
INSERT INTO `t_blog` VALUES (3, b'1', b'1', 'qdqdqd', '2021-02-21 07:56:22.711000', 'qwdqd', 'https://picsum.photos/seed/picsum/800/450', '', b'1', b'0', b'0', 'wddwqd', '2021-02-21 07:56:22.711000', 0, 17, 1);

-- ----------------------------
-- Table structure for t_blog_tags
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_tags`;
CREATE TABLE `t_blog_tags`  (
  `blogs_id` bigint(20) NOT NULL,
  `tags_id` bigint(20) NOT NULL,
  INDEX `FK5feau0gb4lq47fdb03uboswm8`(`tags_id`) USING BTREE,
  INDEX `FKh4pacwjwofrugxa9hpwaxg6mr`(`blogs_id`) USING BTREE,
  CONSTRAINT `FK5feau0gb4lq47fdb03uboswm8` FOREIGN KEY (`tags_id`) REFERENCES `t_tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKh4pacwjwofrugxa9hpwaxg6mr` FOREIGN KEY (`blogs_id`) REFERENCES `t_blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_blog_tags
-- ----------------------------
INSERT INTO `t_blog_tags` VALUES (1, 10);
INSERT INTO `t_blog_tags` VALUES (1, 11);
INSERT INTO `t_blog_tags` VALUES (2, 10);
INSERT INTO `t_blog_tags` VALUES (2, 11);
INSERT INTO `t_blog_tags` VALUES (2, 12);
INSERT INTO `t_blog_tags` VALUES (3, 10);
INSERT INTO `t_blog_tags` VALUES (3, 11);

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_comment` bit(1) NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `blog_id` bigint(20) NULL DEFAULT NULL,
  `parent_comment_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKke3uogd04j4jx316m1p51e05u`(`blog_id`) USING BTREE,
  INDEX `FK4jj284r3pb7japogvo6h72q95`(`parent_comment_id`) USING BTREE,
  CONSTRAINT `FK4jj284r3pb7japogvo6h72q95` FOREIGN KEY (`parent_comment_id`) REFERENCES `t_comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKke3uogd04j4jx316m1p51e05u` FOREIGN KEY (`blog_id`) REFERENCES `t_blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (1, b'1', 'https://unsplash.it/100/100?image=1005', 'test', '2021-02-21 07:53:48.037000', '844040753@qq.com', 'luqi', 1, NULL);

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_tag
-- ----------------------------
INSERT INTO `t_tag` VALUES (10, 'louisblog');
INSERT INTO `t_tag` VALUES (11, '卢琦');
INSERT INTO `t_tag` VALUES (12, 'louisblogs2');

-- ----------------------------
-- Table structure for t_type
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES (17, 'louisblogs2');
INSERT INTO `t_type` VALUES (39, 'louisblog');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `update_time` datetime(6) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'https://unsplash.it/100/100?image=1005', '2021-02-12 17:54:56.000000', '844040753@qq.com', 'luqi', 'e10adc3949ba59abbe56e057f20f883e', 1, '2021-02-12 17:55:29.000000', 'luqi');

SET FOREIGN_KEY_CHECKS = 1;
