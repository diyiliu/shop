/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2016-11-18 17:37:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bs_detail
-- ----------------------------
DROP TABLE IF EXISTS `bs_detail`;
CREATE TABLE `bs_detail` (
  `ID` varchar(32) NOT NULL,
  `PRO_ID` varchar(32) DEFAULT NULL,
  `PUR_ID` varchar(32) DEFAULT NULL,
  `PRO_COUNT` int(11) DEFAULT NULL,
  `PRO_PRICE` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bs_product
-- ----------------------------
DROP TABLE IF EXISTS `bs_product`;
CREATE TABLE `bs_product` (
  `ID` varchar(32) NOT NULL,
  `PRO_NAME` varchar(50) DEFAULT NULL,
  `PRO_PRICE` decimal(8,2) DEFAULT NULL,
  `PRO_COUNT` int(11) DEFAULT NULL,
  `MARK` varchar(200) DEFAULT NULL,
  `MODIFIED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bs_purchase
-- ----------------------------
DROP TABLE IF EXISTS `bs_purchase`;
CREATE TABLE `bs_purchase` (
  `ID` varchar(32) NOT NULL,
  `USER_ID` varchar(32) DEFAULT NULL,
  `MONEY` decimal(8,2) DEFAULT NULL,
  `ORDER_TIME` datetime DEFAULT NULL,
  `ADDRESS` varchar(120) DEFAULT NULL,
  `SIGN_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ref_permission_resource
-- ----------------------------
DROP TABLE IF EXISTS `ref_permission_resource`;
CREATE TABLE `ref_permission_resource` (
  `ID` varchar(20) DEFAULT NULL COMMENT 'ID',
  `PID` varchar(20) DEFAULT NULL COMMENT '权限ID',
  `RID` varchar(20) DEFAULT NULL COMMENT '资源ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ref_role_group
-- ----------------------------
DROP TABLE IF EXISTS `ref_role_group`;
CREATE TABLE `ref_role_group` (
  `ID` varchar(20) DEFAULT NULL COMMENT 'ID',
  `RID` varchar(20) DEFAULT NULL COMMENT '角色ID',
  `GID` varchar(20) DEFAULT NULL COMMENT '用户组ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ref_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `ref_role_permission`;
CREATE TABLE `ref_role_permission` (
  `ID` varchar(20) DEFAULT NULL COMMENT 'ID',
  `RID` varchar(20) DEFAULT NULL COMMENT '角色ID',
  `PID` varchar(20) DEFAULT NULL COMMENT '权限ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ref_user_ref_group
-- ----------------------------
DROP TABLE IF EXISTS `ref_user_ref_group`;
CREATE TABLE `ref_user_ref_group` (
  `ID` varchar(20) DEFAULT NULL COMMENT 'ID',
  `UID` varchar(20) DEFAULT NULL COMMENT '用户ID',
  `GID` varchar(20) DEFAULT NULL COMMENT '用户组ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ref_user_role
-- ----------------------------
DROP TABLE IF EXISTS `ref_user_role`;
CREATE TABLE `ref_user_role` (
  `ID` varchar(20) DEFAULT NULL COMMENT 'ID',
  `UID` varchar(20) DEFAULT NULL COMMENT '用户ID',
  `RID` varchar(20) DEFAULT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_group`;
CREATE TABLE `sys_group` (
  `ID` varchar(20) DEFAULT NULL COMMENT 'ID',
  `P_GID` varchar(20) DEFAULT NULL COMMENT '父组',
  `NAME` varchar(50) DEFAULT NULL COMMENT '组名称',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `REMARK` varchar(200) DEFAULT NULL COMMENT '描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组表';

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `ID` varchar(20) DEFAULT NULL COMMENT 'ID',
  `ACCESS` varchar(50) DEFAULT NULL COMMENT '权限',
  `REMARK` varchar(200) DEFAULT NULL COMMENT '描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限';

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `ID` varchar(20) DEFAULT NULL COMMENT 'ID',
  `NAME` varchar(50) DEFAULT NULL COMMENT '名称',
  `TYPE` varchar(15) DEFAULT NULL COMMENT '类型',
  `URL` varchar(100) DEFAULT NULL COMMENT 'URL地址',
  `PARENT_ID` varchar(50) DEFAULT NULL COMMENT '父节点',
  `PARENT_IDS` varchar(100) DEFAULT NULL COMMENT '父节点组',
  `SORT` int(5) DEFAULT NULL COMMENT '排序',
  `AVAILABLE` tinyint(1) DEFAULT NULL COMMENT '是否生效'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源';

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ID` varchar(20) DEFAULT NULL COMMENT 'ID',
  `NAME` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `REMARK` varchar(200) DEFAULT NULL COMMENT '描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT=' 角色表';

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `ID` varchar(20) DEFAULT NULL COMMENT 'ID',
  `LOGINNAME` varchar(50) DEFAULT NULL COMMENT '用户账号',
  `PASSWORD` varchar(100) DEFAULT NULL COMMENT '用户密码',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `LOGIN_TIME` datetime DEFAULT NULL COMMENT '登录时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT=' 用户表';
