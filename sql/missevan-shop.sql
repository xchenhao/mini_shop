/*
 Navicat Premium Data Transfer

 Source Server         : pc_local
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : 127.0.0.1:3306
 Source Schema         : mini_shop

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 27/04/2020 19:16:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gf_address
-- ----------------------------
DROP TABLE IF EXISTS `gf_address`;
CREATE TABLE `gf_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipient` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收件人',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货地址',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是默认地址',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户 ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收货地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gf_admin
-- ----------------------------
DROP TABLE IF EXISTS `gf_admin`;
CREATE TABLE `gf_admin`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '后台登录用户名',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '后台登录密码',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户表\r\n默认密码123456' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gf_category
-- ----------------------------
DROP TABLE IF EXISTS `gf_category`;
CREATE TABLE `gf_category`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目名称',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '父级栏目的id',
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 78 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gf_category
-- ----------------------------
INSERT INTO `gf_category` VALUES (1, '海报', 0);
INSERT INTO `gf_category` VALUES (3, '明信片', 0);
INSERT INTO `gf_category` VALUES (4, '文件袋', 0);
INSERT INTO `gf_category` VALUES (5, '书签', 0);
INSERT INTO `gf_category` VALUES (6, '数码', 0);
INSERT INTO `gf_category` VALUES (7, '鼠标垫', 0);
INSERT INTO `gf_category` VALUES (10, '默读限量海报', 1);
INSERT INTO `gf_category` VALUES (13, '撒野限量海报', 1);
INSERT INTO `gf_category` VALUES (15, '破云限量海报', 1);
INSERT INTO `gf_category` VALUES (25, '默读明信片', 3);
INSERT INTO `gf_category` VALUES (26, '撒野明信片', 3);
INSERT INTO `gf_category` VALUES (27, '破云明信片', 3);
INSERT INTO `gf_category` VALUES (31, '默读文件袋', 4);
INSERT INTO `gf_category` VALUES (32, '撒野文件袋', 4);
INSERT INTO `gf_category` VALUES (33, '破云文件袋', 4);
INSERT INTO `gf_category` VALUES (47, '宅喵卡通书签', 5);
INSERT INTO `gf_category` VALUES (49, '宅喵定制耳机', 6);
INSERT INTO `gf_category` VALUES (58, '宅喵超长款珍藏鼠标垫', 7);
INSERT INTO `gf_category` VALUES (73, '钥匙扣', 0);
INSERT INTO `gf_category` VALUES (74, '手账本', 0);
INSERT INTO `gf_category` VALUES (75, '门牌', 0);
INSERT INTO `gf_category` VALUES (76, '立牌', 0);
INSERT INTO `gf_category` VALUES (77, '套盒', 0);

-- ----------------------------
-- Table structure for gf_goods
-- ----------------------------
DROP TABLE IF EXISTS `gf_goods`;
CREATE TABLE `gf_goods`  (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称商品名称',
  `cate_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品所属栏目',
  `market_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '市场价',
  `shop_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '商城价',
  `slogan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品宣传语',
  `details` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品详情',
  `preview` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详情图册',
  `list_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列表页展示图',
  `is_hot` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否热门',
  `is_onsale` enum('1','0') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否优惠',
  `click` int(11) NOT NULL DEFAULT 0 COMMENT '查看次数',
  `is_recommended` enum('1','0') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否推荐',
  `is_cover` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '首页中的栏目下的长条大图显示部分',
  `slide` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '首页轮播图',
  PRIMARY KEY (`gid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gf_goods
-- ----------------------------
INSERT INTO `gf_goods` VALUES (59, '我磕了对家X我的CP完结礼包', 76, 129.00, 129.00, '', '<p><img src=\"goods/list_pic/202004/27/58a610a776c8208e495671f68a45409d165246.png\" width=\"1352\" height=\"818\" style=\"width: 1352px; height: 818px;\"/></p><p><img src=\"goods/details/202004/27/a620c8ffe15c6b5cf3ad409d713955de172137.png\" width=\"1353\" height=\"1075\" style=\"width: 1353px; height: 1075px;\"/></p>', '[\"goods\\/list_pic\\/202004\\/27\\/58a610a776c8208e495671f68a45409d165246.png\"]', 'goods/list_pic/202004/27/58a610a776c8208e495671f68a45409d165246.png', '1', '1', 101, '1', '0', '');
INSERT INTO `gf_goods` VALUES (58, '伪装学渣门牌', 75, 28.00, 28.00, '', '<p><img src=\"goods/list_pic/202004/27/d8f18d1e22d9de6f641bb2f5c2625806164355.jpg\" width=\"985\" style=\"width: 985px; \"/></p>', '[\"goods\\/preview\\/202004\\/27\\/738a42d118c70fe4301bfeb8de4ca639164353.jpg\"]', 'goods/list_pic/202004/27/d8f18d1e22d9de6f641bb2f5c2625806164355.jpg', '1', '1', 200, '1', '0', '');
INSERT INTO `gf_goods` VALUES (56, '伪装学渣卡套钥匙扣', 73, 30.00, 30.00, '', '<p><img src=\"goods/list_pic/202004/27/fce3f33dc01cac6d6a91f1e4e7572360164114.jpg\" width=\"983\" style=\"width: 983px; ;\"/></p>', '[\"goods\\/preview\\/202004\\/27\\/0d211eec7444fd4fb93c0369cb1ce668164113.jpg\"]', 'goods/list_pic/202004/27/fce3f33dc01cac6d6a91f1e4e7572360164114.jpg', '1', '1', 7, '1', '0', '');
INSERT INTO `gf_goods` VALUES (57, '伪装学渣手账本', 74, 65.00, 65.00, '', '<p><img src=\"goods/list_pic/202004/27/c8f91d920ae7a4e776816c2ac5a11d43164302.jpg\" width=\"1300\" style=\"width: 1300px; ;\"/></p>', '[\"goods\\/preview\\/202004\\/27\\/cb18e15bbbb45045c789d16df81ec256164300.jpg\"]', 'goods/list_pic/202004/27/c8f91d920ae7a4e776816c2ac5a11d43164302.jpg', '0', '1', 6, '0', '0', '');
INSERT INTO `gf_goods` VALUES (52, '宅喵超长款珍藏鼠标垫', 58, 50.00, 50.00, '', '<p><img src=\"goods/details/201901/11/c1132e0f2d049c1baa5ab2efc416456f115810.png\"/></p>', '[\"goods\\/preview\\/201901\\/11\\/dc06dbe7a544de6dde706c45fe5989fa115809.png\"]', 'goods/list_pic/201901/11/b5032484b2b141f4a1264a5e64ea8954115810.png', '0', '1', 1002, '0', '1', 'goods/slide/201901/11/7c0423662035857ef0ff9f707b9cfb31115810.jpg');
INSERT INTO `gf_goods` VALUES (60, '撒野广播剧完结套盒', 77, 179.00, 179.00, '', '<p><img src=\"goods/list_pic/202004/27/c9b495173c1b4da5025dca39e0df11bd165743.png\" width=\"1352\" style=\"width: 1352px;\"/></p>', '[\"goods\\/list_pic\\/202004\\/27\\/c9b495173c1b4da5025dca39e0df11bd165743.png\"]', 'goods/list_pic/202004/27/c9b495173c1b4da5025dca39e0df11bd165743.png', '0', '1', 3, '0', '0', '');

-- ----------------------------
-- Table structure for gf_goods_comment
-- ----------------------------
DROP TABLE IF EXISTS `gf_goods_comment`;
CREATE TABLE `gf_goods_comment`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `goods_id` int(11) UNSIGNED NOT NULL COMMENT '所属商品 ID',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户 ID',
  `create_time` int(10) UNSIGNED NOT NULL COMMENT '创建时间',
  `star` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '满意度',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 268 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '货品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gf_goods_comment
-- ----------------------------
INSERT INTO `gf_goods_comment` VALUES (267, '好好好好好好好好好好', 48, 2, 1547186052, 5);
INSERT INTO `gf_goods_comment` VALUES (266, 'kkkkkkkkkkk', 50, 2, 1547182176, 5);
INSERT INTO `gf_goods_comment` VALUES (265, 'kkkkkkkkkkk', 49, 2, 1547182176, 5);
INSERT INTO `gf_goods_comment` VALUES (264, '好评', 48, 2, 1547181339, 5);

-- ----------------------------
-- Table structure for gf_goods_sort
-- ----------------------------
DROP TABLE IF EXISTS `gf_goods_sort`;
CREATE TABLE `gf_goods_sort`  (
  `gsid` int(11) NOT NULL AUTO_INCREMENT,
  `property` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组合属性',
  `storage` int(11) NOT NULL DEFAULT 0 COMMENT '库存量',
  `goods_id` int(11) NOT NULL COMMENT '所属商品id',
  PRIMARY KEY (`gsid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 242 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '货品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gf_goods_sort
-- ----------------------------
INSERT INTO `gf_goods_sort` VALUES (219, '10', 5, 53);
INSERT INTO `gf_goods_sort` VALUES (212, '15', 5, 54);
INSERT INTO `gf_goods_sort` VALUES (231, '1', 5, 52);
INSERT INTO `gf_goods_sort` VALUES (238, '1', 5, 60);
INSERT INTO `gf_goods_sort` VALUES (241, '1', 5, 56);
INSERT INTO `gf_goods_sort` VALUES (233, '1', 5, 57);
INSERT INTO `gf_goods_sort` VALUES (240, '1', 5, 58);
INSERT INTO `gf_goods_sort` VALUES (239, '1', 5, 59);

-- ----------------------------
-- Table structure for gf_migrations
-- ----------------------------
DROP TABLE IF EXISTS `gf_migrations`;
CREATE TABLE `gf_migrations`  (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `end_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `breakpoint` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gf_migrations
-- ----------------------------
INSERT INTO `gf_migrations` VALUES (20170817131555, 'Users', '2017-08-17 21:58:16', '2017-08-17 21:58:16', 0);
INSERT INTO `gf_migrations` VALUES (20170820152923, 'Address', '2017-08-20 23:46:26', '2017-08-20 23:46:26', 0);

-- ----------------------------
-- Table structure for gf_order
-- ----------------------------
DROP TABLE IF EXISTS `gf_order`;
CREATE TABLE `gf_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '订单号',
  `total_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '价格总计',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '待付款' COMMENT '订单状态（取消，删除，其它是一般状态）',
  `address_id` int(11) NOT NULL DEFAULT 0 COMMENT '收货地址id',
  `user_id` int(11) NOT NULL COMMENT '所属用户id',
  `order_time` int(11) NOT NULL DEFAULT 0 COMMENT '下单时间',
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gf_order_items
-- ----------------------------
DROP TABLE IF EXISTS `gf_order_items`;
CREATE TABLE `gf_order_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NULL DEFAULT NULL COMMENT '所属订单id',
  `total_sub_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '价格小计',
  `num` int(11) NULL DEFAULT 1 COMMENT '购买数量',
  `goods_sort_id` int(11) NULL DEFAULT NULL COMMENT '所属货品款式id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单列表项' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for gf_search_words
-- ----------------------------
DROP TABLE IF EXISTS `gf_search_words`;
CREATE TABLE `gf_search_words`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `search_word` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '搜索关键词',
  `times` int(11) NOT NULL DEFAULT 1 COMMENT '搜索次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gf_users
-- ----------------------------
DROP TABLE IF EXISTS `gf_users`;
CREATE TABLE `gf_users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '前台用户名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '前台用户密码',
  `mail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '前台用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gf_users
-- ----------------------------
INSERT INTO `gf_users` VALUES (1, 'chenhao', 'e10adc3949ba59abbe56e057f20f883e', 'chenhao_apple@163.com', 'avatars/201901/11/cb4b957a4d4a719fa1d94b510cd2e07f121750.jpg');

-- ----------------------------
-- Table structure for gf_view_times
-- ----------------------------
DROP TABLE IF EXISTS `gf_view_times`;
CREATE TABLE `gf_view_times`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `gid` int(11) NOT NULL COMMENT '浏览商品的id',
  `times` int(11) NOT NULL DEFAULT 1 COMMENT '浏览次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

SET FOREIGN_KEY_CHECKS = 1;
