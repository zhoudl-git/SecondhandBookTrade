/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.7.26 : Database - secondbooktrade
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`secondbooktrade` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `secondbooktrade`;

/*Table structure for table `tb_function` */

DROP TABLE IF EXISTS `tb_function`;

CREATE TABLE `tb_function` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '姓名',
  `parent_id` bigint(20) NOT NULL COMMENT '父节点ID',
  `url` varchar(128) NOT NULL COMMENT '模块URL',
  `serial_num` int(11) NOT NULL,
  `accordion` int(11) NOT NULL,
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_function` */

/*Table structure for table `tb_image` */

DROP TABLE IF EXISTS `tb_image`;

CREATE TABLE `tb_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '轮播图ID',
  `url` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '图片路径',
  `link` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '图片链接地址',
  `STATUS` int(1) DEFAULT '1' COMMENT '图片状态 1 添加到首页轮播 2 禁止轮播',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='轮播图管理表';

/*Data for the table `tb_image` */

/*Table structure for table `tb_item` */

DROP TABLE IF EXISTS `tb_item`;

CREATE TABLE `tb_item` (
  `id` bigint(20) DEFAULT NULL COMMENT '书籍ID 同时也是书籍编号',
  `title` varchar(100) DEFAULT NULL COMMENT '书籍名称',
  `sell_point` varchar(500) DEFAULT NULL COMMENT '书籍买点',
  `price` bigint(20) DEFAULT NULL COMMENT '书籍价格 单位 分',
  `num` int(10) DEFAULT NULL COMMENT '库存数量',
  `barcode` varchar(30) DEFAULT NULL COMMENT '书籍条形码',
  `image` varchar(500) DEFAULT NULL COMMENT '书籍图片',
  `cid` bigint(10) DEFAULT NULL COMMENT '所属类目 叶子类目',
  `status` tinyint(4) DEFAULT NULL COMMENT '书籍状态 1 正常 2 下架 3 删除',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  `upload_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_item` */

/*Table structure for table `tb_item_cat` */

DROP TABLE IF EXISTS `tb_item_cat`;

CREATE TABLE `tb_item_cat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父类目ID=0时，代表的是一级的类目',
  `NAME` varchar(50) DEFAULT NULL COMMENT '类目名称',
  `STATUS` int(1) DEFAULT '1' COMMENT '状态。可选值:1(正常),2(删除)',
  `sort_order` int(4) DEFAULT NULL COMMENT '排列序号，表示同级类目的展现次序，如数值相等则按名称次序排列。取值范围:大于零的整数',
  `is_parent` tinyint(1) DEFAULT '1' COMMENT '该类目是否为父类目，1为true，0为false',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`,`STATUS`) USING BTREE,
  KEY `sort_order` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=1183 DEFAULT CHARSET=utf8 COMMENT='书籍类目';

/*Data for the table `tb_item_cat` */

/*Table structure for table `tb_item_desc` */

DROP TABLE IF EXISTS `tb_item_desc`;

