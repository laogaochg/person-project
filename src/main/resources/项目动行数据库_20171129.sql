/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : springboot_layui

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-05-12 14:03:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for csair_brand
-- ----------------------------
DROP TABLE IF EXISTS `csair_brand`;
CREATE TABLE `csair_brand` (
  `brand_id` int(10) NOT NULL AUTO_INCREMENT COMMENT ''品牌id'',
  `brand_name` varchar(100) DEFAULT NULL COMMENT ''品牌名称'',
  `brand_logo` varchar(100) DEFAULT NULL COMMENT ''logo图片'',
  `brand_logo_thumb` varchar(100) DEFAULT NULL COMMENT ''logo图片缩略图'',
  `brand_website` varchar(100) DEFAULT NULL COMMENT ''品牌官网地址'',
  `brand_desc` text COMMENT ''品牌描述'',
  `brand_order` int(5) DEFAULT NULL COMMENT ''品牌排序'',
  `status` tinyint(1) DEFAULT NULL COMMENT ''状态 0-停用，1-启用'',
  `add_time` datetime DEFAULT NULL COMMENT ''添加时间'',
  `add_by` int(5) DEFAULT NULL COMMENT ''添加人'',
  PRIMARY KEY (`brand_id`),
  KEY `name_index` (`brand_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csair_brand
-- ----------------------------
INSERT INTO `csair_brand` VALUES (''9'', ''华为'', ''bd861e694ece4fa2b1f30d960b4afc27.jpg'', null, ''www.miansui.com'', ''免税&lt;img src=&quot;/image/e815704761784844af388e18776c9ceb.png&quot; alt=&quot;e815704761784844af388e18776c9ceb.png&quot;&gt;'', ''1'', ''1'', ''2017-06-20 17:35:10'', null);
INSERT INTO `csair_brand` VALUES (''10'', ''天天'', ''/images/err.gif'', null, ''www.kuajinggou.com'', ''跨境购&lt;b&gt;221221&lt;i&gt;22&lt;/i&gt;22&lt;strike&gt;2222222&lt;/strike&gt;2222gd gd gd&amp;nbsp;&lt;i&gt;&lt;u&gt;天天&amp;nbsp; &lt;/u&gt;在&amp;nbsp;在在&amp;nbsp;在&amp;nbsp;&amp;nbsp;&lt;/i&gt;&lt;/b&gt;&lt;img src=&quot;/my/2018-02-27/db145f78418d4b6e95170d4e298d3167.png&quot; alt=&quot;/my/2018-02-27/db145f78418d4b6e95170d4e298d3167.png&quot;&gt;&lt;img src=&quot;/2018-02-27/1ddbaba75a254be38764ae311fe78226.png&quot; alt=&quot;/2018-02-27/1ddbaba75a254be38764ae311fe78226.png&quot;&gt;'', ''211111111'', ''1'', ''2017-06-20 17:35:10'', null);
INSERT INTO `csair_brand` VALUES (''11'', ''水明'', ''072115bf1c9049678e6d6f76d5d40f6c.jpg'', null, ''www.hkjp.com'', ''航空精品'', ''3'', ''1'', ''2017-06-20 17:35:10'', null);
INSERT INTO `csair_brand` VALUES (''12'', ''小孙'', ''bd861e694ece4fa2b1f30d960b4afc27.jpg'', null, ''www.hyg.com'', ''航易购'', ''4'', ''1'', ''2017-06-20 17:35:10'', ''3'');
INSERT INTO `csair_brand` VALUES (''14'', ''小米11'', ''bd861e694ece4fa2b1f30d960b4afc27.jpg'', '''', ''http://www.baidu.com'', ''&lt;p&gt;&lt;img src=&quot;/html/img/0d24a521ac384c75a45dc3c42172db64.jpg&quot; alt=&quot;undefined&quot;/&gt;1222&lt;span style=&quot;text-decoration:underline;&quot;&gt;222222222211&lt;/span&gt;1111111111111&lt;/p&gt;'', ''101'', null, null, null);

-- ----------------------------
-- Table structure for csair_certificate
-- ----------------------------
DROP TABLE IF EXISTS `csair_certificate`;
CREATE TABLE `csair_certificate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT ''用户id'',
  `name` varchar(20) DEFAULT NULL COMMENT ''用户昵称'',
  `remark` varchar(100) DEFAULT NULL COMMENT ''备注'',
  `create_id` bigint(20) DEFAULT NULL COMMENT ''创建人'',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT=''证书表_类目二级关联'';

-- ----------------------------
-- Records of csair_certificate
-- ----------------------------
INSERT INTO `csair_certificate` VALUES (''1'', ''单身证书'', ''单身'', ''3'', ''2017-07-24 18:25:12'', null);
INSERT INTO `csair_certificate` VALUES (''2'', ''四级证书'', ''四级1'', ''3'', ''2017-07-24 20:32:44'', ''2018-02-26 22:08:24'');
INSERT INTO `csair_certificate` VALUES (''15'', ''七级证书'', ''七级1'', ''3'', ''2017-07-31 14:15:28'', ''2017-07-31 14:15:35'');
INSERT INTO `csair_certificate` VALUES (''16'', ''卫生证书'', ''12'', ''3'', ''2017-07-31 14:15:48'', null);

-- ----------------------------
-- Table structure for csair_log_operation
-- ----------------------------
DROP TABLE IF EXISTS `csair_log_operation`;
CREATE TABLE `csair_log_operation` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `author` varchar(80) NOT NULL COMMENT ''操作人员id'',
  `action` varchar(200) NOT NULL COMMENT ''动作'',
  `content` text COMMENT ''内容'',
  `op_time` datetime NOT NULL COMMENT ''操作时间'',
  `op_ip` varchar(255) DEFAULT NULL COMMENT ''操作的ip地址'',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3106 DEFAULT CHARSET=utf8 COMMENT=''后台操作记录日志'';

-- ----------------------------
-- Records of csair_log_operation
-- ----------------------------
INSERT INTO `csair_log_operation` VALUES (''3100'', ''3'', ''新增权限'', ''权限的id：null权限的名字：44  权限的url：44444'', ''2018-05-07 20:11:50'', ''0:0:0:0:0:0:0:1'');
INSERT INTO `csair_log_operation` VALUES (''3101'', ''3'', ''添加权限'', ''权限名字：图书列表 ,URL: /123213'', ''2018-05-07 21:11:46'', ''127.0.0.1'');
INSERT INTO `csair_log_operation` VALUES (''3102'', ''3'', ''修改权限'', ''权限名字：权限列表 ,URL: /permission/permissionList'', ''2018-05-07 21:45:33'', ''127.0.0.1'');
INSERT INTO `csair_log_operation` VALUES (''3103'', ''3'', ''添加权限'', ''权限名字：21121221 ,URL: 122121'', ''2018-05-07 21:47:31'', ''127.0.0.1'');
INSERT INTO `csair_log_operation` VALUES (''3104'', ''3'', ''修改菜单'', ''菜单id:158；菜单名：44；菜单的url：44444'', ''2018-05-07 22:13:53'', ''127.0.0.1'');
INSERT INTO `csair_log_operation` VALUES (''3105'', ''3'', ''修改角色权限'', ''角色的id7；增加角色的id集合：15,16,0,154,155,156,158'', ''2018-05-07 23:14:00'', ''127.0.0.1'');

-- ----------------------------
-- Table structure for csair_user_info
-- ----------------------------
DROP TABLE IF EXISTS `csair_user_info`;
CREATE TABLE `csair_user_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) DEFAULT NULL COMMENT ''用户id，根据user_type判断明珠会员是明珠卡号，e行会员是e行用户编号'',
  `cn_name` varchar(100) DEFAULT NULL COMMENT ''中文名'',
  `en_name` varchar(100) DEFAULT NULL COMMENT ''英文名'',
  `user_type` varchar(10) DEFAULT NULL COMMENT ''登录用户类型 EM   E行用户 FFPM  常客明珠会员'',
  `mobile_phone` varchar(20) DEFAULT NULL COMMENT ''手机号码'',
  `band_phone` varchar(20) DEFAULT NULL COMMENT ''绑定手机号码'',
  `birthday` date DEFAULT NULL COMMENT ''生日'',
  `userful_mileage` decimal(15,2) DEFAULT NULL COMMENT ''可用里程'',
  `email` varchar(100) DEFAULT NULL COMMENT ''邮箱'',
  `ni_cert_num` varchar(20) DEFAULT NULL COMMENT ''身份证号码'',
  `bind_email` varchar(100) DEFAULT NULL COMMENT ''绑定邮箱'',
  `phone` varchar(20) DEFAULT NULL COMMENT ''固话'',
  `registered_time` datetime DEFAULT NULL COMMENT ''注册时间'',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csair_user_info
-- ----------------------------
INSERT INTO `csair_user_info` VALUES (''1'', ''10001'', ''测试'', ''test'', ''明珠会员'', ''13802514605'', ''13802514605'', ''2017-07-26'', ''22.22'', ''111@qq.com'', ''430444933838'', ''111@qq.com'', ''7770990'', ''2017-07-27 16:54:10'');
INSERT INTO `csair_user_info` VALUES (''2'', ''10002'', ''黄彪'', ''huangbiao'', ''E行会员'', ''13802514605'', ''13802514605'', ''2017-07-27'', ''55.33'', ''222@qq.com'', ''430444933838'', ''222@qq.com'', ''3445454'', ''2017-07-27 16:54:16'');
INSERT INTO `csair_user_info` VALUES (''6'', ''10006'', ''彭珍'', ''PENG/ZHEN'', ''明珠会员'', ''18600680089'', ''18600680089'', ''1977-09-19'', ''0.00'', ''123@qq.com'', ''440901197709194316'', ''123456@qq.com'', ''18600680089'', ''2017-07-31 17:22:47'');
INSERT INTO `csair_user_info` VALUES (''7'', ''10003'', ''test'', ''huangbiao'', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `csair_user_info` VALUES (''8'', ''10004'', ''test2'', ''huangbiao'', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `csair_user_info` VALUES (''9'', ''10005'', ''test2'', ''huangbiao'', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `csair_user_info` VALUES (''10'', ''1006'', ''huangbiao'', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `csair_user_info` VALUES (''11'', ''1006'', ''huangbiao'', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `csair_user_info` VALUES (''12'', ''1006'', ''huangbiao'', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `csair_user_info` VALUES (''13'', ''1006'', ''huangbiao'', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `csair_user_info` VALUES (''14'', ''1006'', ''huangbiao'', null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for csair_user_info_address
-- ----------------------------
DROP TABLE IF EXISTS `csair_user_info_address`;
CREATE TABLE `csair_user_info_address` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_info_id` int(10) NOT NULL COMMENT ''关联csair_user_info会员表id'',
  `name` varchar(100) DEFAULT NULL COMMENT ''收货人'',
  `address` varchar(200) DEFAULT NULL COMMENT ''收货地址'',
  `phone` varchar(20) DEFAULT NULL COMMENT ''联系电话'',
  `remark` varchar(200) DEFAULT NULL COMMENT ''备注'',
  `create_time` datetime DEFAULT NULL COMMENT ''创建时间'',
  `modify_time` datetime DEFAULT NULL COMMENT ''修改时间'',
  `delete_time` datetime DEFAULT NULL COMMENT ''删除时间'',
  `enbale` tinyint(4) DEFAULT NULL COMMENT ''是否有效标识,0有效,1无效'',
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
  `mid` int(20) NOT NULL AUTO_INCREMENT COMMENT ''菜单ID'',
  `mname` varchar(20) NOT NULL COMMENT ''菜单名'',
  `pid` int(11) DEFAULT NULL COMMENT ''父菜单id'',
  `url` varchar(100) DEFAULT NULL,
  `state` tinyint(4) NOT NULL DEFAULT ''1'' COMMENT ''1:可见，0：不可见'',
  `sort` int(11) NOT NULL DEFAULT ''1'' COMMENT ''排序'',
  `rank` int(11) DEFAULT NULL COMMENT ''菜单的等级：一级菜单：1；二级菜单：2'',
  `logo_file_name` varchar(100) DEFAULT NULL COMMENT ''logo图片的名字'',
  `type` tinyint(1) DEFAULT NULL COMMENT ''类型 NULL 平台  ，2 商家'',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8 COMMENT=''后台菜单表'';

-- ----------------------------
-- Records of e_admin_menu
-- ----------------------------
INSERT INTO `e_admin_menu` VALUES (''15'', ''系统设置'', null, '''', ''1'', ''52'', ''1'', null, null);
INSERT INTO `e_admin_menu` VALUES (''16'', ''管理角色'', ''15'', ''/RoleManage/RoleList'', ''1'', ''51'', ''2'', null, null);
INSERT INTO `e_admin_menu` VALUES (''49'', ''管理菜单'', ''15'', ''/Menu/menuTree'', ''1'', ''55'', ''2'', null, null);
INSERT INTO `e_admin_menu` VALUES (''125'', ''品牌管理'', null, '''', ''1'', ''26'', ''1'', '''', null);
INSERT INTO `e_admin_menu` VALUES (''129'', ''品牌列表'', ''125'', ''/Brand/BrandList'', ''1'', ''50'', ''2'', null, null);
INSERT INTO `e_admin_menu` VALUES (''151'', ''主页'', null, ''/main'', ''1'', ''5'', ''1'', null, null);
INSERT INTO `e_admin_menu` VALUES (''153'', ''图书管理'', null, ''/book/list'', ''1'', ''30'', ''1'', null, null);
INSERT INTO `e_admin_menu` VALUES (''154'', ''根21'', null, ''211221'', ''1'', ''60'', ''1'', null, null);
INSERT INTO `e_admin_menu` VALUES (''155'', ''二阶3'', ''154'', ''1212'', ''1'', ''21'', ''2'', null, null);
INSERT INTO `e_admin_menu` VALUES (''156'', ''三阶'', ''155'', ''1221'', ''1'', ''211'', ''3'', null, null);
INSERT INTO `e_admin_menu` VALUES (''157'', ''权限管理'', ''15'', ''/permission/PermissionList'', ''1'', ''30'', ''2'', null, null);
INSERT INTO `e_admin_menu` VALUES (''158'', ''44'', ''156'', ''44444'', ''1'', ''444'', ''4'', null, null);

-- ----------------------------
-- Table structure for e_admin_permission
-- ----------------------------
DROP TABLE IF EXISTS `e_admin_permission`;
CREATE TABLE `e_admin_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL COMMENT ''url地址'',
  `name` varchar(64) DEFAULT NULL COMMENT ''url描述'',
  `mid` bigint(20) DEFAULT NULL COMMENT ''对应菜单的id'',
  `type` tinyint(1) DEFAULT NULL COMMENT ''1:系统根据菜单建立的权限,2:用户建立的权限'',
  `class_name` varchar(255) DEFAULT NULL COMMENT ''归属类的类名，用于确定菜单下的权限列表'',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=524 DEFAULT CHARSET=utf8 COMMENT=''后台管理权限表'';

-- ----------------------------
-- Records of e_admin_permission
-- ----------------------------
INSERT INTO `e_admin_permission` VALUES (''508'', ''/user/list'', ''用户账号'', ''50'', ''1'', '''');
INSERT INTO `e_admin_permission` VALUES (''509'', ''/permission/list'', ''管理权限'', ''148'', ''1'', '''');
INSERT INTO `e_admin_permission` VALUES (''510'', ''/RoleManage/list'', ''管理角色'', ''16'', ''2'', '''');
INSERT INTO `e_admin_permission` VALUES (''511'', ''/Menu/menuTree'', ''管理菜单'', ''49'', ''1'', '''');
INSERT INTO `e_admin_permission` VALUES (''512'', ''/Brand/BrandList'', ''品牌列表'', ''129'', ''1'', '''');
INSERT INTO `e_admin_permission` VALUES (''513'', ''/main'', ''主页'', ''151'', ''1'', '''');
INSERT INTO `e_admin_permission` VALUES (''514'', '''', ''系统设置'', ''15'', ''1'', '''');
INSERT INTO `e_admin_permission` VALUES (''515'', '''', ''品牌管理'', ''125'', ''1'', '''');
INSERT INTO `e_admin_permission` VALUES (''516'', ''/book/list'', ''图书管理'', ''153'', ''1'', '''');
INSERT INTO `e_admin_permission` VALUES (''517'', ''211221'', ''根21'', ''154'', ''1'', '''');
INSERT INTO `e_admin_permission` VALUES (''518'', ''1212'', ''二阶3'', ''155'', ''1'', '''');
INSERT INTO `e_admin_permission` VALUES (''519'', ''1221'', ''三阶'', ''156'', ''1'', '''');
INSERT INTO `e_admin_permission` VALUES (''520'', ''/permission/permissionList'', ''权限列表'', ''157'', null, null);
INSERT INTO `e_admin_permission` VALUES (''521'', ''44444'', ''44'', ''158'', ''1'', null);
INSERT INTO `e_admin_permission` VALUES (''522'', ''/123213'', ''图书列表'', ''153'', ''1'', null);
INSERT INTO `e_admin_permission` VALUES (''523'', ''122121'', ''21121221'', ''157'', ''1'', null);

-- ----------------------------
-- Table structure for e_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `e_admin_role`;
CREATE TABLE `e_admin_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT ''角色id'',
  `name` varchar(32) DEFAULT NULL COMMENT ''角色名称'',
  `type` varchar(10) DEFAULT NULL COMMENT ''角色类型'',
  `remark` varchar(255) DEFAULT NULL COMMENT ''备注'',
  `shop_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT=''后台管理角色表'';

-- ----------------------------
-- Records of e_admin_role
-- ----------------------------
INSERT INTO `e_admin_role` VALUES (''1'', ''管理员'', ''admin'', ''超级管理员1'', null);
INSERT INTO `e_admin_role` VALUES (''2'', ''编辑'', ''编辑'', ''编辑'', null);
INSERT INTO `e_admin_role` VALUES (''4'', ''普通用户'', ''normal'', ''90-'', null);
INSERT INTO `e_admin_role` VALUES (''7'', ''测试员2'', ''root'', ''99999'', null);

-- ----------------------------
-- Table structure for e_admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `e_admin_role_menu`;
CREATE TABLE `e_admin_role_menu` (
  `mid` bigint(20) DEFAULT NULL COMMENT ''菜单ID'',
  `rid` bigint(20) DEFAULT NULL COMMENT ''角色ID'',
  UNIQUE KEY `uniques1` (`mid`,`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT=''后台角色与菜单关联表'';

-- ----------------------------
-- Records of e_admin_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for e_admin_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `e_admin_role_permission`;
CREATE TABLE `e_admin_role_permission` (
  `rid` bigint(20) DEFAULT NULL COMMENT ''角色ID'',
  `pid` bigint(20) DEFAULT NULL COMMENT ''权限ID''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT=''角色与权限关联表'';

-- ----------------------------
-- Records of e_admin_role_permission
-- ----------------------------
INSERT INTO `e_admin_role_permission` VALUES (''1'', ''508'');
INSERT INTO `e_admin_role_permission` VALUES (''1'', ''509'');
INSERT INTO `e_admin_role_permission` VALUES (''1'', ''510'');
INSERT INTO `e_admin_role_permission` VALUES (''1'', ''511'');
INSERT INTO `e_admin_role_permission` VALUES (''1'', ''512'');
INSERT INTO `e_admin_role_permission` VALUES (''1'', ''513'');
INSERT INTO `e_admin_role_permission` VALUES (''1'', ''514'');
INSERT INTO `e_admin_role_permission` VALUES (''1'', ''515'');
INSERT INTO `e_admin_role_permission` VALUES (''1'', ''516'');
INSERT INTO `e_admin_role_permission` VALUES (''1'', ''517'');
INSERT INTO `e_admin_role_permission` VALUES (''1'', ''518'');
INSERT INTO `e_admin_role_permission` VALUES (''1'', ''519'');
INSERT INTO `e_admin_role_permission` VALUES (''1'', ''520'');
INSERT INTO `e_admin_role_permission` VALUES (''1'', ''521'');
INSERT INTO `e_admin_role_permission` VALUES (''1'', ''522'');
INSERT INTO `e_admin_role_permission` VALUES (''1'', ''523'');
INSERT INTO `e_admin_role_permission` VALUES (''7'', ''15'');
INSERT INTO `e_admin_role_permission` VALUES (''7'', ''16'');
INSERT INTO `e_admin_role_permission` VALUES (''7'', ''0'');
INSERT INTO `e_admin_role_permission` VALUES (''7'', ''154'');
INSERT INTO `e_admin_role_permission` VALUES (''7'', ''155'');
INSERT INTO `e_admin_role_permission` VALUES (''7'', ''156'');
INSERT INTO `e_admin_role_permission` VALUES (''7'', ''158'');

-- ----------------------------
-- Table structure for e_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `e_admin_user`;
CREATE TABLE `e_admin_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT ''用户id'',
  `nickname` varchar(20) DEFAULT NULL COMMENT ''用户昵称'',
  `email` varchar(128) DEFAULT NULL COMMENT ''邮箱|登录帐号'',
  `pswd` varchar(32) DEFAULT NULL COMMENT ''密码'',
  `create_time` datetime DEFAULT NULL COMMENT ''创建时间'',
  `last_login_time` datetime DEFAULT NULL COMMENT ''最后登录时间'',
  `status` bigint(1) DEFAULT ''1'' COMMENT ''1:有效，0:禁止登录'',
  `mobile` varchar(20) DEFAULT NULL COMMENT ''手机'',
  `wx_unionid` varchar(50) DEFAULT NULL COMMENT ''微信unionid'',
  `last_ip` varchar(50) DEFAULT NULL COMMENT ''上次登录ip'',
  `remark` varchar(100) DEFAULT NULL COMMENT ''备注'',
  `type` tinyint(1) DEFAULT NULL COMMENT ''管理员类型 1 平台  ，2 商家'',
  `shop_id` int(10) DEFAULT NULL COMMENT ''商家id'',
  `platform_flag` varchar(20) NOT NULL,
  `hash_code` varchar(6) DEFAULT NULL COMMENT ''hash'',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT=''后台用户表'';

-- ----------------------------
-- Records of e_admin_user
-- ----------------------------
INSERT INTO `e_admin_user` VALUES (''1'', ''julice'', ''julice@test.com'', ''F54C5F3213B11DDD2692C4E53301C66B'', ''2017-03-29 08:49:00'', ''2017-03-29 08:49:00'', ''1'', ''222'', ''222'', ''222'', ''2222'', ''1'', ''222'', ''csair_admin'', ''aaaaaa'');
INSERT INTO `e_admin_user` VALUES (''2'', ''bob'', ''bob@test.com'', ''F54C5F3213B11DDD2692C4E53301C66B'', ''2017-03-29 08:49:00'', ''2018-02-25 21:20:20'', ''1'', null, null, ''0:0:0:0:0:0:0:1'', null, null, null, ''csair_admin'', ''aaaaaa'');
INSERT INTO `e_admin_user` VALUES (''3'', ''alice1'', ''alice@test.com'', ''F54C5F3213B11DDD2692C4E53301C66B'', ''2017-03-29 08:49:00'', ''2018-05-07 20:05:54'', ''1'', null, null, ''0:0:0:0:0:0:0:1'', null, null, null, ''csair_admin'', ''aaaaaa'');
INSERT INTO `e_admin_user` VALUES (''23'', ''123'', ''2112211221'', ''783ED423A9D32A96DD84135D8F7EF87A'', ''2017-07-18 10:02:02'', null, ''1'', null, null, ''111'', ''1221'', ''1'', null, ''csair_admin'', ''aaaaaa'');
INSERT INTO `e_admin_user` VALUES (''24'', ''testCreate'', ''testCerate@test.com'', ''685228DC8CB1074BD2E9A87F69F103A3'', ''2017-07-18 11:57:17'', null, ''0'', null, null, ''111'', ''12'', ''1'', null, ''csair_admin'', ''kT0OpD'');
INSERT INTO `e_admin_user` VALUES (''25'', ''dsgfsad '', ''ateate'', ''5CED7152440C7125D028EF8CF6389334'', ''2017-07-26 09:19:33'', null, ''0'', null, null, ''111'', '''', ''1'', null, ''csair_admin'', ''Nfio2Y'');
INSERT INTO `e_admin_user` VALUES (''43'', ''userAdmin'', ''1'', ''123'', ''2017-07-26 09:19:33'', null, ''2'', null, null, ''111'', null, ''2'', ''1'', ''1'', null);
INSERT INTO `e_admin_user` VALUES (''50'', ''userAdmin'', ''1'', ''123'', ''2017-07-26 09:19:33'', null, ''2'', null, null, ''111'', null, ''2'', ''2'', ''1'', null);
INSERT INTO `e_admin_user` VALUES (''51'', ''userAdmin'', ''1'', ''123'', ''2017-07-26 09:19:33'', null, ''2'', null, null, ''111'', null, ''2'', ''3'', ''1'', null);
INSERT INTO `e_admin_user` VALUES (''52'', ''userAdmin'', ''1'', ''123'', ''2017-07-26 09:19:33'', null, ''2'', null, null, ''111'', null, ''2'', ''4'', ''1'', null);
INSERT INTO `e_admin_user` VALUES (''54'', ''alice@test.com'', ''1'', ''C1CA17EDD59C7A159B88A3980B8B7ABB'', ''2017-07-26 09:19:33'', null, ''1'', null, null, ''111'', '''', ''1'', null, ''csair_admin'', ''ZAFhve'');
INSERT INTO `e_admin_user` VALUES (''57'', ''alice@test.com'', ''1'', ''741D677BB4A90D5027B0D06BEC00EDC5'', ''2017-07-26 09:19:33'', null, ''1'', null, null, ''111'', '''', ''1'', null, ''csair_admin'', ''90cBlA'');
INSERT INTO `e_admin_user` VALUES (''58'', ''1'', ''1'', null, ''2017-07-26 09:19:33'', null, ''1'', null, null, ''111'', null, null, null, ''1'', null);
INSERT INTO `e_admin_user` VALUES (''59'', ''昵称'', ''1'', null, ''2017-07-26 09:19:33'', null, ''1'', null, null, ''111'', null, null, null, ''1'', null);
INSERT INTO `e_admin_user` VALUES (''60'', ''昵称'', ''1'', null, ''2017-07-26 09:19:33'', null, ''1'', null, null, ''111'', null, null, null, ''1'', null);

-- ----------------------------
-- Table structure for e_admin_user_role
-- ----------------------------
DROP TABLE IF EXISTS `e_admin_user_role`;
CREATE TABLE `e_admin_user_role` (
  `uid` bigint(20) DEFAULT NULL COMMENT ''用户ID'',
  `rid` bigint(20) DEFAULT NULL COMMENT ''角色ID''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT=''后台用户与角色关联表'';

-- ----------------------------
-- Records of e_admin_user_role
-- ----------------------------
INSERT INTO `e_admin_user_role` VALUES (''1'', ''3'');
INSERT INTO `e_admin_user_role` VALUES (''3'', ''3'');
INSERT INTO `e_admin_user_role` VALUES (''4'', ''2'');
INSERT INTO `e_admin_user_role` VALUES (''4'', ''3'');
INSERT INTO `e_admin_user_role` VALUES (''5'', ''3'');
INSERT INTO `e_admin_user_role` VALUES (''5'', ''4'');
INSERT INTO `e_admin_user_role` VALUES (''6'', ''4'');
INSERT INTO `e_admin_user_role` VALUES (''2'', ''5'');
INSERT INTO `e_admin_user_role` VALUES (''2'', ''2'');
INSERT INTO `e_admin_user_role` VALUES (''2'', ''4'');
INSERT INTO `e_admin_user_role` VALUES (null, ''1'');
INSERT INTO `e_admin_user_role` VALUES (''1'', ''6'');
INSERT INTO `e_admin_user_role` VALUES (''3'', ''1'');
INSERT INTO `e_admin_user_role` VALUES (''4'', ''2'');
INSERT INTO `e_admin_user_role` VALUES (''5'', ''2'');
INSERT INTO `e_admin_user_role` VALUES (''14'', ''7'');
INSERT INTO `e_admin_user_role` VALUES (''15'', ''7'');
INSERT INTO `e_admin_user_role` VALUES (''16'', ''2'');
INSERT INTO `e_admin_user_role` VALUES (''17'', ''4'');
INSERT INTO `e_admin_user_role` VALUES (''18'', ''5'');
INSERT INTO `e_admin_user_role` VALUES (''19'', ''7'');
INSERT INTO `e_admin_user_role` VALUES (''21'', ''2'');
INSERT INTO `e_admin_user_role` VALUES (''16'', ''7'');
INSERT INTO `e_admin_user_role` VALUES (''22'', ''2'');
INSERT INTO `e_admin_user_role` VALUES (''23'', ''2'');
INSERT INTO `e_admin_user_role` VALUES (''54'', ''1'');
INSERT INTO `e_admin_user_role` VALUES (''55'', ''2'');
INSERT INTO `e_admin_user_role` VALUES (''56'', ''2'');
INSERT INTO `e_admin_user_role` VALUES (''57'', ''2'');
INSERT INTO `e_admin_user_role` VALUES (''11111111111111111'', ''1'');

-- ----------------------------
-- Table structure for goods_info
-- ----------------------------
DROP TABLE IF EXISTS `goods_info`;
CREATE TABLE `goods_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT ''名字'',
  `create_date` datetime DEFAULT NULL COMMENT ''创建时间'',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_info
-- ----------------------------
INSERT INTO `goods_info` VALUES (''8'', ''天朝手机'', ''2018-03-30 19:39:31'');

-- ----------------------------
-- Table structure for goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `goods_sku`;
CREATE TABLE `goods_sku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sell_price` varchar(255) DEFAULT NULL,
  `attr_desc` varchar(255) DEFAULT NULL COMMENT ''属性值id组合，用,号分开：备用字段'',
  `good_id` bigint(20) DEFAULT NULL COMMENT ''商品id'',
  `attr_id` varchar(255) DEFAULT NULL COMMENT ''属性名id和属性值id组合：2:33,3:24'',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=582 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_sku
-- ----------------------------
INSERT INTO `goods_sku` VALUES (''577'', ''100.99'', ''1寸,红,11G,11T'', ''8'', ''11:27,12:30,13:34,14:38'');
INSERT INTO `goods_sku` VALUES (''578'', ''200.99'', ''1寸,黑,12G,12T'', ''8'', ''11:27,12:31,13:35,14:39'');
INSERT INTO `goods_sku` VALUES (''579'', ''300.99'', ''1寸,白,13G,11T'', ''8'', ''11:27,12:32,13:36,14:38'');
INSERT INTO `goods_sku` VALUES (''580'', ''400.99'', ''1寸,灰,12G,12T'', ''8'', ''11:27,12:33,13:35,14:39'');
INSERT INTO `goods_sku` VALUES (''581'', ''500.99'', ''2寸,红,13G,11T'', ''8'', ''11:28,12:30,13:36,14:38'');

-- ----------------------------
-- Table structure for sku_properties
-- ----------------------------
DROP TABLE IF EXISTS `sku_properties`;
CREATE TABLE `sku_properties` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `good_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sku_properties
-- ----------------------------
INSERT INTO `sku_properties` VALUES (''11'', ''大小'', ''8'');
INSERT INTO `sku_properties` VALUES (''12'', ''颜色'', ''8'');
INSERT INTO `sku_properties` VALUES (''13'', ''CPU'', ''8'');
INSERT INTO `sku_properties` VALUES (''14'', ''内存'', ''8'');

-- ----------------------------
-- Table structure for sku_properties_value
-- ----------------------------
DROP TABLE IF EXISTS `sku_properties_value`;
CREATE TABLE `sku_properties_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  `sku_property_name` varchar(255) DEFAULT NULL,
  `sku_properties_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sku_properties_value
-- ----------------------------
INSERT INTO `sku_properties_value` VALUES (''27'', ''1寸'', ''大小'', ''11'');
INSERT INTO `sku_properties_value` VALUES (''28'', ''2寸'', ''大小'', ''11'');
INSERT INTO `sku_properties_value` VALUES (''29'', ''3寸'', ''大小'', ''11'');
INSERT INTO `sku_properties_value` VALUES (''30'', ''红'', ''颜色'', ''12'');
INSERT INTO `sku_properties_value` VALUES (''31'', ''黑'', ''颜色'', ''12'');
INSERT INTO `sku_properties_value` VALUES (''32'', ''白'', ''颜色'', ''12'');
INSERT INTO `sku_properties_value` VALUES (''33'', ''灰'', ''颜色'', ''12'');
INSERT INTO `sku_properties_value` VALUES (''34'', ''11G'', ''CPU'', ''13'');
INSERT INTO `sku_properties_value` VALUES (''35'', ''12G'', ''CPU'', ''13'');
INSERT INTO `sku_properties_value` VALUES (''36'', ''13G'', ''CPU'', ''13'');
INSERT INTO `sku_properties_value` VALUES (''37'', ''23G'', ''CPU'', ''13'');
INSERT INTO `sku_properties_value` VALUES (''38'', ''11T'', ''内存'', ''14'');
INSERT INTO `sku_properties_value` VALUES (''39'', ''12T'', ''内存'', ''14'');
INSERT INTO `sku_properties_value` VALUES (''40'', ''13T'', ''内存'', ''14'');
INSERT INTO `sku_properties_value` VALUES (''41'', ''23T'', ''内存'', ''14'');

-- ----------------------------
-- Table structure for sku_property_connect
-- ----------------------------
DROP TABLE IF EXISTS `sku_property_connect`;
CREATE TABLE `sku_property_connect` (
  `sku_id` bigint(20) NOT NULL,
  `sku_property_name_id` bigint(20) DEFAULT NULL,
  `sku_property_value_id` bigint(20) DEFAULT NULL,
  `good_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT=''sku和sku属性值的关连表'';

-- ----------------------------
-- Records of sku_property_connect
-- ----------------------------
