/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2016-12-07 17:31:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gd_goods
-- ----------------------------
DROP TABLE IF EXISTS `gd_goods`;
CREATE TABLE `gd_goods` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SERIAL` varchar(50) DEFAULT NULL COMMENT '序列号',
  `NAME` varchar(120) DEFAULT NULL COMMENT '名称',
  `STORE` varchar(100) DEFAULT NULL COMMENT '店名',
  `STORE_TYPE` varchar(10) DEFAULT NULL COMMENT '店家类型',
  `IMAGE_PATH` varchar(200) DEFAULT NULL COMMENT '图片地址',
  `PRICE` decimal(10,2) DEFAULT NULL COMMENT '原价',
  `DISCOUNT` decimal(10,2) DEFAULT NULL COMMENT '优惠价',
  `TORDER` varchar(200) DEFAULT NULL COMMENT '淘口令',
  `LINK1` varchar(200) DEFAULT NULL COMMENT '链接1',
  `LINK2` varchar(200) DEFAULT NULL COMMENT '链接2',
  `LINK3` varchar(200) DEFAULT NULL COMMENT '链接3',
  `START_TIME` datetime DEFAULT NULL COMMENT '开始时间',
  `END_TIME` datetime DEFAULT NULL COMMENT '结束时间',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='商品';