CREATE TABLE `tb_item_desc` (
  `item_id` bigint(20) NOT NULL COMMENT '商品ID',
  `item_desc` text COMMENT '商品描述',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品描述表';

/*Data for the table `tb_item_desc` */

/*Table structure for table `tb_item_param_item` */

DROP TABLE IF EXISTS `tb_item_param_item`;

CREATE TABLE `tb_item_param_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `param_data` text COMMENT '参数数据，格式为json格式',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='商品规格和商品的关系表';

/*Data for the table `tb_item_param_item` */

/*Table structure for table `tb_message` */

DROP TABLE IF EXISTS `tb_message`;

CREATE TABLE `tb_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '留言ID',
  `content` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '留言内容',
  `create_time` datetime DEFAULT NULL COMMENT '留言创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '留言更新时间',
  `isDelte` int(1) DEFAULT '1' COMMENT '是否删除',
  `issuer_id` bigint(20) DEFAULT NULL COMMENT '发布人ID',
  `item_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `reply_id` bigint(20) DEFAULT NULL COMMENT '回复人ID',
  `reply_content` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '回复留言内容',
  `status` int(1) DEFAULT '1' COMMENT '备用字段 是否已阅读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='留言表';

/*Data for the table `tb_message` */

/*Table structure for table `tb_order` */

DROP TABLE IF EXISTS `tb_order`;

CREATE TABLE `tb_order` (
  `order_id` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '订单id',
  `payment` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '实付金额。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `payment_type` int(2) DEFAULT NULL COMMENT '支付类型，1、在线支付，2、货到付款',
  `STATUS` int(10) DEFAULT NULL COMMENT '状态：1、未付款，2、已付款，3、未发货，4、已发货，5、交易成功，6、交易关闭',
  `create_time` datetime DEFAULT NULL COMMENT '订单创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '订单更新时间',
  `payment_time` datetime DEFAULT NULL COMMENT '付款时间',
  `consign_time` datetime DEFAULT NULL COMMENT '发货时间',
  `end_time` datetime DEFAULT NULL COMMENT '交易完成时间',
  `close_time` datetime DEFAULT NULL COMMENT '交易关闭时间',
  `shipping_name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '物流名称',
  `shipping_code` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '物流单号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `buyer_message` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '买家留言',
  `buyer_nick` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '买家昵称',
  `addressDetail` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '送货地址',
  `buyer_rate` int(2) DEFAULT NULL COMMENT '买家是否已经评价',
  PRIMARY KEY (`order_id`),
  KEY `create_time` (`create_time`),
  KEY `buyer_nick` (`buyer_nick`),
  KEY `STATUS` (`STATUS`),
  KEY `payment_type` (`payment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tb_order` */

/*Table structure for table `tb_report` */

DROP TABLE IF EXISTS `tb_report`;

CREATE TABLE `tb_report` (
  `id` bigint(20) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `isdelete` int(1) DEFAULT NULL,
  `userid` bigint(21) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_report` */

/*Table structure for table `tb_role` */

DROP TABLE IF EXISTS `tb_role`;

CREATE TABLE `tb_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '角色名称',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_role` */

/*Table structure for table `tb_role_function` */

DROP TABLE IF EXISTS `tb_role_function`;

CREATE TABLE `tb_role_function` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `function_id` bigint(20) NOT NULL,
  `status` int(11) NOT NULL,
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_role_function` */

/*Table structure for table `tb_shop_cat` */

DROP TABLE IF EXISTS `tb_shop_cat`;

CREATE TABLE `tb_shop_cat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '购物车ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `item_id` bigint(20) NOT NULL COMMENT '商品ID',
  `item_name` varchar(100) NOT NULL COMMENT '商品名称',
  `num` int(10) NOT NULL COMMENT '商品数量',
  `price` bigint(20) NOT NULL COMMENT '商品价格',
  `function_id` bigint(20) NOT NULL COMMENT '商品数量',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '创建时间',
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车';

/*Data for the table `tb_shop_cat` */

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `pass` varchar(32) NOT NULL COMMENT '密码，加密存储',
  `phone` varchar(20) DEFAULT NULL COMMENT '注册手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '注册邮箱',
  `sex` varchar(20) NOT NULL COMMENT '性别',
  `identity` varchar(50) DEFAULT NULL COMMENT '身份证号',
  `address` varchar(500) DEFAULT NULL COMMENT '用户常住地址',
  `addressDetail` varchar(500) DEFAULT NULL COMMENT '用户详细地址',
  `interest` varchar(500) DEFAULT NULL COMMENT '用户爱好',
  `created` datetime NOT NULL COMMENT '创建时间',
  `updated` datetime NOT NULL COMMENT '修改时间',
  `birthday` datetime NOT NULL COMMENT '生日',
  `status` varchar(2) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `phone` (`phone`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `tb_user` */

insert  into `tb_user`(`id`,`username`,`pass`,`phone`,`email`,`sex`,`identity`,`address`,`addressDetail`,`interest`,`created`,`updated`,`birthday`,`status`) values
(37,'admin','123456',NULL,NULL,'男',NULL,NULL,NULL,NULL,'2019-08-08 13:41:28','2019-08-08 13:41:26','2019-08-08 13:41:24','1'),
(38,'administrator','123456','18809428954','188@63.com','男','622412499109528743','上海市浦东新区','上海市浦东新区唐镇','阅读','2019-08-08 14:18:32','2019-08-08 14:18:34','2019-08-08 14:18:35','1');

/*Table structure for table `tb_user_role` */

DROP TABLE IF EXISTS `tb_user_role`;

CREATE TABLE `tb_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_user_role` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
