/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50631
Source Host           : 127.0.0.1:3306
Source Database       : csair_eshop

Target Server Type    : MYSQL
Target Server Version : 50631
File Encoding         : 65001

Date: 2017-12-01 16:03:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for csair_brand
-- ----------------------------
DROP TABLE IF EXISTS `csair_brand`;
CREATE TABLE `csair_brand` (
  `brand_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '品牌id',
  `brand_name` varchar(100) DEFAULT NULL COMMENT '品牌名称',
  `brand_logo` varchar(100) DEFAULT NULL COMMENT 'logo图片',
  `brand_logo_thumb` varchar(100) DEFAULT NULL COMMENT 'logo图片缩略图',
  `brand_website` varchar(100) DEFAULT NULL COMMENT '品牌官网地址',
  `brand_desc` text COMMENT '品牌描述',
  `brand_order` int(5) DEFAULT NULL COMMENT '品牌排序',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 0-停用，1-启用',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `add_by` int(5) DEFAULT NULL COMMENT '添加人',
  PRIMARY KEY (`brand_id`),
  KEY `name_index` (`brand_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csair_brand
-- ----------------------------
INSERT INTO `csair_brand` VALUES ('9', '免税品', 'bd861e694ece4fa2b1f30d960b4afc27.jpg', 'small_bd861e694ece4fa2b1f30d960b4afc27.jpg', 'www.miansui.com', '免税&lt;img src=&quot;/image/e815704761784844af388e18776c9ceb.png&quot; alt=&quot;e815704761784844af388e18776c9ceb.png&quot;&gt;', '1', '1', null, null);
INSERT INTO `csair_brand` VALUES ('10', '跨境购', 'bd861e694ece4fa2b1f30d960b4afc27.jpg', 'small_bd861e694ece4fa2b1f30d960b4afc27.jpg', 'www.kuajinggou.com', '跨境购', '211111111', '1', null, null);
INSERT INTO `csair_brand` VALUES ('11', '航空精品', '072115bf1c9049678e6d6f76d5d40f6c.jpg', 'small_072115bf1c9049678e6d6f76d5d40f6c.jpg', 'www.hkjp.com', '航空精品', '3', '1', null, null);
INSERT INTO `csair_brand` VALUES ('12', '航易购', 'bd861e694ece4fa2b1f30d960b4afc27.jpg', 'small_c98de6a79f9740bda809b64b555e9674.jpg', 'www.hyg.com', '航易购', '4', '1', '2017-06-20 17:35:10', '3');
INSERT INTO `csair_brand` VALUES ('14', '小米', 'bd861e694ece4fa2b1f30d960b4afc27.jpg', 'small_bd861e694ece4fa2b1f30d960b4afc27.jpg', 'http://www.baidu.com', '&lt;img src=&quot;/html/img/0d24a521ac384c75a45dc3c42172db64.jpg&quot; alt=&quot;undefined&quot;&gt;1222&lt;u&gt;222222222211&lt;/u&gt;1111111111111', '10', '1', null, null);

-- ----------------------------
-- Table structure for csair_certificate
-- ----------------------------
DROP TABLE IF EXISTS `csair_certificate`;
CREATE TABLE `csair_certificate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='证书表_类目二级关联';

-- ----------------------------
-- Records of csair_certificate
-- ----------------------------
INSERT INTO `csair_certificate` VALUES ('1', '单身证书', '单身', '3', '2017-07-24 18:25:12', null);
INSERT INTO `csair_certificate` VALUES ('2', '四级证书', '四级1', '3', '2017-07-24 20:32:44', '2017-07-24 20:39:46');
INSERT INTO `csair_certificate` VALUES ('15', '七级证书', '七级1', '3', '2017-07-31 14:15:28', '2017-07-31 14:15:35');
INSERT INTO `csair_certificate` VALUES ('16', '卫生证书', '12', '3', '2017-07-31 14:15:48', null);

-- ----------------------------
-- Table structure for csair_log_operation
-- ----------------------------
DROP TABLE IF EXISTS `csair_log_operation`;
CREATE TABLE `csair_log_operation` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `author` varchar(80) NOT NULL COMMENT '操作人员id',
  `action` varchar(200) NOT NULL COMMENT '动作',
  `content` text COMMENT '内容',
  `op_time` datetime NOT NULL COMMENT '操作时间',
  `op_ip` varchar(255) DEFAULT NULL COMMENT '操作的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3025 DEFAULT CHARSET=utf8 COMMENT='后台操作记录日志';

-- ----------------------------
-- Records of csair_log_operation
-- ----------------------------
INSERT INTO `csair_log_operation` VALUES ('22', '3', '修改菜单', '菜单id:74菜单名：营销中二级菜单', '2017-07-11 15:35:55', '10.108.151.11');
INSERT INTO `csair_log_operation` VALUES ('23', '3', '修改菜单', '菜单id:72菜单名：cms二级管理', '2017-07-11 15:37:01', '10.108.151.11');
INSERT INTO `csair_log_operation` VALUES ('24', '3', '修改菜单', '菜单id:72菜单名：cms二级管理2', '2017-07-11 15:37:58', '10.108.151.11');
INSERT INTO `csair_log_operation` VALUES ('25', '3', '添加菜单', '菜单id:84     菜单名：测试用菜单', '2017-07-11 16:03:29', '10.108.151.11');
INSERT INTO `csair_log_operation` VALUES ('26', '3', '添加菜单', '菜单id:85     菜单名：管理权限', '2017-07-11 17:28:18', '10.108.151.11');
INSERT INTO `csair_log_operation` VALUES ('27', '3', '修改菜单', '菜单id:50     菜单名：用户账号', '2017-07-11 17:28:38', '10.108.151.11');
INSERT INTO `csair_log_operation` VALUES ('28', '3', '修改菜单', '菜单id:59     菜单名：新建账号', '2017-07-11 17:28:50', '10.108.151.11');
INSERT INTO `csair_log_operation` VALUES ('29', '3', '删除菜单', '菜单id:85菜单名：管理权限', '2017-07-11 17:31:37', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('30', '3', '新增用户', '用户邮箱aaa@qq.com；用户id22', '2017-07-12 11:39:16', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('31', '3', '修改角色权限', '角色的id2；增加角色的id集合：152,151；删除角色的id集合：63,64,65,116,70,63,64,65,66,67,68,69,70,71,73,74,75,96,98,99,107,111,116,119', '2017-07-12 11:40:49', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('32', '3', '新增权限', '权限的id：null权限的名字：查看菜单:交易查询  权限的url：/tr', '2017-07-12 11:46:50', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('33', '3', '添加菜单', '菜单id:86     菜单名：交易查询', '2017-07-12 11:46:50', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('34', '3', '删除菜单', '菜单id:42菜单名：商品列表', '2017-07-12 11:46:58', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('35', '3', '修改用户', '用户邮箱alice@test.com；用户id3', '2017-07-12 11:51:44', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('36', '2', '新增权限', '权限的id：135权限的名字：查看菜单:交易审批  权限的url：/trade/list', '2017-07-12 14:22:24', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('37', '2', '修改菜单', '菜单id:79；菜单名：交易审批；菜单的url：/trade/list', '2017-07-12 14:22:24', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('38', '3', '修改角色权限', '角色的id2；增加角色的id集合：144,143', '2017-07-12 15:01:59', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('39', '3', '新增权限', '权限的id：156权限的名字：修改自己的密码  权限的url：/user/changePassword', '2017-07-12 16:36:44', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('40', '3', '修改角色权限', '角色的id2；增加角色的id集合：156,139', '2017-07-12 16:37:09', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2085', '3', '新增用户', '用户邮箱：2112211221；用户id：23', '2017-07-18 10:02:02', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2086', '3', '修改用户', '用户邮箱：ilh；用户id：17', '2017-07-18 10:05:48', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2087', '2', '删除菜单', '菜单id:68；菜单名：建立模型；菜单的url：/model/add', '2017-07-18 11:39:34', '10.108.151.11');
INSERT INTO `csair_log_operation` VALUES ('2088', '3', '新增用户', '用户邮箱：testCerate@test.com；用户id：24', '2017-07-18 11:57:17', '10.108.151.11');
INSERT INTO `csair_log_operation` VALUES ('2089', '3', '删除菜单', '菜单id:99；菜单名：合同管理；菜单的url：null', '2017-07-18 16:42:03', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2090', '3', '删除菜单', '菜单id:101；菜单名：商家续约；菜单的url：null', '2017-07-18 16:42:11', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2091', '3', '删除菜单', '菜单id:102；菜单名：保证金管理；菜单的url：null', '2017-07-18 16:42:18', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2092', '3', '删除角色下用户', '角色名字：编辑；被删除的用户的id3,12,13', '2017-07-18 16:54:12', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2093', '3', '添加商户', '：操作人id:3', '2017-07-19 09:06:59', '；操作人Ip：0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2094', '3', '修改商户', '：操作人id:3', '2017-07-19 09:07:35', '；操作人Ip：0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2095', '3', '删除菜单', '菜单id:91；菜单名：店铺管理；菜单的url：/shop/addshop', '2017-07-19 09:36:09', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2096', '3', '删除菜单', '菜单id:43；菜单名：发布商品；菜单的url：null', '2017-07-19 09:36:28', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2097', '3', '删除菜单', '菜单id:65；菜单名：删除商品；菜单的url：/good/delete', '2017-07-19 09:36:34', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2098', '3', '短信服务配置', '用户名：aaaaa发件人姓名：cccc', '2017-07-19 09:39:28', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2099', '3', '短信服务配置', '发送账号：123', '2017-07-19 09:44:26', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2100', '3', '新增权限', '权限的id：181权限的名字：查看菜单:入驻店铺信息管理  权限的url：/shop/selectshop', '2017-07-19 10:02:42', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2101', '3', '新增权限', '权限的id：182权限的名字：查看菜单:入驻店铺信息管理  权限的url：/shop/selectshop', '2017-07-19 10:02:57', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2102', '3', '删除菜单', '菜单id:115；菜单名：入驻店铺信息管理；菜单的url：/shop/selectshop', '2017-07-19 10:03:21', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2103', '3', '新增权限', '权限的id：183权限的名字：查看菜单:店铺信息审核  权限的url：', '2017-07-19 10:03:58', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2104', '3', '新增权限', '权限的id：184权限的名字：查看菜单:商家信息管理  权限的url：', '2017-07-19 10:04:31', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2105', '3', '新增权限', '权限的id：185权限的名字：查看菜单:资质变更审核列表  权限的url：', '2017-07-19 10:04:57', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2106', '3', '新增权限', '权限的id：186权限的名字：查看菜单:合同管理  权限的url：', '2017-07-19 10:05:29', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2107', '3', '新增权限', '权限的id：186权限的名字：查看菜单:合同管理  权限的url：', '2017-07-19 10:05:47', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2108', '3', '修改菜单', '菜单id:119；菜单名：合同管理；菜单的url：', '2017-07-19 10:05:47', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2109', '3', '新增权限', '权限的id：187权限的名字：查看菜单:商家续约  权限的url：', '2017-07-19 10:06:09', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2110', '3', '邮箱服务配置', '用户名：1;发件人姓名：<script>alert(\'xss\')</script>', '2017-07-19 10:48:17', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2111', '3', '邮箱服务配置', '用户名：1;发件人姓名：\"><script>alert(&#039;xss&#039;)</script>', '2017-07-19 10:53:19', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2112', '3', '新增权限', '权限的id：145权限的名字：角色编辑页面  权限的url：/role/inputRole', '2017-07-19 11:48:14', '127.0.0.1');
INSERT INTO `csair_log_operation` VALUES ('2113', '3', '新增权限', '权限的id：188权限的名字：修改角色  权限的url：/role/addOrUpdataRole', '2017-07-19 11:49:38', '127.0.0.1');
INSERT INTO `csair_log_operation` VALUES ('2114', '3', '新增权限', '权限的id：189权限的名字：删除角色下用户  权限的url：/role/removeRoleUser', '2017-07-19 14:07:20', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2115', '3', '短信服务配置', '发送账号：1', '2017-07-19 14:28:25', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2116', '3', '短信服务配置', '发送账号：1', '2017-07-19 14:37:17', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2117', '3', '短信服务配置', '发送账号：1', '2017-07-19 14:48:46', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2118', '3', '短信服务配置', '发送账号：1', '2017-07-19 15:08:16', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2119', '3', '短信服务配置', '发送账号：1', '2017-07-19 15:09:08', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2120', '3', '短信服务配置', '发送账号：1', '2017-07-19 15:10:03', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2121', '3', '新增权限', '权限的id：190权限的名字：添加文章  权限的url：/cms/add', '2017-07-19 15:48:42', '10.108.151.11');
INSERT INTO `csair_log_operation` VALUES ('2122', '3', '邮箱服务配置', '用户名：1;发件人姓名：1', '2017-07-19 16:13:12', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2123', '3', '邮箱服务配置', '用户名：1;发件人姓名：1', '2017-07-19 16:13:13', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2124', '3', '邮箱服务配置', '用户名：1;发件人姓名：1', '2017-07-19 16:14:56', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2125', '3', '邮箱服务配置', '用户名：1;发件人姓名：1', '2017-07-19 16:14:58', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2126', '3', '邮箱服务配置', '用户名：1;发件人姓名：1', '2017-07-19 16:15:42', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2127', '3', '邮箱服务配置', '用户名：1;发件人姓名：1', '2017-07-19 16:15:43', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2128', '3', '邮箱服务配置', '用户名：1;发件人姓名：1', '2017-07-19 16:19:46', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2129', '3', '短信服务配置', '发送账号：1', '2017-07-19 16:34:59', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2130', '3', '短信服务配置', '发送账号：<script>', '2017-07-19 16:37:48', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2131', '3', '短信服务配置', '发送账号：1', '2017-07-19 16:58:56', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2132', '3', '短信服务配置', '发送账号：&lt;span&gt;你好&lt;/span&gt;', '2017-07-19 17:01:51', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2133', '3', '短信服务配置', '发送账号：&lt;span&gt;你好&lt;/span&gt;', '2017-07-19 17:05:10', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2134', '3', '短信服务配置', '发送账号：1', '2017-07-19 17:05:47', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2135', '3', '邮箱服务配置', '用户名：1;发件人姓名：1', '2017-07-19 17:09:07', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2136', '3', '短信服务配置', '发送账号：1', '2017-07-19 17:10:57', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2137', '3', '短信服务配置', '发送账号：1', '2017-07-19 17:13:44', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2138', '3', '短信服务配置', '发送账号：1', '2017-07-19 20:14:11', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2139', '3', '短信服务配置', '发送账号：test', '2017-07-19 20:40:12', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2140', '3', '短信服务配置', '发送账号：test', '2017-07-19 20:43:38', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2141', '3', '短信服务配置', '发送账号：sms', '2017-07-19 20:45:46', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2142', '3', '邮箱服务配置', '用户名：email;发件人姓名：email', '2017-07-19 20:46:14', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2143', '3', '短信服务配置', '发送账号：sms', '2017-07-19 20:48:44', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2144', '3', '短信服务配置', '发送账号：1', '2017-07-20 08:41:26', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2145', '3', '短信服务配置', '发送账号：test11', '2017-07-20 08:44:04', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2146', '3', '邮箱服务配置', '用户名：test11;发件人姓名：test11', '2017-07-20 08:44:23', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2147', '3', '新增权限', '权限的id：77权限的名字：查看菜单:商品管理  权限的url：', '2017-07-20 10:43:30', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2148', '3', '修改菜单', '菜单id:2；菜单名：商品管理；菜单的url：', '2017-07-20 10:43:30', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2149', '3', '删除菜单', '菜单id:41；菜单名：商品管理；菜单的url：null', '2017-07-20 10:43:44', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2150', '3', '新增权限', '权限的id：191权限的名字：查看菜单:类目管理  权限的url：/GoodCategory/queryAllGoodCategory', '2017-07-20 10:46:14', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2151', '3', '添加菜单', '菜单id:121；菜单名：类目管理；菜单的url：/GoodCategory/queryAllGoodCategory', '2017-07-20 10:46:14', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2152', '3', '新增权限', '权限的id：191权限的名字：查看菜单:类目管理  权限的url：', '2017-07-20 10:57:37', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2153', '3', '修改菜单', '菜单id:121；菜单名：类目管理；菜单的url：', '2017-07-20 10:57:37', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2154', '3', '新增权限', '权限的id：192权限的名字：查看菜单:类目列表  权限的url：/GoodCategory/queryAllGoodCategory', '2017-07-20 10:58:14', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2155', '3', '添加菜单', '菜单id:122；菜单名：类目列表；菜单的url：/GoodCategory/queryAllGoodCategory', '2017-07-20 10:58:14', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2156', '3', '新增权限', '权限的id：193权限的名字：查看菜单:短信测试  权限的url：/messsage/sendSms', '2017-07-20 15:01:56', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2157', '3', '添加菜单', '菜单id:123；菜单名：短信测试；菜单的url：/messsage/sendSms', '2017-07-20 15:01:56', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2158', '3', '新增权限', '权限的id：194权限的名字：查看菜单:短信测试  权限的url：message/sendSms', '2017-07-20 15:02:55', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2159', '3', '添加菜单', '菜单id:124；菜单名：短信测试；菜单的url：message/sendSms', '2017-07-20 15:02:55', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2160', '3', '添加类目', '类目id:7 ; 类目名字： null 。', '2017-07-20 19:23:15', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2161', '3', '添加类目', '类目id:8 ; 类目名字： null 。', '2017-07-20 19:25:28', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2162', '3', '添加类目', '类目id:9 ; 类目名字： 电子商品 。', '2017-07-20 19:40:59', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2163', '3', '添加类目', '类目id:10 ; 类目名字： 1 。', '2017-07-20 19:49:59', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2164', '3', '添加类目', '类目id:11 ; 类目名字： 衣服 。', '2017-07-20 19:52:44', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2165', '3', '添加类目', '类目id:12 ; 类目名字： null 。', '2017-07-20 20:19:56', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2166', '3', '添加类目', '类目id:13 ; 类目名字： null 。', '2017-07-20 20:23:30', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2167', '3', '添加类目', '类目id:14 ; 类目名字： null 。', '2017-07-20 20:25:19', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2168', '3', '添加类目', '类目id:15 ; 类目名字： 品牌笔记本 。', '2017-07-20 20:58:55', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2169', '3', '添加类目', '类目id:16 ; 类目名字： 上衣 。', '2017-07-21 08:42:02', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2170', '3', '新增权限', '权限的id：185权限的名字：查看菜单:资质变更审核列表  权限的url：/shop/selectshop', '2017-07-21 11:15:36', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2171', '3', '修改菜单', '菜单id:118；菜单名：资质变更审核列表；菜单的url：/shop/selectshop', '2017-07-21 11:15:37', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2172', '3', '删除菜单', '菜单id:73；菜单名：cms三级菜单1；菜单的url：null', '2017-07-21 11:38:52', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2173', '3', '新增权限', '权限的id：127权限的名字：查看菜单:文章  权限的url：/article/Article_list', '2017-07-21 11:41:48', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2174', '3', '修改菜单', '菜单id:72；菜单名：文章；菜单的url：/article/Article_list', '2017-07-21 11:41:49', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2175', '3', '新增权限', '权限的id：126权限的名字：查看菜单:文章分类  权限的url：/articleclassify/ArtiCleclassify_list', '2017-07-21 11:47:04', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2176', '3', '修改菜单', '菜单id:71；菜单名：文章分类；菜单的url：/articleclassify/ArtiCleclassify_list', '2017-07-21 11:47:04', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2177', '3', '新增权限', '权限的id：195权限的名字：查看菜单:品牌管理  权限的url：/brand/addbrand', '2017-07-21 11:52:21', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2178', '3', '添加菜单', '菜单id:125；菜单名：品牌管理；菜单的url：/brand/addbrand', '2017-07-21 11:52:21', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2179', '3', '新增权限', '权限的id：195权限的名字：查看菜单:添加品牌  权限的url：/brand/addbrand', '2017-07-21 14:14:24', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2180', '3', '修改菜单', '菜单id:125；菜单名：添加品牌；菜单的url：/brand/addbrand', '2017-07-21 14:14:24', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2181', '3', '添加类目', '类目id:18 ; 类目名字： 小米笔记本 。', '2017-07-21 14:25:08', '127.0.0.1');
INSERT INTO `csair_log_operation` VALUES ('2182', '3', '添加类目', '类目id:19 ; 类目名字： 小米笔记本 。', '2017-07-21 14:26:53', '127.0.0.1');
INSERT INTO `csair_log_operation` VALUES ('2183', '3', '删除菜单', '菜单id:123；菜单名：短信测试；菜单的url：/messsage/sendSms', '2017-07-24 09:37:16', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2184', '3', '删除菜单', '菜单id:124；菜单名：短信测试；菜单的url：message/sendSms', '2017-07-24 09:37:33', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2185', '3', '短信服务配置', '发送账号：null', '2017-07-24 11:41:13', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2186', '3', '短信服务配置', '发送账号：null', '2017-07-24 11:45:21', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2187', '3', '短信服务配置', '发送账号：null', '2017-07-24 11:45:23', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2188', '3', '新增权限', '权限的id：196权限的名字：查看菜单:字典库管理  权限的url：', '2017-07-24 16:15:10', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2189', '3', '添加菜单', '菜单id:126；菜单名：字典库管理；菜单的url：', '2017-07-24 16:15:10', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2190', '3', '新增权限', '权限的id：197权限的名字：查看菜单:类目证书管理  权限的url：/certificate/list', '2017-07-24 16:16:55', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2191', '3', '添加菜单', '菜单id:127；菜单名：类目证书管理；菜单的url：/certificate/list', '2017-07-24 16:16:55', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2192', '3', '短信服务配置', '发送账号：345', '2017-07-24 17:26:01', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2193', '3', '邮箱服务配置', '用户名：uhiu;发件人姓名：iii', '2017-07-24 17:28:45', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2194', '3', '删除文章', '：操作人id:3', '2017-07-24 18:50:22', '；操作人Ip：0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2195', '3', '删除文章', '：操作人id:3', '2017-07-24 18:52:27', '；操作人Ip：0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2196', '3', '删除文章', '：操作人id:3', '2017-07-24 18:55:42', '；操作人Ip：0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2197', '3', '添加文章', '：操作人id:3', '2017-07-24 19:23:29', '；操作人Ip：0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2198', '3', '添加文章', '：操作人id:3', '2017-07-24 19:33:21', '；操作人Ip：0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2199', '3', '添加证书', '证书id:10;', '2017-07-24 19:41:01', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2200', '3', '添加证书', '证书id:9;', '2017-07-24 19:41:07', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2201', '3', '添加证书', '证书id:8;', '2017-07-24 19:41:09', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2202', '3', '添加证书', '证书id:7;', '2017-07-24 19:41:11', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2203', '3', '添加证书', '证书id:6;', '2017-07-24 19:41:20', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2204', '3', '短信服务配置', '发送账号：null', '2017-07-24 19:44:42', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2205', '3', '修改文章', '：操作人id:3', '2017-07-24 20:00:47', '；操作人Ip：0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2206', '3', '添加证书', '证书id:2;', '2017-07-24 20:02:36', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2207', '3', '修改文章', '：操作人id:3', '2017-07-24 20:03:25', '；操作人Ip：0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2208', '3', '修改文章', '：操作人id:3', '2017-07-24 20:05:29', '；操作人Ip：0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2209', '3', '修改文章', '：操作人id:3', '2017-07-24 20:08:04', '；操作人Ip：0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2210', '3', '短信服务配置', '发送账号：null', '2017-07-24 20:08:46', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2211', '3', '短信服务配置', '发送账号：null', '2017-07-24 20:16:31', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2212', '3', '修改文章', '：操作人id:3', '2017-07-24 20:23:35', '；操作人Ip：0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2213', '3', '短信服务配置', '发送账号：null', '2017-07-24 20:23:59', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2214', '3', '修改证书', '证书id:2;证书名字null;', '2017-07-24 20:27:14', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2215', '3', '修改证书', '证书id:2;证书名字四级证书;', '2017-07-24 20:29:17', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2216', '3', '短信服务配置', '发送账号：null', '2017-07-24 20:31:31', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2217', '3', '修改证书', '证书id:2;证书名字四级证书;', '2017-07-24 20:34:26', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2218', '3', '修改证书', '证书id:2;证书名字四级证书;', '2017-07-24 20:36:33', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2219', '3', '短信服务配置', '发送账号：null', '2017-07-24 20:37:09', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2220', '3', '短信服务配置', '发送账号：null', '2017-07-24 20:39:37', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2221', '3', '修改证书', '证书id:2;证书名字四级证书;', '2017-07-24 20:39:46', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2222', '3', '添加证书', '证书id:5;', '2017-07-24 20:58:24', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2223', '3', '添加文章分类', '：操作人id:3', '2017-07-25 10:41:42', '；操作人Ip：0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2224', '3', '添加文章分类', '：操作人id:3', '2017-07-25 10:52:31', '；操作人Ip：0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2225', '3', '添加文章分类', '：操作人id:3', '2017-07-25 11:15:02', '；操作人Ip：0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2226', '3', '修改文章分类', '：操作人id:3', '2017-07-25 11:15:33', '；操作人Ip：0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2227', '3', '短信服务配置', '发送账号：null', '2017-07-25 11:33:18', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2228', '3', '删除文章分类', '：操作人id:3', '2017-07-25 11:35:57', '；操作人Ip：0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2229', '3', '短信服务配置', '发送账号：null', '2017-07-25 14:31:02', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2230', '3', '邮箱服务配置', '用户名：emailusername;发件人姓名：null', '2017-07-25 14:31:39', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2231', '3', '邮箱服务配置', '用户名：emailusername;发件人姓名：null', '2017-07-25 14:34:05', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2232', '3', '邮箱服务配置', '用户名：emailusername123456;发件人姓名：null', '2017-07-25 14:34:23', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2233', '3', '添加证书', '证书id:11;', '2017-07-25 15:17:39', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2234', '3', '添加证书', '证书id:12;', '2017-07-25 15:24:11', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2235', '3', '添加证书', '证书id:13;证书名字12;', '2017-07-25 15:24:53', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2236', '3', '添加证书', '证书id:13;', '2017-07-25 15:25:00', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2237', '3', '添加证书', '证书id:13;', '2017-07-25 15:25:02', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2238', '3', '添加证书', '证书id:14;证书名字12222222;', '2017-07-25 15:25:18', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2239', '3', '添加证书', '证书id:14;', '2017-07-25 15:25:27', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2240', '3', '添加证书', '证书id:14;', '2017-07-25 15:25:28', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2241', '3', '邮箱服务配置', '用户名：测试测试;发件人姓名：null', '2017-07-25 15:53:58', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2242', '3', '短信服务配置', '发送账号：null', '2017-07-25 15:54:36', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2243', '3', '短信服务配置', '发送账号：null', '2017-07-25 16:00:56', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2244', '3', '短信服务配置', '发送账号：null', '2017-07-25 16:01:17', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2245', '3', '邮箱服务配置', '用户名：测试测试;发件人姓名：null', '2017-07-25 16:01:46', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2246', '3', '邮箱服务配置', '用户名：测试测试;发件人姓名：null', '2017-07-25 16:02:08', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2247', '3', '短信服务配置', '发送账号：null', '2017-07-25 16:03:16', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2248', '3', '新增权限', '权限的id：195权限的名字：查看菜单:品牌管理  权限的url：', '2017-07-25 16:09:37', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2249', '3', '修改菜单', '菜单id:125；菜单名：品牌管理；菜单的url：', '2017-07-25 16:09:37', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2250', '3', '新增权限', '权限的id：198权限的名字：查看菜单:品牌列表  权限的url：/brand/list', '2017-07-25 16:10:37', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2251', '3', '添加菜单', '菜单id:129；菜单名：品牌列表；菜单的url：/brand/list', '2017-07-25 16:10:37', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2252', '3', '新增权限', '权限的id：199权限的名字：查看菜单:会员管理  权限的url：', '2017-07-25 16:13:47', '192.168.1.222');
INSERT INTO `csair_log_operation` VALUES ('2253', '3', '添加菜单', '菜单id:130；菜单名：会员管理；菜单的url：', '2017-07-25 16:13:48', '192.168.1.222');
INSERT INTO `csair_log_operation` VALUES ('2254', '3', '新增权限', '权限的id：200权限的名字：查看菜单:会员列表  权限的url：', '2017-07-25 16:14:56', '192.168.1.222');
INSERT INTO `csair_log_operation` VALUES ('2255', '3', '添加菜单', '菜单id:131；菜单名：会员列表；菜单的url：', '2017-07-25 16:14:56', '192.168.1.222');
INSERT INTO `csair_log_operation` VALUES ('2256', '3', '新增权限', '权限的id：201权限的名字：查看菜单:会员信息  权限的url：', '2017-07-25 16:15:23', '192.168.1.222');
INSERT INTO `csair_log_operation` VALUES ('2257', '3', '添加菜单', '菜单id:132；菜单名：会员信息；菜单的url：', '2017-07-25 16:15:24', '192.168.1.222');
INSERT INTO `csair_log_operation` VALUES ('2258', '3', '新增权限', '权限的id：202权限的名字：查看菜单:会员信息  权限的url：', '2017-07-25 16:16:44', '192.168.1.222');
INSERT INTO `csair_log_operation` VALUES ('2259', '3', '添加菜单', '菜单id:133；菜单名：会员信息；菜单的url：', '2017-07-25 16:16:44', '192.168.1.222');
INSERT INTO `csair_log_operation` VALUES ('2260', '3', '删除菜单', '菜单id:133；菜单名：会员信息；菜单的url：null', '2017-07-25 16:17:31', '192.168.1.222');
INSERT INTO `csair_log_operation` VALUES ('2261', '3', '短信服务配置', '配置用户名：EMALL', '2017-07-25 16:16:50', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2262', '3', '添加证书', '证书id:4;', '2017-07-25 16:26:55', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2263', '3', '添加证书', '证书id:3;', '2017-07-25 16:27:32', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2264', '3', '添加证书', '证书id:3;', '2017-07-25 16:27:34', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2265', '3', '删除文章分类', '：操作人id:3', '2017-07-25 16:40:46', '；操作人Ip：0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2266', '3', '删除文章分类', '：操作人id:3', '2017-07-25 16:40:56', '；操作人Ip：0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2267', '3', '新增权限', '权限的id：197权限的名字：查看菜单:类目证书管理  权限的url：/certificate/list', '2017-07-25 18:40:11', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2268', '3', '修改菜单', '菜单id:127；菜单名：类目证书管理；菜单的url：/certificate/list', '2017-07-25 18:40:11', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2269', '3', '短信服务配置', '配置用户名：EMALL21313123', '2017-07-25 18:59:57', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2270', '3', '新增权限', '权限的id：200权限的名字：查看菜单:会员列表  权限的url：/user/list', '2017-07-25 19:06:07', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2271', '3', '修改菜单', '菜单id:131；菜单名：会员列表；菜单的url：/user/list', '2017-07-25 19:06:07', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2272', '3', '删除菜单', '菜单id:132；菜单名：会员信息；菜单的url：null', '2017-07-25 19:11:23', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2273', '3', '添加商户', '：操作人id:3', '2017-07-25 05:29:15', '；操作人Ip：0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2274', '3', '添加商户', '：操作人id:3', '2017-07-25 05:29:43', '；操作人Ip：0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2275', '3', '新增用户', '用户邮箱：ateate；用户id：25', '2017-07-26 09:19:33', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2276', '3', '修改商户', '：操作人id:3', '2017-07-25 19:59:59', '；操作人Ip：0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2277', '3', '添加商户', '：操作人id:3', '2017-07-25 20:00:35', '；操作人Ip：0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2278', '3', '短信服务配置', '配置用户名：EMALL', '2017-07-26 11:52:18', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2279', '3', '邮箱服务配置', '配置用户名ID:EMALL', '2017-07-26 14:17:09', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2280', '3', '添加品牌', '品牌名字：小米', '2017-07-26 14:46:12', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2281', '3', '添加品牌', '品牌名字：华为', '2017-07-26 15:24:24', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2282', '3', '添加品牌', '品牌名字：华为', '2017-07-26 15:26:57', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2283', '3', '新增权限', '权限的id：187权限的名字：查看菜单:商家续约  权限的url：', '2017-07-26 16:40:52', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2284', '3', '修改菜单', '菜单id:120；菜单名：商家续约；菜单的url：', '2017-07-26 16:40:52', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2285', '3', '添加品牌', '品牌名字：小米', '2017-07-26 17:27:30', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2584', '3', '删除文章', '：操作人id:3', '2017-07-27 10:03:55', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2585', '3', '添加商户', '：操作人id:3', '2017-07-27 10:43:44', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2586', '3', '添加商户', '：操作人id:3', '2017-07-27 10:46:17', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2587', '3', '新增权限', '权限的id：186权限的名字：查看菜单:合同管理  权限的url：', '2017-07-27 12:00:45', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2588', '3', '修改菜单', '菜单id:119；菜单名：合同管理；菜单的url：', '2017-07-27 12:00:45', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2589', '3', '删除菜单', '菜单id:5；菜单名：模型管理；菜单的url：null', '2017-07-27 14:23:54', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2590', '3', '批量删除品牌', '品牌ID：（17）。', '2017-07-27 14:33:43', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2591', '3', '批量删除品牌', '品牌ID：（19,20）。', '2017-07-27 14:35:34', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2592', '3', '批量删除品牌', '品牌ID：（22,23,24,25,26）。', '2017-07-27 14:38:58', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2593', '3', '批量删除品牌', '品牌ID：（18）。', '2017-07-27 14:39:12', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2594', '3', '添加商户', '：操作人id:3', '2017-07-27 14:41:01', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2595', '3', '添加商户', '：操作人id:3', '2017-07-27 14:43:35', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2596', '3', '批量删除品牌', '品牌ID：（16）。', '2017-07-27 14:48:14', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2597', '3', '删除商户', '：操作人id:3', '2017-07-27 14:59:51', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2598', '3', '批量删除品牌', '品牌ID：（29,30,31,32,33,34,35,36,37,38）。', '2017-07-27 15:02:15', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2599', '3', '批量删除品牌', '品牌ID：（39,40,41,42,43,44,45,46,47,48）。', '2017-07-27 15:02:25', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2600', '3', '批量删除品牌', '品牌ID：（28）。', '2017-07-27 15:19:22', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2601', '3', '修改商户', '：操作人id:3', '2017-07-27 16:01:26', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2602', '3', '修改商户', '：操作人id:3', '2017-07-27 16:01:36', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2603', '3', '修改商户', '：操作人id:3', '2017-07-27 16:07:31', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2604', '3', '修改商户', '：操作人id:3', '2017-07-27 16:07:54', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2605', '3', '新增权限', '权限的id：185权限的名字：查看菜单:资质变更审核列表  权限的url：', '2017-07-27 16:34:43', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2606', '3', '修改菜单', '菜单id:118；菜单名：资质变更审核列表；菜单的url：', '2017-07-27 16:34:43', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2607', '3', '新增权限', '权限的id：147权限的名字：用户查询  权限的url：/user/list||/user/downloadUser', '2017-07-27 16:34:59', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2608', '3', '新增权限', '权限的id：181权限的名字：查看菜单:入驻店铺信息管理  权限的url：', '2017-07-27 16:36:02', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2609', '3', '修改菜单', '菜单id:114；菜单名：入驻店铺信息管理；菜单的url：', '2017-07-27 16:36:02', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2610', '3', '新增权限', '权限的id：181权限的名字：查看菜单:入驻店铺信息管理  权限的url：', '2017-07-27 16:36:45', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2611', '3', '修改菜单', '菜单id:114；菜单名：入驻店铺信息管理；菜单的url：', '2017-07-27 16:36:45', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2612', '3', '新增权限', '权限的id：203权限的名字：查看菜单:商铺增删该查操作  权限的url：/shop/selectshop', '2017-07-27 16:39:33', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2613', '3', '添加菜单', '菜单id:134；菜单名：商铺增删该查操作；菜单的url：/shop/selectshop', '2017-07-27 16:39:33', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2614', '3', '新增权限', '权限的id：186权限的名字：查看菜单:合同管理  权限的url：', '2017-07-27 16:55:33', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2615', '3', '修改菜单', '菜单id:119；菜单名：合同管理；菜单的url：', '2017-07-27 16:55:33', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2616', '3', '新增权限', '权限的id：204权限的名字：查看菜单:资质变更审核列表  权限的url：', '2017-07-27 16:57:39', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2617', '3', '添加菜单', '菜单id:135；菜单名：资质变更审核列表；菜单的url：', '2017-07-27 16:57:40', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2618', '3', '新增权限', '权限的id：181权限的名字：查看菜单:入驻店铺信息管理  权限的url：', '2017-07-27 16:58:25', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2619', '3', '修改菜单', '菜单id:114；菜单名：入驻店铺信息管理；菜单的url：', '2017-07-27 16:58:25', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2620', '3', '新增权限', '权限的id：205权限的名字：编辑品牌  权限的url：/editBrand||/brand/toEditBrand', '2017-07-27 17:17:23', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2621', '3', '新增权限', '权限的id：206权限的名字：删除品牌  权限的url：/brand/batchDeleteBrand', '2017-07-27 17:31:40', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2622', '3', '新增权限', '权限的id：207权限的名字：编辑品牌  权限的url：/editBrand', '2017-07-27 17:32:54', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2623', '3', '新增权限', '权限的id：207权限的名字：编辑品牌  权限的url：/brand/editBrand', '2017-07-27 17:33:31', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2624', '3', '修改角色权限', '角色的id2；删除角色的id集合：80,125', '2017-07-28 10:47:38', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2625', '3', '修改品牌', '品牌ID:9；品牌名字：免税品', '2017-07-28 10:52:41', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2626', '3', '修改权限', '权限的id：195权限的名字：查看菜单:品牌管理  权限的url：/brand/list', '2017-07-28 10:54:34', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2627', '3', '修改菜单', '菜单id:125；菜单名：品牌管理；菜单的url：/brand/list', '2017-07-28 10:54:35', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2628', '3', '添加商户', '：操作人id:3', '2017-07-28 14:35:15', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2629', '3', '添加商户', '：操作人id:3', '2017-07-28 14:54:34', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2630', '3', '添加商户', '：操作人id:3', '2017-07-28 15:01:19', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2631', '3', '审核通过创建用户管理商户', '：操作人id:3', '2017-07-28 15:01:20', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2632', '3', '删除菜单', '菜单id:74；菜单名：营销中二级菜单；菜单的url：yxzx/ef333', '2017-07-28 15:09:39', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2633', '3', '删除菜单', '菜单id:69；菜单名：测试用根菜单；菜单的url：/test/a', '2017-07-28 15:10:23', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2634', '3', '新增权限', '权限的id：204权限的名字：查看菜单:资质变更审核列表  权限的url：/aptitude/list', '2017-07-28 15:50:29', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2635', '3', '修改菜单', '菜单id:135；菜单名：资质变更审核列表；菜单的url：/aptitude/list', '2017-07-28 15:50:29', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2636', '3', '添加商户', '：操作人id:3', '2017-07-28 16:14:12', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2637', '3', '审核通过创建用户管理商户', '：操作人id:3', '2017-07-28 16:14:12', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2638', '3', '添加商户', '：操作人id:3', '2017-07-28 16:18:20', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2639', '3', '审核通过创建用户管理商户', '：操作人id:3', '2017-07-28 16:18:20', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2640', '3', '添加商户', '：操作人id:3', '2017-07-28 16:21:28', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2641', '3', '审核通过创建用户管理商户', '：操作人id:3', '2017-07-28 16:21:29', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2642', '3', '添加商户', '操作人id:3', '2017-07-28 16:39:36', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2643', '3', '审核通过创建用户管理商户', '操作人id:3', '2017-07-28 16:39:36', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2644', '3', '添加商户', '操作人id:3', '2017-07-28 16:45:22', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2645', '3', '添加商户', '操作人id:3', '2017-07-28 16:52:29', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2646', '3', '审核通过创建用户管理商户', '操作人id:3', '2017-07-28 16:52:29', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2647', '3', '添加商户', '操作人id:3', '2017-07-28 16:52:38', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2648', '3', '审核通过创建用户管理商户', '操作人id:3', '2017-07-28 16:52:38', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2649', '3', '添加商户', '操作人id:3', '2017-07-28 16:55:42', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2650', '3', '审核通过创建用户管理商户', '操作人id:3', '2017-07-28 16:55:43', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2651', '3', '修改商户', '操作人id:3', '2017-07-28 17:01:50', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2652', '3', '删除商户', '操作人id:3', '2017-07-28 17:01:57', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2653', '3', '添加类目', '类目id:22 ; 类目名字： 一级类目0728 。', '2017-07-28 17:15:57', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2654', '3', '添加商户', '操作人id:3', '2017-07-28 17:23:51', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2655', '3', '审核通过创建用户管理商户', '操作人id:3', '2017-07-28 17:23:51', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2656', '3', '添加商户', '操作人id:3', '2017-07-28 17:28:38', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2657', '3', '审核通过创建用户管理商户', '操作人id:3', '2017-07-28 17:28:38', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2658', '3', '添加商户', '操作人id:3', '2017-07-28 17:31:23', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2659', '3', '审核通过创建用户管理商户', '操作人id:3', '2017-07-28 17:31:23', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2660', '3', '添加商户', '操作人id:3', '2017-07-28 17:40:03', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2661', '3', '审核通过创建用户管理商户', '操作人id:3', '2017-07-28 17:40:03', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2662', '3', '新增权限', '权限的id：208权限的名字：查看菜单:订单管理  权限的url：', '2017-07-31 09:50:58', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2663', '3', '添加菜单', '菜单id:136；菜单名：订单管理；菜单的url：', '2017-07-31 09:50:58', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2664', '3', '新增权限', '权限的id：209权限的名字：查看菜单:订单列表  权限的url：order/list', '2017-07-31 09:53:28', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2665', '3', '添加菜单', '菜单id:137；菜单名：订单列表；菜单的url：order/list', '2017-07-31 09:53:28', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2666', '3', '修改权限', '权限的id：209权限的名字：查看菜单:订单列表  权限的url：/order/list', '2017-07-31 09:53:40', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2667', '3', '修改菜单', '菜单id:137；菜单名：订单列表；菜单的url：/order/list', '2017-07-31 09:53:40', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2668', '3', '添加商户', '操作人id:3', '2017-07-31 10:43:35', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2669', '3', '审核通过创建用户管理商户', '操作人id:3', '2017-07-31 10:43:36', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2670', '3', '添加商户', '操作人id:3', '2017-07-31 11:02:09', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2671', '3', '审核通过创建用户管理商户', '操作人id:3', '2017-07-31 11:02:10', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2672', '3', '修改类目的序号', '类目的id：9,11,15,20,19,21,16,17', '2017-07-31 11:07:49', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2673', '3', '修改类目的序号', '类目的id：11,9,21,15,20,19', '2017-07-31 11:08:46', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2674', '3', '修改类目的序号', '类目的id：9,11', '2017-07-31 11:09:39', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2675', '3', '添加商户', '操作人id:3', '2017-07-31 11:15:54', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2676', '3', '审核通过创建用户管理商户', '操作人id:3', '2017-07-31 11:15:54', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2677', '3', '删除商户', '操作人id:3', '2017-07-31 11:16:01', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2678', '3', '添加商户', '操作人id:3', '2017-07-31 11:20:50', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2679', '3', '审核通过创建用户管理商户', '操作人id:3', '2017-07-31 11:20:51', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2680', '3', '添加商户', '操作人id:3', '2017-07-31 11:20:54', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2681', '3', '审核通过创建用户管理商户', '操作人id:3', '2017-07-31 11:20:54', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2682', '3', '修改商户', '操作人id:3', '2017-07-31 11:21:10', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2683', '3', '删除商户', '操作人id:3', '2017-07-31 11:21:14', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2684', '3', '修改类目的序号', '类目的id：15,20,19,21', '2017-07-31 11:24:03', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2685', '3', '修改类目的序号', '类目的id：21,15,20,19', '2017-07-31 11:24:23', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2686', '3', '修改类目的序号', '类目的id：15,20,19,21', '2017-07-31 11:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2687', '3', '修改类目的序号', '类目的id：21,15,20,19', '2017-07-31 11:32:41', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2688', '3', '修改类目的序号', '类目的id：15,20,19,21', '2017-07-31 11:35:01', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2689', '3', '添加类目', '类目id:23 ; 类目名字： 上衣三级类目1 。', '2017-07-31 11:44:49', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2690', '3', '添加类目', '类目id:24 ; 类目名字： 上衣三级类目2 。', '2017-07-31 11:45:35', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2691', '3', '添加类目', '类目id:25 ; 类目名字： 上衣三级类目3 。', '2017-07-31 11:45:55', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2692', '3', '添加类目', '类目id:26 ; 类目名字： 上衣三级类目3 。', '2017-07-31 11:45:57', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2693', '3', '添加证书', '证书id:15;证书名字七级证书;', '2017-07-31 14:15:28', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2694', '3', '修改证书', '证书id:15;证书名字七级证书;', '2017-07-31 14:15:35', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2695', '3', '添加证书', '证书id:16;证书名字卫生证书;', '2017-07-31 14:15:48', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2696', '3', '删除文章', '：操作人id:3', '2017-07-31 14:33:43', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2697', '3', '删除文章分类', '：操作人id:3', '2017-07-31 14:34:55', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2698', '3', '修改类目的序号', '类目的id：21,15,20,19,23,24,25,26', '2017-07-31 14:42:17', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2699', '3', '修改类目的序号', '类目的id：15,20,19,21', '2017-07-31 14:42:29', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2700', '3', '删除类目', '类目ID:22。', '2017-07-31 14:43:40', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2701', '3', '删除类目', '类目ID:17。', '2017-07-31 14:44:17', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2702', '3', '添加类目', '类目id:27 ; 类目名字： 一级类目 。', '2017-07-31 15:11:52', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2703', '3', '添加类目', '类目id:28 ; 类目名字： 二级类目 。', '2017-07-31 15:12:11', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2704', '3', '添加类目', '类目id:29 ; 类目名字： 三级类目 。', '2017-07-31 15:13:18', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2705', '3', '添加类目', '类目id:30 ; 类目名字： 三级类目 。', '2017-07-31 15:13:21', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2706', '3', '修改类目的序号', '类目的id：9,11,27,23,24,25,26,28,29,30', '2017-07-31 15:14:46', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2707', 'null', '修改商户', '：操作人id:null', '2017-07-31 15:19:18', null);
INSERT INTO `csair_log_operation` VALUES ('2708', '3', '删除类目', '类目ID:30,类目名字：三级类目。', '2017-07-31 15:21:22', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2709', '3', '删除类目', '类目ID:29,类目名字：三级类目。', '2017-07-31 15:22:01', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2710', '3', '添加类目', '类目id:31 ; 类目名字： 三级类目 。', '2017-07-31 15:22:22', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2711', '3', '添加类目', '类目id:32 ; 类目名字： 三级类目 。', '2017-07-31 15:22:24', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2712', '3', '添加类目', '类目id:33 ; 类目名字： 三级类目 。', '2017-07-31 15:22:24', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2713', '3', '添加类目', '类目id:34 ; 类目名字： 三级类目 。', '2017-07-31 15:22:25', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2714', '3', '添加类目', '类目id:35 ; 类目名字： 三级类目 。', '2017-07-31 15:22:25', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2715', '3', '添加类目', '类目id:36 ; 类目名字： 三级类目 。', '2017-07-31 15:22:25', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2716', '3', '添加类目', '类目id:37 ; 类目名字： 三级类目 。', '2017-07-31 15:22:25', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2717', '3', '添加类目', '类目id:38 ; 类目名字： 三级类目 。', '2017-07-31 15:22:25', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2718', '3', '添加类目', '类目id:39 ; 类目名字： 三级类目 。', '2017-07-31 15:22:25', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2719', '3', '修改类目的序号', '类目的id：31,32,33,34,35,36', '2017-07-31 15:23:39', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2720', 'null', '修改商户', '：操作人id:null', '2017-07-31 15:25:03', null);
INSERT INTO `csair_log_operation` VALUES ('2721', '3', '修改品牌', '品牌ID:11；品牌名字：航空精品', '2017-07-31 15:24:36', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2722', 'null', '修改商户', '：操作人id:null', '2017-07-31 15:25:27', null);
INSERT INTO `csair_log_operation` VALUES ('2723', 'null', '修改商户', '：操作人id:null', '2017-07-31 15:26:19', null);
INSERT INTO `csair_log_operation` VALUES ('2724', 'null', '修改商户', '：操作人id:null', '2017-07-31 15:30:03', null);
INSERT INTO `csair_log_operation` VALUES ('2725', '3', '添加类目', '类目id:40 ; 类目名字： 衣服二级类目 。', '2017-07-31 15:30:28', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2726', '3', '添加类目', '类目id:41 ; 类目名字： 衣服二级类目 。', '2017-07-31 15:30:31', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2727', '3', '添加类目', '类目id:42 ; 类目名字： 衣服二级类目 。', '2017-07-31 15:30:31', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2728', '3', '修改类目的序号', '类目的id：40,42,41', '2017-07-31 15:30:59', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2729', 'null', '修改商户', '：操作人id:null', '2017-07-31 15:33:23', null);
INSERT INTO `csair_log_operation` VALUES ('2730', '3', '修改类目的序号', '类目的id：21,15,20,19,42,40', '2017-07-31 15:32:59', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2731', 'null', '修改商户', '：操作人id:null', '2017-07-31 15:37:13', null);
INSERT INTO `csair_log_operation` VALUES ('2732', '3', '修改类目的序号', '类目的id：40,41,42', '2017-07-31 15:40:00', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2733', 'null', '修改商户', '：操作人id:null', '2017-07-31 15:41:44', null);
INSERT INTO `csair_log_operation` VALUES ('2734', 'null', '修改商户', '：操作人id:null', '2017-07-31 15:41:54', null);
INSERT INTO `csair_log_operation` VALUES ('2735', 'null', '修改商户', '：操作人id:null', '2017-07-31 15:42:33', null);
INSERT INTO `csair_log_operation` VALUES ('2736', 'null', '修改商户', '：操作人id:null', '2017-07-31 15:45:46', null);
INSERT INTO `csair_log_operation` VALUES ('2737', 'null', '修改商户', '：操作人id:null', '2017-07-31 16:47:18', null);
INSERT INTO `csair_log_operation` VALUES ('2738', 'null', '修改商户', '：操作人id:null', '2017-07-31 16:52:21', null);
INSERT INTO `csair_log_operation` VALUES ('2739', '3', '修改商户', '操作人id:3', '2017-07-31 20:08:20', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2740', '3', '修改商户', '操作人id:3', '2017-07-31 20:08:28', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2741', '3', '修改商户', '操作人id:3', '2017-07-31 20:08:39', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2742', '3', '修改商户', '操作人id:3', '2017-07-31 20:08:46', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2743', '3', '修改商户', '操作人id:3', '2017-07-31 20:11:46', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2744', '3', '修改商户', '操作人id:3', '2017-07-31 20:12:09', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2745', '3', '添加商户', '操作人id:3', '2017-08-01 09:15:35', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2746', '3', '审核通过创建用户管理商户', '操作人id:3', '2017-08-01 09:15:36', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2747', '3', '添加商户', '操作人id:3', '2017-08-01 09:26:51', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2748', '3', '添加商户', '操作人id:3', '2017-08-01 09:29:24', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2749', '3', '审核通过创建用户管理商户', '操作人id:3', '2017-08-01 09:29:24', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2750', '3', '添加商户', '操作人id:3', '2017-08-01 09:30:01', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2751', '3', '审核通过创建用户管理商户', '操作人id:3', '2017-08-01 09:30:01', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2752', '3', '添加商户', '操作人id:3', '2017-08-01 09:31:05', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2753', '3', '审核通过创建用户管理商户', '操作人id:3', '2017-08-01 09:31:05', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2754', '3', '添加文章', '：操作人id:3', '2017-08-01 10:06:13', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2755', '3', '添加文章', '：操作人id:3', '2017-08-01 10:12:05', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2756', '3', '修改文章', '：操作人id:3', '2017-08-01 10:12:37', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2757', '3', '添加文章', '：操作人id:3', '2017-08-01 10:13:22', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2758', '3', '新增权限', '权限的id：210权限的名字：查看菜单:商品属性模板列表  权限的url：/goodCategoryPropertyTemplet/list', '2017-08-01 10:15:21', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2759', '3', '添加菜单', '菜单id:138；菜单名：商品属性模板列表；菜单的url：/goodCategoryPropertyTemplet/list', '2017-08-01 10:15:21', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2760', '3', '修改商户', '操作人id:3', '2017-08-01 10:19:27', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2761', '3', '修改商户', '操作人id:3', '2017-08-01 10:19:33', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2762', '3', '修改商户', '操作人id:3', '2017-08-01 10:19:45', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2763', '3', '修改商户', '操作人id:3', '2017-08-01 10:20:08', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2764', '3', '修改商户', '操作人id:3', '2017-08-01 10:20:16', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2765', '3', '修改商户', '操作人id:3', '2017-08-01 10:44:36', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2766', '3', '修改商户', '操作人id:3', '2017-08-01 10:51:12', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2767', '3', '删除商户', '操作人id:3', '2017-08-01 10:51:21', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2768', '3', '添加商户', '操作人id:3', '2017-08-01 10:55:30', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2769', '3', '添加商户', '操作人id:3', '2017-08-01 10:59:00', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2770', '3', '审核通过创建用户管理商户', '操作人id:3', '2017-08-01 10:59:00', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2771', '3', '添加商户', '操作人id:3', '2017-08-01 11:08:40', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2772', '3', '添加商户', '操作人id:3', '2017-08-01 11:11:49', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2773', '3', '审核通过创建用户管理商户', '操作人id:3', '2017-08-01 11:11:49', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2774', 'null', '修改商户', '操作人id:null', '2017-08-01 11:50:05', null);
INSERT INTO `csair_log_operation` VALUES ('2775', '3', '添加文章', '：操作人id:3', '2017-08-01 16:38:15', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2776', '3', '添加商户', '商户名称南航7', '2017-08-02 09:46:38', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2777', '3', '审核通过创建用户', '用户名称:alice1', '2017-08-02 09:46:39', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2778', '3', '修改商户', '商户名称:南航2', '2017-08-02 09:47:05', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2779', '3', '修改商户', '商户名称:南航4', '2017-08-02 09:55:00', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2780', '3', '删除商户', '商户名称:null', '2017-08-02 09:55:14', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2781', '3', '添加商户', '商户名称南航8', '2017-08-02 09:59:56', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2782', '3', '审核通过创建用户', '用户名称:alice1', '2017-08-02 09:59:57', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2783', '3', '修改类目的序号', '类目的id：11,9', '2017-08-02 10:25:08', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2784', '3', '修改类目的序号', '类目的id：9,11', '2017-08-02 10:25:15', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2785', '3', '新增或修改属性模板', '模板类目id:5;模板名字：21', '2017-08-02 10:28:13', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2786', '3', '新增或修改属性模板', '模板类目id:5;模板名字：三级类目模板', '2017-08-02 10:39:00', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2787', '3', '批量删除品牌', '品牌ID：（56,57）。', '2017-08-02 11:23:10', '192.168.1.215');
INSERT INTO `csair_log_operation` VALUES ('2788', '3', '批量删除品牌', '品牌ID：（58,59）。', '2017-08-02 11:23:18', '192.168.1.215');
INSERT INTO `csair_log_operation` VALUES ('2789', '3', '批量删除品牌', '品牌ID：（60,61）。', '2017-08-02 11:24:15', '192.168.1.215');
INSERT INTO `csair_log_operation` VALUES ('2790', '3', '添加文章', '添加的文章名称时尚街拍：街拍女孩儿的牛仔裤，最后那个腿是真的好看！', '2017-08-02 11:37:20', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2791', '3', '添加文章', '添加的文章名称街拍：出行逛街的姐妹闺蜜，欢笑中钱包厚度锐减', '2017-08-02 11:37:57', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2792', '3', '新增权限', '权限的id：211权限的名字：查看菜单:配送管理  权限的url：', '2017-08-02 11:41:18', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2793', '3', '添加菜单', '菜单id:139；菜单名：配送管理；菜单的url：', '2017-08-02 11:41:19', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2794', '3', '新增权限', '权限的id：212权限的名字：查看菜单:自取点列表  权限的url：', '2017-08-02 11:43:36', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2795', '3', '添加菜单', '菜单id:140；菜单名：自取点列表；菜单的url：', '2017-08-02 11:43:36', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2796', '3', '新增权限', '权限的id：213权限的名字：查看菜单:添加自取点  权限的url：', '2017-08-02 11:44:21', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2797', '3', '添加菜单', '菜单id:141；菜单名：添加自取点；菜单的url：', '2017-08-02 11:44:22', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2798', '3', '新增权限', '权限的id：214权限的名字：查看菜单:物流公司列表  权限的url：', '2017-08-02 11:45:10', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2799', '3', '添加菜单', '菜单id:142；菜单名：物流公司列表；菜单的url：', '2017-08-02 11:45:10', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2800', '3', '删除类目', '类目ID:35,类目名字：三级类目5。', '2017-08-02 14:18:25', '192.168.1.215');
INSERT INTO `csair_log_operation` VALUES ('2801', '3', '删除类目', '类目ID:36,类目名字：三级类目6。', '2017-08-02 14:18:25', '192.168.1.215');
INSERT INTO `csair_log_operation` VALUES ('2802', '3', '批量删除品牌', '品牌ID：（1,2,3）。', '2017-08-02 15:42:37', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2803', '3', '删除属性模板', '模板类目ID：11', '2017-08-02 15:46:40', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2804', '3', '删除属性模板', '模板类目ID：9', '2017-08-02 15:48:06', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2805', '3', '删除属性模板', '模板类目ID：10', '2017-08-02 15:48:06', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2806', '3', '修改品牌', '品牌ID:64；品牌名字：21', '2017-08-02 17:13:43', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2807', '3', '新增或修改属性模板', '模板类目id:20;模板名字：联想笔记本属性模板', '2017-08-02 17:18:36', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2808', '3', '新增或修改属性模板', '模板类目id:20;模板名字：联想笔记本属性模板', '2017-08-02 17:22:53', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2809', '3', '添加类目', '类目id:43 ; 类目名字： 衣服三级类目 。', '2017-08-02 17:26:40', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2810', 'null', '修改商户', '商户名称:南航', '2017-08-02 17:31:30', null);
INSERT INTO `csair_log_operation` VALUES ('2811', 'null', '修改商户', '商户名称:南航', '2017-08-02 17:34:28', null);
INSERT INTO `csair_log_operation` VALUES ('2812', '3', '修改品牌', '品牌ID:64；品牌名字：21', '2017-08-02 17:37:26', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2813', '3', '修改品牌', '品牌ID:14；品牌名字：小米', '2017-08-02 19:04:31', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2814', '3', '修改品牌', '品牌ID:14；品牌名字：小米', '2017-08-02 19:04:44', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2815', '3', '修改品牌', '品牌ID:14；品牌名字：小米', '2017-08-02 19:04:56', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2816', '3', '修改品牌', '品牌ID:10；品牌名字：跨境购', '2017-08-02 19:09:19', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2817', '3', '删除属性模板', '模板类目ID：5', '2017-08-03 08:47:36', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2818', '3', '删除属性模板', '模板类目ID：6', '2017-08-03 08:47:44', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2819', '3', '删除属性模板', '模板类目ID：7', '2017-08-03 08:47:44', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2820', 'null', '修改商户', '商户名称:南航', '2017-08-03 08:59:13', null);
INSERT INTO `csair_log_operation` VALUES ('2821', '3', '修改角色权限', '角色的id2；删除角色的id集合：78,79,86', '2017-08-03 09:04:23', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2822', '3', '修改角色权限', '角色的id2；删除角色的id集合：118,88,118', '2017-08-03 09:05:43', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2823', '3', '修改角色权限', '角色的id4；删除角色的id集合：63,64,65,66,67,68,69,70,71,73,74,75,78,79,80,83,86,87,88,96,98,99,107,111,116,118,119,125', '2017-08-03 09:08:01', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2824', '3', '修改角色权限', '角色的id5；删除角色的id集合：63,64,65,66,67,68,69,70,71,73,74,75,78,79,80,83,85,86,87,88,96,98,99,107,111,116,118,119,125', '2017-08-03 09:08:27', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2825', 'null', '修改商户', '商户名称:南航', '2017-08-03 09:26:53', null);
INSERT INTO `csair_log_operation` VALUES ('2826', 'null', '修改商户', '商户名称:南航7', '2017-08-03 09:29:35', null);
INSERT INTO `csair_log_operation` VALUES ('2827', 'null', '修改商户', '商户名称:南航8', '2017-08-03 09:32:01', null);
INSERT INTO `csair_log_operation` VALUES ('2828', 'null', '修改商户', '商户名称:南航', '2017-08-03 09:35:36', null);
INSERT INTO `csair_log_operation` VALUES ('2829', 'null', '修改商户', '商户名称:南航7', '2017-08-03 09:41:34', null);
INSERT INTO `csair_log_operation` VALUES ('2830', '3', '禁止用户登录', '用户ID：25', '2017-08-03 10:12:59', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2831', '3', '禁止用户登录', '用户ID：24', '2017-08-03 10:13:08', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2832', '3', '开放用户登录', '用户ID：25', '2017-08-03 10:29:40', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2833', '3', '禁止用户登录', '用户ID：25', '2017-08-03 10:29:56', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2834', '3', '禁止用户登录', '用户ID：2', '2017-08-03 10:30:02', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2835', '3', '开放用户登录', '用户ID：2', '2017-08-03 10:30:30', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2836', '3', '删除属性模板', '模板类目ID：3', '2017-08-03 10:32:09', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2837', '3', '删除属性模板', '模板类目ID：4', '2017-08-03 10:32:09', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2838', '3', '新增用户', '用户邮箱：2121；用户id：53', '2017-08-03 10:45:54', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2839', 'null', '修改商户', '商户名称:南航', '2017-08-03 10:55:09', null);
INSERT INTO `csair_log_operation` VALUES ('2840', 'null', '修改商户', '商户名称:南航6', '2017-08-03 10:55:22', null);
INSERT INTO `csair_log_operation` VALUES ('2841', '3', '新增用户', '用户邮箱：221221；用户id：54', '2017-08-03 11:08:57', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2842', '3', '添加文章', '添加的文章名称发的说法', '2017-08-03 11:22:41', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2843', 'null', '修改商户', '商户名称:南航7', '2017-08-03 11:35:40', null);
INSERT INTO `csair_log_operation` VALUES ('2844', '3', '新增用户', '用户邮箱：1；用户id：55', '2017-08-03 11:58:08', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2845', '3', '新增用户', '用户邮箱：1；用户id：56', '2017-08-03 11:59:32', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2846', '3', '新增用户', '用户邮箱：11；用户id：57', '2017-08-03 14:34:06', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2847', '3', '修改权限', '权限的id：184权限的名字：查看菜单:商家信息管理  权限的url：/shop/sellerMessageList', '2017-08-03 16:30:22', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2848', '3', '修改菜单', '菜单id:117；菜单名：商家信息管理；菜单的url：/shop/sellerMessageList', '2017-08-03 16:30:22', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2849', '3', '添加类目', '类目id:44 ; 类目名字： 一级类目0728 。', '2017-08-04 08:53:18', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2850', '3', '修改类目', '类目ID16;类目名字上衣', '2017-08-04 09:31:58', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2851', '3', '修改类目', '类目ID16;类目名字上衣', '2017-08-04 09:32:40', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2852', '3', '修改类目', '类目ID23;类目名字上衣三级类目1', '2017-08-04 09:59:20', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2853', '3', '修改类目', '类目ID23;类目名字上衣三级类目1', '2017-08-04 10:01:55', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2854', '3', '修改商家消息', '商家消息ID:3, 商家消息标题：商城正式上线', '2017-08-04 10:03:19', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2855', '3', '修改商家消息', '商家消息ID:3, 商家消息标题：商城正式上线', '2017-08-04 10:03:21', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2856', '3', '修改商家消息', '商家消息ID:3, 商家消息标题：商城正式上线', '2017-08-04 10:03:24', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2857', '3', '修改商家消息', '商家消息ID:1, 商家消息标题：测试a', '2017-08-04 10:04:01', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2858', '3', '添加商家消息', '商家消息ID:4, 商家消息标题：aaaaaaaaaaa。', '2017-08-04 10:09:37', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2859', '3', '修改商家消息', '商家消息ID:4, 商家消息标题：aaaaaaaaaaa', '2017-08-04 10:09:50', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2860', '3', '修改商家消息', '商家消息ID:1, 商家消息标题：测试a', '2017-08-04 10:10:39', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2861', '3', '修改商家消息', '商家消息ID:3, 商家消息标题：商城正式上线', '2017-08-04 10:10:45', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2862', '3', '修改商家消息', '商家消息ID:1, 商家消息标题：测试a', '2017-08-04 10:10:50', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2863', '3', '修改商家消息', '商家消息ID:3, 商家消息标题：商城正式上线', '2017-08-04 10:10:52', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2864', '3', '修改类目', '类目ID44;类目名字一级类目0729', '2017-08-04 10:31:39', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2865', '3', '添加类目', '类目id:45 ; 类目名字： 二级类目11 。', '2017-08-04 10:32:10', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2866', '3', '修改类目', '类目ID45;类目名字二级类目11', '2017-08-04 10:32:19', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2867', '3', '添加类目', '类目id:46 ; 类目名字： 三级类目22 。', '2017-08-04 10:32:46', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2868', '3', '添加类目', '类目id:47 ; 类目名字： 三级类目222 。', '2017-08-04 10:33:14', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2869', '3', '修改类目', '类目ID25;类目名字上衣三级类目4', '2017-08-04 11:10:03', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2870', '3', '修改类目的序号', '类目的id：44,20,19,40,41,42,23,24,25,26,43,31,32,33,34,45,46,47', '2017-08-04 11:15:18', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2871', '3', '修改类目的序号', '类目的id：26,25', '2017-08-04 11:15:31', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2872', '3', '修改类目的序号', '类目的id：25,26,24,23', '2017-08-04 11:15:53', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2873', '3', '添加商家消息', '商家消息ID:5, 商家消息标题：bbbbbbbb。', '2017-08-04 11:20:51', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2874', '3', '新增或修改属性模板', '模板类目id:47;模板名字：1212121', '2017-08-04 11:22:41', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2875', '3', '修改商家消息', '商家消息ID:1, 商家消息标题：测试huangbiao。', '2017-08-04 11:27:53', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2876', '3', '新增或修改属性模板', '模板类目id:46;模板名字：三级类目22', '2017-08-04 11:29:55', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2877', '3', '删除类目', '类目ID:33,类目名字：三级类目3。', '2017-08-04 11:30:59', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2878', '3', '删除类目', '类目ID:34,类目名字：三级类目4。', '2017-08-04 11:30:59', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2879', '3', '修改商家消息', '商家消息ID:3, 商家消息标题：商城正式上线', '2017-08-04 11:38:48', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2880', '3', '修改商家消息', '商家消息ID:3, 商家消息标题：商城正式上线', '2017-08-04 11:39:59', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2881', '3', '修改商家消息', '商家消息ID:1, 商家消息标题：测试huangbiao', '2017-08-04 11:41:19', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2882', '3', '修改商家消息', '商家消息ID:1, 商家消息标题：测试huangbiao', '2017-08-04 11:44:27', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2883', '3', '修改商家消息', '商家消息ID:2, 商家消息标题：测试b', '2017-08-04 11:44:28', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2884', '3', '修改商家消息', '商家消息ID:5, 商家消息标题：bbbbbbbb', '2017-08-04 11:45:26', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2885', '3', '修改商家消息', '商家消息ID:5, 商家消息标题：bbbbbbbb', '2017-08-04 11:45:42', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2886', '3', '修改商家消息', '商家消息ID:4, 商家消息标题：aaaaaaaaaaa', '2017-08-04 11:45:50', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2887', '3', '修改商家消息', '商家消息ID:1, 商家消息标题：测试huangbiao', '2017-08-04 11:46:24', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2888', '3', '修改商家消息', '商家消息ID:2, 商家消息标题：测试b', '2017-08-04 11:46:29', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2889', '3', '修改商家消息', '商家消息ID:3, 商家消息标题：商城正式上线', '2017-08-04 11:46:35', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2890', '3', '修改商家消息', '商家消息ID:1, 商家消息标题：测试huangbiao', '2017-08-04 11:46:37', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2891', '3', '修改商家消息', '商家消息ID:1, 商家消息标题：测试huangbiao', '2017-08-04 11:46:43', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2892', '3', '修改商家消息', '商家消息ID:1, 商家消息标题：测试huangbiao', '2017-08-04 11:46:49', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2893', '3', '修改商家消息', '商家消息ID:5, 商家消息标题：bbbbbbbb', '2017-08-04 11:47:08', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2894', '3', '修改商家消息', '商家消息ID:5, 商家消息标题：bbbbbbbb', '2017-08-04 11:47:14', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2895', '3', '修改商家消息', '商家消息ID:5, 商家消息标题：bbbbbbbb。', '2017-08-04 11:47:49', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2896', '3', '修改商家消息', '商家消息ID:5, 商家消息标题：bbbbbbbb', '2017-08-04 11:48:01', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2897', '3', '修改商家消息', '商家消息ID:2, 商家消息标题：测试b', '2017-08-04 11:48:42', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2898', '3', '删除商家消息', '商家消息ID:2', '2017-08-04 11:54:42', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2899', '3', '修改商家消息', '商家消息ID:4, 商家消息标题：aaaaaaaaaaa', '2017-08-04 11:55:47', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2900', '3', '修改商家消息', '商家消息ID:1, 商家消息标题：测试huangbiao', '2017-08-04 11:55:58', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2901', '3', '修改商家消息', '商家消息ID:5, 商家消息标题：bbbbbbbb', '2017-08-04 11:57:19', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2902', '3', '修改商家消息', '商家消息ID:1, 商家消息标题：测试huangbiao', '2017-08-04 14:22:33', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2903', '3', '新增权限', '权限的id：215权限的名字：查看菜单:店铺信息列表  权限的url：/shop/shopInfoList', '2017-08-04 14:26:09', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2904', '3', '添加菜单', '菜单id:143；菜单名：店铺信息列表；菜单的url：/shop/shopInfoList', '2017-08-04 14:26:11', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2905', '3', '新增权限', '权限的id：216权限的名字：查看菜单:店铺首页装修  权限的url：/shop/shopHomePageUpdate', '2017-08-04 14:32:32', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2906', '3', '添加菜单', '菜单id:144；菜单名：店铺首页装修；菜单的url：/shop/shopHomePageUpdate', '2017-08-04 14:32:33', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2907', '3', '删除属性模板', '模板类目ID：1', '2017-08-04 14:56:37', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2908', '3', '删除属性模板', '模板类目ID：2', '2017-08-04 14:56:37', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2909', 'null', '修改商户', '商户名称:南航8', '2017-08-04 15:07:11', null);
INSERT INTO `csair_log_operation` VALUES ('2910', '3', '删除菜单', '菜单id:134；菜单名：商铺增删该查操作；菜单的url：/shop/selectshop', '2017-08-04 15:28:09', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2911', '3', '新增权限', '权限的id：217权限的名字：查看菜单:保证金管理  权限的url：', '2017-08-04 15:32:09', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2912', '3', '添加菜单', '菜单id:145；菜单名：保证金管理；菜单的url：', '2017-08-04 15:32:10', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2913', '3', '修改权限', '权限的id：215权限的名字：查看菜单:店铺信息列表  权限的url：/shop/selectshop', '2017-08-04 15:34:41', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2914', '3', '修改菜单', '菜单id:143；菜单名：店铺信息列表；菜单的url：/shop/selectshop', '2017-08-04 15:34:41', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2915', '3', '修改权限', '权限的id：215权限的名字：查看菜单:店铺信息列表  权限的url：/shop/shopInfoList', '2017-08-04 15:37:44', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2916', '3', '修改菜单', '菜单id:143；菜单名：店铺信息列表；菜单的url：/shop/shopInfoList', '2017-08-04 15:37:44', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2917', '3', '删除属性模板', '模板类目ID：6', '2017-08-04 15:47:16', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2918', '3', '删除属性模板', '模板类目ID：7', '2017-08-04 15:47:16', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2919', '3', '添加类目', '类目id:48 ; 类目名字： 67589 。', '2017-08-04 15:56:13', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2920', '3', '修改商家消息', '商家消息ID:4, 商家消息标题：aaaaaaaaaaa', '2017-08-04 16:12:46', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2921', '3', '修改类目的序号', '类目的id：11,27,9,48,44', '2017-08-04 16:31:28', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2922', '3', '新增或修改属性模板', '模板类目id:43;模板名字：1221', '2017-08-04 16:43:23', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2923', '3', '修改属性模板', '模板类目id:46;模板名字：212112', '2017-08-04 17:03:13', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2924', '3', '修改权限', '权限的id：215权限的名字：查看菜单:店铺信息列表  权限的url：/shop/selectshop', '2017-08-04 17:10:10', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2925', '3', '修改菜单', '菜单id:143；菜单名：店铺信息列表；菜单的url：/shop/selectshop', '2017-08-04 17:10:10', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2926', '3', '修改属性模板', '模板类目id:46;模板名字：122112', '2017-08-04 17:10:31', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2927', '3', '新增权限', '权限的id：218权限的名字：查看菜单:商品增刪改查  权限的url：/shop/selectshop', '2017-08-04 17:18:02', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2928', '3', '添加菜单', '菜单id:146；菜单名：商品增刪改查；菜单的url：/shop/selectshop', '2017-08-04 17:18:02', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2929', '3', '修改权限', '权限的id：215权限的名字：查看菜单:店铺信息列表  权限的url：/shop/shopInfoList', '2017-08-04 17:18:20', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2930', '3', '修改菜单', '菜单id:143；菜单名：店铺信息列表；菜单的url：/shop/shopInfoList', '2017-08-04 17:18:20', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2931', '3', '修改权限', '权限的id：215权限的名字：查看菜单:店铺信息列表  权限的url：/shop/shopInfoList', '2017-08-04 17:19:12', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2932', '3', '修改菜单', '菜单id:143；菜单名：店铺信息列表；菜单的url：/shop/shopInfoList', '2017-08-04 17:19:14', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2933', '3', '新增属性模板', '模板类目id:47;模板名字：122121', '2017-08-04 17:19:06', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2934', '3', '修改属性模板', '模板类目id:47;模板名字：122121', '2017-08-04 17:20:45', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2935', '3', '删除菜单', '菜单id:3；菜单名：商品分类；菜单的url：null', '2017-09-01 14:26:58', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2936', '3', '删除菜单', '菜单id:4；菜单名：品牌管理；菜单的url：null', '2017-09-01 14:27:02', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2937', '3', '删除菜单', '菜单id:11；菜单名：财务与统计；菜单的url：null', '2017-09-01 14:27:08', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2938', '3', '删除菜单', '菜单id:66；菜单名：客服列表；菜单的url：/service/list', '2017-09-01 14:27:12', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2939', '3', '删除菜单', '菜单id:13；菜单名：客服；菜单的url：/service', '2017-09-01 14:27:16', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2940', '3', '删除菜单', '菜单id:12；菜单名：财务；菜单的url：null', '2017-09-01 14:27:20', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2941', '3', '删除菜单', '菜单id:8；菜单名：用户；菜单的url：null', '2017-09-01 14:27:25', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2942', '3', '删除菜单', '菜单id:10；菜单名：营销；菜单的url：null', '2017-09-01 14:27:29', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2943', '3', '添加证书', '证书id:17;证书名字规定规定;', '2017-09-01 14:31:11', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2944', '3', '批量删除品牌', '品牌ID：（64）。', '2017-09-01 17:14:42', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2945', '3', '删除菜单', '菜单id:87；菜单名：消息管理；菜单的url：null', '2017-09-08 17:20:12', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2946', '3', '删除菜单', '菜单id:7；菜单名：CMS；菜单的url：cms/8joi', '2017-09-08 17:29:59', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2947', '3', '删除菜单', '菜单id:139；菜单名：配送管理；菜单的url：null', '2017-09-08 17:30:07', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2948', '3', '删除菜单', '菜单id:6；菜单名：交易；菜单的url：null', '2017-09-08 17:30:19', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2949', '3', '新增权限', '权限的id：219权限的名字：查看菜单:根菜单  权限的url：/test/a', '2017-09-13 15:08:53', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2950', '3', '添加菜单', '菜单id:147；菜单名：根菜单；菜单的url：/test/a', '2017-09-13 15:08:53', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2951', '3', '新增权限', '权限的id：220权限的名字：查看菜单:二级菜单  权限的url：/test/test2', '2017-09-13 15:09:26', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2952', '3', '添加菜单', '菜单id:148；菜单名：二级菜单；菜单的url：/test/test2', '2017-09-13 15:09:26', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2953', '3', '添加证书', '证书id:17;', '2017-09-13 15:10:32', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2954', '3', '添加证书', '证书id:17;', '2017-09-13 15:10:33', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2955', '3', '修改权限', '权限的id：192权限的名字：查看菜单:类目列表  权限的url：/GoodCategory/queryAllGoodCategory', '2017-09-13 15:39:50', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2956', '3', '修改菜单', '菜单id:122；菜单名：类目列表；菜单的url：/GoodCategory/queryAllGoodCategory', '2017-09-13 15:39:50', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2957', '3', '修改角色权限', '角色的id7；增加角色的id集合：189,188,152,151,149,148,145', '2017-09-27 14:40:21', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2958', '3', '新增权限', '权限的id：220权限的名字：查看菜单:根菜单1  权限的url：', '2017-09-27 14:45:57', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2959', '3', '添加菜单', '菜单id:148；菜单名：根菜单1；菜单的url：', '2017-09-27 14:45:57', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2960', '3', '新增权限', '权限的id：221权限的名字：查看菜单:新建菜单  权限的url：', '2017-09-27 19:52:02', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2961', '3', '添加菜单', '菜单id:149；菜单名：新建菜单；菜单的url：', '2017-09-27 19:52:02', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2962', '3', '新增权限', '权限的id：222权限的名字：查看菜单:121212  权限的url：', '2017-09-27 20:12:18', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2963', '3', '添加菜单', '菜单id:150；菜单名：121212；菜单的url：', '2017-09-27 20:12:18', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2964', '3', '新增权限', '权限的id：223权限的名字：查看菜单:121212  权限的url：', '2017-09-27 20:13:47', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2965', '3', '添加菜单', '菜单id:151；菜单名：121212；菜单的url：', '2017-09-27 20:13:47', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2966', '3', '新增权限', '权限的id：224权限的名字：查看菜单:121221  权限的url：12', '2017-09-27 20:13:57', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2967', '3', '添加菜单', '菜单id:152；菜单名：121221；菜单的url：12', '2017-09-27 20:13:57', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2968', '3', '新增权限', '权限的id：225权限的名字：查看菜单:121221  权限的url：21', '2017-09-27 20:24:53', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2969', '3', '添加菜单', '菜单id:153；菜单名：121221；菜单的url：21', '2017-09-27 20:24:53', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2970', '3', '删除菜单', '菜单id:153；菜单名：121221；菜单的url：21', '2017-09-27 20:24:57', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2971', '3', '修改角色权限', '角色的id2；删除角色的id集合：126,127,156,139', '2017-09-29 16:22:23', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2972', '3', '修改菜单', '菜单id:125；菜单名：品牌管理；菜单的url：', '2017-10-18 14:20:05', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2973', '3', '修改角色权限', '角色的id2；增加角色的id集合：373,382,397,371,372,379,387,399', '2017-10-18 14:36:08', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2974', '2', '修改菜单', '菜单id:2；菜单名：商品管理；菜单的url：', '2017-10-18 14:36:51', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2975', '3', '删除菜单', '菜单id:59；菜单名：新建账号；菜单的url：/user/toEditUser', '2017-10-18 14:40:52', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2976', '3', '修改品牌', '品牌ID:9；品牌名字：免税品', '2017-10-18 17:08:53', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2977', '3', '修改品牌', '品牌ID:9；品牌名字：免税品', '2017-10-18 17:11:16', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2978', '3', '修改品牌', '品牌ID:9；品牌名字：免税品', '2017-10-18 17:13:11', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2979', '3', '修改品牌', '品牌ID:9；品牌名字：免税品', '2017-10-18 17:13:37', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2980', '3', '修改品牌', '品牌ID:9；品牌名字：免税品', '2017-10-18 17:14:15', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2981', '3', '修改品牌', '品牌ID:10；品牌名字：跨境购', '2017-10-18 17:15:39', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2982', '3', '修改品牌', '品牌ID:9；品牌名字：免税品', '2017-10-18 17:20:09', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2983', '3', '添加品牌', '品牌名字：1221', '2017-10-18 17:24:54', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2984', '3', '添加品牌', '品牌名字：1221', '2017-10-18 17:25:09', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2985', '3', '添加品牌', '品牌名字：1211111', '2017-10-18 17:25:25', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2986', '3', '添加品牌', '品牌名字：211111111111', '2017-10-18 17:25:35', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2987', '3', '添加品牌', '品牌名字：1322222222', '2017-10-18 17:25:49', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2988', '3', '批量删除品牌', '品牌ID：（71）。', '2017-10-19 09:17:08', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2989', '3', '批量删除品牌', '品牌ID：（63,65）。', '2017-10-19 09:28:56', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2990', '3', '批量删除品牌', '品牌ID：（66,67）。', '2017-10-19 09:30:47', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2991', '3', '修改菜单', '菜单id:121；菜单名：类目管理；菜单的url：', '2017-10-19 09:35:11', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2992', '3', '添加菜单', '菜单id:147；菜单名：121221；菜单的url：2112', '2017-10-24 15:45:08', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2993', '3', '修改角色权限', '角色的id2；增加角色的id集合：455,456,460,467,481,484', '2017-10-24 15:53:14', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2994', '3', '修改角色权限', '角色的id2；增加角色的id集合：485,466', '2017-10-24 15:53:26', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2995', '3', '修改角色权限', '角色的id2；增加角色的id集合：483,457,465', '2017-10-26 17:22:28', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2996', '3', '添加品牌', '品牌名字：12', '2017-10-27 16:45:59', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2997', '3', '添加品牌', '品牌名字：121111121', '2017-10-27 16:50:18', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2998', '3', '添加品牌', '品牌名字：1221', '2017-10-27 17:01:03', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2999', '3', '批量删除品牌', '品牌ID：（62,68,69）。', '2017-11-01 08:48:51', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('3000', '3', '批量删除品牌', '品牌ID：（70,71,72）。', '2017-11-01 08:48:58', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('3001', '3', '批量删除品牌', '品牌ID：（73）。', '2017-11-01 08:49:03', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('3002', '3', '添加品牌', '品牌名字：12', '2017-11-01 08:49:21', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('3003', '3', '修改品牌', '品牌ID:74；品牌名字：12', '2017-11-01 09:00:59', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('3004', '3', '修改品牌', '品牌ID:74；品牌名字：12', '2017-11-01 09:03:05', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('3005', '3', '修改品牌', '品牌ID:74；品牌名字：12', '2017-11-01 09:09:53', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('3006', '3', '批量删除品牌', '品牌ID：（74）。', '2017-11-01 09:10:08', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('3007', '3', '添加品牌', '品牌名字：1211111', '2017-11-01 09:10:18', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('3008', '3', '批量删除品牌', '品牌ID：（15）。', '2017-11-15 15:55:34', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('3009', '3', '批量删除品牌', '品牌ID：（13）。', '2017-11-15 15:55:45', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('3010', '3', '删除菜单', '菜单id:147；菜单名：121221；菜单的url：2112', '2017-11-28 15:27:18', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('3011', '3', '批量删除品牌', '品牌ID：（75）。', '2017-11-28 15:46:48', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('3012', '3', '添加菜单', '菜单id:148；菜单名：管理权限；菜单的url：/permission/list', '2017-11-28 16:11:04', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('3013', '3', '删除权限', '权限id：[[461, 462]]', '2017-11-29 15:57:18', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('3014', '3', '删除权限', '权限id：[[453]]', '2017-11-29 15:58:38', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('3015', '3', '删除权限', '权限id：[[470]]', '2017-11-29 16:00:55', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('3016', '3', '删除权限', '权限id：[487]', '2017-11-29 16:24:34', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('3017', '3', '添加权限', '权限名字：null ,URL: null', '2017-12-01 14:42:11', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('3018', '3', '添加权限', '权限名字：12 ,URL: 12', '2017-12-01 14:47:05', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('3019', '3', '删除权限', '权限id：[491]', '2017-12-01 14:47:19', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('3020', '3', '添加权限', '权限名字：编辑权限 ,URL: /permission/toEditPermission||/permission/editPermission||', '2017-12-01 14:52:11', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('3021', '3', '修改权限', '权限名字：编辑权限 ,URL: /permission/toEditPermission||/permission/editPermission', '2017-12-01 14:54:55', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('3022', '3', '删除权限', '权限id：[490]', '2017-12-01 14:58:21', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('3023', '3', '修改权限', '权限名字：编辑权限 ,URL: /permission/toEditPermission||/permission/editPermission||/permission/list', '2017-12-01 14:59:18', '0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('3024', '3', '添加权限', '权限名字：类目列表 ,URL: /GoodCategory/queryAllGoodCategory', '2017-12-01 15:59:46', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for csair_user_info
-- ----------------------------
DROP TABLE IF EXISTS `csair_user_info`;
CREATE TABLE `csair_user_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户id，根据user_type判断明珠会员是明珠卡号，e行会员是e行用户编号',
  `cn_name` varchar(100) DEFAULT NULL COMMENT '中文名',
  `en_name` varchar(100) DEFAULT NULL COMMENT '英文名',
  `user_type` varchar(10) DEFAULT NULL COMMENT '登录用户类型 EM   E行用户 FFPM  常客明珠会员',
  `mobile_phone` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `band_phone` varchar(20) DEFAULT NULL COMMENT '绑定手机号码',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `userful_mileage` decimal(15,2) DEFAULT NULL COMMENT '可用里程',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `ni_cert_num` varchar(20) DEFAULT NULL COMMENT '身份证号码',
  `bind_email` varchar(100) DEFAULT NULL COMMENT '绑定邮箱',
  `phone` varchar(20) DEFAULT NULL COMMENT '固话',
  `registered_time` datetime DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csair_user_info
-- ----------------------------
INSERT INTO `csair_user_info` VALUES ('1', '10001', '测试', 'test', '明珠会员', '13802514605', '13802514605', '2017-07-26', '22.22', '111@qq.com', '430444933838', '111@qq.com', '7770990', '2017-07-27 16:54:10');
INSERT INTO `csair_user_info` VALUES ('2', '10002', '黄彪', 'huangbiao', 'E行会员', '13802514605', '13802514605', '2017-07-27', '55.33', '222@qq.com', '430444933838', '222@qq.com', '3445454', '2017-07-27 16:54:16');
INSERT INTO `csair_user_info` VALUES ('6', '10006', '彭珍', 'PENG/ZHEN', '明珠会员', '18600680089', '18600680089', '1977-09-19', '0.00', '123@qq.com', '440901197709194316', '123456@qq.com', '18600680089', '2017-07-31 17:22:47');
INSERT INTO `csair_user_info` VALUES ('7', '10003', 'test', 'huangbiao', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `csair_user_info` VALUES ('8', '10004', 'test2', 'huangbiao', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `csair_user_info` VALUES ('9', '10005', 'test2', 'huangbiao', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `csair_user_info` VALUES ('10', '1006', 'huangbiao', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `csair_user_info` VALUES ('11', '1006', 'huangbiao', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `csair_user_info` VALUES ('12', '1006', 'huangbiao', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `csair_user_info` VALUES ('13', '1006', 'huangbiao', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `csair_user_info` VALUES ('14', '1006', 'huangbiao', null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for csair_user_info_address
-- ----------------------------
DROP TABLE IF EXISTS `csair_user_info_address`;
CREATE TABLE `csair_user_info_address` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_info_id` int(10) NOT NULL COMMENT '关联csair_user_info会员表id',
  `name` varchar(100) DEFAULT NULL COMMENT '收货人',
  `address` varchar(200) DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `enbale` tinyint(4) DEFAULT NULL COMMENT '是否有效标识,0有效,1无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csair_user_info_address
-- ----------------------------

-- ----------------------------
-- Table structure for e_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `e_admin_menu`;
CREATE TABLE `e_admin_menu` (
  `mid` int(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `mname` varchar(20) NOT NULL COMMENT '菜单名',
  `pid` int(11) DEFAULT NULL COMMENT '父菜单id',
  `url` varchar(100) DEFAULT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:可见，0：不可见',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `rank` int(11) DEFAULT NULL COMMENT '菜单的等级：一级菜单：1；二级菜单：2',
  `logo_file_name` varchar(100) DEFAULT NULL COMMENT 'logo图片的名字',
  `type` tinyint(1) DEFAULT NULL COMMENT '类型 NULL 平台  ，2 商家',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of e_admin_menu
-- ----------------------------
INSERT INTO `e_admin_menu` VALUES ('2', '商品管理', null, '', '1', '1', '1', '', null);
INSERT INTO `e_admin_menu` VALUES ('9', '店铺管理', null, null, '1', '18', '1', null, null);
INSERT INTO `e_admin_menu` VALUES ('14', '系统设置', null, null, '1', '40', '1', null, null);
INSERT INTO `e_admin_menu` VALUES ('15', '权限设置', '14', null, '1', '1', '2', null, null);
INSERT INTO `e_admin_menu` VALUES ('16', '管理角色', '15', '/role/list', '1', '1', '3', null, null);
INSERT INTO `e_admin_menu` VALUES ('47', '文章列表', '46', null, '1', '1', '3', null, null);
INSERT INTO `e_admin_menu` VALUES ('49', '管理菜单', '15', '/menu/list', '1', '1', '3', null, null);
INSERT INTO `e_admin_menu` VALUES ('50', '用户账号', '15', '/user/list', '1', '50', '3', null, null);
INSERT INTO `e_admin_menu` VALUES ('64', '首页第一', '1', '/index/list', '1', '100', '2', null, null);
INSERT INTO `e_admin_menu` VALUES ('67', '删除文章', '46', '/asf/delete', '1', '11', '3', null, null);
INSERT INTO `e_admin_menu` VALUES ('71', '文章分类', '7', '/articleclassify/ArtiCleclassify_list', '1', '8', '2', null, null);
INSERT INTO `e_admin_menu` VALUES ('72', '文章', '7', '/article/Article_list', '1', '1', '2', null, null);
INSERT INTO `e_admin_menu` VALUES ('78', '交易列表', '6', '/trade/list', '1', '1', '2', null, null);
INSERT INTO `e_admin_menu` VALUES ('79', '交易审批', '6', '/trade/list', '1', '20', '2', null, null);
INSERT INTO `e_admin_menu` VALUES ('80', '交易新建', '78', null, '1', '1', '3', null, null);
INSERT INTO `e_admin_menu` VALUES ('81', '账户安全', '14', '/use/safety', '1', '20', '2', null, null);
INSERT INTO `e_admin_menu` VALUES ('82', '后台操作记录', '81', '/log/list', '1', '10', '3', null, null);
INSERT INTO `e_admin_menu` VALUES ('83', '修改密码', '81', '/changePassword', '1', '20', '3', null, null);
INSERT INTO `e_admin_menu` VALUES ('86', '交易查询', '6', '/tr', '1', '20', '2', null, null);
INSERT INTO `e_admin_menu` VALUES ('88', '短信服务', '87', '/message/smsService', '1', '10', '3', null, null);
INSERT INTO `e_admin_menu` VALUES ('90', '邮箱服务', '87', '/message/emailService', '1', '20', '3', null, null);
INSERT INTO `e_admin_menu` VALUES ('92', '入驻店铺信息管理', '91', '/shop/selectshop', '1', '1', '3', null, null);
INSERT INTO `e_admin_menu` VALUES ('95', '店铺信息审核', '91', null, '1', '2', '3', null, null);
INSERT INTO `e_admin_menu` VALUES ('96', '商家消息管理', '91', null, '1', '3', '3', null, null);
INSERT INTO `e_admin_menu` VALUES ('98', '资质详情', '97', null, '1', '1', '5', null, null);
INSERT INTO `e_admin_menu` VALUES ('103', '店铺信息列表', '95', null, '1', '1', '4', null, null);
INSERT INTO `e_admin_menu` VALUES ('104', '店铺详情', '103', null, '1', '1', '5', null, null);
INSERT INTO `e_admin_menu` VALUES ('105', '经营类目', '104', null, '1', '1', '6', null, null);
INSERT INTO `e_admin_menu` VALUES ('106', '经营品牌', '104', null, '1', '2', '6', null, null);
INSERT INTO `e_admin_menu` VALUES ('107', '店铺首页装修', '103', null, '1', '2', '5', null, null);
INSERT INTO `e_admin_menu` VALUES ('108', '添加消息', '96', null, '1', '1', '4', null, null);
INSERT INTO `e_admin_menu` VALUES ('109', '添加消息', '96', null, '1', '1', '4', null, null);
INSERT INTO `e_admin_menu` VALUES ('114', '入驻店铺信息管理', '9', '/shop/selectshop', '1', '1', '2', null, null);
INSERT INTO `e_admin_menu` VALUES ('119', '合同管理', '114', null, '1', '2', '3', null, null);
INSERT INTO `e_admin_menu` VALUES ('121', '类目管理', '2', '', '1', '20', '2', '', null);
INSERT INTO `e_admin_menu` VALUES ('122', '类目列表', '121', '/GoodCategory/queryAllGoodCategory', '1', '100', '3', '', null);
INSERT INTO `e_admin_menu` VALUES ('125', '品牌管理', '2', '', '1', '3', '2', '', null);
INSERT INTO `e_admin_menu` VALUES ('126', '字典库管理', '14', null, '1', '40', '2', null, null);
INSERT INTO `e_admin_menu` VALUES ('127', '类目证书管理', '126', '/certificate/list', '1', '10', '3', '021ce40fceb54770be73e2f059d1607a.jpg', null);
INSERT INTO `e_admin_menu` VALUES ('129', '品牌列表', '125', '/brand/list', '1', '10', '3', null, null);
INSERT INTO `e_admin_menu` VALUES ('130', '会员管理', null, null, '1', '1', null, null, null);
INSERT INTO `e_admin_menu` VALUES ('131', '会员列表', '130', '/member/list', '1', '1', null, null, null);
INSERT INTO `e_admin_menu` VALUES ('135', '资质变更审核列表', '114', '/aptitude/list', '1', '1', '3', null, null);
INSERT INTO `e_admin_menu` VALUES ('136', '订单管理', null, null, '1', '15', null, null, null);
INSERT INTO `e_admin_menu` VALUES ('137', '订单列表', '136', '/order/list', '1', '10', null, null, null);
INSERT INTO `e_admin_menu` VALUES ('138', '商品属性模板列表', '2', '/goodCategoryPropertyTemplet/list', '1', '30', '2', null, null);
INSERT INTO `e_admin_menu` VALUES ('140', '自取点列表', '139', null, '1', '1', null, null, null);
INSERT INTO `e_admin_menu` VALUES ('141', '添加自取点', '140', null, '1', '1', null, null, null);
INSERT INTO `e_admin_menu` VALUES ('142', '物流公司列表', '139', null, '1', '1', null, null, null);
INSERT INTO `e_admin_menu` VALUES ('143', '店铺信息列表', '116', '/shop/shopInfoList', '1', '1', '3', null, null);
INSERT INTO `e_admin_menu` VALUES ('144', '店铺首页装修', '116', '/shop/shopHomePageUpdate', '1', '1', '3', null, null);
INSERT INTO `e_admin_menu` VALUES ('145', '保证金管理', '114', null, '1', '1', '3', null, null);
INSERT INTO `e_admin_menu` VALUES ('146', '商品增刪改查', '114', '/shop/selectshop', '1', '1', '3', null, null);
INSERT INTO `e_admin_menu` VALUES ('148', '管理权限', '15', '/permission/list', '1', '50', '3', '', null);

-- ----------------------------
-- Table structure for e_admin_permission
-- ----------------------------
DROP TABLE IF EXISTS `e_admin_permission`;
CREATE TABLE `e_admin_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL COMMENT 'url地址',
  `name` varchar(64) DEFAULT NULL COMMENT 'url描述',
  `mid` bigint(20) DEFAULT NULL COMMENT '对应菜单的id',
  `type` tinyint(1) DEFAULT NULL COMMENT 'NULL为管理平台的权限；2为商家权限',
  `class_name` varchar(255) DEFAULT NULL COMMENT '归属类的类名，用于确定菜单下的权限列表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=494 DEFAULT CHARSET=utf8 COMMENT='后台管理权限表';

-- ----------------------------
-- Records of e_admin_permission
-- ----------------------------
INSERT INTO `e_admin_permission` VALUES ('454', '/certificate/batchDelete', '删除证书', null, null, 'com.csair.admin.core.controller.CertificateController');
INSERT INTO `e_admin_permission` VALUES ('455', '/user/list', '查询所有用户', null, null, 'com.csair.admin.core.controller.ManageUserController');
INSERT INTO `e_admin_permission` VALUES ('456', '/user/toEditUser', '新建用户', null, null, 'com.csair.admin.core.controller.ManageUserController');
INSERT INTO `e_admin_permission` VALUES ('457', '/role/userList', '角色成员查询', null, null, 'com.csair.admin.core.controller.RoleController');
INSERT INTO `e_admin_permission` VALUES ('458', '/role/addOrUpdataRole', '角色编辑', null, null, 'com.csair.admin.core.controller.RoleController');
INSERT INTO `e_admin_permission` VALUES ('459', '/brand/editBrand', '编辑品牌', null, null, 'com.csair.admin.core.controller.BrandController');
INSERT INTO `e_admin_permission` VALUES ('460', '/user/editUser', '编辑用户', null, null, 'com.csair.admin.core.controller.ManageUserController');
INSERT INTO `e_admin_permission` VALUES ('463', '/role/editRolePermission', '角色权限编辑', null, null, 'com.csair.admin.core.controller.RoleController');
INSERT INTO `e_admin_permission` VALUES ('464', '/brand/toEditBrand', '编辑品牌', null, null, 'com.csair.admin.core.controller.BrandController');
INSERT INTO `e_admin_permission` VALUES ('465', '/role/list', '角色查询', null, null, 'com.csair.admin.core.controller.RoleController');
INSERT INTO `e_admin_permission` VALUES ('466', '/changePassword', '修改密码', null, null, 'com.csair.admin.core.controller.UserController');
INSERT INTO `e_admin_permission` VALUES ('467', '/user/downloadUser', '下载用户数据', null, null, 'com.csair.admin.core.controller.ManageUserController');
INSERT INTO `e_admin_permission` VALUES ('468', '/brand/batchDeleteBrand', '删除品牌', null, null, 'com.csair.admin.core.controller.BrandController');
INSERT INTO `e_admin_permission` VALUES ('469', '/certificate/toEditCertificate', '编辑证书', null, null, 'com.csair.admin.core.controller.CertificateController');
INSERT INTO `e_admin_permission` VALUES ('471', '/menu/edit', '管理菜单', null, null, 'com.csair.admin.core.controller.MenuController');
INSERT INTO `e_admin_permission` VALUES ('472', '/certificate/batchInsertCertificate', '编辑证书', null, null, 'com.csair.admin.core.controller.CertificateController');
INSERT INTO `e_admin_permission` VALUES ('473', '/menu/list', '菜单查询', null, null, 'com.csair.admin.core.controller.MenuController');
INSERT INTO `e_admin_permission` VALUES ('474', '/permission/list', '权限查询', null, null, 'com.csair.admin.core.controller.PermissionController');
INSERT INTO `e_admin_permission` VALUES ('475', '/role/inputRole', '角色编辑', null, null, 'com.csair.admin.core.controller.RoleController');
INSERT INTO `e_admin_permission` VALUES ('476', '/menu/delete', '删除菜单', null, null, 'com.csair.admin.core.controller.MenuController');
INSERT INTO `e_admin_permission` VALUES ('478', '/user/changePassword', '修改密码', null, null, 'com.csair.admin.core.controller.UserController');
INSERT INTO `e_admin_permission` VALUES ('479', '/role/deleteRole', '删除角色', null, null, 'com.csair.admin.core.controller.RoleController');
INSERT INTO `e_admin_permission` VALUES ('480', '/role/removeRoleUser', '删除角色成员', null, null, 'com.csair.admin.core.controller.RoleController');
INSERT INTO `e_admin_permission` VALUES ('481', '/forbidUserLogin', '禁止用户登陆', null, null, 'com.csair.admin.core.controller.ManageUserController');
INSERT INTO `e_admin_permission` VALUES ('483', '/brand/list', '查看品牌', null, null, 'com.csair.admin.core.controller.BrandController');
INSERT INTO `e_admin_permission` VALUES ('484', '/cancelForbidUserLogin', '解禁用户登陆', null, null, 'com.csair.admin.core.controller.ManageUserController');
INSERT INTO `e_admin_permission` VALUES ('485', '/log/list', '操作历史查询', null, null, 'com.csair.admin.core.controller.OperationLogController');
INSERT INTO `e_admin_permission` VALUES ('486', '/certificate/list', '查询证书', null, null, 'com.csair.admin.core.controller.CertificateController');
INSERT INTO `e_admin_permission` VALUES ('488', '/certificate/editCertificate', '编辑证书', null, null, 'com.csair.admin.core.controller.CertificateController');
INSERT INTO `e_admin_permission` VALUES ('489', '/menu/toEdit', '管理菜单', null, null, 'com.csair.admin.core.controller.MenuController');
INSERT INTO `e_admin_permission` VALUES ('492', '/permission/toEditPermission||/permission/editPermission||/permission/list', '编辑权限', null, null, null);
INSERT INTO `e_admin_permission` VALUES ('493', '/GoodCategory/queryAllGoodCategory', '类目列表', null, null, null);

-- ----------------------------
-- Table structure for e_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `e_admin_role`;
CREATE TABLE `e_admin_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(32) DEFAULT NULL COMMENT '角色名称',
  `type` varchar(10) DEFAULT NULL COMMENT '角色类型',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `shop_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='后台管理角色表';

-- ----------------------------
-- Records of e_admin_role
-- ----------------------------
INSERT INTO `e_admin_role` VALUES ('1', '管理员', 'admin', '超级管理员1', null);
INSERT INTO `e_admin_role` VALUES ('2', '编辑', '编辑', '编辑', null);
INSERT INTO `e_admin_role` VALUES ('4', '普通用户', 'normal', '90-', null);
INSERT INTO `e_admin_role` VALUES ('5', '21', '1221', '2121', null);
INSERT INTO `e_admin_role` VALUES ('7', '测试员2', 'root', '99999', null);

-- ----------------------------
-- Table structure for e_admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `e_admin_role_menu`;
CREATE TABLE `e_admin_role_menu` (
  `mid` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID',
  UNIQUE KEY `uniques1` (`mid`,`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台角色与菜单关联表';

-- ----------------------------
-- Records of e_admin_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for e_admin_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `e_admin_role_permission`;
CREATE TABLE `e_admin_role_permission` (
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '权限ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与权限关联表';

-- ----------------------------
-- Records of e_admin_role_permission
-- ----------------------------
INSERT INTO `e_admin_role_permission` VALUES ('1', '453');
INSERT INTO `e_admin_role_permission` VALUES ('1', '454');
INSERT INTO `e_admin_role_permission` VALUES ('1', '455');
INSERT INTO `e_admin_role_permission` VALUES ('1', '456');
INSERT INTO `e_admin_role_permission` VALUES ('1', '457');
INSERT INTO `e_admin_role_permission` VALUES ('1', '458');
INSERT INTO `e_admin_role_permission` VALUES ('1', '459');
INSERT INTO `e_admin_role_permission` VALUES ('1', '460');
INSERT INTO `e_admin_role_permission` VALUES ('1', '461');
INSERT INTO `e_admin_role_permission` VALUES ('1', '462');
INSERT INTO `e_admin_role_permission` VALUES ('1', '463');
INSERT INTO `e_admin_role_permission` VALUES ('1', '464');
INSERT INTO `e_admin_role_permission` VALUES ('1', '465');
INSERT INTO `e_admin_role_permission` VALUES ('1', '466');
INSERT INTO `e_admin_role_permission` VALUES ('1', '467');
INSERT INTO `e_admin_role_permission` VALUES ('1', '468');
INSERT INTO `e_admin_role_permission` VALUES ('1', '469');
INSERT INTO `e_admin_role_permission` VALUES ('1', '470');
INSERT INTO `e_admin_role_permission` VALUES ('1', '471');
INSERT INTO `e_admin_role_permission` VALUES ('1', '472');
INSERT INTO `e_admin_role_permission` VALUES ('1', '473');
INSERT INTO `e_admin_role_permission` VALUES ('1', '474');
INSERT INTO `e_admin_role_permission` VALUES ('1', '475');
INSERT INTO `e_admin_role_permission` VALUES ('1', '476');
INSERT INTO `e_admin_role_permission` VALUES ('1', '477');
INSERT INTO `e_admin_role_permission` VALUES ('1', '478');
INSERT INTO `e_admin_role_permission` VALUES ('1', '479');
INSERT INTO `e_admin_role_permission` VALUES ('1', '480');
INSERT INTO `e_admin_role_permission` VALUES ('1', '481');
INSERT INTO `e_admin_role_permission` VALUES ('1', '482');
INSERT INTO `e_admin_role_permission` VALUES ('1', '483');
INSERT INTO `e_admin_role_permission` VALUES ('1', '484');
INSERT INTO `e_admin_role_permission` VALUES ('1', '485');
INSERT INTO `e_admin_role_permission` VALUES ('1', '486');
INSERT INTO `e_admin_role_permission` VALUES ('1', '487');
INSERT INTO `e_admin_role_permission` VALUES ('1', '488');
INSERT INTO `e_admin_role_permission` VALUES ('1', '489');
INSERT INTO `e_admin_role_permission` VALUES ('2', '455');
INSERT INTO `e_admin_role_permission` VALUES ('2', '456');
INSERT INTO `e_admin_role_permission` VALUES ('2', '460');
INSERT INTO `e_admin_role_permission` VALUES ('2', '467');
INSERT INTO `e_admin_role_permission` VALUES ('2', '481');
INSERT INTO `e_admin_role_permission` VALUES ('2', '484');
INSERT INTO `e_admin_role_permission` VALUES ('2', '485');
INSERT INTO `e_admin_role_permission` VALUES ('2', '466');
INSERT INTO `e_admin_role_permission` VALUES ('2', '483');
INSERT INTO `e_admin_role_permission` VALUES ('2', '457');
INSERT INTO `e_admin_role_permission` VALUES ('2', '465');
INSERT INTO `e_admin_role_permission` VALUES ('1', '463');
INSERT INTO `e_admin_role_permission` VALUES ('1', '464');
INSERT INTO `e_admin_role_permission` VALUES ('1', '465');
INSERT INTO `e_admin_role_permission` VALUES ('1', '466');
INSERT INTO `e_admin_role_permission` VALUES ('1', '467');
INSERT INTO `e_admin_role_permission` VALUES ('1', '468');
INSERT INTO `e_admin_role_permission` VALUES ('1', '469');
INSERT INTO `e_admin_role_permission` VALUES ('1', '470');
INSERT INTO `e_admin_role_permission` VALUES ('1', '471');
INSERT INTO `e_admin_role_permission` VALUES ('1', '472');
INSERT INTO `e_admin_role_permission` VALUES ('1', '473');
INSERT INTO `e_admin_role_permission` VALUES ('1', '474');
INSERT INTO `e_admin_role_permission` VALUES ('1', '475');
INSERT INTO `e_admin_role_permission` VALUES ('1', '476');
INSERT INTO `e_admin_role_permission` VALUES ('1', '477');
INSERT INTO `e_admin_role_permission` VALUES ('1', '478');
INSERT INTO `e_admin_role_permission` VALUES ('1', '479');
INSERT INTO `e_admin_role_permission` VALUES ('1', '480');
INSERT INTO `e_admin_role_permission` VALUES ('1', '481');
INSERT INTO `e_admin_role_permission` VALUES ('1', '482');
INSERT INTO `e_admin_role_permission` VALUES ('1', '483');
INSERT INTO `e_admin_role_permission` VALUES ('1', '484');
INSERT INTO `e_admin_role_permission` VALUES ('1', '485');
INSERT INTO `e_admin_role_permission` VALUES ('1', '486');
INSERT INTO `e_admin_role_permission` VALUES ('1', '487');
INSERT INTO `e_admin_role_permission` VALUES ('1', '488');
INSERT INTO `e_admin_role_permission` VALUES ('1', '489');
INSERT INTO `e_admin_role_permission` VALUES ('1', '463');
INSERT INTO `e_admin_role_permission` VALUES ('1', '464');
INSERT INTO `e_admin_role_permission` VALUES ('1', '465');
INSERT INTO `e_admin_role_permission` VALUES ('1', '466');
INSERT INTO `e_admin_role_permission` VALUES ('1', '467');
INSERT INTO `e_admin_role_permission` VALUES ('1', '468');
INSERT INTO `e_admin_role_permission` VALUES ('1', '469');
INSERT INTO `e_admin_role_permission` VALUES ('1', '470');
INSERT INTO `e_admin_role_permission` VALUES ('1', '471');
INSERT INTO `e_admin_role_permission` VALUES ('1', '472');
INSERT INTO `e_admin_role_permission` VALUES ('1', '473');
INSERT INTO `e_admin_role_permission` VALUES ('1', '474');
INSERT INTO `e_admin_role_permission` VALUES ('1', '475');
INSERT INTO `e_admin_role_permission` VALUES ('1', '476');
INSERT INTO `e_admin_role_permission` VALUES ('1', '477');
INSERT INTO `e_admin_role_permission` VALUES ('1', '478');
INSERT INTO `e_admin_role_permission` VALUES ('1', '479');
INSERT INTO `e_admin_role_permission` VALUES ('1', '480');
INSERT INTO `e_admin_role_permission` VALUES ('1', '481');
INSERT INTO `e_admin_role_permission` VALUES ('1', '482');
INSERT INTO `e_admin_role_permission` VALUES ('1', '483');
INSERT INTO `e_admin_role_permission` VALUES ('1', '484');
INSERT INTO `e_admin_role_permission` VALUES ('1', '485');
INSERT INTO `e_admin_role_permission` VALUES ('1', '486');
INSERT INTO `e_admin_role_permission` VALUES ('1', '487');
INSERT INTO `e_admin_role_permission` VALUES ('1', '488');
INSERT INTO `e_admin_role_permission` VALUES ('1', '489');
INSERT INTO `e_admin_role_permission` VALUES ('1', '463');
INSERT INTO `e_admin_role_permission` VALUES ('1', '464');
INSERT INTO `e_admin_role_permission` VALUES ('1', '465');
INSERT INTO `e_admin_role_permission` VALUES ('1', '466');
INSERT INTO `e_admin_role_permission` VALUES ('1', '467');
INSERT INTO `e_admin_role_permission` VALUES ('1', '468');
INSERT INTO `e_admin_role_permission` VALUES ('1', '469');
INSERT INTO `e_admin_role_permission` VALUES ('1', '470');
INSERT INTO `e_admin_role_permission` VALUES ('1', '471');
INSERT INTO `e_admin_role_permission` VALUES ('1', '472');
INSERT INTO `e_admin_role_permission` VALUES ('1', '473');
INSERT INTO `e_admin_role_permission` VALUES ('1', '474');
INSERT INTO `e_admin_role_permission` VALUES ('1', '475');
INSERT INTO `e_admin_role_permission` VALUES ('1', '476');
INSERT INTO `e_admin_role_permission` VALUES ('1', '477');
INSERT INTO `e_admin_role_permission` VALUES ('1', '478');
INSERT INTO `e_admin_role_permission` VALUES ('1', '479');
INSERT INTO `e_admin_role_permission` VALUES ('1', '480');
INSERT INTO `e_admin_role_permission` VALUES ('1', '481');
INSERT INTO `e_admin_role_permission` VALUES ('1', '482');
INSERT INTO `e_admin_role_permission` VALUES ('1', '483');
INSERT INTO `e_admin_role_permission` VALUES ('1', '484');
INSERT INTO `e_admin_role_permission` VALUES ('1', '485');
INSERT INTO `e_admin_role_permission` VALUES ('1', '486');
INSERT INTO `e_admin_role_permission` VALUES ('1', '487');
INSERT INTO `e_admin_role_permission` VALUES ('1', '488');
INSERT INTO `e_admin_role_permission` VALUES ('1', '489');
INSERT INTO `e_admin_role_permission` VALUES ('1', '463');
INSERT INTO `e_admin_role_permission` VALUES ('1', '464');
INSERT INTO `e_admin_role_permission` VALUES ('1', '465');
INSERT INTO `e_admin_role_permission` VALUES ('1', '466');
INSERT INTO `e_admin_role_permission` VALUES ('1', '467');
INSERT INTO `e_admin_role_permission` VALUES ('1', '468');
INSERT INTO `e_admin_role_permission` VALUES ('1', '469');
INSERT INTO `e_admin_role_permission` VALUES ('1', '470');
INSERT INTO `e_admin_role_permission` VALUES ('1', '471');
INSERT INTO `e_admin_role_permission` VALUES ('1', '472');
INSERT INTO `e_admin_role_permission` VALUES ('1', '473');
INSERT INTO `e_admin_role_permission` VALUES ('1', '474');
INSERT INTO `e_admin_role_permission` VALUES ('1', '475');
INSERT INTO `e_admin_role_permission` VALUES ('1', '476');
INSERT INTO `e_admin_role_permission` VALUES ('1', '477');
INSERT INTO `e_admin_role_permission` VALUES ('1', '478');
INSERT INTO `e_admin_role_permission` VALUES ('1', '479');
INSERT INTO `e_admin_role_permission` VALUES ('1', '480');
INSERT INTO `e_admin_role_permission` VALUES ('1', '481');
INSERT INTO `e_admin_role_permission` VALUES ('1', '482');
INSERT INTO `e_admin_role_permission` VALUES ('1', '483');
INSERT INTO `e_admin_role_permission` VALUES ('1', '484');
INSERT INTO `e_admin_role_permission` VALUES ('1', '485');
INSERT INTO `e_admin_role_permission` VALUES ('1', '486');
INSERT INTO `e_admin_role_permission` VALUES ('1', '487');
INSERT INTO `e_admin_role_permission` VALUES ('1', '488');
INSERT INTO `e_admin_role_permission` VALUES ('1', '489');
INSERT INTO `e_admin_role_permission` VALUES ('1', '463');
INSERT INTO `e_admin_role_permission` VALUES ('1', '464');
INSERT INTO `e_admin_role_permission` VALUES ('1', '465');
INSERT INTO `e_admin_role_permission` VALUES ('1', '466');
INSERT INTO `e_admin_role_permission` VALUES ('1', '467');
INSERT INTO `e_admin_role_permission` VALUES ('1', '468');
INSERT INTO `e_admin_role_permission` VALUES ('1', '469');
INSERT INTO `e_admin_role_permission` VALUES ('1', '470');
INSERT INTO `e_admin_role_permission` VALUES ('1', '471');
INSERT INTO `e_admin_role_permission` VALUES ('1', '472');
INSERT INTO `e_admin_role_permission` VALUES ('1', '473');
INSERT INTO `e_admin_role_permission` VALUES ('1', '474');
INSERT INTO `e_admin_role_permission` VALUES ('1', '475');
INSERT INTO `e_admin_role_permission` VALUES ('1', '476');
INSERT INTO `e_admin_role_permission` VALUES ('1', '477');
INSERT INTO `e_admin_role_permission` VALUES ('1', '478');
INSERT INTO `e_admin_role_permission` VALUES ('1', '479');
INSERT INTO `e_admin_role_permission` VALUES ('1', '480');
INSERT INTO `e_admin_role_permission` VALUES ('1', '481');
INSERT INTO `e_admin_role_permission` VALUES ('1', '482');
INSERT INTO `e_admin_role_permission` VALUES ('1', '483');
INSERT INTO `e_admin_role_permission` VALUES ('1', '484');
INSERT INTO `e_admin_role_permission` VALUES ('1', '485');
INSERT INTO `e_admin_role_permission` VALUES ('1', '486');
INSERT INTO `e_admin_role_permission` VALUES ('1', '487');
INSERT INTO `e_admin_role_permission` VALUES ('1', '488');
INSERT INTO `e_admin_role_permission` VALUES ('1', '489');
INSERT INTO `e_admin_role_permission` VALUES ('1', '463');
INSERT INTO `e_admin_role_permission` VALUES ('1', '464');
INSERT INTO `e_admin_role_permission` VALUES ('1', '465');
INSERT INTO `e_admin_role_permission` VALUES ('1', '466');
INSERT INTO `e_admin_role_permission` VALUES ('1', '467');
INSERT INTO `e_admin_role_permission` VALUES ('1', '468');
INSERT INTO `e_admin_role_permission` VALUES ('1', '469');
INSERT INTO `e_admin_role_permission` VALUES ('1', '470');
INSERT INTO `e_admin_role_permission` VALUES ('1', '471');
INSERT INTO `e_admin_role_permission` VALUES ('1', '472');
INSERT INTO `e_admin_role_permission` VALUES ('1', '473');
INSERT INTO `e_admin_role_permission` VALUES ('1', '474');
INSERT INTO `e_admin_role_permission` VALUES ('1', '475');
INSERT INTO `e_admin_role_permission` VALUES ('1', '476');
INSERT INTO `e_admin_role_permission` VALUES ('1', '477');
INSERT INTO `e_admin_role_permission` VALUES ('1', '478');
INSERT INTO `e_admin_role_permission` VALUES ('1', '479');
INSERT INTO `e_admin_role_permission` VALUES ('1', '480');
INSERT INTO `e_admin_role_permission` VALUES ('1', '481');
INSERT INTO `e_admin_role_permission` VALUES ('1', '482');
INSERT INTO `e_admin_role_permission` VALUES ('1', '483');
INSERT INTO `e_admin_role_permission` VALUES ('1', '484');
INSERT INTO `e_admin_role_permission` VALUES ('1', '485');
INSERT INTO `e_admin_role_permission` VALUES ('1', '486');
INSERT INTO `e_admin_role_permission` VALUES ('1', '487');
INSERT INTO `e_admin_role_permission` VALUES ('1', '488');
INSERT INTO `e_admin_role_permission` VALUES ('1', '489');
INSERT INTO `e_admin_role_permission` VALUES ('1', '463');
INSERT INTO `e_admin_role_permission` VALUES ('1', '464');
INSERT INTO `e_admin_role_permission` VALUES ('1', '465');
INSERT INTO `e_admin_role_permission` VALUES ('1', '466');
INSERT INTO `e_admin_role_permission` VALUES ('1', '467');
INSERT INTO `e_admin_role_permission` VALUES ('1', '468');
INSERT INTO `e_admin_role_permission` VALUES ('1', '469');
INSERT INTO `e_admin_role_permission` VALUES ('1', '470');
INSERT INTO `e_admin_role_permission` VALUES ('1', '471');
INSERT INTO `e_admin_role_permission` VALUES ('1', '472');
INSERT INTO `e_admin_role_permission` VALUES ('1', '473');
INSERT INTO `e_admin_role_permission` VALUES ('1', '474');
INSERT INTO `e_admin_role_permission` VALUES ('1', '475');
INSERT INTO `e_admin_role_permission` VALUES ('1', '476');
INSERT INTO `e_admin_role_permission` VALUES ('1', '477');
INSERT INTO `e_admin_role_permission` VALUES ('1', '478');
INSERT INTO `e_admin_role_permission` VALUES ('1', '479');
INSERT INTO `e_admin_role_permission` VALUES ('1', '480');
INSERT INTO `e_admin_role_permission` VALUES ('1', '481');
INSERT INTO `e_admin_role_permission` VALUES ('1', '482');
INSERT INTO `e_admin_role_permission` VALUES ('1', '483');
INSERT INTO `e_admin_role_permission` VALUES ('1', '484');
INSERT INTO `e_admin_role_permission` VALUES ('1', '485');
INSERT INTO `e_admin_role_permission` VALUES ('1', '486');
INSERT INTO `e_admin_role_permission` VALUES ('1', '487');
INSERT INTO `e_admin_role_permission` VALUES ('1', '488');
INSERT INTO `e_admin_role_permission` VALUES ('1', '489');

-- ----------------------------
-- Table structure for e_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `e_admin_user`;
CREATE TABLE `e_admin_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `nickname` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱|登录帐号',
  `pswd` varchar(32) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` bigint(1) DEFAULT '1' COMMENT '1:有效，0:禁止登录',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机',
  `wx_unionid` varchar(50) DEFAULT NULL COMMENT '微信unionid',
  `last_ip` varchar(50) DEFAULT NULL COMMENT '上次登录ip',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `type` tinyint(1) DEFAULT NULL COMMENT '管理员类型 1 平台  ，2 商家',
  `shop_id` int(10) DEFAULT NULL COMMENT '商家id',
  `platform_flag` varchar(20) NOT NULL,
  `hash_code` varchar(6) DEFAULT NULL COMMENT 'hash',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='后台用户表';

-- ----------------------------
-- Records of e_admin_user
-- ----------------------------
INSERT INTO `e_admin_user` VALUES ('1', 'julice', 'julice@test.com', 'F54C5F3213B11DDD2692C4E53301C66B', '2017-03-29 08:49:00', '2017-03-29 08:49:00', '1', '222', '222', '222', '2222', '1', '222', 'csair_admin', 'aaaaaa');
INSERT INTO `e_admin_user` VALUES ('2', 'bob', 'bob@test.com', 'F54C5F3213B11DDD2692C4E53301C66B', '2017-03-29 08:49:00', '2017-10-26 17:23:28', '1', null, null, '0:0:0:0:0:0:0:1', null, null, null, 'csair_admin', 'aaaaaa');
INSERT INTO `e_admin_user` VALUES ('3', 'alice1', 'alice@test.com', 'F54C5F3213B11DDD2692C4E53301C66B', '2017-03-29 08:49:00', '2017-12-01 14:40:32', '1', null, null, '0:0:0:0:0:0:0:1', null, null, null, 'csair_admin', 'aaaaaa');
INSERT INTO `e_admin_user` VALUES ('23', '123', '2112211221', '783ED423A9D32A96DD84135D8F7EF87A', '2017-07-18 10:02:02', null, '1', null, null, '111', '1221', '1', null, 'csair_admin', 'aaaaaa');
INSERT INTO `e_admin_user` VALUES ('24', 'testCreate', 'testCerate@test.com', '685228DC8CB1074BD2E9A87F69F103A3', '2017-07-18 11:57:17', null, '0', null, null, '111', '12', '1', null, 'csair_admin', 'kT0OpD');
INSERT INTO `e_admin_user` VALUES ('25', 'dsgfsad ', 'ateate', '5CED7152440C7125D028EF8CF6389334', '2017-07-26 09:19:33', null, '0', null, null, '111', '', '1', null, 'csair_admin', 'Nfio2Y');
INSERT INTO `e_admin_user` VALUES ('43', 'userAdmin', '1', '123', '2017-07-26 09:19:33', null, '2', null, null, '111', null, '2', '1', '1', null);
INSERT INTO `e_admin_user` VALUES ('50', 'userAdmin', '1', '123', '2017-07-26 09:19:33', null, '2', null, null, '111', null, '2', '2', '1', null);
INSERT INTO `e_admin_user` VALUES ('51', 'userAdmin', '1', '123', '2017-07-26 09:19:33', null, '2', null, null, '111', null, '2', '3', '1', null);
INSERT INTO `e_admin_user` VALUES ('52', 'userAdmin', '1', '123', '2017-07-26 09:19:33', null, '2', null, null, '111', null, '2', '4', '1', null);
INSERT INTO `e_admin_user` VALUES ('54', 'alice@test.com', '1', 'C1CA17EDD59C7A159B88A3980B8B7ABB', '2017-07-26 09:19:33', null, '1', null, null, '111', '', '1', null, 'csair_admin', 'ZAFhve');
INSERT INTO `e_admin_user` VALUES ('57', 'alice@test.com', '1', '741D677BB4A90D5027B0D06BEC00EDC5', '2017-07-26 09:19:33', null, '1', null, null, '111', '', '1', null, 'csair_admin', '90cBlA');
INSERT INTO `e_admin_user` VALUES ('58', '1', '1', null, '2017-07-26 09:19:33', null, '1', null, null, '111', null, null, null, '1', null);
INSERT INTO `e_admin_user` VALUES ('59', '昵称', '1', null, '2017-07-26 09:19:33', null, '1', null, null, '111', null, null, null, '1', null);
INSERT INTO `e_admin_user` VALUES ('60', '昵称', '1', null, '2017-07-26 09:19:33', null, '1', null, null, '111', null, null, null, '1', null);

-- ----------------------------
-- Table structure for e_admin_user_role
-- ----------------------------
DROP TABLE IF EXISTS `e_admin_user_role`;
CREATE TABLE `e_admin_user_role` (
  `uid` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台用户与角色关联表';

-- ----------------------------
-- Records of e_admin_user_role
-- ----------------------------
INSERT INTO `e_admin_user_role` VALUES ('1', '3');
INSERT INTO `e_admin_user_role` VALUES ('3', '3');
INSERT INTO `e_admin_user_role` VALUES ('4', '2');
INSERT INTO `e_admin_user_role` VALUES ('4', '3');
INSERT INTO `e_admin_user_role` VALUES ('5', '3');
INSERT INTO `e_admin_user_role` VALUES ('5', '4');
INSERT INTO `e_admin_user_role` VALUES ('6', '4');
INSERT INTO `e_admin_user_role` VALUES ('2', '5');
INSERT INTO `e_admin_user_role` VALUES ('2', '2');
INSERT INTO `e_admin_user_role` VALUES ('2', '4');
INSERT INTO `e_admin_user_role` VALUES (null, '1');
INSERT INTO `e_admin_user_role` VALUES ('1', '6');
INSERT INTO `e_admin_user_role` VALUES ('3', '1');
INSERT INTO `e_admin_user_role` VALUES ('4', '2');
INSERT INTO `e_admin_user_role` VALUES ('5', '2');
INSERT INTO `e_admin_user_role` VALUES ('14', '7');
INSERT INTO `e_admin_user_role` VALUES ('15', '7');
INSERT INTO `e_admin_user_role` VALUES ('16', '2');
INSERT INTO `e_admin_user_role` VALUES ('17', '4');
INSERT INTO `e_admin_user_role` VALUES ('18', '5');
INSERT INTO `e_admin_user_role` VALUES ('19', '7');
INSERT INTO `e_admin_user_role` VALUES ('21', '2');
INSERT INTO `e_admin_user_role` VALUES ('16', '7');
INSERT INTO `e_admin_user_role` VALUES ('22', '2');
INSERT INTO `e_admin_user_role` VALUES ('23', '2');
INSERT INTO `e_admin_user_role` VALUES ('54', '1');
INSERT INTO `e_admin_user_role` VALUES ('55', '2');
INSERT INTO `e_admin_user_role` VALUES ('56', '2');
INSERT INTO `e_admin_user_role` VALUES ('57', '2');
INSERT INTO `e_admin_user_role` VALUES ('11111111111111111', '1');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('237', null, '/weixing');
INSERT INTO `permission` VALUES ('238', '删除证书', '/certificate/batchDelete');
INSERT INTO `permission` VALUES ('239', '查询所有用户', '/user/list');
INSERT INTO `permission` VALUES ('240', null, '/user/toEditUser');
INSERT INTO `permission` VALUES ('241', '角色编辑', '/role/addOrUpdataRole');
INSERT INTO `permission` VALUES ('242', '角色成员查询', '/role/userList');
INSERT INTO `permission` VALUES ('243', '编辑品牌', '/brand/editBrand');
INSERT INTO `permission` VALUES ('244', '编辑用户', '/user/editUser');
INSERT INTO `permission` VALUES ('245', null, '/authImage');
INSERT INTO `permission` VALUES ('246', null, '/menu/menuChild');
INSERT INTO `permission` VALUES ('247', '角色权限编辑', '/role/editRolePermission');
INSERT INTO `permission` VALUES ('248', '编辑品牌', '/brand/toEditBrand');
INSERT INTO `permission` VALUES ('249', '角色查询', '/role/list');
INSERT INTO `permission` VALUES ('250', '修改密码', '/changePassword');
INSERT INTO `permission` VALUES ('251', '下载用户数据', '/user/downloadUser');
INSERT INTO `permission` VALUES ('252', '删除品牌', '/brand/batchDeleteBrand');
INSERT INTO `permission` VALUES ('253', '编辑证书', '/certificate/toEditCertificate');
INSERT INTO `permission` VALUES ('254', null, '/menu/queryParentMenus');
INSERT INTO `permission` VALUES ('255', '管理菜单', '/menu/edit');
INSERT INTO `permission` VALUES ('256', '编辑证书', '/certificate/batchInsertCertificate');
INSERT INTO `permission` VALUES ('257', '菜单查询', '/menu/list');
INSERT INTO `permission` VALUES ('258', '权限查询', '/permission/list');
INSERT INTO `permission` VALUES ('259', '角色编辑', '/role/inputRole');
INSERT INTO `permission` VALUES ('260', '删除菜单', '/menu/delete');
INSERT INTO `permission` VALUES ('261', '权限编辑', '/permission/addMenu');
INSERT INTO `permission` VALUES ('262', '修改密码', '/user/changePassword');
INSERT INTO `permission` VALUES ('263', '删除角色', '/role/deleteRole');
INSERT INTO `permission` VALUES ('264', '删除角色成员', '/role/removeRoleUser');
INSERT INTO `permission` VALUES ('265', '禁止用户登陆', '/forbidUserLogin');
INSERT INTO `permission` VALUES ('266', '权限编辑', '/permission/edit');
INSERT INTO `permission` VALUES ('267', '查看品牌', '/brand/list');
INSERT INTO `permission` VALUES ('268', '解禁用户登陆', '/cancelForbidUserLogin');
INSERT INTO `permission` VALUES ('269', '操作历史查询', '/log/list');
INSERT INTO `permission` VALUES ('270', '查询证书', '/certificate/list');
INSERT INTO `permission` VALUES ('271', null, '/uploadFile');
INSERT INTO `permission` VALUES ('272', '编辑证书', '/certificate/editCertificate');
INSERT INTO `permission` VALUES ('273', '管理菜单', '/menu/toEdit');
INSERT INTO `permission` VALUES ('274', null, '/weixing');
INSERT INTO `permission` VALUES ('275', '删除证书', '/certificate/batchDelete');
INSERT INTO `permission` VALUES ('276', '查询所有用户', '/user/list');
INSERT INTO `permission` VALUES ('277', null, '/user/toEditUser');
INSERT INTO `permission` VALUES ('278', '角色编辑', '/role/addOrUpdataRole');
INSERT INTO `permission` VALUES ('279', '角色成员查询', '/role/userList');
INSERT INTO `permission` VALUES ('280', '编辑品牌', '/brand/editBrand');
INSERT INTO `permission` VALUES ('281', '编辑用户', '/user/editUser');
INSERT INTO `permission` VALUES ('282', null, '/authImage');
INSERT INTO `permission` VALUES ('283', null, '/menu/menuChild');
INSERT INTO `permission` VALUES ('284', '角色权限编辑', '/role/editRolePermission');
INSERT INTO `permission` VALUES ('285', '编辑品牌', '/brand/toEditBrand');
INSERT INTO `permission` VALUES ('286', '角色查询', '/role/list');
INSERT INTO `permission` VALUES ('287', '修改密码', '/changePassword');
INSERT INTO `permission` VALUES ('288', '下载用户数据', '/user/downloadUser');
INSERT INTO `permission` VALUES ('289', '删除品牌', '/brand/batchDeleteBrand');
INSERT INTO `permission` VALUES ('290', '编辑证书', '/certificate/toEditCertificate');
INSERT INTO `permission` VALUES ('291', null, '/menu/queryParentMenus');
INSERT INTO `permission` VALUES ('292', '管理菜单', '/menu/edit');
INSERT INTO `permission` VALUES ('293', '编辑证书', '/certificate/batchInsertCertificate');
INSERT INTO `permission` VALUES ('294', '菜单查询', '/menu/list');
INSERT INTO `permission` VALUES ('295', '权限查询', '/permission/list');
INSERT INTO `permission` VALUES ('296', '角色编辑', '/role/inputRole');
INSERT INTO `permission` VALUES ('297', '删除菜单', '/menu/delete');
INSERT INTO `permission` VALUES ('298', '权限编辑', '/permission/addMenu');
INSERT INTO `permission` VALUES ('299', '修改密码', '/user/changePassword');
INSERT INTO `permission` VALUES ('300', '删除角色', '/role/deleteRole');
INSERT INTO `permission` VALUES ('301', '删除角色成员', '/role/removeRoleUser');
INSERT INTO `permission` VALUES ('302', '禁止用户登陆', '/forbidUserLogin');
INSERT INTO `permission` VALUES ('303', '权限编辑', '/permission/edit');
INSERT INTO `permission` VALUES ('304', '查看品牌', '/brand/list');
INSERT INTO `permission` VALUES ('305', '解禁用户登陆', '/cancelForbidUserLogin');
INSERT INTO `permission` VALUES ('306', '操作历史查询', '/log/list');
INSERT INTO `permission` VALUES ('307', '查询证书', '/certificate/list');
INSERT INTO `permission` VALUES ('308', null, '/uploadFile');
INSERT INTO `permission` VALUES ('309', '编辑证书', '/certificate/editCertificate');
INSERT INTO `permission` VALUES ('310', '管理菜单', '/menu/toEdit');
INSERT INTO `permission` VALUES ('311', null, '/weixing');
INSERT INTO `permission` VALUES ('312', '删除证书', '/certificate/batchDelete');
INSERT INTO `permission` VALUES ('313', '查询所有用户', '/user/list');
INSERT INTO `permission` VALUES ('314', null, '/user/toEditUser');
INSERT INTO `permission` VALUES ('315', '角色编辑', '/role/addOrUpdataRole');
INSERT INTO `permission` VALUES ('316', '角色成员查询', '/role/userList');
INSERT INTO `permission` VALUES ('317', '编辑品牌', '/brand/editBrand');
INSERT INTO `permission` VALUES ('318', '编辑用户', '/user/editUser');
INSERT INTO `permission` VALUES ('319', null, '/authImage');
INSERT INTO `permission` VALUES ('320', null, '/menu/menuChild');
INSERT INTO `permission` VALUES ('321', '角色权限编辑', '/role/editRolePermission');
INSERT INTO `permission` VALUES ('322', '编辑品牌', '/brand/toEditBrand');
INSERT INTO `permission` VALUES ('323', '角色查询', '/role/list');
INSERT INTO `permission` VALUES ('324', '修改密码', '/changePassword');
INSERT INTO `permission` VALUES ('325', '下载用户数据', '/user/downloadUser');
INSERT INTO `permission` VALUES ('326', '删除品牌', '/brand/batchDeleteBrand');
INSERT INTO `permission` VALUES ('327', '编辑证书', '/certificate/toEditCertificate');
INSERT INTO `permission` VALUES ('328', null, '/menu/queryParentMenus');
INSERT INTO `permission` VALUES ('329', '管理菜单', '/menu/edit');
INSERT INTO `permission` VALUES ('330', '编辑证书', '/certificate/batchInsertCertificate');
INSERT INTO `permission` VALUES ('331', '菜单查询', '/menu/list');
INSERT INTO `permission` VALUES ('332', '权限查询', '/permission/list');
INSERT INTO `permission` VALUES ('333', '角色编辑', '/role/inputRole');
INSERT INTO `permission` VALUES ('334', '删除菜单', '/menu/delete');
INSERT INTO `permission` VALUES ('335', '权限编辑', '/permission/addMenu');
INSERT INTO `permission` VALUES ('336', '修改密码', '/user/changePassword');
INSERT INTO `permission` VALUES ('337', '删除角色', '/role/deleteRole');
INSERT INTO `permission` VALUES ('338', '删除角色成员', '/role/removeRoleUser');
INSERT INTO `permission` VALUES ('339', '禁止用户登陆', '/forbidUserLogin');
INSERT INTO `permission` VALUES ('340', '权限编辑', '/permission/edit');
INSERT INTO `permission` VALUES ('341', '查看品牌', '/brand/list');
INSERT INTO `permission` VALUES ('342', '解禁用户登陆', '/cancelForbidUserLogin');
INSERT INTO `permission` VALUES ('343', '操作历史查询', '/log/list');
INSERT INTO `permission` VALUES ('344', '查询证书', '/certificate/list');
INSERT INTO `permission` VALUES ('345', null, '/uploadFile');
INSERT INTO `permission` VALUES ('346', '编辑证书', '/certificate/editCertificate');
INSERT INTO `permission` VALUES ('347', '管理菜单', '/menu/toEdit');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `test_fail` varchar(50) DEFAULT NULL COMMENT '退货id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('1', '1');
INSERT INTO `test` VALUES ('12', '12');
INSERT INTO `test` VALUES ('121', '11');

-- ----------------------------
-- Procedure structure for num_from_employee
-- ----------------------------
DROP PROCEDURE IF EXISTS `num_from_employee`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `num_from_employee`(IN emp_id INT, OUT count_num INT)
    READS SQL DATA
BEGIN
              SELECT  COUNT(*)  INTO  count_num
              FROM  csair_log_operation
              WHERE  author=emp_id ;



END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_adder
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_adder`;
DELIMITER ;;
CREATE DEFINER=`csair_eshop`@`localhost` PROCEDURE `proc_adder`(IN a int, IN b int, OUT sum int)
BEGIN
    #Routine body goes here...

    DECLARE c int;
    if a is null then set a = 0;
    end if;

    if b is null then set b = 0;
    end if;

    set sum  = a + b;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for test_function
-- ----------------------------
DROP PROCEDURE IF EXISTS `test_function`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `test_function`( in name varchar(10) , out seq int)
begin
 select * FROM  test;
set seq = 10;
end
;;
DELIMITER ;
