/*
MySQL Backup
Source Server Version: 5.6.31
Source Database: csair_eshop
Date: 2017/8/26 16:28:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `csair_activity`
-- ----------------------------
DROP TABLE IF EXISTS `csair_activity`;
CREATE TABLE `csair_activity` (
  `activity_id` int(10) NOT NULL COMMENT '活动id',
  `activity_name` varchar(200) DEFAULT NULL COMMENT '活动名称',
  `activity_key` varchar(20) DEFAULT NULL COMMENT '活动key',
  `shop_id` int(10) DEFAULT NULL COMMENT '店铺id',
  `activity_desc` text COMMENT '互动描述',
  `start_time` datetime DEFAULT NULL COMMENT '活动开始时间',
  `over_time` datetime DEFAULT NULL COMMENT '活动结束时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 0,关闭，1.开启',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `add_by` int(10) DEFAULT NULL COMMENT '添加人',
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_activity_rule`
-- ----------------------------
DROP TABLE IF EXISTS `csair_activity_rule`;
CREATE TABLE `csair_activity_rule` (
  `act_rule_id` int(10) DEFAULT NULL COMMENT '规则id',
  `act_rule_key` varchar(50) DEFAULT NULL COMMENT '规则字段名',
  `activity_id` int(10) DEFAULT NULL COMMENT '活动id',
  `shop_id` int(10) DEFAULT NULL COMMENT '店铺id',
  `act_rule_value` varchar(500) DEFAULT NULL COMMENT '规则值'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_ad`
-- ----------------------------
DROP TABLE IF EXISTS `csair_ad`;
CREATE TABLE `csair_ad` (
  `ad_id` int(10) NOT NULL COMMENT '广告id',
  `ad_position_id` int(10) DEFAULT NULL COMMENT '广告位id',
  `ad_name` varchar(100) DEFAULT NULL COMMENT '广告名称',
  `ad_img` varchar(100) DEFAULT NULL COMMENT '广告图',
  `ad_link` varchar(100) DEFAULT NULL COMMENT '广告链接',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `over_time` datetime DEFAULT NULL COMMENT '结束时间',
  `click_nums` int(10) DEFAULT NULL COMMENT '点击量',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 0-关闭，1-开启',
  `ad_order` int(10) DEFAULT NULL COMMENT '顺序',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `add_by` int(10) DEFAULT NULL COMMENT '添加人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` int(10) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_ad_position`
-- ----------------------------
DROP TABLE IF EXISTS `csair_ad_position`;
CREATE TABLE `csair_ad_position` (
  `ad_position_id` int(10) NOT NULL COMMENT '广告位id',
  `ad_position_name` varchar(100) DEFAULT NULL COMMENT '广告位名称',
  `ad_position_desc` varchar(500) DEFAULT NULL COMMENT '广告位描述',
  `ad_width` int(10) DEFAULT NULL COMMENT '宽度',
  `ad_height` int(10) DEFAULT NULL COMMENT '高度',
  `ad_style` tinyint(1) DEFAULT NULL COMMENT '显示方式 1,轮播，2，单图',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 0-关闭，1-开启',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `add_by` int(10) DEFAULT NULL COMMENT '添加人',
  PRIMARY KEY (`ad_position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_area`
-- ----------------------------
DROP TABLE IF EXISTS `csair_area`;
CREATE TABLE `csair_area` (
  `area_id` int(10) NOT NULL COMMENT '地区id',
  `parent_id` int(10) DEFAULT NULL COMMENT '上一级id',
  `area_name` varchar(100) DEFAULT NULL COMMENT '地区名',
  `area_type` tinyint(1) DEFAULT NULL COMMENT '地区类型',
  `area_order` int(10) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_article`
-- ----------------------------
DROP TABLE IF EXISTS `csair_article`;
CREATE TABLE `csair_article` (
  `ar_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `ar_name` varchar(100) NOT NULL COMMENT '文章名称',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `ar_abs` varchar(200) DEFAULT NULL COMMENT '文章摘要',
  `ar_desc` text COMMENT '文章描述',
  `ac_id` int(11) NOT NULL COMMENT '文章分类',
  `is_auth` tinyint(4) NOT NULL COMMENT '文章状态 0否（待审核），1审核通过',
  `status` tinyint(4) NOT NULL COMMENT '文章状态 0关闭，1正常,2删除',
  `sortOrder` int(11) DEFAULT NULL COMMENT '排序',
  `is_commend` int(11) DEFAULT NULL COMMENT '是否推荐 0否（默认），1是',
  `is_dis` int(11) DEFAULT NULL COMMENT '是否禁用',
  PRIMARY KEY (`ar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_articleclassify`
-- ----------------------------
DROP TABLE IF EXISTS `csair_articleclassify`;
CREATE TABLE `csair_articleclassify` (
  `ac_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文章分类id',
  `ac_name` varchar(100) NOT NULL COMMENT '文章分类名称',
  `sort_order` int(11) DEFAULT NULL COMMENT '排序',
  `status` tinyint(4) NOT NULL COMMENT '文章状态 0关闭，1正常,2删除',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `fl_id` int(11) DEFAULT NULL COMMENT '父级分类id',
  PRIMARY KEY (`ac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_articleclassify_parent`
-- ----------------------------
DROP TABLE IF EXISTS `csair_articleclassify_parent`;
CREATE TABLE `csair_articleclassify_parent` (
  `fl_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '父级分类id',
  `fl_name` varchar(100) NOT NULL COMMENT '父类分类名称',
  `sort_order` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`fl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_banner`
-- ----------------------------
DROP TABLE IF EXISTS `csair_banner`;
CREATE TABLE `csair_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片链接',
  `url` varchar(255) DEFAULT NULL COMMENT '跳转链接',
  `sort` int(11) DEFAULT NULL COMMENT '排序，数值越大越在前',
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_brand`
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
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_category_brand`
-- ----------------------------
DROP TABLE IF EXISTS `csair_category_brand`;
CREATE TABLE `csair_category_brand` (
  `category_id` int(5) DEFAULT NULL COMMENT '分类id',
  `brand_id` int(5) DEFAULT NULL COMMENT '品牌id',
  `is_recommend` tinyint(1) DEFAULT NULL COMMENT '是否为该分类推荐品牌0-否（默认），1-是'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_category_spec`
-- ----------------------------
DROP TABLE IF EXISTS `csair_category_spec`;
CREATE TABLE `csair_category_spec` (
  `category_id` int(10) DEFAULT NULL COMMENT '类型ID',
  `spec_id` int(10) DEFAULT NULL COMMENT '规格ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_certificate`
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
--  Table structure for `csair_config`
-- ----------------------------
DROP TABLE IF EXISTS `csair_config`;
CREATE TABLE `csair_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '配置项名字',
  `content` longtext COMMENT '配置内容',
  `creation_date` datetime NOT NULL COMMENT '创建日期',
  `modify_date` datetime NOT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8 COMMENT='系统配置';

-- ----------------------------
--  Table structure for `csair_delivery`
-- ----------------------------
DROP TABLE IF EXISTS `csair_delivery`;
CREATE TABLE `csair_delivery` (
  `delivery_id` int(10) NOT NULL COMMENT '物流方式配送',
  `delivery_name` varchar(100) DEFAULT NULL COMMENT '物流配送名称',
  `delivery_desc` text COMMENT '物流配送描述',
  `area_groupid` text COMMENT '配送区域id',
  `first_price` decimal(5,2) DEFAULT NULL COMMENT '首重价格',
  `second_price` decimal(5,2) DEFAULT NULL COMMENT '续重价格',
  `type` tinyint(1) DEFAULT NULL COMMENT '配送类型 2先付款后发货 1先发货后付款 ',
  `first_weight` int(5) DEFAULT NULL COMMENT '首重重量 重量克',
  `second_weight` int(5) DEFAULT NULL COMMENT '续重重量 重量克',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 0关闭，1开启',
  `delivery_order` int(10) DEFAULT NULL COMMENT '排序',
  `is_save_price` tinyint(1) DEFAULT NULL COMMENT '是否支持物流保价 1支持保价 0  不支持保价',
  `save_rate` decimal(5,2) DEFAULT NULL COMMENT '保价费率',
  `low_price` decimal(5,2) DEFAULT NULL COMMENT '最低保价',
  `open_default` tinyint(1) DEFAULT NULL COMMENT '其他地区是否启用默认费用 1启用 0 不启用',
  `is_del` tinyint(1) DEFAULT NULL COMMENT '是否删除 0:未删除 1:删除',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `add_by` int(10) DEFAULT NULL COMMENT '添加人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` int(10) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`delivery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_deliveryl_model`
-- ----------------------------
DROP TABLE IF EXISTS `csair_deliveryl_model`;
CREATE TABLE `csair_deliveryl_model` (
  `model_id` int(10) NOT NULL COMMENT '模板id',
  `model_name` varchar(100) DEFAULT NULL COMMENT '模板名字',
  `config` text COMMENT '序列化的快递单结构数据',
  `background` varchar(100) DEFAULT NULL COMMENT '背景图片路径',
  `width` int(10) DEFAULT NULL COMMENT '宽度',
  `height` int(10) DEFAULT NULL COMMENT '高度',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 0,关闭 ，1-开启',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `add_by` int(10) DEFAULT NULL COMMENT '添加人',
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_delivery_doc`
-- ----------------------------
DROP TABLE IF EXISTS `csair_delivery_doc`;
CREATE TABLE `csair_delivery_doc` (
  `doc_id` int(10) NOT NULL COMMENT '配送单id',
  `order_id` varchar(10) DEFAULT NULL COMMENT '订单id',
  `cas_id` varchar(10) DEFAULT NULL COMMENT '用户id',
  `login_id` int(10) DEFAULT NULL COMMENT '配单员id',
  `shop_id` int(10) DEFAULT NULL COMMENT '店铺id',
  `recv_name` varchar(100) DEFAULT NULL COMMENT '收货人',
  `recv_postcode` int(10) DEFAULT NULL COMMENT '收获邮政编码',
  `recv_phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `country_id` int(10) DEFAULT NULL COMMENT '国家id',
  `province_id` int(10) DEFAULT NULL COMMENT '省id',
  `city_id` int(10) DEFAULT NULL COMMENT '城市id',
  `district_id` int(10) DEFAULT NULL COMMENT '区县id',
  `recv_address` text COMMENT '收货地址',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `freight` decimal(5,2) DEFAULT NULL COMMENT '运费',
  `express_id` char(10) DEFAULT NULL COMMENT '快递公司id',
  `delivery_no` varchar(50) DEFAULT NULL COMMENT '物流单号',
  `delivery_type` tinyint(1) DEFAULT NULL COMMENT '物流方式',
  `remark` text COMMENT '备注信息',
  `is_del` tinyint(1) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_delivery_shop`
-- ----------------------------
DROP TABLE IF EXISTS `csair_delivery_shop`;
CREATE TABLE `csair_delivery_shop` (
  `shop_delivery_id` int(10) NOT NULL COMMENT '商家物流id',
  `delivery_id` int(10) DEFAULT NULL COMMENT '平台方式配送',
  `shop_id` int(10) DEFAULT NULL COMMENT '商家id',
  `area_groupid` text COMMENT '配送区域id',
  `price_type` tinyint(1) DEFAULT NULL COMMENT '费用类型 0统一设置 1指定地区费用',
  `first_price` decimal(5,2) DEFAULT NULL COMMENT '首重价格',
  `second_price` decimal(5,2) DEFAULT NULL COMMENT '续重价格',
  `type` tinyint(1) DEFAULT NULL COMMENT '配送类型  配送类型 2先付款后发货 1先发货后付款 ',
  `first_weight` int(5) DEFAULT NULL COMMENT '首重重量 重量克',
  `second_weight` int(5) DEFAULT NULL COMMENT '续重重量',
  `is_save_price` tinyint(1) DEFAULT NULL COMMENT '是否支持保价 是否支持物流保价 1支持保价 0  不支持保价',
  `save_rate` decimal(5,2) DEFAULT NULL COMMENT '保价费率',
  `low_price` decimal(5,2) DEFAULT NULL COMMENT '最低保价',
  `open_default` tinyint(1) DEFAULT NULL COMMENT '其他地区是否启用默认费用 1启用 0 不启用',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `add_by` int(10) DEFAULT NULL COMMENT '添加人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` int(10) NOT NULL COMMENT '更新人',
  PRIMARY KEY (`shop_delivery_id`,`update_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_delivery_takeself`
-- ----------------------------
DROP TABLE IF EXISTS `csair_delivery_takeself`;
CREATE TABLE `csair_delivery_takeself` (
  `takeself_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自提点id',
  `tkf_name` varchar(100) NOT NULL COMMENT '自提点名称',
  `province_id` int(5) DEFAULT NULL COMMENT '省id',
  `city_id` int(5) DEFAULT NULL COMMENT '市id',
  `district_id` int(5) DEFAULT NULL COMMENT '区县id',
  `receive_addr` varchar(100) NOT NULL COMMENT '详细地址',
  `p_name` varchar(10) NOT NULL COMMENT '联系人',
  `mobile` varchar(15) DEFAULT NULL COMMENT '固定电话',
  `phone` varchar(20) NOT NULL COMMENT '手机',
  `up_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`takeself_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_depot`
-- ----------------------------
DROP TABLE IF EXISTS `csair_depot`;
CREATE TABLE `csair_depot` (
  `depot_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '仓库ID',
  `name` varchar(255) DEFAULT NULL COMMENT '仓库名称',
  `choose` smallint(1) DEFAULT NULL COMMENT '是否为默认仓库 0：否，1：是',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `add_by` int(10) DEFAULT NULL COMMENT '添加人',
  PRIMARY KEY (`depot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_express`
-- ----------------------------
DROP TABLE IF EXISTS `csair_express`;
CREATE TABLE `csair_express` (
  `express_id` int(10) NOT NULL COMMENT '物流公司id',
  `express` varchar(10) DEFAULT NULL COMMENT '物流公司名称',
  `website` varchar(200) DEFAULT NULL COMMENT '官网',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 0-关闭，1-开启',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`express_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_favourite`
-- ----------------------------
DROP TABLE IF EXISTS `csair_favourite`;
CREATE TABLE `csair_favourite` (
  `favourite` int(10) NOT NULL COMMENT '收藏id',
  `cas_id` int(10) DEFAULT NULL COMMENT '用户id',
  `goods_id` int(10) DEFAULT NULL COMMENT '收藏商品id',
  `shop_id` int(10) DEFAULT NULL COMMENT '收藏店铺id',
  `add_time` datetime DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`favourite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_goods`
-- ----------------------------
DROP TABLE IF EXISTS `csair_goods`;
CREATE TABLE `csair_goods` (
  `goods_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '商品ID(主键)',
  `goods_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `sn` varchar(255) DEFAULT NULL COMMENT '商品编号',
  `brand_id` int(10) DEFAULT NULL COMMENT '商品品牌ID 关联商品品牌表（csair_brand）',
  `category_id` int(10) DEFAULT NULL COMMENT '商品分类ID',
  `goods_type` tinyint(1) DEFAULT NULL COMMENT '商品类型',
  `unit` varchar(255) DEFAULT NULL COMMENT '商品计价单位',
  `weight` decimal(20,2) DEFAULT NULL COMMENT '商品重量',
  `market_enable` tinyint(1) DEFAULT NULL COMMENT '商品是否上架 0代表已下架，1代表已上架，2 代表草稿',
  `brief` text COMMENT '商品说明(简介)',
  `intro` text COMMENT '商品详情',
  `price` decimal(20,2) DEFAULT NULL COMMENT '商品价格',
  `cost` decimal(20,2) DEFAULT NULL COMMENT '商品成本价',
  `mktprice` decimal(20,2) DEFAULT NULL COMMENT '商品市场价',
  `params` text COMMENT '商品参数字符串',
  `props` text COMMENT '商品属性字符串',
  `have_spec` tinyint(1) DEFAULT NULL COMMENT '是否开启规格 0代表未开启，1代表已开启',
  `create_time` datetime DEFAULT NULL COMMENT '商品添加时间',
  `last_modify` datetime DEFAULT NULL COMMENT '商品最后更新时间',
  `view_count` int(10) DEFAULT NULL COMMENT '商品被浏览次数',
  `buy_count` int(10) DEFAULT NULL COMMENT '商品被购买次数',
  `disabled` tinyint(1) DEFAULT NULL COMMENT '商品是否被禁用 0代表未禁用，1代表已禁用',
  `quantity` int(10) DEFAULT NULL COMMENT '商品可用库存',
  `enable_quantity` int(10) DEFAULT '0' COMMENT '商品总库存',
  `point` int(10) DEFAULT NULL COMMENT '商品积分',
  `page_title` varchar(255) DEFAULT NULL COMMENT '页面标题',
  `meta_keywords` varchar(255) DEFAULT NULL COMMENT '页面关键字',
  `meta_description` text COMMENT '页面描述',
  `sord` int(10) DEFAULT '0' COMMENT '商品排序',
  `is_pack` tinyint(1) DEFAULT '0' COMMENT '是否是捆绑商品 0：不是，1：是',
  `thumbnail` varchar(255) DEFAULT NULL COMMENT '商品缩略图',
  `big` varchar(255) DEFAULT NULL COMMENT '商品展示大图',
  `small` varchar(255) DEFAULT NULL COMMENT '商品展示小图',
  `original` varchar(255) DEFAULT NULL COMMENT '商品原始图片',
  `shop_id` int(10) DEFAULT NULL COMMENT '商品所属卖家ID',
  `shop_cat_id` int(10) DEFAULT NULL COMMENT '商品所属店铺类目ID',
  `buy_num` int(10) DEFAULT NULL COMMENT '商品被购买数量',
  `template_id` int(10) DEFAULT NULL COMMENT '商品运费模板ID',
  `goods_transfee_charge` tinyint(1) DEFAULT NULL COMMENT '是否为买家承担运费 0：买家承担，1：卖家承担',
  `seller_name` varchar(255) DEFAULT NULL COMMENT '商品所属店铺名称',
  `commission` decimal(20,2) DEFAULT NULL COMMENT '商品佣金比例',
  `is_auth` int(10) DEFAULT NULL COMMENT ' 是否审核:0,未审核,1,已审核通过,2,审核未通过 ',
  `auth_message` varchar(255) DEFAULT NULL COMMENT '审核消息',
  `favorable_rate` varchar(255) DEFAULT '0' COMMENT '好评率',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_goods_cart`
-- ----------------------------
DROP TABLE IF EXISTS `csair_goods_cart`;
CREATE TABLE `csair_goods_cart` (
  `cart_id` int(10) NOT NULL COMMENT '购物车id',
  `cas_id` int(10) DEFAULT NULL COMMENT '用户id',
  `cart_content` text COMMENT '购物车内容',
  `add_time` datetime DEFAULT NULL COMMENT '加入时间',
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_goods_category`
-- ----------------------------
DROP TABLE IF EXISTS `csair_goods_category`;
CREATE TABLE `csair_goods_category` (
  `category_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `category_name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `parent_id` int(10) DEFAULT NULL COMMENT '父分类id',
  `img` varchar(100) DEFAULT NULL COMMENT '类型图片',
  `thumb_img` varchar(100) DEFAULT NULL COMMENT '类型图片缩略图',
  `keyword` text COMMENT '关键词',
  `category_desc` text COMMENT '分类描述',
  `category_order` int(5) DEFAULT NULL COMMENT '排序',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `add_by` int(5) DEFAULT NULL COMMENT '添加人',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态，0删除，1 显示，2 不显示',
  `rank` tinyint(4) DEFAULT NULL COMMENT '级别：1：一级；2：二级；3：三级',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_goods_category_property`
-- ----------------------------
DROP TABLE IF EXISTS `csair_goods_category_property`;
CREATE TABLE `csair_goods_category_property` (
  `goods_category_id` bigint(20) NOT NULL COMMENT '分类id',
  `commission` decimal(18,2) DEFAULT NULL COMMENT '佣金_一级类目属性',
  `deposit` decimal(18,6) DEFAULT NULL COMMENT '保证金_一级类目属性',
  `certificate_id` bigint(20) DEFAULT NULL COMMENT '证书id_二级类目属性',
  `property_templet_id` bigint(20) DEFAULT NULL COMMENT '属性模板id',
  `brand_id` bigint(20) DEFAULT NULL COMMENT '品牌id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类属性表';

-- ----------------------------
--  Table structure for `csair_goods_category_property_templet`
-- ----------------------------
DROP TABLE IF EXISTS `csair_goods_category_property_templet`;
CREATE TABLE `csair_goods_category_property_templet` (
  `name` varchar(32) DEFAULT NULL COMMENT '属性名字',
  `value` varchar(32) DEFAULT NULL COMMENT '属性值',
  `category_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '三级类目的id',
  `update` datetime DEFAULT NULL COMMENT '修改时间',
  `templet_name` varchar(32) DEFAULT NULL COMMENT '模板名字'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='三级类目属性模板';

-- ----------------------------
--  Table structure for `csair_goods_category_relation`
-- ----------------------------
DROP TABLE IF EXISTS `csair_goods_category_relation`;
CREATE TABLE `csair_goods_category_relation` (
  `goods_id` int(10) NOT NULL COMMENT '商品ID',
  `category_id` int(10) NOT NULL COMMENT '分类id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_goods_commend`
-- ----------------------------
DROP TABLE IF EXISTS `csair_goods_commend`;
CREATE TABLE `csair_goods_commend` (
  `commend_id` int(10) NOT NULL COMMENT '推荐id',
  `commend_type` tinyint(1) DEFAULT NULL COMMENT '推荐类型 1:最新商品 2:特价商品 3:热卖排行 4:推荐商品',
  `goods_id` int(10) DEFAULT NULL COMMENT '商品id',
  PRIMARY KEY (`commend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_goods_comment`
-- ----------------------------
DROP TABLE IF EXISTS `csair_goods_comment`;
CREATE TABLE `csair_goods_comment` (
  `comment_id` int(10) NOT NULL COMMENT '评论id',
  `goods_id` int(10) DEFAULT NULL COMMENT '商品id',
  `shop_id` int(10) DEFAULT NULL COMMENT '商家id',
  `order_no` varchar(50) DEFAULT NULL COMMENT '订单编号',
  `cas_id` int(10) DEFAULT NULL COMMENT '用户id',
  `buy_time` datetime DEFAULT NULL COMMENT '购买时间',
  `comment_time` datetime DEFAULT NULL COMMENT '评论时间',
  `content` text COMMENT '评论内容',
  `comment_img` varchar(100) DEFAULT NULL COMMENT '评论图片',
  `recontent` text COMMENT '回复评论内容',
  `recontent_time` datetime DEFAULT NULL COMMENT '回复评论时间',
  `point` tinyint(1) DEFAULT NULL COMMENT '评分',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 0-未评论，1-已评论',
  `is_view` tinyint(1) DEFAULT NULL COMMENT '是否显示评论 0-不显示，1-显示(默认)',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_goods_depot`
-- ----------------------------
DROP TABLE IF EXISTS `csair_goods_depot`;
CREATE TABLE `csair_goods_depot` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `goods_id` int(10) DEFAULT NULL COMMENT '商品ID',
  `depot_id` int(10) DEFAULT NULL COMMENT '仓库ID',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `add_by` int(10) DEFAULT NULL COMMENT '添加人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_goods_img`
-- ----------------------------
DROP TABLE IF EXISTS `csair_goods_img`;
CREATE TABLE `csair_goods_img` (
  `img_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `goods_id` int(10) DEFAULT NULL COMMENT '商品ID',
  `thumbnail` varchar(255) DEFAULT NULL COMMENT '相册列表尺寸 用于各商品列表中',
  `small` varchar(255) DEFAULT NULL COMMENT '小尺寸 用于商品详细中preview',
  `big` varchar(255) DEFAULT NULL COMMENT '大尺寸',
  `original` varchar(255) DEFAULT NULL COMMENT '原尺寸',
  `tiny` varchar(255) DEFAULT NULL COMMENT '极小尺寸 用于商品详细页中主图下的小列表图',
  `isdefault` smallint(1) DEFAULT '0' COMMENT '是否为默认 0：否，1：是。',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_goods_notify`
-- ----------------------------
DROP TABLE IF EXISTS `csair_goods_notify`;
CREATE TABLE `csair_goods_notify` (
  `notify_id` int(10) NOT NULL COMMENT '通知id',
  `goods_id` int(10) DEFAULT NULL COMMENT '商品id',
  `cas_id` int(10) DEFAULT NULL COMMENT '用户id',
  `notify_email` varchar(100) DEFAULT NULL COMMENT '邮件',
  `notify_mobile` varchar(20) DEFAULT NULL COMMENT '手机',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `notify_time` datetime DEFAULT NULL COMMENT '通知时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 0-未通知，1-已通知',
  PRIMARY KEY (`notify_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_goods_sku`
-- ----------------------------
DROP TABLE IF EXISTS `csair_goods_sku`;
CREATE TABLE `csair_goods_sku` (
  `sku_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `goods_id` int(10) DEFAULT NULL COMMENT '商品ID',
  `goods_name` varchar(255) DEFAULT NULL COMMENT '名称',
  `sn` varchar(50) DEFAULT NULL COMMENT '货号',
  `quantity` int(10) DEFAULT '0' COMMENT '总库存',
  `enable_quantity` int(10) DEFAULT '0' COMMENT '可用库存',
  `price` decimal(20,2) DEFAULT NULL COMMENT '价格',
  `specs` longtext COMMENT '规格',
  `cost` decimal(20,2) DEFAULT NULL COMMENT '折扣',
  `weight` decimal(20,2) DEFAULT NULL COMMENT '重量',
  `is_pack` smallint(1) DEFAULT '0' COMMENT ' 是否是套餐 0：否，1：是',
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_goods_sku_snapshot`
-- ----------------------------
DROP TABLE IF EXISTS `csair_goods_sku_snapshot`;
CREATE TABLE `csair_goods_sku_snapshot` (
  `sku_snapshot_id` int(10) NOT NULL COMMENT '商品sku快照ID',
  `sku_id` int(10) DEFAULT NULL COMMENT 'skuid',
  `goods_id` int(10) DEFAULT NULL COMMENT '商品ID',
  `goods_name` varchar(255) DEFAULT NULL COMMENT '名称',
  `sn` varchar(50) DEFAULT NULL COMMENT '货号',
  `quantity` int(10) DEFAULT '0' COMMENT '总库存',
  `enable_quantity` int(10) DEFAULT '0' COMMENT '可用库存',
  `price` decimal(20,2) DEFAULT NULL COMMENT '价格',
  `specs` longtext COMMENT '规格',
  `cost` decimal(20,2) DEFAULT NULL COMMENT '折扣',
  `weight` decimal(20,2) DEFAULT NULL COMMENT '重量',
  `is_pack` tinyint(1) DEFAULT '0' COMMENT '是否是套餐 0：否，1：是',
  PRIMARY KEY (`sku_snapshot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_goods_snapshot`
-- ----------------------------
DROP TABLE IF EXISTS `csair_goods_snapshot`;
CREATE TABLE `csair_goods_snapshot` (
  `snapshot_id` int(10) NOT NULL COMMENT '快照id',
  `edit_time` datetime DEFAULT NULL COMMENT '编辑时间',
  `goods_id` int(10) DEFAULT NULL COMMENT '商品ID',
  `name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `sn` varchar(255) DEFAULT NULL COMMENT '商品编号',
  `brand_id` int(10) DEFAULT NULL COMMENT '商品品牌ID',
  `cat_id` int(10) DEFAULT NULL COMMENT '商品分类ID',
  `type_id` int(10) DEFAULT NULL COMMENT '商品类型ID',
  `goods_type` tinyint(1) DEFAULT NULL COMMENT '商品类型',
  `unit` varchar(255) DEFAULT NULL COMMENT '商品计价单位',
  `weight` decimal(20,2) DEFAULT NULL COMMENT '商品重量',
  `market_enable` tinyint(1) DEFAULT NULL COMMENT '商品是否上架 0代表已下架，1代表已上架',
  `brief` varchar(255) DEFAULT NULL COMMENT '商品说明(简介)',
  `intro` text COMMENT '商品详情',
  `price` decimal(20,2) DEFAULT NULL COMMENT '商品价格',
  `cost` decimal(20,2) DEFAULT NULL COMMENT '商品成本价',
  `mktprice` decimal(20,2) DEFAULT NULL COMMENT '商品市场价',
  `params` text COMMENT '商品参数字符串',
  `props` text COMMENT '商品属性字符串',
  `specs` text COMMENT '商品规格字符串',
  `have_spec` tinyint(1) DEFAULT NULL COMMENT '是否开启规格 0代表未开启，1代表已开启',
  `adjuncts` text COMMENT '商品相关配件字符串',
  `create_time` datetime DEFAULT NULL COMMENT '商品添加时间',
  `last_modify` datetime DEFAULT NULL COMMENT '商品最后更新时间',
  `view_count` int(10) DEFAULT NULL COMMENT '商品被浏览次数',
  `buy_count` int(10) DEFAULT NULL COMMENT '商品被购买次数',
  `disabled` tinyint(1) DEFAULT NULL COMMENT '商品是否被禁用 0代表未禁用，1代表已禁用',
  `quantity` int(10) DEFAULT NULL COMMENT '商品可用库存',
  `enable_quantity` int(10) DEFAULT '0' COMMENT '商品总库存',
  `point` int(10) DEFAULT NULL COMMENT '商品积分',
  `page_title` varchar(255) DEFAULT NULL COMMENT '页面标题',
  `meta_keywords` varchar(255) DEFAULT NULL COMMENT '页面关键字',
  `meta_description` text COMMENT '页面描述',
  `sord` int(10) DEFAULT '0' COMMENT '商品排序',
  `grade` int(10) DEFAULT '0' COMMENT '商品评分',
  `goods_comment` text COMMENT '商品评论',
  `is_pack` tinyint(1) DEFAULT '0' COMMENT '是否是捆绑商品 0：不是，1：是',
  `thumbnail` varchar(255) DEFAULT NULL COMMENT '商品缩略图',
  `big` varchar(255) DEFAULT NULL COMMENT '商品展示大图',
  `small` varchar(255) DEFAULT NULL COMMENT '商品展示小图',
  `original` varchar(255) DEFAULT NULL COMMENT '商品原始图片',
  `seller_id` int(10) DEFAULT NULL COMMENT '商品所属店铺ID',
  `seller_cat_id` int(10) DEFAULT NULL COMMENT '商品所属店铺分类ID',
  `buy_num` int(10) DEFAULT NULL COMMENT '商品被购买数量 此字段是安装b2b2c后新增的字段，可能和原有的buy_count字段重复了！',
  `comment_num` int(10) DEFAULT NULL COMMENT '商品被评论次数',
  `template_id` int(10) DEFAULT NULL COMMENT '商品运费模板ID 关联店铺模板表（es_store_template）',
  `goods_transfee_charge` tinyint(1) DEFAULT NULL COMMENT '是否为买家承担运费 0：买家承担，1：卖家承担',
  `seller_name` varchar(255) DEFAULT NULL COMMENT '商品所属店铺名称',
  `commission` decimal(20,2) DEFAULT NULL COMMENT '商品佣金比例',
  PRIMARY KEY (`snapshot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_goods_snapshot_img`
-- ----------------------------
DROP TABLE IF EXISTS `csair_goods_snapshot_img`;
CREATE TABLE `csair_goods_snapshot_img` (
  `img_snapshot_id` int(10) DEFAULT NULL COMMENT '图片快照id',
  `img_id` int(10) NOT NULL COMMENT 'img_id',
  `thumbnail` varchar(255) DEFAULT NULL COMMENT '商品缩略图',
  `small` varchar(255) DEFAULT NULL COMMENT '商品展示小图',
  `big` varchar(255) DEFAULT NULL COMMENT '商品展示大图',
  `original` varchar(255) DEFAULT NULL COMMENT '商品原始图片',
  `tiny` varchar(255) DEFAULT NULL COMMENT '商品微图',
  `isdefault` tinyint(1) DEFAULT '0' COMMENT '是否默认 0：不是，1：是',
  `sord` int(10) DEFAULT '0' COMMENT '商品排序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_goods_spec`
-- ----------------------------
DROP TABLE IF EXISTS `csair_goods_spec`;
CREATE TABLE `csair_goods_spec` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `spec_id` int(10) DEFAULT NULL COMMENT '规格ID',
  `spec_value_id` int(10) DEFAULT NULL COMMENT '规格值ID',
  `goods_id` int(10) DEFAULT NULL COMMENT '商品ID',
  `sku_id` int(10) DEFAULT NULL COMMENT '货品ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_log_operation`
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
) ENGINE=InnoDB AUTO_INCREMENT=2935 DEFAULT CHARSET=utf8 COMMENT='后台操作记录日志';

-- ----------------------------
--  Table structure for `csair_navigator`
-- ----------------------------
DROP TABLE IF EXISTS `csair_navigator`;
CREATE TABLE `csair_navigator` (
  `navigator_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片url',
  `link` varchar(255) DEFAULT NULL COMMENT '超链接',
  `navigator_name` varchar(255) DEFAULT NULL COMMENT '导航名称',
  PRIMARY KEY (`navigator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `csair_news`
-- ----------------------------
DROP TABLE IF EXISTS `csair_news`;
CREATE TABLE `csair_news` (
  `news_id` int(10) NOT NULL COMMENT '资讯id',
  `news_category_id` int(10) DEFAULT NULL COMMENT '所属分类id',
  `news_title` varchar(200) DEFAULT NULL COMMENT '资讯标题',
  `news_desc` text COMMENT '资讯简介',
  `news_img` varchar(100) DEFAULT NULL COMMENT '资讯宣传图片',
  `content` text COMMENT '资讯内容',
  `news_order` int(10) DEFAULT NULL COMMENT '资讯顺序',
  `click_nums` int(10) DEFAULT NULL COMMENT '点击量',
  `publish_time` datetime DEFAULT NULL COMMENT '发布时间',
  `key_word` varchar(100) DEFAULT NULL COMMENT '关键词',
  `top` tinyint(1) DEFAULT NULL COMMENT '资讯置顶  0-否，1-是',
  `news_tage` varchar(50) DEFAULT NULL COMMENT '资讯标签 1.推荐，2-最新，3-最热，多个标签逗号分隔',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `add_by` int(10) DEFAULT NULL COMMENT '添加人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` int(10) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_news_category`
-- ----------------------------
DROP TABLE IF EXISTS `csair_news_category`;
CREATE TABLE `csair_news_category` (
  `news_category_id` int(10) NOT NULL COMMENT '资讯分类id',
  `parent_id` int(10) NOT NULL COMMENT '父类id',
  `news_category_name` varchar(200) NOT NULL COMMENT '资讯分类名称',
  `news_category_order` int(10) DEFAULT NULL COMMENT '排序',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  `add_by` int(10) NOT NULL COMMENT '添加人',
  PRIMARY KEY (`news_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_order`
-- ----------------------------
DROP TABLE IF EXISTS `csair_order`;
CREATE TABLE `csair_order` (
  `order_id` int(10) NOT NULL COMMENT '订单id',
  `order_no` varchar(50) DEFAULT NULL COMMENT '订单编号',
  `user_id` int(10) DEFAULT NULL COMMENT '用户id',
  `shop_id` int(10) DEFAULT NULL COMMENT '店铺id',
  `pay_type` tinyint(1) DEFAULT NULL COMMENT '用户支付方式ID：银联支付1，微信支付2，支付宝支付3，visa支付4，其他5',
  `distribution` int(10) DEFAULT NULL COMMENT '配送方式：1快递，2平邮，3EMS，4自提，5机上配送，6其他',
  `status` tinyint(1) DEFAULT NULL COMMENT '订单状态 1新订单,2取消订单(客户触发),3作废订单(管理员触发),4完成订单,5退款(订单完成后),6部分退款(订单完成后)',
  `pay_status` tinyint(1) DEFAULT NULL COMMENT '支付状态 0：未支付; 1：已支付;',
  `distribution_status` tinyint(1) DEFAULT NULL COMMENT '配送状态 0：未发送,1：已发送,2：部分发送',
  `receiver` varchar(50) DEFAULT NULL COMMENT '收货人',
  `receive_postcode` varchar(10) DEFAULT NULL COMMENT '邮政编码',
  `receive_telephone` varchar(20) DEFAULT NULL COMMENT '收货人固定电话',
  `receive_mobile` varchar(20) DEFAULT NULL COMMENT '收货人手机号码',
  `country_id` int(10) DEFAULT NULL COMMENT '国家id',
  `province_id` int(10) DEFAULT NULL COMMENT '省id',
  `city_id` int(10) DEFAULT NULL COMMENT '城市id',
  `district_id` int(10) DEFAULT NULL COMMENT '区县id',
  `receive_addr` varchar(100) DEFAULT NULL COMMENT '收货详细地址',
  `payable_amount` decimal(15,2) DEFAULT NULL COMMENT '应付商品订单总额',
  `real_amount` decimal(15,2) DEFAULT NULL COMMENT '实付商品订单总额',
  `payable_freight` decimal(15,2) DEFAULT NULL COMMENT '应付总运费',
  `real_freight` decimal(15,2) DEFAULT NULL COMMENT '实际支付总运费',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `send_time` datetime DEFAULT NULL COMMENT '发货时间',
  `add_time` datetime DEFAULT NULL COMMENT '下单时间',
  `complete_time` datetime DEFAULT NULL COMMENT '订单完成时间',
  `invoice` tinyint(1) DEFAULT NULL COMMENT '发票：0不索要1索要',
  `user_remark` text COMMENT '用户留言',
  `admin_note` text COMMENT '管理员备注',
  `is_del` tinyint(1) DEFAULT NULL COMMENT '是否删除1为删除',
  `insured` decimal(15,2) DEFAULT NULL COMMENT '保价',
  `invoice_title` varchar(10) DEFAULT NULL COMMENT '发票抬头',
  `tex` decimal(15,2) DEFAULT NULL COMMENT '发票税费',
  `promotions` decimal(15,2) DEFAULT NULL COMMENT '促销优惠金额',
  `discount` decimal(15,0) DEFAULT NULL COMMENT '折扣',
  `order_amount` decimal(15,2) DEFAULT NULL COMMENT '订单总额',
  `trade_no` varchar(50) DEFAULT NULL COMMENT '支付平台交易号',
  `takeself` int(10) DEFAULT NULL COMMENT '自提点id',
  `checkcode` varchar(10) DEFAULT NULL COMMENT '自提方式的验证码',
  `active_id` int(10) DEFAULT NULL COMMENT '促销活动id',
  `is_checkout` tinyint(1) DEFAULT NULL COMMENT '是否给商家结算货款 0:未结算 1:已结算',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_order_goods`
-- ----------------------------
DROP TABLE IF EXISTS `csair_order_goods`;
CREATE TABLE `csair_order_goods` (
  `order_goods_id` int(10) NOT NULL COMMENT '主键id',
  `order_id` int(10) DEFAULT NULL COMMENT '订单id',
  `goods_id` int(10) DEFAULT NULL COMMENT '商品id',
  `goods_img` varchar(100) DEFAULT NULL COMMENT '商品缩略图',
  `product_id` int(10) DEFAULT NULL COMMENT '货品id',
  `price` decimal(15,2) DEFAULT NULL COMMENT '商品原价',
  `real_price` decimal(15,2) DEFAULT NULL COMMENT '商品实付价格',
  `goods_nums` int(10) DEFAULT NULL COMMENT '商品数量',
  `goods_weight` decimal(15,2) DEFAULT NULL COMMENT '商品重量',
  `goods_array` text COMMENT '商品和货品名称name和规格value串json数据格式',
  `is_send` tinyint(1) DEFAULT NULL COMMENT '是否已发货 0:未发货;1:已发货;2:已经退货',
  `delivery_id` int(10) DEFAULT NULL COMMENT '配送单id',
  `shop_id` int(10) DEFAULT NULL COMMENT '商家id',
  PRIMARY KEY (`order_goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_order_log`
-- ----------------------------
DROP TABLE IF EXISTS `csair_order_log`;
CREATE TABLE `csair_order_log` (
  `log_id` int(10) NOT NULL COMMENT '日志id',
  `order_id` int(10) DEFAULT NULL COMMENT '订单id',
  `login_id` int(10) DEFAULT NULL COMMENT '操作人',
  `action` varchar(50) DEFAULT NULL COMMENT '动作',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `result` varchar(10) DEFAULT NULL COMMENT '操作结果',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_power`
-- ----------------------------
DROP TABLE IF EXISTS `csair_power`;
CREATE TABLE `csair_power` (
  `power_id` varchar(4) DEFAULT NULL COMMENT '权限id',
  `power_key` varchar(100) DEFAULT NULL COMMENT '权限对应key',
  `power_name` varchar(100) DEFAULT NULL COMMENT '权限名称',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `add_by` int(5) DEFAULT NULL COMMENT '添加人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` int(5) DEFAULT NULL COMMENT '更新人'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_power_group`
-- ----------------------------
DROP TABLE IF EXISTS `csair_power_group`;
CREATE TABLE `csair_power_group` (
  `group_id` tinyint(3) NOT NULL COMMENT '权限组id',
  `group_name` varchar(100) DEFAULT NULL COMMENT '权限组名称',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_power_group_manage`
-- ----------------------------
DROP TABLE IF EXISTS `csair_power_group_manage`;
CREATE TABLE `csair_power_group_manage` (
  `manage_id` tinyint(3) NOT NULL COMMENT '管理权限角色id',
  `manage_name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `power_id` varchar(200) DEFAULT NULL COMMENT '拥有的权限id',
  `add_time` datetime DEFAULT NULL COMMENT '添加权限时间',
  `add_by` int(10) DEFAULT NULL COMMENT '添加人',
  `update_time` datetime DEFAULT NULL COMMENT '最近更新时间',
  `update_by` int(10) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`manage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_quantity_log`
-- ----------------------------
DROP TABLE IF EXISTS `csair_quantity_log`;
CREATE TABLE `csair_quantity_log` (
  `log_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `depot_id` int(10) DEFAULT NULL COMMENT '仓库ID',
  `goods_id` int(10) DEFAULT NULL COMMENT '商品ID',
  `sku_id` int(10) DEFAULT NULL COMMENT '货品ID',
  `goods_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `depot_type` tinyint(1) DEFAULT NULL COMMENT '仓库类型 0：网站，1：实体店',
  `op_type` tinyint(2) DEFAULT '0' COMMENT '操作类型 0：进货，1：实体店出货，2：网店订单发货',
  `num` int(10) DEFAULT NULL COMMENT '本次操作的数量',
  `enable_quantity` int(10) DEFAULT '0' COMMENT '本次操作的有效库存',
  `remark` text COMMENT '备注',
  `dateline` datetime DEFAULT NULL COMMENT '记录时间',
  `login_id` int(10) DEFAULT NULL COMMENT '操作员ID',
  `login_name` varchar(255) DEFAULT NULL COMMENT '操作员名称',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_receive`
-- ----------------------------
DROP TABLE IF EXISTS `csair_receive`;
CREATE TABLE `csair_receive` (
  `receive_id` int(10) NOT NULL COMMENT '收货信息id',
  `cas_id` int(10) DEFAULT NULL COMMENT '用户id',
  `receiver` varchar(100) DEFAULT NULL COMMENT '收货人',
  `receive_postcode` int(10) DEFAULT NULL COMMENT '邮政编码',
  `receive_phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `country_id` int(10) DEFAULT NULL COMMENT '国家id',
  `province_id` int(10) DEFAULT NULL COMMENT '省id',
  `city_id` int(10) DEFAULT NULL COMMENT '城市id',
  `district_id` int(10) DEFAULT NULL COMMENT '区县id',
  `receive_addr` varchar(500) DEFAULT NULL COMMENT '详细地址',
  `is_default` tinyint(1) DEFAULT NULL COMMENT '是否默认 0-否，1-是',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`receive_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_refund_order`
-- ----------------------------
DROP TABLE IF EXISTS `csair_refund_order`;
CREATE TABLE `csair_refund_order` (
  `refond_id` int(10) NOT NULL COMMENT '退单id',
  `order_no` varchar(20) DEFAULT NULL COMMENT '订单编号',
  `order_id` int(10) DEFAULT NULL COMMENT '订单id',
  `cas_id` int(10) DEFAULT NULL COMMENT '用户id',
  `amount` decimal(15,2) DEFAULT NULL COMMENT '退款金额',
  `add_time` datetime DEFAULT NULL COMMENT '退款发起时间',
  `login_id` int(10) DEFAULT NULL COMMENT '管理员id',
  `status` tinyint(1) DEFAULT NULL COMMENT '退款状态,0:申请退款 1:退款失败 2:退款成功',
  `content` text COMMENT '申请退款原因',
  `dispost_time` datetime DEFAULT NULL COMMENT '处理时间',
  `dispost_idea` text COMMENT '处理意见',
  `goods_id` int(10) DEFAULT NULL COMMENT '退款产品id',
  `shop_id` int(10) DEFAULT NULL COMMENT '店铺id',
  PRIMARY KEY (`refond_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_remind_me`
-- ----------------------------
DROP TABLE IF EXISTS `csair_remind_me`;
CREATE TABLE `csair_remind_me` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `activity_id` int(11) DEFAULT NULL COMMENT '活动id',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `remind_time` datetime DEFAULT NULL COMMENT '提醒时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `csair_return_message_board`
-- ----------------------------
DROP TABLE IF EXISTS `csair_return_message_board`;
CREATE TABLE `csair_return_message_board` (
  `message_board_id` int(10) DEFAULT NULL COMMENT '主键id',
  `return_id` int(10) DEFAULT NULL COMMENT '退货id',
  `order_id` int(10) DEFAULT NULL COMMENT '订单id',
  `return_type` tinyint(1) DEFAULT NULL COMMENT '留言类型 0买家留言，1卖家回复',
  `cas_id` int(10) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `shop_id` int(10) DEFAULT NULL COMMENT '商家id',
  `shop_name` varchar(100) DEFAULT NULL COMMENT '商家名称',
  `message` text COMMENT '留言内容',
  `add_time` datetime DEFAULT NULL COMMENT '发表时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_return_order_goods`
-- ----------------------------
DROP TABLE IF EXISTS `csair_return_order_goods`;
CREATE TABLE `csair_return_order_goods` (
  `return_id` int(10) DEFAULT NULL COMMENT '退货id',
  `order_id` int(10) DEFAULT NULL COMMENT '订单id',
  `return_sn` varchar(20) DEFAULT NULL COMMENT '退货编码',
  `shop_id` int(10) DEFAULT NULL COMMENT '商家id',
  `cas_id` int(10) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `shop_type` tinyint(1) DEFAULT NULL COMMENT '商家状态',
  `status` tinyint(1) DEFAULT NULL COMMENT '退货状态 0处理中，1通过，2不通过',
  `delivery_status` tinyint(1) DEFAULT NULL COMMENT '退货物流状态 退货物流 0待收货，1已收货，2拒绝收货',
  `reply` text COMMENT '回复',
  `return_goods_id` text COMMENT '退货商品id,逗号分隔',
  `return_goods_number` text COMMENT '退货商品数量',
  `dispose_type` tinyint(1) DEFAULT NULL COMMENT '退换类型 0退货，1换货，2保修',
  `cause` varchar(100) DEFAULT NULL COMMENT '申请原因',
  `content` text COMMENT '内容',
  `province` varchar(100) DEFAULT NULL COMMENT '省(退货)',
  `city` varchar(100) DEFAULT NULL COMMENT '市（退货）',
  `district` varchar(100) DEFAULT NULL COMMENT '区县(退货)',
  `address` varchar(500) DEFAULT NULL COMMENT '地址(退货)',
  `zipcode` varchar(20) DEFAULT NULL COMMENT '邮政编码(退货)',
  `telephone` varchar(20) DEFAULT NULL COMMENT '电话（退货）',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机（退货）',
  `file_img` text COMMENT '图片凭证',
  `r_order_price` decimal(15,2) DEFAULT NULL COMMENT '退款金额',
  `return_address` varchar(200) DEFAULT NULL COMMENT '回寄地址',
  `return_user` varchar(100) DEFAULT NULL COMMENT '回寄联系人',
  `return_tel` varchar(20) DEFAULT NULL COMMENT '回寄联系电话',
  `return_mobile` varchar(20) DEFAULT NULL COMMENT '回寄联系手机',
  `logistics_sn` varchar(50) DEFAULT NULL COMMENT '退货物流单号',
  `logistics_kd` int(10) DEFAULT NULL COMMENT '退货物流公司',
  `return_type` tinyint(1) DEFAULT NULL COMMENT '是否收到退货 0未收到，1已收到',
  `add_time` datetime DEFAULT NULL COMMENT ' 申请退货时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_return_order_message`
-- ----------------------------
DROP TABLE IF EXISTS `csair_return_order_message`;
CREATE TABLE `csair_return_order_message` (
  `mid` int(10) DEFAULT NULL COMMENT '自增id',
  `return_id` int(10) DEFAULT NULL COMMENT '退货id',
  `of_shop` tinyint(1) DEFAULT NULL COMMENT '归属 0平台，1商家',
  `shop_id` int(10) DEFAULT NULL COMMENT '店铺id',
  `username` varchar(20) DEFAULT NULL COMMENT '发送消息人',
  `message` text COMMENT ' 消息内容',
  `add_time` datetime DEFAULT NULL COMMENT '发送时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_return_save_mes`
-- ----------------------------
DROP TABLE IF EXISTS `csair_return_save_mes`;
CREATE TABLE `csair_return_save_mes` (
  `rsm_id` int(10) DEFAULT NULL COMMENT '退单操作id',
  `save_id` varchar(20) DEFAULT NULL COMMENT '操作人',
  `return_id` int(11) DEFAULT NULL COMMENT '退货id',
  `save_of` tinyint(1) DEFAULT NULL COMMENT '操作人归属 0商家，1平台管理',
  `type` int(10) DEFAULT NULL COMMENT '操作类型',
  `message` text COMMENT '操作备注',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_search`
-- ----------------------------
DROP TABLE IF EXISTS `csair_search`;
CREATE TABLE `csair_search` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '搜索历史记录id',
  `user_id` varchar(255) DEFAULT NULL COMMENT '用户id',
  `keyword` varchar(255) DEFAULT NULL COMMENT '搜索关键字',
  `login_ip` varchar(255) DEFAULT NULL COMMENT '登录ip',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间（搜索时间）',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态 0 不可用 1可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_seller_message`
-- ----------------------------
DROP TABLE IF EXISTS `csair_seller_message`;
CREATE TABLE `csair_seller_message` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL COMMENT '商家消息标题',
  `content` text COMMENT '商家消息内容',
  `sort_order` tinyint(4) DEFAULT NULL COMMENT '商家消息排序',
  `create_time` datetime DEFAULT NULL COMMENT '商家消息创建时间',
  `publish_time` datetime DEFAULT NULL COMMENT '商家消息发布时间',
  `modify_time` datetime DEFAULT NULL COMMENT '商家消息修改时间',
  `delete_time` datetime DEFAULT NULL COMMENT '商家信息删除时间',
  `is_publish` tinyint(4) DEFAULT '0' COMMENT '商家信息是否发布,0未发布1已发布',
  `enable` tinyint(4) DEFAULT '0' COMMENT '是否有效标识，0有效1无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_shop`
-- ----------------------------
DROP TABLE IF EXISTS `csair_shop`;
CREATE TABLE `csair_shop` (
  `shop_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '店铺id',
  `shop_name` varchar(100) NOT NULL COMMENT '店铺名称',
  `create_time` datetime NOT NULL COMMENT '开店时间',
  `is_commend` tinyint(1) NOT NULL COMMENT ' 是否推荐商家 0否（默认），1是',
  `status` tinyint(2) NOT NULL COMMENT '店铺状态 0关闭，1正常，2删除',
  `contacts` varchar(10) DEFAULT NULL COMMENT '联系人',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(15) DEFAULT NULL COMMENT '电话',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机',
  `shop_desc` varchar(200) DEFAULT NULL COMMENT '店铺描述',
  `apply_id` int(10) DEFAULT NULL COMMENT '申请店铺id 用户在申请店铺时生成的申请id',
  `ratio` decimal(15,2) DEFAULT NULL COMMENT '进驻费率',
  `country_id` int(5) DEFAULT NULL COMMENT '国家id',
  `province_id` int(5) DEFAULT NULL COMMENT '省id',
  `city_id` int(5) DEFAULT NULL COMMENT '城市id',
  `district_id` int(5) DEFAULT NULL COMMENT '区县id',
  `shop_order` int(10) DEFAULT NULL COMMENT '排序',
  `is_auth` tinyint(4) NOT NULL COMMENT '审核状态:0待审核,1审核通过,2审核不通过',
  `auth_time` datetime NOT NULL COMMENT '审核提交时间',
  `auth_desc` varchar(100) DEFAULT NULL COMMENT '审核不通过原因',
  `id` bigint(20) DEFAULT NULL COMMENT '关联用户的id',
  `shop_type` tinyint(1) DEFAULT '1' COMMENT '店铺商品类型：1.普通商品、2.跨境购、3.机上免税品、4.线下自提、5里程兑换',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_shop_addr`
-- ----------------------------
DROP TABLE IF EXISTS `csair_shop_addr`;
CREATE TABLE `csair_shop_addr` (
  `shop_addr_id` int(1) NOT NULL COMMENT '地址表id',
  `shop_id` int(10) DEFAULT NULL COMMENT '店铺id',
  `addr_name` varchar(10) DEFAULT NULL COMMENT '地址名称',
  `contact_name` varchar(100) DEFAULT NULL COMMENT '联系人',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别 1男2女',
  `country_id` int(10) DEFAULT NULL COMMENT '国家id',
  `province_id` int(10) DEFAULT NULL COMMENT '省id',
  `city_id` int(10) DEFAULT NULL COMMENT '城市id',
  `district_id` int(10) DEFAULT NULL COMMENT '区县id',
  `postcode` varchar(10) DEFAULT NULL COMMENT '邮政编码',
  `address` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机',
  `telephone` varchar(20) DEFAULT NULL COMMENT '电话',
  `is_defual` tinyint(1) DEFAULT NULL COMMENT '是否默认地址 0否，1是',
  `type` tinyint(1) DEFAULT NULL COMMENT '收发地址类型 1 收2发',
  `remark` text COMMENT '备注',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `add_by` int(10) DEFAULT NULL COMMENT '添加人',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 0，关闭，1开启',
  `is_del` tinyint(1) DEFAULT NULL COMMENT '是否删除 0 否 1 是',
  PRIMARY KEY (`shop_addr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_shop_admin`
-- ----------------------------
DROP TABLE IF EXISTS `csair_shop_admin`;
CREATE TABLE `csair_shop_admin` (
  `admin_id` int(10) NOT NULL COMMENT '商家管理员id',
  `shop_id` int(10) DEFAULT NULL COMMENT '店铺id',
  `admin_name` varchar(10) NOT NULL COMMENT '商家登陆用户名称',
  `password` varchar(32) NOT NULL COMMENT '登陆密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `mobile` varchar(15) DEFAULT NULL COMMENT '手机',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `wx_unionid` varchar(32) DEFAULT NULL COMMENT '微信unionid',
  `last_ip` varchar(30) DEFAULT NULL COMMENT '上次登录ip',
  `last_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '账号状态',
  `remark` text COMMENT '备注',
  `role_id` tinyint(3) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_shop_apply`
-- ----------------------------
DROP TABLE IF EXISTS `csair_shop_apply`;
CREATE TABLE `csair_shop_apply` (
  `apply_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '申请id',
  `cas_id` int(10) NOT NULL COMMENT '申请人id',
  `company` varchar(100) NOT NULL COMMENT '公司名称',
  `shop_name` varchar(100) NOT NULL COMMENT '店铺名称',
  `country_id` int(5) DEFAULT NULL COMMENT '所在国家id',
  `province_id` int(5) DEFAULT NULL COMMENT '所在省份id',
  `city_id` int(10) DEFAULT NULL COMMENT '所在城市id',
  `district` int(10) DEFAULT NULL COMMENT '所在县区id',
  `legal_person` varchar(50) NOT NULL COMMENT '法人代表',
  `legal_person_id` varchar(50) NOT NULL COMMENT '法人代表证件号',
  `legal_person_id_type` tinyint(1) NOT NULL COMMENT '法人代表证件类型 1身份证',
  `company_phone` varchar(20) DEFAULT NULL COMMENT '公司联系电话',
  `total_staff` int(10) DEFAULT NULL COMMENT '员工总数',
  `register_capital` varchar(20) DEFAULT NULL COMMENT '注册资金',
  `contact_name` varchar(50) DEFAULT NULL COMMENT '联系人姓名',
  `email` varchar(100) DEFAULT NULL COMMENT '联系邮箱',
  `contact_phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `contact_address` varchar(200) DEFAULT NULL COMMENT '联系地址',
  `fax` varchar(20) DEFAULT NULL COMMENT '传真',
  `contact_information` varchar(200) DEFAULT NULL COMMENT '常用联系人信息',
  `goods_cat_ids` varchar(10) DEFAULT NULL COMMENT '产品分类id',
  `brand_ids` varchar(10) DEFAULT NULL COMMENT '品牌id',
  `other_brands` varchar(100) DEFAULT NULL COMMENT '其他品牌',
  `quality_report_img` varchar(200) DEFAULT NULL COMMENT '质量检测报告',
  `devolution_img` varchar(200) DEFAULT NULL COMMENT '代理授权文件',
  `credentials_img` varchar(200) DEFAULT NULL COMMENT '产品资质证明',
  `credentials_date` datetime DEFAULT NULL COMMENT '产品资质证明有效期',
  `business_license_img` varchar(200) DEFAULT NULL COMMENT '营业执照',
  `account_opening_licenses_img` varchar(200) DEFAULT NULL COMMENT '开户许可证',
  `registration_certificate_img` varchar(200) DEFAULT NULL COMMENT '税务登记证',
  `organization_code` varchar(100) DEFAULT NULL COMMENT '组织机构代码号',
  `organization_code_img` varchar(200) DEFAULT NULL COMMENT '组织机构代码号图',
  `corporate_identity_card_img` varchar(200) DEFAULT NULL COMMENT '企业法人身份证',
  `taxpayer_qualification_certificate_img` varchar(200) DEFAULT NULL COMMENT '一般纳税人资格证',
  `delivery_method` tinyint(1) DEFAULT NULL COMMENT '配送方式 1.物流，2. 自提，3.无需快递',
  `store_address` varchar(200) DEFAULT NULL COMMENT '仓库地址',
  `return_address` varchar(200) DEFAULT NULL COMMENT '退货地址',
  `return_zip_code` varchar(10) DEFAULT NULL COMMENT '退货邮政编码',
  `return_contacts` varchar(100) DEFAULT NULL COMMENT '退货联系人',
  `return_contacts_telephone` varchar(20) DEFAULT NULL COMMENT '退货联系号码',
  `finance_contacts` varchar(100) DEFAULT NULL COMMENT '财务联系人',
  `finance_company_name` varchar(200) DEFAULT NULL COMMENT '公司抬头',
  `taxpayer_identification_number` varchar(50) DEFAULT NULL COMMENT '纳税人识别号',
  `finance_telephone` varchar(20) DEFAULT NULL COMMENT '财务联系电话',
  `finance_mobile` varchar(20) DEFAULT NULL COMMENT '财务联系手机',
  `finance_address` varchar(200) DEFAULT NULL COMMENT '财务联系地址',
  `finance_bank` varchar(100) DEFAULT NULL COMMENT '开户行名称',
  `finance_bank_branch` varchar(100) DEFAULT NULL COMMENT '开户行支行',
  `finance_bank_number` varchar(30) DEFAULT NULL COMMENT '开户行账号',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 0刚申请，1通过，2拒绝，3合同签署完毕',
  `return_message` text COMMENT '回复信息',
  `express_company` varchar(100) DEFAULT NULL COMMENT '邮寄合同快递公司',
  `express_number` varchar(50) DEFAULT NULL COMMENT '快递号',
  `express_remark` text COMMENT '邮寄合同备注',
  `handheld_id_card` varchar(100) DEFAULT NULL COMMENT '手持身份证',
  `front_of_Id_card` varchar(100) DEFAULT NULL COMMENT '身份证正面',
  `Id_card_back` varchar(100) DEFAULT NULL COMMENT '身份证背面',
  `front_bank_card` varchar(100) DEFAULT NULL COMMENT '银行卡正面',
  PRIMARY KEY (`apply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_shop_bill`
-- ----------------------------
DROP TABLE IF EXISTS `csair_shop_bill`;
CREATE TABLE `csair_shop_bill` (
  `bill_id` int(10) NOT NULL COMMENT '结算id',
  `shop_id` int(10) DEFAULT NULL COMMENT '商家id',
  `apply_time` datetime DEFAULT NULL COMMENT '申请结算时间',
  `pay_time` datetime DEFAULT NULL COMMENT '支付结算时间',
  `login_id` int(10) DEFAULT NULL COMMENT '结算管理员id',
  `is_pay` tinyint(1) DEFAULT NULL COMMENT '是否已结算 0:未结算,1:已结算',
  `apply_content` text COMMENT '申请结算文本',
  `pay_content` text COMMENT '支付结算文本',
  `start_time` datetime DEFAULT NULL COMMENT '结算月份',
  `bill_log` text COMMENT '结算明细',
  `order_ids` text COMMENT '结算订单id',
  `amount` decimal(15,2) DEFAULT NULL COMMENT '结算金额',
  PRIMARY KEY (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_shop_contract`
-- ----------------------------
DROP TABLE IF EXISTS `csair_shop_contract`;
CREATE TABLE `csair_shop_contract` (
  `contract_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '合同id',
  `contract_name` varchar(100) NOT NULL COMMENT '合同名称',
  `status` tinyint(4) NOT NULL COMMENT '合同状态:0关闭,1正常,2删除',
  `contract_type` tinyint(4) NOT NULL COMMENT '合同分类,1为主合同,2为副合同',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `contract_createtime` datetime NOT NULL COMMENT '合同开始时间',
  `contract_endtime` datetime NOT NULL COMMENT '合同结束时间',
  `first_party` varchar(100) DEFAULT NULL COMMENT '甲方',
  `second_party` varchar(100) DEFAULT NULL COMMENT '乙方',
  `category_id` bigint(20) DEFAULT NULL COMMENT '关联的类目(一级)',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '关联的商家id',
  `shop_name` varchar(100) DEFAULT NULL COMMENT '关联的商家名称',
  `shop_address` varchar(100) DEFAULT NULL COMMENT '关联的商家地址',
  `shop_phone` varchar(20) DEFAULT NULL COMMENT '关联的商家联系方式',
  `contract_image` varchar(200) DEFAULT NULL COMMENT '合同图片',
  `contract_abs` varchar(200) DEFAULT NULL COMMENT '合同备注',
  PRIMARY KEY (`contract_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_shop_info`
-- ----------------------------
DROP TABLE IF EXISTS `csair_shop_info`;
CREATE TABLE `csair_shop_info` (
  `shopinfo_id` int(10) NOT NULL COMMENT '店铺配置id',
  `shop_id` int(10) DEFAULT NULL COMMENT '店铺id',
  `shop_title` varchar(100) DEFAULT NULL COMMENT '店铺标题',
  `shop_logo` varchar(100) DEFAULT NULL COMMENT '店铺logo',
  `shop_banner` varchar(100) DEFAULT NULL COMMENT '店铺banner图',
  `shop_desc` text COMMENT '店铺介绍',
  `service_time` varchar(100) DEFAULT NULL COMMENT '服务时间',
  `service_phone` varchar(20) DEFAULT NULL COMMENT '服务电话',
  `background` varchar(100) DEFAULT NULL COMMENT '背景图',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` int(10) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`shopinfo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_sku_depot_quantity`
-- ----------------------------
DROP TABLE IF EXISTS `csair_sku_depot_quantity`;
CREATE TABLE `csair_sku_depot_quantity` (
  `sku_depot_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `goods_id` int(10) DEFAULT NULL COMMENT '商品ID',
  `sku_id` int(10) DEFAULT NULL COMMENT '产品ID',
  `depot_id` int(10) DEFAULT NULL COMMENT '仓库ID',
  `quantity` int(10) DEFAULT NULL COMMENT '库存数量',
  `enable_quantity` int(10) DEFAULT '0' COMMENT '有效库存数量',
  PRIMARY KEY (`sku_depot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_specification`
-- ----------------------------
DROP TABLE IF EXISTS `csair_specification`;
CREATE TABLE `csair_specification` (
  `spec_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `spec_name` varchar(50) DEFAULT NULL COMMENT '规格名称',
  `spec_type` tinyint(1) DEFAULT NULL COMMENT '显示类型 0：文字，1：图片',
  `spec_desc` text COMMENT '描述',
  `spec_order` int(10) DEFAULT NULL COMMENT '显示次序',
  `disabled` tinyint(1) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`spec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商品规格值';

-- ----------------------------
--  Table structure for `csair_spec_values`
-- ----------------------------
DROP TABLE IF EXISTS `csair_spec_values`;
CREATE TABLE `csair_spec_values` (
  `spec_value_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `spec_id` int(10) DEFAULT NULL COMMENT '规格ID',
  `spec_value` varchar(100) DEFAULT NULL COMMENT '规格值',
  `spec_image` varchar(100) DEFAULT NULL COMMENT '规格图片',
  `spec_order` int(10) DEFAULT NULL COMMENT '排序值',
  `spec_type` tinyint(1) DEFAULT NULL COMMENT '规格显示类型 0：文字，1：图片',
  PRIMARY KEY (`spec_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_sys_admin`
-- ----------------------------
DROP TABLE IF EXISTS `csair_sys_admin`;
CREATE TABLE `csair_sys_admin` (
  `admin_id` int(10) NOT NULL COMMENT '管理员id',
  `admin_name` varchar(20) NOT NULL COMMENT '管理员名称',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `manage_id` tinyint(3) NOT NULL COMMENT '角色id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `mobile` varchar(15) DEFAULT NULL COMMENT '手机',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `staff_no` varchar(10) DEFAULT NULL COMMENT '员工工号',
  `staff_name` varchar(100) DEFAULT NULL COMMENT '员工姓名',
  `wx_unionid` varchar(32) DEFAULT NULL COMMENT '微信unionid',
  `last_ip` varchar(30) DEFAULT NULL COMMENT '上次登陆ip',
  `last_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  `status` tinyint(1) NOT NULL COMMENT '账号状态 0-停用，1-正常，2-删除',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csair_user_info`
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
--  Table structure for `csair_user_info_address`
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
--  Table structure for `csair_warn_num`
-- ----------------------------
DROP TABLE IF EXISTS `csair_warn_num`;
CREATE TABLE `csair_warn_num` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `goods_id` int(10) DEFAULT NULL COMMENT '商品ID',
  `sku_id` int(10) DEFAULT NULL COMMENT '货品ID',
  `warn_num` int(10) DEFAULT NULL COMMENT '报警数量',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `add_by` int(10) DEFAULT NULL COMMENT '添加人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `e_admin_menu`
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
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
--  Table structure for `e_admin_permission`
-- ----------------------------
DROP TABLE IF EXISTS `e_admin_permission`;
CREATE TABLE `e_admin_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(256) DEFAULT NULL COMMENT 'url地址',
  `name` varchar(64) DEFAULT NULL COMMENT 'url描述',
  `mid` bigint(20) DEFAULT NULL COMMENT '对应菜单的id',
  `type` tinyint(1) DEFAULT NULL COMMENT 'NULL为管理平台的权限；2为商家权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8 COMMENT='后台管理权限表';

-- ----------------------------
--  Table structure for `e_admin_role`
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
--  Table structure for `e_admin_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `e_admin_role_menu`;
CREATE TABLE `e_admin_role_menu` (
  `mid` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID',
  UNIQUE KEY `uniques1` (`mid`,`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台角色与菜单关联表';

-- ----------------------------
--  Table structure for `e_admin_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `e_admin_role_permission`;
CREATE TABLE `e_admin_role_permission` (
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '权限ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与权限关联表';

-- ----------------------------
--  Table structure for `e_admin_user`
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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='后台用户表';

-- ----------------------------
--  Table structure for `e_admin_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `e_admin_user_role`;
CREATE TABLE `e_admin_user_role` (
  `uid` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台用户与角色关联表';

-- ----------------------------
--  Table structure for `test`
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `test_fail` varchar(50) DEFAULT NULL COMMENT '退货id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `csair_activity` VALUES ('1','限时秒杀','sec_kill','1','限时秒杀','2017-07-28 08:59:40','2017-07-28 08:59:46','1','2017-07-10 09:00:20','1'), ('2','限时秒杀','sec_kill','1','限时秒杀','2017-07-20 08:59:40','2017-07-20 12:59:46','1','2017-07-13 08:59:46','1');
INSERT INTO `csair_activity_rule` VALUES ('4','goods_id_ex','1','1','1'), ('5','goods_id_ex','1','1','2'), ('6','goods_id_ex','1','1','3'), ('7','discount','1','1','80%');
INSERT INTO `csair_area` VALUES ('1','0','中国','1','1'), ('2','0','美国','1','2'), ('3','0','英国','1','3'), ('4','1','北京','2','1'), ('5','1','上海','2','2'), ('6','1','广东','2','3'), ('7','1','深圳','2','4'), ('8','6','广州','3','1'), ('9','8','白云区','4','1'), ('10','8','天河区','4','2'), ('11','8','越秀区','4','3'), ('12','8','海珠区','4','4'), ('13','8','荔湾区','4','5'), ('14','8','增城区','4','6'), ('15','8','从化区','4','7'), ('16','7','福田区','4','1'), ('17','7','南山区','4','2');
INSERT INTO `csair_article` VALUES ('20','不看不','2017-07-10 20:21:45','不看不知道，一看吓一跳','&lt;p&gt;&lt;img src=&quot;/html/img/6b7c9ae5c06c43e39adfa1bd80e17d5f.jpg&quot; alt=&quot;undefined&quot;&gt;不看不知道，一看吓一跳，没想到当男子走近后发现这家伙居然会动，还是个活物，这可把男子吓了一大跳，男子平复了下心情，于是凑近细看后发现这个物种长相十分诡异，看上去像是长着一对螃蟹的钳子。&lt;/p&gt;&lt;p class=&quot;pcenter&quot; style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://img1.utuku.china.com/635x0/news/20170710/9fc53341-25b9-41ee-b6dc-e83c813dcf48.jpg&quot; img_width=&quot;635&quot; img_height=&quot;420&quot; alt=&quot;男子山上发现诡异生物，走进一看吓了一跳&quot; inline=&quot;0&quot;&gt;&lt;/p&gt;&lt;p class=&quot;pcenter&quot; style=&quot;text-align: center;&quot;&gt;男子山上发现诡异生物&lt;/p&gt;&lt;p class=&quot;pcenter&quot; style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://img0.utuku.china.com/638x0/news/20170710/b74457ad-17d4-47ce-a004-c59ec467da30.jpg&quot; alt=&quot;男子山上发现诡异生物，走进一看吓了一跳&quot;&gt;&lt;/p&gt;&lt;p&gt;还有就是，这个奇异的物种身上有着特殊的斑纹，像是蟒蛇皮一般，十分吓人，还有一些黑白相间的小点，身份真是令人匪夷所思。&lt;/p&gt;','17','0','1','3','1','0'), ('23','台媒曝&lt;sub&gt;洪都拉&lt;/sub&gt;斯恐与台湾&ldquo;断交&rdquo; &ldquo;驻台使节&rdquo;将调往大陆任职','2017-07-11 19:44:55','台媒曝洪都拉&lt;sub&gt;斯恐与台&lt;/sub&gt;湾&ldquo;断交&rdquo; &ldquo;驻台使节&rdquo;将调往大陆任职台媒曝洪都拉斯恐与台湾&ldquo;断交&rdquo; &ldquo;驻台使节&rdquo;将调往大陆任职','&lt;p class=&quot;otitle&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;（原标题：台媒曝洪都拉斯恐与台湾&ldquo;断交&rdquo; &ldquo;驻台使节&rdquo;将调往大陆任职）\r\n                &lt;/p&gt;&lt;p class=&quot;f_center&quot;&gt;&lt;img alt=&quot;台媒:洪都拉斯或与台断交 驻台使节将调大陆&quot; src=&quot;http://cms-bucket.nosdn.127.net/77d440652c064a8cacb59ed01541754920170711171733.jpeg?imageView&amp;amp;thumbnail=550x0&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;台湾《镜周刊》爆料称，洪都拉斯&ldquo;驻台使馆&rdquo;人员10日在高雄与友人餐叙时，无意透露部分&ldquo;驻台使节&rdquo;将在本月15日后调离台湾，并赴中国大陆任职。报道称，此举恐意味台湾与洪都拉斯也将面临&ldquo;断交&rdquo;命运。不过，台湾当局&ldquo;外交部&rdquo;11日仅回应称，没听说洪都拉斯&ldquo;大使&rdquo;将离任之消息，若是私人行程，&ldquo;自无所悉&rdquo;。&lt;/p&gt;&lt;p&gt;报道指出，事实上，巴拿马上个月宣布与台湾&ldquo;断交&rdquo;后，台当局&ldquo;外交部&rdquo;曾点名&ldquo;外交关系&rdquo;亮&ldquo;黄灯&rdquo;的国家，包括梵蒂冈、布基纳法索、危地马拉、尼加拉瓜与巴拉圭。而洪都拉斯也在日前曾传出与台湾&ldquo;邦交&rdquo;不稳，不过洪都拉斯&ldquo;大使&rdquo;曾在今年1月出面驳斥传言，称自己是&ldquo;爱台派&rdquo;。&lt;/p&gt;&lt;p&gt;报道认为，继前马英九任内与冈比亚&ldquo;断交&rdquo;后，蔡英文任内又与圣多美和普林西比、巴拿马&ldquo;断交&rdquo;，目前台湾当局&ldquo;邦交国&rdquo;数量只剩20各。而今，&ldquo;台巴断交&rdquo;风波未平，今又再传出台湾与洪都拉斯&ldquo;邦谊&rdquo;生变，引发外界猜测&ldquo;雪崩式断交&rdquo;的可能性。&lt;/p&gt;&lt;p&gt;此前，台湾&ldquo;外交部&rdquo;官员陈俊贤曾在6月14日透露，已有五个国家要求台湾在该国&ldquo;驻外办事处&rdquo;更名。据报道，这5个国家分别是尼日利亚、迪拜、约旦、厄瓜多尔、巴林。5国中除了在巴林办事处的名义是&ldquo;台湾&rdquo;外，其余4国办事处名称均包含了&ldquo;中华民国&rdquo;字眼。台湾与这些&ldquo;非邦交国&rdquo;的办事处被要求更名，&ldquo;如果继续使用会被要求拆牌&rdquo;。&lt;/p&gt;&lt;p&gt;\r\n&lt;/p&gt;&lt;div class=&quot;gg200x300&quot;&gt;\r\n&lt;div&gt;\r\n		&lt;a href=&quot;http://gb.corp.163.com/gb/legal.html&quot; class=&quot;ad_hover_href&quot;&gt;&lt;/a&gt;\r\n&lt;iframe src=&quot;http://g.163.com/r?site=netease&amp;amp;affiliate=news&amp;amp;cat=article&amp;amp;type=logo300x250&amp;amp;location=12&quot; border=&quot;0&quot; marginwidth=&quot;0&quot; marginheight=&quot;0&quot; scrolling=&quot;no&quot; width=&quot;300&quot; height=&quot;250&quot; frameborder=&quot;no&quot;&gt; &lt;/iframe&gt;\r\n    &lt;/div&gt;\r\n&lt;/div&gt;&lt;p&gt;台湾《中时电子报》刊文就曾分析称，巴拿马与台湾&ldquo;断交&rdquo;，成为近年来最大的&ldquo;断交&rdquo;冲击。巴拿马握有国际贸易和运输航线上最重要的运河，更是台湾在中美洲多年的重要&ldquo;盟邦&rdquo;，一旦失去，恐将真的面临骨牌效应。亲绿媒体《自由时报》也称，这是台湾&ldquo;外交&rdquo;重大挫折。&lt;/p&gt;&lt;p&gt;\r\n                                &lt;/p&gt;&lt;p&gt;国台办发言人马晓光曾表示，世界上只有一个中国。坚持一个中国原则是国际社会普遍共识，中巴建交是人心所向，大势所趋。体现一个中国原则的&ldquo;九二共识&rdquo;是两岸关系和平发展的定海神针。只有承认&ldquo;九二共识&rdquo;，认同其两岸同属一中的核心意涵，两岸关系才能重回和平发展的正确方向。台湾当局应认清客观大势，做出明智抉择。&lt;/p&gt;','19','0','1','1','1','0'), ('36','aaaaaaaaaaaaaaaa','2017-07-12 09:51:46','（原标题：台媒曝洪都拉斯恐与台湾“断交”“驻台使节”将调往大陆任职）\r\n\r\n台媒:洪都拉斯或与台断交驻台使节将调大陆\r\n\r\n台湾《镜周刊》爆料称洪都拉斯“驻台使','pclass=otitle（原标题：台媒曝洪都拉斯恐与台湾“断交”“驻台使节”将调往大陆任职）/ppclass=fcenterimgalt=台媒:洪都拉斯或与台断交驻台使节将调大陆src=http://cms-bucket.nosdn.127.net/77d440652c064a8cacb59ed01541754920170711171733.jpeg?imageViewthumbnail=550x0br/pp台湾《镜周刊》爆料称洪都拉斯“驻台使馆”人员10日在高雄与友人餐叙时无意透露部分“驻台使节”将在本月15日后调离台湾并赴中国大陆任职报道称此举恐意味台湾与洪都拉斯也将面临“断交”命运不过台湾当局“外交部”11日仅回应称没听说洪都拉斯“大使”将离任之消息若是私人行程“自无所悉”/pp报道指出事实上巴拿马上个月宣布与台湾“断交”后台当局“外交部”曾点名“外交关系”亮“黄灯”的国家包括梵蒂冈、布基纳法索、危地马拉、尼加拉瓜与巴拉圭而洪都拉斯也在日前曾传出与台湾“邦交”不稳不过洪都拉斯“大使”曾在今年1月出面驳斥传言称自己是“爱台派”/pp报道认为继前马英九任内与冈比亚“断交”后蔡英文任内又与圣多美和普林西比、巴拿马“断交”目前台湾当局“邦交国”数量只剩20各而今“台巴断交”风波未平今又再传出台湾与洪都拉斯“邦谊”生变引发外界猜测“雪崩式断交”的可能性/pp此前台湾“外交部”官员陈俊贤曾在6月14日透露已有五个国家要求台湾在该国“驻外办事处”更名据报道这5个国家分别是尼日利亚、迪拜、约旦、厄瓜多尔、巴林5国中除了在巴林办事处的名义是“台湾”外其余4国办事处名称均包含了“中华民国”字眼台湾与这些“非邦交国”的办事处被要求更名“如果继续使用会被要求拆牌”/pp/pdivclass=gg200x300ahref=http://gb.corp.163.com/gb/legal.htmlclass=adhoverhref/aiframesrc=http://g.163.com/r?site=neteaseaffiliate=newscat=articletype=logo300x250location=12border=0marginwidth=0marginheight=0scrolling=nowidth=300height=250frameborder=no/iframe/divp台湾《中时电子报》刊文就曾分析称巴拿马与台湾“断交”成为近年来最大的“断交”冲击巴拿马握有国际贸易和运输航线上最重要的运河更是台湾在中美洲多年的重要“盟邦”一旦失去恐将真的面临骨牌效应亲绿媒体《自由时报》也称这是台湾“外交”重大挫折/pp/pp国台办发言人马晓光曾表示世界上只有一个中国坚持一个中国原则是国际社会普遍共识中巴建交是人心所向大势所趋体现一个中国原则的“九二共识”是两岸关系和平发展的定海神针只有承认“九二共识”认同其两岸同属一中的核心意涵两岸关系才能重回和平发展的正确方向台湾当局应认清客观大势做出明智抉择/p','17','0','1','1','1','0'), ('42','&lt;spean&gt;&lt;#if&gt;$&amp;wo 我','2017-07-12 09:51:53','（原标题：台媒曝洪都拉斯恐与台湾&ldquo;断交&rdquo;&ldquo;驻台使节&rdquo;将调往大陆任职）\r\n\r\n台媒:洪都拉斯或与台断交驻台使节将调大陆\r\n\r\n台湾《镜周刊》爆料称洪都拉斯&ldquo;驻台使','pclass=otitle（原标题：台媒曝洪都拉斯恐与台湾&ldquo;断交&rdquo;&ldquo;驻台使节&rdquo;将调往大陆任职）/ppclass=fcenterimgalt=台媒:洪都拉斯或与台断交驻台使节将调大陆src=http://cms-bucket.nosdn.127.net/77d440652c064a8cacb59ed01541754920170711171733.jpeg?imageViewthumbnail=550x0br/pp台湾《镜周刊》爆料称洪都拉斯&ldquo;驻台使馆&rdquo;人员10日在高雄与友人餐叙时无意透露部分&ldquo;驻台使节&rdquo;将在本月15日后调离台湾并赴中国大陆任职报道称此举恐意味台湾与洪都拉斯也将面临&ldquo;断交&rdquo;命运不过台湾当局&ldquo;外交部&rdquo;11日仅回应称没听说洪都拉斯&ldquo;大使&rdquo;将离任之消息若是私人行程&ldquo;自无所悉&rdquo;/pp报道指出事实上巴拿马上个月宣布与台湾&ldquo;断交&rdquo;后台当局&ldquo;外交部&rdquo;曾点名&ldquo;外交关系&rdquo;亮&ldquo;黄灯&rdquo;的国家包括梵蒂冈、布基纳法索、危地马拉、尼加拉瓜与巴拉圭而洪都拉斯也在日前曾传出与台湾&ldquo;邦交&rdquo;不稳不过洪都拉斯&ldquo;大使&rdquo;曾在今年1月出面驳斥传言称自己是&ldquo;爱台派&rdquo;/pp报道认为继前马英九任内与冈比亚&ldquo;断交&rdquo;后蔡英文任内又与圣多美和普林西比、巴拿马&ldquo;断交&rdquo;目前台湾当局&ldquo;邦交国&rdquo;数量只剩20各而今&ldquo;台巴断交&rdquo;风波未平今又再传出台湾与洪都拉斯&ldquo;邦谊&rdquo;生变引发外界猜测&ldquo;雪崩式断交&rdquo;的可能性/pp此前台湾&ldquo;外交部&rdquo;官员陈俊贤曾在6月14日透露已有五个国家要求台湾在该国&ldquo;驻外办事处&rdquo;更名据报道这5个国家分别是尼日利亚、迪拜、约旦、厄瓜多尔、巴林5国中除了在巴林办事处的名义是&ldquo;台湾&rdquo;外其余4国办事处名称均包含了&ldquo;中华民国&rdquo;字眼台湾与这些&ldquo;非邦交国&rdquo;的办事处被要求更名&ldquo;如果继续使用会被要求拆牌&rdquo;/pp/pdivclass=gg200x300ahref=http://gb.corp.163.com/gb/legal.htmlclass=adhoverhref/aiframesrc=http://g.163.com/r?site=neteaseaffiliate=newscat=articletype=logo300x250location=12border=0marginwidth=0marginheight=0scrolling=nowidth=300height=250frameborder=no/iframe/divp台湾《中时电子报》刊文就曾分析称巴拿马与台湾&ldquo;断交&rdquo;成为近年来最大的&ldquo;断交&rdquo;冲击巴拿马握有国际贸易和运输航线上最重要的运河更是台湾在中美洲多年的重要&ldquo;盟邦&rdquo;一旦失去恐将真的面临骨牌效应亲绿媒体《自由时报》也称这是台湾&ldquo;外交&rdquo;重大挫折/pp/pp国台办发言人马晓光曾表示世界上只有一个中国坚持一个中国原则是国际社会普遍共识中巴建交是人心所向大势所趋体现一个中国原则的&ldquo;九二共识&rdquo;是两岸关系和平发展的定海神针只有承认&ldquo;九二共识&rdquo;认同其两岸同属一中的核心意涵两岸关系才能重回和平发展的正确方向台湾当局应认清客观大势做出明智抉择/p','17','0','1','1','1','0'), ('43','夏日234','2017-07-12 14:21:50','sdfsafasdfasfas\r\nsadfasdfasfasad','&lt;p&gt;iho&lt;strike&gt;ihyi&lt;/strike&gt;o&lt;/p&gt;&lt;p&gt;asd&lt;b&gt;fa&lt;/b&gt;s&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;','11','0','1','1','1','0'), ('45','/%$*_+&lt;&gt; 这位妈妈爆红网络，只因总给3个孩子穿&ldquo;旧衣服&rdquo;~','2017-07-12 16:00:39','这位妈妈爆红网络，只因总给3个孩子穿&ldquo;旧衣服&rdquo;~这位妈妈爆红网络，只因总给3个孩子穿&ldquo;旧衣服&rdquo;~这位妈妈爆红网络，只因总给3个孩子穿&ldquo;旧衣服&rdquo;~这位妈妈爆红网络，只因总给3个孩子穿&ldquo;旧衣服&rdquo;~这位妈妈','&lt;div class=&quot;text-title&quot;&gt;&lt;h1&gt;这位妈妈爆红网络，只因总给3个孩子穿&ldquo;旧衣服&rdquo;~&lt;span class=&quot;article-tag&quot;&gt;&lt;/span&gt;&lt;/h1&gt;&lt;div class=&quot;article-info&quot;&gt;&lt;span class=&quot;time&quot; id=&quot;news-time&quot; data-val=&quot;1499693088000&quot;&gt;2017-07-10 21:24&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;&lt;article class=&quot;article&quot;&gt;&lt;p&gt;&lt;span&gt;想必很多人小时候&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;都经历过这样的蜜汁风格&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;且不说红配绿这种赛狗屁的搭配&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;光是厚棉袄和厚棉裤&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;你敢说你家没有？&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;这种搭配统统可以称为：&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;你妈怕你冻着style&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;▼&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://img.mp.itc.cn/upload/20170710/d4f7dd2c96fc4b588e8bfa5e2ec12152_th.jpg&quot; alt=&quot;&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;再来看看&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;别人家的妈妈给娃穿的衣服&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;▼&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://img.mp.itc.cn/upload/20170710/aac94461d14a4e51bbb9bc35e28e0a3c_th.jpg&quot; alt=&quot;&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;这位&ldquo;别人家的妈妈&rdquo;叫Sarah Tyau&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;一名生活在美国的韩裔服装设计师&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;同时也是3个孩子的母亲&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;▼&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://img.mp.itc.cn/upload/20170710/5fee56566c2d4324915f1893aa7df399_th.jpg&quot; alt=&quot;&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;将老公的衣服&ldquo;重新包装&rdquo;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;成了心仪的小裙子&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;▼&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://img.mp.itc.cn/upload/20170710/25b72b08d9434ed09aab053afc29d3bb_th.jpg&quot; alt=&quot;&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://img.mp.itc.cn/upload/20170710/49514ee856704433b10807c887380ee4_th.jpg&quot; alt=&quot;&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;自己过时的大衣&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;摇身一变成了当季新款&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;▼&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://img.mp.itc.cn/upload/20170710/695e37c757bc420c8a8acb2637f79f4a_th.jpg&quot; alt=&quot;&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;一件衣服做给两个女儿穿&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;估计也就这位妈妈才能办到了&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;▼&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://img.mp.itc.cn/upload/20170710/bb4f5698bb264b83a27711df83c3d551_th.jpg&quot; alt=&quot;&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;现在Sarah的模特不仅局限于女儿&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;她本人也为自己&ldquo;代言&rdquo;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;做起成人的衣服更是信手拈来&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;格子大衣穿腻了？&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;换成背带裙！&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;▼&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://img.mp.itc.cn/upload/20170710/61e79396255d4aefa7a8ff82041861a2_th.jpg&quot; alt=&quot;&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;这种垫肩装应该是很复古了吧&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;没关系&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;换个颜色加个点缀&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;瞬间活力四射！&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;你能看出这是同一件衣服吗？&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;▼&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://img.mp.itc.cn/upload/20170710/37296f19386b4d1fa456d3d21b4e2ce5_th.jpg&quot; alt=&quot;&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;一件简单的裙子&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;加上花边图案&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;瞬间也能仙气十足&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;▼&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://img.mp.itc.cn/upload/20170710/d8584ef32a9b4e5ea4f584f860242dd6_th.jpg&quot; alt=&quot;&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;又肥又大的白色裙子&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;估计是自己怀孕时穿的&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;经过她的巧手&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;不仅精致还显身材呢~&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;▼&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://img.mp.itc.cn/upload/20170710/328a8da5f0d14a34ab588bc4f14a7c7a_th.jpg&quot; alt=&quot;&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;做套亲子装&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;一家人出游都成了焦点&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;▼&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://img.mp.itc.cn/upload/20170710/f76a5408629641af8fe1ced33f58c976_th.jpg&quot; alt=&quot;&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;Sarah的行为&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;影响了越来越多热爱生活的人&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;生活是公平的&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;当我们放下急功近利&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;去拥抱生活&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;最终也会被生活温柔以待&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;我是分割线&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;你学会了吗？&lt;/span&gt;&lt;/p&gt;&lt;p&gt;想获取更多可以关注我们，我们将精心为大家准备，于每天为大家推送时尚资讯，服装搭配，旧物改造等内容哦！&lt;/p&gt;&lt;p&gt;【有需要咨询的可以在文章下留言哈，小编看到了，会尽快回复大家的呢！】&lt;/p&gt;&lt;blockquote&gt;&lt;p&gt;每日穿衣搭配精选&lt;/p&gt;&lt;p&gt;ID：meirichuanyi&lt;/p&gt;&lt;p&gt;&lt;span&gt;简介:&amp;nbsp;&lt;/span&gt;想知道怎么穿衣，怎么时尚搭配，关注@每日穿衣搭配精选 绝对有你想要的。&lt;/p&gt;&lt;/blockquote&gt;&lt;/article&gt;','11','0','1','1','1','0'), ('48','宗旨，不断满足人民群众日益增长的司法需求。作为司法改革&ldquo;排头兵&rdquo;&ldquo;试验田&rdquo;的巡回法庭要做','2017-07-12 19:52:23','oijy9uihjiuk\r\nergopeirgoperig0ero\r\nerg9er','&lt;p class=&quot;otitle&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;（原标题：坚定不移推进司法改革走中国特色社会主义法治道路&mdash;&mdash;习近平总书记对司法体制改革作出的重要指示引起热烈反响）\r\n                &lt;/p&gt;&lt;p&gt;新华社北京7月11日电&amp;nbsp;&lt;strong&gt;题：坚定不移推进司法改革走中国特色社会主义法治道路&mdash;&mdash;习近平总书记对司法体制改革作出的重要指示引起热烈反响&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;新华社记者 杨维汉、丁小溪、罗沙&lt;/p&gt;&lt;p&gt;中共中央总书记、国家主席、中央军委主席习近平近日对司法体制改革作出重要指示。&lt;/p&gt;&lt;p&gt;连日来，习近平总书记的重要指示在广大法律工作者中引起热烈反响。大家表示，要认真领会总书记的重要指示，指导司法体制改革创新实践，不断完善和发展中国特色社会主义司法制度，为加快建设社会主义法治国家作出新贡献。&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&ldquo;两个坚定不移&rdquo;，始终坚持司法体制改革正确政治方向&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;党的领导是社会主义法治的根本保证，坚持党的领导是我国社会主义司法制度的根本特征和政治优势。&lt;/p&gt;&lt;p&gt;习近平总书记要求，全国政法机关要按照党中央要求，坚定不移推进司法体制改革，坚定不移走中国特色社会主义法治道路。&lt;/p&gt;&lt;p&gt;&ldquo;习近平总书记提出&lsquo;两个坚定不移&rsquo;的要求，是推进司法体制改革的根本遵循。改革要牢牢坚持党的领导不动摇。&rdquo;江苏省委政法委书记王立科说，&ldquo;我们必须在党的领导下坚定不移推进司法体制改革，确保改革始终保持正确的政治方向。&rdquo;&lt;/p&gt;&lt;p&gt;不久前深入到司法体制改革一线考察的四川大学法学院教授龙宗智深有感触地说：&ldquo;党的十八大以来的司法体制改革坚持正确政治方向，遵循司法规律，在党中央坚强领导和强有力推动下,取得了实实在在的成效。无论是司法员额制、司法责任制改革，还是以审判为中心的刑事诉讼制度改革，都是在党总揽全局、协调各方的基础上，使改革得以有效推进。&rdquo;&lt;/p&gt;&lt;p&gt;&ldquo;总书记的重要指示高屋建瓴、要求明确，坚定了我们走中国特色社会主义法治道路的决心和信心。&rdquo;贵州省委政法委书记谌贻琴表示，我们要切实肩负好政治责任、把握好重大机遇、运用好重要经验、落实好重点任务，坚定不移推进司法体制改革落地生根、开花结果。&lt;/p&gt;&lt;p&gt;最高人民法院巡回法庭被誉为&ldquo;家门口的最高法院&rdquo;。最高人民法院审判委员会专职委员、第二巡回法庭庭长胡云腾认为，把握好司法改革政治方向要以司法为民作为根本宗旨，不断满足人民群众日益增长的司法需求。作为司法改革&ldquo;排头兵&rdquo;&ldquo;试验田&rdquo;的巡回法庭要做司法为民的模范、严格公正司法的表率。&lt;/p&gt;&lt;p&gt;推进司法体制改革，是社会主义司法制度自我完善和发展，走的是中国特色社会主义法治道路。北京市人民检察院检察长敬大力表示，要按照总书记提出的要求，始终坚持问题导向，不断提高司法体制改革的体系化、精细化水平，努力向党中央交出一份合格的改革答卷，以更加优异的成绩迎接党的十九大胜利召开。&lt;/p&gt;&lt;p&gt;&lt;strong&gt;啃硬骨头、涉险滩、闯难关，深化改革提高司法公信力&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;习近平总书记指出，党的十八大以来，政法战线坚持正确改革方向，敢于啃硬骨头、涉险滩、闯难关，做成了想了很多年、讲了很多年但没有做成的改革，司法公信力不断提升，对维护社会公平正义发挥了重要作用。&lt;/p&gt;&lt;p&gt;司法员额制、司法责任制改革是近年来推进司法体制改革的重点。员额制改革是&ldquo;一块最难啃的硬骨头&rdquo;，对司法人员的利益格局&ldquo;重新洗牌&rdquo;。成为员额制法官必须办案并对案件终身负责，司法责任制就是&ldquo;硬约束&rdquo;。&lt;/p&gt;&lt;p&gt;&ldquo;习近平总书记的重要指示让我们基层入额办案的法官深受鼓舞。&rdquo;河南省宁陵县人民法院院长王宏伟去年年底成为员额制法官，带头办案的他对改革深有感触：&ldquo;作为一名入额法官，回归办案第一线，特别是作为进入员额的法院领导，更要带头办理疑难复杂的案件，履行好应尽职责。&rdquo;&lt;/p&gt;&lt;p&gt;进入员额并不意味着进了&ldquo;保险箱&rdquo;。上海市闵行区人民检察院检察官胡智强说，院里以岗定责，建立了&ldquo;权力、职责、问责&rdquo;清单，对检察员额施行动态管理，不称职的检察官将依照规定和程序退出员额，&ldquo;所以我必须认真对待每一个经手的案件&rdquo;。&lt;/p&gt;&lt;p&gt;2015年以来，吉林省检察机关针对内设机构过多过滥，导致职能碎片化等突出问题，先后撤并内设机构500多个，一线办案力量和效能大幅增加。吉林省人民检察院检察长杨克勤表示，这一轮司法改革动人员、调机构动作很大，的确是涉险滩、闯难关。下一步，我们要按照总书记的重要指示，全面落实司法责任制和相关配套改革，深入推进以审判为中心的刑事诉讼制度改革，进一步提高办案质量、效率和公信力。&lt;/p&gt;&lt;p&gt;改革，就是要动真碰硬。在中国人民大学法学院教授陈卫东看来，总书记充分肯定了党的十八大以来司法体制改革工作。他说：&ldquo;特别是&lsquo;做成了想了很多年、讲了很多年但没有做成的改革&rsquo;，比如实现了法官、检察官和司法辅助人员分类管理，让进入员额的司法人员真正拥有办案权，同时与司法责任制结合，打破了多年的司法行政化，实现了&lsquo;谁办案谁负责&rsquo;，更加符合司法规律，司法改革在正确的道路上蹄疾步稳。作为专家学者也要积极投身其中，为改革出谋划策、贡献智慧。&rdquo;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;提升改革整体效能，完善发展中国特色社会主义司法制度&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;习近平总书记强调，要遵循司法规律，把深化司法体制改革和现代科技应用结合起来，不断完善和发展中国特色社会主义司法制度。&lt;/p&gt;&lt;p&gt;浙江省高级人民法院研究室副主任程建乐说：&ldquo;习近平总书记的要求指引着未来司法体制改革的方向。大数据、人工智能时代，司法改革要紧紧抓住新一轮科技革命的历史机遇，构建人力和科技深度融合的司法运行新模式，把现代科技和司法人员创造力更好地结合起来，形成科技和司法的融合效应，提升改革整体效能。&rdquo;&lt;/p&gt;&lt;p&gt;习近平总书记指出，要统筹推进公安改革、国家安全机关改革、司法行政改革，提高维护社会大局稳定、促进社会公平正义、保障人民安居乐业的能力。&lt;/p&gt;&lt;p&gt;&ldquo;习近平总书记的重要指示对改革提出了更高的目标和要求，我们要树立法治思维、创新思维，进一步找准科技创新与政法工作的结合点。&rdquo;天津市公安局局长赵飞对改革充满信心，他表示要充分依托运用大数据、人工智能系统，大力深化公安改革，为迈向更高水平的社会主义司法文明作出积极贡献。&lt;/p&gt;&lt;p&gt;公安部副部长、北京市公安局局长王小洪表示，公安机关将主动适应以审判为中心的刑事诉讼制度改革要求，深入推进实施警务运行模式等改革举措，确保社会大局稳定，维护社会公平正义。&lt;/p&gt;&lt;p&gt;司法部副部长熊选国表示，要主动拥抱人工智能时代，推动信息技术与司法行政工作深度融合，同时将研究制定深化司法行政改革的意见，以公共法律服务体系建设为总抓手，继续狠抓改革任务落实，确保取得实效。&lt;/p&gt;&lt;p&gt;律师是推进司法体制改革的重要力量。广东省律师协会副会长王波说，广大律师将发挥专业优势，与法官、检察官等法律工作者一起，推动司法体制改革不断发展进步，为建设公正高效权威的社会主义司法制度献计出力。&lt;/p&gt;&lt;p&gt;\r\n                                &lt;/p&gt;&lt;p&gt;&ldquo;习近平总书记的重要指示站在全面深化改革、全面依法治国的高度，为进一步推进司法体制改革提供了科学指南。&rdquo;最高人民检察院反贪总局四局局长宋寒松说，我们要明确改革目标，用过硬的办案和司法服务，让广大人民群众增强对中国特色社会主义司法制度的自信，为全面依法治国共同发力。&lt;/p&gt;','66','0','1','1','1','0'), ('49','dfgaset 314ter gg','2017-07-13 19:48:49','','&lt;p&gt;&lt;img src=&quot;/public/images/b76ea70254a442c48ab6f0c21ebe3181.png&quot; alt=&quot;undefined&quot;&gt;017-07-13 19:48:00.290 &amp;nbsp;INFO 4380 --- [nio-8082-exec-1] o.s.web.servlet.DispatcherServlet &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;: FrameworkServlet &#39;dispatcherServlet&#39;: initialization started&lt;/p&gt;&lt;div&gt;2017-07-13 19:48:00.317 &amp;nbsp;INFO 4380 --- [nio-8082-exec-1] o.s.web.servlet.DispatcherServlet &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;: FrameworkServlet &#39;dispatcherServlet&#39;: initialization completed in 26 ms&lt;/div&gt;&lt;div&gt;获取的开始时间为null结束时间为null&lt;/div&gt;&lt;div&gt;2017-07-13 19:48:14.274 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : org.apache.tomcat.jdbc.pool.StatementFacade$StatementProxy[Proxy=2095532930; Query=SELECT ar.ar_id,ar.ar_name,ar.status ,ar.sortOrder,ar.is_dis,ar.ac_id,ac.ac_name FROM csair_article ar , csair_articleclassify ac &amp;nbsp;where ar.ac_id = ac.ac_id &amp;nbsp; and create_time &amp;lt;=&#39;null23:59:59&#39; ORDER BY sortOrder limit ?, ? &amp;nbsp;; Delegate=com.mysql.jdbc.JDBC42PreparedStatement@3f8f8239: SELECT ar.ar_id,ar.ar_name,ar.status ,ar.sortOrder,ar.is_dis,ar.ac_id,ac.ac_name FROM csair_article ar , csair_articleclassify ac &amp;nbsp;where ar.ac_id = ac.ac_id &amp;nbsp; and create_time &amp;lt;=&#39;null23:59:59&#39; ORDER BY sortOrder limit 0, 5 &amp;nbsp;]&lt;/div&gt;&lt;div&gt;2017-07-13 19:48:14.285 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : com.mysql.jdbc.JDBC42ResultSet@16787564&lt;/div&gt;&lt;div&gt;2017-07-13 19:48:14.299 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : org.apache.tomcat.jdbc.pool.StatementFacade$StatementProxy[Proxy=1465538366; Query=select count(*) from csair_article ar where 1=1 &amp;nbsp; &amp;nbsp;and create_time &amp;lt;=&#39;null23:59:59&#39;; Delegate=com.mysql.jdbc.JDBC42PreparedStatement@1127ad0c: select count(*) from csair_article ar where 1=1 &amp;nbsp; &amp;nbsp;and create_time &amp;lt;=&#39;null23:59:59&#39;]&lt;/div&gt;&lt;div&gt;2017-07-13 19:48:14.309 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : com.mysql.jdbc.JDBC42ResultSet@527a7b5b&lt;/div&gt;&lt;div&gt;2017-07-13 19:48:14.364 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : org.apache.tomcat.jdbc.pool.StatementFacade$StatementProxy[Proxy=125626149; Query=SELECT * FROM csair_articleclassify ORDER BY sort_order; Delegate=com.mysql.jdbc.JDBC42PreparedStatement@29aa353: SELECT * FROM csair_articleclassify ORDER BY sort_order]&lt;/div&gt;&lt;div&gt;2017-07-13 19:48:14.367 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : com.mysql.jdbc.JDBC42ResultSet@2ef921c1&lt;/div&gt;&lt;div&gt;2017-07-13 19:48:15.988 &amp;nbsp;INFO 4380 --- [io-8082-exec-10] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : org.apache.tomcat.jdbc.pool.StatementFacade$StatementProxy[Proxy=1627203620; Query=SELECT * FROM csair_articleclassify ORDER BY sort_order; Delegate=com.mysql.jdbc.JDBC42PreparedStatement@64c2a0e3: SELECT * FROM csair_articleclassify ORDER BY sort_order]&lt;/div&gt;&lt;div&gt;2017-07-13 19:48:15.990 &amp;nbsp;INFO 4380 --- [io-8082-exec-10] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : com.mysql.jdbc.JDBC42ResultSet@199e13e7&lt;/div&gt;&lt;div&gt;获取到的图片为org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@6f72162&lt;/div&gt;&lt;div&gt;oldName is :bd_logo1_31bdc765.png&lt;/div&gt;&lt;div&gt;newName is :b76ea70254a442c48ab6f0c21ebe3181&lt;/div&gt;&lt;p&gt;017-07-13 19:48:00.290 &amp;nbsp;INFO 4380 --- [nio-8082-exec-1] o.s.web.servlet.DispatcherServlet &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;: FrameworkServlet &#39;dispatcherServlet&#39;: initialization started&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:00.317 &amp;nbsp;INFO 4380 --- [nio-8082-exec-1] o.s.web.servlet.DispatcherServlet &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;: FrameworkServlet &#39;dispatcherServlet&#39;: initialization completed in 26 ms&lt;/p&gt;&lt;p&gt;获取的开始时间为null结束时间为null&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:14.274 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : org.apache.tomcat.jdbc.pool.StatementFacade$StatementProxy[Proxy=2095532930; Query=SELECT ar.ar_id,ar.ar_name,ar.status ,ar.sortOrder,ar.is_dis,ar.ac_id,ac.ac_name FROM csair_article ar , csair_articleclassify ac &amp;nbsp;where ar.ac_id = ac.ac_id &amp;nbsp; and create_time &amp;lt;=&#39;null23:59:59&#39; ORDER BY sortOrder limit ?, ? &amp;nbsp;; Delegate=com.mysql.jdbc.JDBC42PreparedStatement@3f8f8239: SELECT ar.ar_id,ar.ar_name,ar.status ,ar.sortOrder,ar.is_dis,ar.ac_id,ac.ac_name FROM csair_article ar , csair_articleclassify ac &amp;nbsp;where ar.ac_id = ac.ac_id &amp;nbsp; and create_time &amp;lt;=&#39;null23:59:59&#39; ORDER BY sortOrder limit 0, 5 &amp;nbsp;]&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:14.285 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : com.mysql.jdbc.JDBC42ResultSet@16787564&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:14.299 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : org.apache.tomcat.jdbc.pool.StatementFacade$StatementProxy[Proxy=1465538366; Query=select count(*) from csair_article ar where 1=1 &amp;nbsp; &amp;nbsp;and create_time &amp;lt;=&#39;null23:59:59&#39;; Delegate=com.mysql.jdbc.JDBC42PreparedStatement@1127ad0c: select count(*) from csair_article ar where 1=1 &amp;nbsp; &amp;nbsp;and create_time &amp;lt;=&#39;null23:59:59&#39;]&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:14.309 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : com.mysql.jdbc.JDBC42ResultSet@527a7b5b&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:14.364 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : org.apache.tomcat.jdbc.pool.StatementFacade$StatementProxy[Proxy=125626149; Query=SELECT * FROM csair_articleclassify ORDER BY sort_order; Delegate=com.mysql.jdbc.JDBC42PreparedStatement@29aa353: SELECT * FROM csair_articleclassify ORDER BY sort_order]&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:14.367 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : com.mysql.jdbc.JDBC42ResultSet@2ef921c1&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:15.988 &amp;nbsp;INFO 4380 --- [io-8082-exec-10] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : org.apache.tomcat.jdbc.pool.StatementFacade$StatementProxy[Proxy=1627203620; Query=SELECT * FROM csair_articleclassify ORDER BY sort_order; Delegate=com.mysql.jdbc.JDBC42PreparedStatement@64c2a0e3: SELECT * FROM csair_articleclassify ORDER BY sort_order]&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:15.990 &amp;nbsp;INFO 4380 --- [io-8082-exec-10] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : com.mysql.jdbc.JDBC42ResultSet@199e13e7&lt;/p&gt;&lt;p&gt;获取到的图片为org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@6f72162&lt;/p&gt;&lt;p&gt;oldName is :bd_logo1_31bdc765.png&lt;/p&gt;&lt;p&gt;newName is :b76ea70254a442c48ab6f0c21ebe3181&lt;/p&gt;&lt;p&gt;017-07-13 19:48:00.290 &amp;nbsp;INFO 4380 --- [nio-8082-exec-1] o.s.web.servlet.DispatcherServlet &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;: FrameworkServlet &#39;dispatcherServlet&#39;: initialization started&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:00.317 &amp;nbsp;INFO 4380 --- [nio-8082-exec-1] o.s.web.servlet.DispatcherServlet &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;: FrameworkServlet &#39;dispatcherServlet&#39;: initialization completed in 26 ms&lt;/p&gt;&lt;p&gt;获取的开始时间为null结束时间为null&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:14.274 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : org.apache.tomcat.jdbc.pool.StatementFacade$StatementProxy[Proxy=2095532930; Query=SELECT ar.ar_id,ar.ar_name,ar.status ,ar.sortOrder,ar.is_dis,ar.ac_id,ac.ac_name FROM csair_article ar , csair_articleclassify ac &amp;nbsp;where ar.ac_id = ac.ac_id &amp;nbsp; and create_time &amp;lt;=&#39;null23:59:59&#39; ORDER BY sortOrder limit ?, ? &amp;nbsp;; Delegate=com.mysql.jdbc.JDBC42PreparedStatement@3f8f8239: SELECT ar.ar_id,ar.ar_name,ar.status ,ar.sortOrder,ar.is_dis,ar.ac_id,ac.ac_name FROM csair_article ar , csair_articleclassify ac &amp;nbsp;where ar.ac_id = ac.ac_id &amp;nbsp; and create_time &amp;lt;=&#39;null23:59:59&#39; ORDER BY sortOrder limit 0, 5 &amp;nbsp;]&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:14.285 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : com.mysql.jdbc.JDBC42ResultSet@16787564&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:14.299 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : org.apache.tomcat.jdbc.pool.StatementFacade$StatementProxy[Proxy=1465538366; Query=select count(*) from csair_article ar where 1=1 &amp;nbsp; &amp;nbsp;and create_time &amp;lt;=&#39;null23:59:59&#39;; Delegate=com.mysql.jdbc.JDBC42PreparedStatement@1127ad0c: select count(*) from csair_article ar where 1=1 &amp;nbsp; &amp;nbsp;and create_time &amp;lt;=&#39;null23:59:59&#39;]&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:14.309 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : com.mysql.jdbc.JDBC42ResultSet@527a7b5b&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:14.364 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : org.apache.tomcat.jdbc.pool.StatementFacade$StatementProxy[Proxy=125626149; Query=SELECT * FROM csair_articleclassify ORDER BY sort_order; Delegate=com.mysql.jdbc.JDBC42PreparedStatement@29aa353: SELECT * FROM csair_articleclassify ORDER BY sort_order]&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:14.367 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : com.mysql.jdbc.JDBC42ResultSet@2ef921c1&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:15.988 &amp;nbsp;INFO 4380 --- [io-8082-exec-10] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : org.apache.tomcat.jdbc.pool.StatementFacade$StatementProxy[Proxy=1627203620; Query=SELECT * FROM csair_articleclassify ORDER BY sort_order; Delegate=com.mysql.jdbc.JDBC42PreparedStatement@64c2a0e3: SELECT * FROM csair_articleclassify ORDER BY sort_order]&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:15.990 &amp;nbsp;INFO 4380 --- [io-8082-exec-10] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : com.mysql.jdbc.JDBC42ResultSet@199e13e7&lt;/p&gt;&lt;p&gt;获取到的图片为org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@6f72162&lt;/p&gt;&lt;p&gt;oldName is :bd_logo1_31bdc765.png&lt;/p&gt;&lt;p&gt;newName is :b76ea70254a442c48ab6f0c21ebe3181&lt;/p&gt;&lt;p&gt;017-07-13 19:48:00.290 &amp;nbsp;INFO 4380 --- [nio-8082-exec-1] o.s.web.servlet.DispatcherServlet &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;: FrameworkServlet &#39;dispatcherServlet&#39;: initialization started&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:00.317 &amp;nbsp;INFO 4380 --- [nio-8082-exec-1] o.s.web.servlet.DispatcherServlet &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;: FrameworkServlet &#39;dispatcherServlet&#39;: initialization completed in 26 ms&lt;/p&gt;&lt;p&gt;获取的开始时间为null结束时间为null&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:14.274 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : org.apache.tomcat.jdbc.pool.StatementFacade$StatementProxy[Proxy=2095532930; Query=SELECT ar.ar_id,ar.ar_name,ar.status ,ar.sortOrder,ar.is_dis,ar.ac_id,ac.ac_name FROM csair_article ar , csair_articleclassify ac &amp;nbsp;where ar.ac_id = ac.ac_id &amp;nbsp; and create_time &amp;lt;=&#39;null23:59:59&#39; ORDER BY sortOrder limit ?, ? &amp;nbsp;; Delegate=com.mysql.jdbc.JDBC42PreparedStatement@3f8f8239: SELECT ar.ar_id,ar.ar_name,ar.status ,ar.sortOrder,ar.is_dis,ar.ac_id,ac.ac_name FROM csair_article ar , csair_articleclassify ac &amp;nbsp;where ar.ac_id = ac.ac_id &amp;nbsp; and create_time &amp;lt;=&#39;null23:59:59&#39; ORDER BY sortOrder limit 0, 5 &amp;nbsp;]&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:14.285 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : com.mysql.jdbc.JDBC42ResultSet@16787564&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:14.299 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : org.apache.tomcat.jdbc.pool.StatementFacade$StatementProxy[Proxy=1465538366; Query=select count(*) from csair_article ar where 1=1 &amp;nbsp; &amp;nbsp;and create_time &amp;lt;=&#39;null23:59:59&#39;; Delegate=com.mysql.jdbc.JDBC42PreparedStatement@1127ad0c: select count(*) from csair_article ar where 1=1 &amp;nbsp; &amp;nbsp;and create_time &amp;lt;=&#39;null23:59:59&#39;]&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:14.309 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : com.mysql.jdbc.JDBC42ResultSet@527a7b5b&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:14.364 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : org.apache.tomcat.jdbc.pool.StatementFacade$StatementProxy[Proxy=125626149; Query=SELECT * FROM csair_articleclassify ORDER BY sort_order; Delegate=com.mysql.jdbc.JDBC42PreparedStatement@29aa353: SELECT * FROM csair_articleclassify ORDER BY sort_order]&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:14.367 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : com.mysql.jdbc.JDBC42ResultSet@2ef921c1&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:15.988 &amp;nbsp;INFO 4380 --- [io-8082-exec-10] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : org.apache.tomcat.jdbc.pool.StatementFacade$StatementProxy[Proxy=1627203620; Query=SELECT * FROM csair_articleclassify ORDER BY sort_order; Delegate=com.mysql.jdbc.JDBC42PreparedStatement@64c2a0e3: SELECT * FROM csair_articleclassify ORDER BY sort_order]&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:15.990 &amp;nbsp;INFO 4380 --- [io-8082-exec-10] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : com.mysql.jdbc.JDBC42ResultSet@199e13e7&lt;/p&gt;&lt;p&gt;获取到的图片为org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@6f72162&lt;/p&gt;&lt;p&gt;oldName is :bd_logo1_31bdc765.png&lt;/p&gt;&lt;p&gt;newName is :b76ea70254a442c48ab6f0c21ebe3181&lt;/p&gt;&lt;p&gt;017-07-13 19:48:00.290 &amp;nbsp;INFO 4380 --- [nio-8082-exec-1] o.s.web.servlet.DispatcherServlet &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;: FrameworkServlet &#39;dispatcherServlet&#39;: initialization started&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:00.317 &amp;nbsp;INFO 4380 --- [nio-8082-exec-1] o.s.web.servlet.DispatcherServlet &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;: FrameworkServlet &#39;dispatcherServlet&#39;: initialization completed in 26 ms&lt;/p&gt;&lt;p&gt;获取的开始时间为null结束时间为null&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:14.274 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : org.apache.tomcat.jdbc.pool.StatementFacade$StatementProxy[Proxy=2095532930; Query=SELECT ar.ar_id,ar.ar_name,ar.status ,ar.sortOrder,ar.is_dis,ar.ac_id,ac.ac_name FROM csair_article ar , csair_articleclassify ac &amp;nbsp;where ar.ac_id = ac.ac_id &amp;nbsp; and create_time &amp;lt;=&#39;null23:59:59&#39; ORDER BY sortOrder limit ?, ? &amp;nbsp;; Delegate=com.mysql.jdbc.JDBC42PreparedStatement@3f8f8239: SELECT ar.ar_id,ar.ar_name,ar.status ,ar.sortOrder,ar.is_dis,ar.ac_id,ac.ac_name FROM csair_article ar , csair_articleclassify ac &amp;nbsp;where ar.ac_id = ac.ac_id &amp;nbsp; and create_time &amp;lt;=&#39;null23:59:59&#39; ORDER BY sortOrder limit 0, 5 &amp;nbsp;]&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:14.285 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : com.mysql.jdbc.JDBC42ResultSet@16787564&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:14.299 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : org.apache.tomcat.jdbc.pool.StatementFacade$StatementProxy[Proxy=1465538366; Query=select count(*) from csair_article ar where 1=1 &amp;nbsp; &amp;nbsp;and create_time &amp;lt;=&#39;null23:59:59&#39;; Delegate=com.mysql.jdbc.JDBC42PreparedStatement@1127ad0c: select count(*) from csair_article ar where 1=1 &amp;nbsp; &amp;nbsp;and create_time &amp;lt;=&#39;null23:59:59&#39;]&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:14.309 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : com.mysql.jdbc.JDBC42ResultSet@527a7b5b&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:14.364 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : org.apache.tomcat.jdbc.pool.StatementFacade$StatementProxy[Proxy=125626149; Query=SELECT * FROM csair_articleclassify ORDER BY sort_order; Delegate=com.mysql.jdbc.JDBC42PreparedStatement@29aa353: SELECT * FROM csair_articleclassify ORDER BY sort_order]&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:14.367 &amp;nbsp;INFO 4380 --- [nio-8082-exec-2] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : com.mysql.jdbc.JDBC42ResultSet@2ef921c1&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:15.988 &amp;nbsp;INFO 4380 --- [io-8082-exec-10] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : org.apache.tomcat.jdbc.pool.StatementFacade$StatementProxy[Proxy=1627203620; Query=SELECT * FROM csair_articleclassify ORDER BY sort_order; Delegate=com.mysql.jdbc.JDBC42PreparedStatement@64c2a0e3: SELECT * FROM csair_articleclassify ORDER BY sort_order]&lt;/p&gt;&lt;p&gt;2017-07-13 19:48:15.990 &amp;nbsp;INFO 4380 --- [io-8082-exec-10] com.csair.admin.util.DataSourceUtils &amp;nbsp; &amp;nbsp; : com.mysql.jdbc.JDBC42ResultSet@199e13e7&lt;/p&gt;&lt;p&gt;获取到的图片为org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@6f72162&lt;/p&gt;&lt;p&gt;oldName is :bd_logo1_31bdc765.png&lt;/p&gt;&lt;p&gt;newName is :b76ea70254a442c48ab6f0c21ebe3181&lt;/p&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;','11','0','1','1','1','0'), ('50','下一个张柏芝，19岁怀孕得5亿分手费','2017-07-19 18:35:13','下一个张柏芝，19岁怀孕得5亿分手费下一个张柏芝，19岁怀孕得5亿分手费下一个张柏芝，19岁怀孕得5亿分手费下一个张柏芝，19岁怀孕得5亿分手费下一个张柏芝，19岁怀孕得5亿分手费下一个张柏芝，19岁','&lt;h1 id=&quot;chan_newsTitle&quot; style=&quot;text-align: center;&quot;&gt;她被誉&lt;img src=&quot;/html/img/1cb77337c615467fa49219c7c7e88e33.jpg&quot; alt=&quot;undefined&quot;&gt;&lt;/img&gt;&lt;/h1&gt;&lt;div id=&quot;chan_newsInfo&quot;&gt;&lt;div class=&quot;chan_newsInfo_link&quot;&gt;&lt;a href=&quot;http://news.china.com/yule/11184455/20170718/30981163.html#&quot; class=&quot;chan_newsInfo_font_small&quot;&gt;小&lt;/a&gt;&lt;a href=&quot;http://news.china.com/yule/11184455/20170718/30981163.html#&quot; class=&quot;chan_newsInfo_font_big&quot;&gt;大&lt;/a&gt;&lt;div class=&quot;cn_share&quot;&gt;&lt;span class=&quot;custom_item weixin&quot;&gt;&lt;/span&gt;&amp;nbsp;&lt;a title=&quot;分享到新浪微博&quot; class=&quot;sinaminiblog&quot;&gt;&lt;/a&gt;&amp;nbsp;&lt;a title=&quot;分享到QQ空间&quot; class=&quot;qzone&quot;&gt;&lt;/a&gt;&amp;nbsp;&lt;a title=&quot;分享到腾讯微博&quot; class=&quot;qqmb&quot;&gt;&lt;/a&gt;&lt;div class=&quot;weixin_main&quot;&gt;&lt;div class=&quot;weixin_main_box&quot;&gt;&lt;div class=&quot;weixin_main_box_int&quot;&gt;&lt;img src=&quot;http://www.china.com/zh_cn/default/1x1.png&quot; class=&quot;js_wx_qrcod&quot;&gt;&lt;p&gt;用微信扫描二维码&lt;br&gt;分享至好友和朋友圈&lt;/p&gt;&lt;div class=&quot;wx_close&quot;&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;2017-07-18 10:04:06 &amp;nbsp; &amp;nbsp;这匹山坡儿是我的 &amp;nbsp;&lt;span class=&quot;chan_newsInfo_comment&quot;&gt;&lt;a href=&quot;http://news.china.com/yule/11184455/20170718/30981163.html#comment&quot;&gt;参与评论(&lt;span id=&quot;top_comment_number&quot;&gt;&lt;/span&gt;)人&lt;/a&gt;&lt;/span&gt;&lt;/div&gt;&lt;div id=&quot;chan_newsDetail&quot;&gt;&lt;p class=&quot;pcenter&quot; style=&quot;text-align: center;&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://img3.utuku.china.com/580x0/news/20170718/255ee5eb-0ed6-453b-b1d2-24b617f8dc7d.jpg&quot;&gt;&lt;/p&gt;&lt;div id=&quot;CH_MTL_10002&quot;&gt;&lt;div&gt;&lt;iframe frameborder=&quot;0&quot; scrolling=&quot;no&quot; width=&quot;310&quot; height=&quot;260&quot; src=&quot;https://static-alias-1.360buyimg.com/jzt/tpl/sspPic.html?ad_ids=2826:5&amp;amp;adflag=0&amp;amp;clkmn=&amp;amp;expose=&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;&lt;/div&gt;&lt;p&gt;她生于中国澳门，中英葡混血，小小年纪就出道，是罕见的&ldquo;九头身美女&rdquo;，29岁却经历比很多人一生都坎坷的女人，在香港娱乐圈是一位传奇人物，她是谁？她就是&lt;span class=&quot;kw&quot;&gt;&lt;a href=&quot;http://news.china.com/baike_5qKB5rSb5pa9.html&quot; target=&quot;_blank&quot;&gt;梁洛施&lt;/a&gt;&lt;/span&gt;。12岁签约英皇，15岁正式出道，19岁怀孕，22岁成了三个孩子的妈，23岁与华人首富李嘉诚的儿子分手，拿到5亿加豪宅，试问：像这样传奇的女人，香港娱乐圈有谁可以与其争锋？&lt;/p&gt;&lt;p class=&quot;pcenter&quot; style=&quot;text-align: center;&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://img0.utuku.china.com/580x0/news/20170718/8ae46d9e-8f51-410a-87d4-4eda5f053237.jpg&quot;&gt;&lt;/p&gt;&lt;p&gt;想当初，梁洛施12岁就凭借中英葡混血的超高颜值被英皇相中，送她学习唱歌、跳舞、演技。15岁正式出道，一出道就被媒体冠上了新一代玉女掌门的称号。&lt;/p&gt;&lt;p class=&quot;pcenter&quot; style=&quot;text-align: center;&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://img1.utuku.china.com/580x0/news/20170718/cdf86337-8ed4-4bfe-a29b-6d7ccfa7797e.jpg&quot;&gt;&lt;/p&gt;&lt;p&gt;梁洛施出名后有同学跳出来爆尿，说她不爱读书，12岁就抽烟、离家出走，上小学时经常无故旷课，甚至还曾因不服从老师的管教被记过32次而被学校除名。&lt;/p&gt;&lt;/div&gt;','11','1','1','1','1','0'), ('51','《异形5》项目彻底停止 雷德利&middot;斯科特亲口证实','2017-07-24 19:33:21','《异形5》项目彻底停止 雷德利&middot;斯科特亲口证实《异形5》项目彻底停止 雷德利&middot;斯科特亲口证实《异形5》项目彻底停止 雷德利&middot;斯科特亲口证实《异形5》项目彻底停止 雷德利&middot;斯科特亲口证实《异形5》项目彻','&lt;div class=&quot;mt15&quot;&gt;&lt;h1 class=&quot;post_tit&quot;&gt;《异形5》项目彻底停止 雷德利&middot;斯科特亲口证实&lt;/h1&gt;&lt;div class=&quot;auteur-info&quot;&gt;&lt;div class=&quot;bar_1&quot;&gt;&lt;span&gt;发布时间：&lt;/span&gt;&lt;span class=&quot;time&quot;&gt;2017-07-22 13:24:00&lt;/span&gt;&amp;nbsp;&lt;span class=&quot;source_word&quot;&gt;来源：&lt;/span&gt;&lt;span class=&quot;source&quot;&gt;论坛&lt;/span&gt;&amp;nbsp;&lt;span class=&quot;author_word m10&quot;&gt;作者：&lt;/span&gt;&lt;span class=&quot;author&quot;&gt;1905电影网&lt;/span&gt;&lt;span class=&quot;float_R reply_num&quot;&gt;&lt;a class=&quot;ico coloRed3&quot; id=&quot;changyan_count_unit&quot;&gt;6&lt;/a&gt;&lt;/span&gt;&lt;span class=&quot;float_R visits_num&quot;&gt;&lt;a class=&quot;ico coloRed3&quot; id=&quot;changyan_parti_unit&quot;&gt;6&lt;/a&gt;&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div&gt;&lt;div id=&quot;BAIDU_SSP__wrapper_u2889335_0&quot;&gt;&lt;iframe id=&quot;iframeu2889335_0&quot; src=&quot;http://pos.baidu.com/dcfm?rdid=2889335&amp;amp;dc=3&amp;amp;di=u2889335&amp;amp;dri=0&amp;amp;dis=0&amp;amp;dai=1&amp;amp;ps=178x257&amp;amp;dcb=___adblockplus&amp;amp;dtm=HTML_POST&amp;amp;dvi=0.0&amp;amp;dci=-1&amp;amp;dpt=none&amp;amp;tsr=0&amp;amp;tpr=1500895365216&amp;amp;ti=%E3%80%8A%E5%BC%82%E5%BD%A25%E3%80%8B%E9%A1%B9%E7%9B%AE%E5%BD%BB%E5%BA%95%E5%81%9C%E6%AD%A2%20%E9%9B%B7%E5%BE%B7%E5%88%A9%C2%B7%E6%96%AF%E7%A7%91%E7%89%B9%E4%BA%B2%E5%8F%A3%E8%AF%81%E5%AE%9E_%E6%AF%94%E7%89%B9%E6%96%B0%E9%97%BB&amp;amp;ari=2&amp;amp;dbv=2&amp;amp;drs=1&amp;amp;pcs=1536x774&amp;amp;pss=1536x179&amp;amp;cfv=0&amp;amp;cpl=5&amp;amp;chi=1&amp;amp;cce=true&amp;amp;cec=GBK&amp;amp;tlm=1500895365&amp;amp;rw=774&amp;amp;ltu=http%3A%2F%2Fnet.chinabyte.com%2Fhot%2F110%2F14228610.shtml&amp;amp;ltr=https%3A%2F%2Fwww.baidu.com%2F%3Ftn%3D95653119_hao_pg&amp;amp;ecd=1&amp;amp;uc=1536x864&amp;amp;pis=-1x-1&amp;amp;sr=1536x864&amp;amp;tcn=1500895365&amp;amp;qn=d8e411a09f3fe0c4&amp;amp;tt=1500895365177.50.58.60&quot; width=&quot;700&quot; height=&quot;260&quot; align=&quot;center,center&quot; vspace=&quot;0&quot; hspace=&quot;0&quot; marginwidth=&quot;0&quot; marginheight=&quot;0&quot; scrolling=&quot;no&quot; frameborder=&quot;0&quot; allowtransparency=&quot;true&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;text js_box&quot; id=&quot;postContent&quot;&gt;&lt;div class=&quot;newconli2&quot;&gt;&lt;p align=&quot;center&quot;&gt;&lt;img alt=&quot;《异形5》项目彻底停止 雷德利&middot;斯科特亲口证实&quot; width=&quot;597&quot; height=&quot;324&quot; src=&quot;http://cimage1.tianjimedia.com/uploadImages/thirdImages/2017/142/0120XI70035R.jpg&quot;&gt;&lt;/p&gt;&lt;p&gt;　　科幻大作《异形5》很可能不会拍摄了&lt;/p&gt;&lt;p&gt;　　1905电影&lt;a class=&quot;keyword_link&quot; id=&quot;k530847276&quot; href=&quot;http://www.chinabyte.com/keyword/%E7%BD%91%E8%AE%AF/&quot; target=&quot;_blank&quot;&gt;网讯&lt;/a&gt;在今年的1月份，《异形5》的导演尼尔&middot;布洛姆坎普曾经相当悲观地表示称，将由他执导的科幻大作《异形5》，很可能不会拍摄了。近日，尼尔&middot;布洛姆坎普的悲观预计成为了现实。据报道，《异形5》彻底停摆，对外界公布这一消息的，恰恰是《异形》的缔造者雷德利&middot;斯科特。&lt;/p&gt;&lt;p&gt;　　在接受采访时，斯科特表示称：&ldquo;从来就没有过什么剧本，一直以来就只有一个十页纸的概念。我从头到尾就是一个制片人。不过现在，这个项目不会继续了，福斯公司彻底决定不再跟进这个项目了。&rdquo;从斯科特的说辞来看，似乎是尼尔&middot;布洛姆坎普对于影片一直没有彻底的计划，才让这部&ldquo;传说中&rdquo;的《异形》终结之作胎死腹中。实际上，关于影片的风言风语一直没有停歇。&lt;/p&gt;&lt;p&gt;　　早在2015年《异形5》项目初步启动时，布洛姆坎普曝光了电影的概念图，对故事整体有新的想法和构思，影片将承接《异形2》而忽略第三、四部的剧情，《异形2》中小女孩纽特会回归。西格妮&middot;韦弗、迈克尔&middot;比恩等原班演员也会出演。但没过多久，外媒又曝光出《异形5》将让位于雷德利&middot;斯科特执导的《普罗米修斯》续集《异形：契约》，当时的说法是，斯科特在拍完《契约》后能担任《异形5》的制作人，影片可能会在2017年开始制作。而到了2015年10月份，延迟开拍的《异形5》直接被叫停，项目的执行取决于《异形：契约》的进度。&lt;/p&gt;&lt;p&gt;　　在福斯宣布将推迟《异形5》的拍摄之后，西格妮&middot;韦弗和导演尼尔&middot;布洛姆坎普都开始各忙各的，这令影片的开拍显得更加遥遥无期：雷德利忙于他的《异形：契约》电影，而韦弗有两部《阿凡达》电影要拍，尼尔还要执导《消逝的世界》。所以，从目前的情况和进度来看，停摆《异形5》是一个相当正确的选择。值得一提的是，《异形》30周年纪念活动马上将于7月23日在圣迭戈漫展上举行。目前，《异形：契约》即将在5月19日上映，斯科特也将着手于第三部&ldquo;异形前传&rdquo;的拍摄。&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;','11','0','1','2','1','0'), ('52','猫咪在蚊香盘里睡的正香，却被主人强行抱起猫咪满眼委屈','2017-08-01 10:12:05','猫咪在蚊香盘里睡的正香，却被主人强行抱起来，猫咪满眼委屈猫咪在蚊香盘里睡的正香，却被主人强行抱起来，猫咪满眼委屈猫咪在蚊香盘里睡的正香，却被主人强行抱起来，猫咪满眼委屈猫咪在蚊香盘里睡的正香，却被主人','&lt;div class=&quot;article-title&quot;&gt;&lt;h2&gt;猫咪在蚊香盘里睡的正香，却被主人强行抱起来，猫咪满眼委屈&lt;/h2&gt;&lt;/div&gt;&lt;div class=&quot;article-source&quot;&gt;&lt;span class=&quot;source&quot;&gt;搜狐新闻&lt;/span&gt;&amp;nbsp;&lt;span class=&quot;date&quot;&gt;08-01&lt;/span&gt;&amp;nbsp;&lt;span class=&quot;time&quot;&gt;08:18&lt;/span&gt;&lt;/div&gt;&lt;div class=&quot;article-content&quot;&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;根据网友转述：我发现，小奶猫有一个致命的缺点，就是爱睡觉！不管你在哪个地方，基本都会找到它的身影..&lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;晚上睡觉喂猫咪的时候，发现找不到我家小奶猫了，结果到处翻腾了一圈，终于在床底下找到它..&lt;/p&gt;&lt;div class=&quot;img-container&quot;&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=3163673785,1191795105&amp;amp;fm=173&amp;amp;s=B89937D3427B1186722C249D030010D3&amp;amp;w=640&amp;amp;h=360&amp;amp;img.JPEG&quot;&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;找到它时，发现这货正躺在蚊香盆里睡着美美的大觉&lt;/p&gt;&lt;div class=&quot;img-container&quot;&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=4004255006,1694098161&amp;amp;fm=173&amp;amp;s=B2DA15C362026757BA85809D030010C3&amp;amp;w=640&amp;amp;h=360&amp;amp;img.JPEG&quot;&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;舒服的它还在盆子里翻了个滚&lt;/p&gt;&lt;div class=&quot;img-container&quot;&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2571082130,823654059&amp;amp;fm=173&amp;amp;s=B29A17CB722B1517C885809D030090C3&amp;amp;w=640&amp;amp;h=360&amp;amp;img.JPEG&quot;&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;将它抱起来时，小猫还一脸的不愿意&lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;你知不知道你背上都被烧焦了！&lt;/p&gt;&lt;div class=&quot;img-container&quot;&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1088626739,2592989438&amp;amp;fm=173&amp;amp;s=6CC4A05158C25453880CE5E803007093&amp;amp;w=640&amp;amp;h=360&amp;amp;img.JPEG&quot;&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;猫：我睡的正香，凭啥把我叫起来！返回搜狐，查看更多&lt;/p&gt;&lt;/div&gt;','17','0','1','1','1','0'), ('53','猫咪没有吸管不愿意喝水，主人无可奈何只好乖乖照做','2017-08-01 10:13:22','猫咪没有吸管不愿意喝水，主人无可奈何只好乖乖照做猫咪没有吸管不愿意喝水，主人无可奈何只好乖乖照做猫咪没有吸管不愿意喝水，主人无可奈何只好乖乖照做猫咪没有吸管不愿意喝水，主人无可奈何只好乖乖照做猫咪没有','&lt;div class=&quot;article-title&quot;&gt;&lt;h2&gt;猫咪没有吸管不愿意喝水，主人无可奈何只好乖乖照做&lt;/h2&gt;&lt;/div&gt;&lt;div class=&quot;article-source&quot;&gt;&lt;span class=&quot;source&quot;&gt;搜狐新闻&lt;/span&gt;&amp;nbsp;&lt;span class=&quot;date&quot;&gt;08-01&lt;/span&gt;&amp;nbsp;&lt;span class=&quot;time&quot;&gt;08:18&lt;/span&gt;&lt;/div&gt;&lt;div class=&quot;article-content&quot;&gt;&lt;div class=&quot;img-container&quot;&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2727743183,2608918221&amp;amp;fm=173&amp;amp;s=80107C979CE45D030049DC4103009071&amp;amp;w=568&amp;amp;h=170&amp;amp;img.JPEG&quot;&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;根据网友转述：家里面养了一只小可爱，所以主子从来就不用发愁在家呆的无聊，最近家里面的小可爱更加有趣了，因为猫咪有一天看到他正在拿吸管喝牛奶，从此以后，没有吸管都不愿意去喝东西了。&lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;比如这次，主子给它喝奶，它用了吸管之后&hellip;&hellip;&lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;嘬了嘬嘴：哎呀，美味啊，配上吸管更省力了耶。&lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;然后小眼神都放光啊，是有多好用呢？&lt;/p&gt;&lt;div class=&quot;img-container&quot;&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=4084155693,2106709165&amp;amp;fm=173&amp;amp;s=B61610CBE66A7B179485CCB103008011&amp;amp;w=640&amp;amp;h=622&amp;amp;img.JPEG&quot;&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;比如喝果汁，也要用吸管，闭着眼睛吸的不亦乐乎啊，好像非常享受&lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;看到这里，忍不住让自家的猫试一试，可是，它好像很鄙视我&hellip;&hellip;&lt;/p&gt;&lt;div class=&quot;img-container&quot;&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1253455821,2066503597&amp;amp;fm=173&amp;amp;s=3A828C4DC233059692A9F4AA03006011&amp;amp;w=640&amp;amp;h=619&amp;amp;img.JPEG&quot;&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;或者这样，用小爪子扶着吸管，有模有样的喝着。&lt;/p&gt;&lt;div class=&quot;img-container&quot;&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3595916481,2113359267&amp;amp;fm=173&amp;amp;s=2AB25D860E32039E580139B00300C012&amp;amp;w=640&amp;amp;h=617&amp;amp;img.JPEG&quot;&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;这是有多好使啊，大家随意感受一下，上图一张。&lt;/p&gt;&lt;/div&gt;','17','0','1','1','1','0'), ('54','古代针对宫女的残酷刑罚，残忍程度简直让人不敢想象！','2017-08-01 16:38:15','古代针对宫女的残酷刑罚，残忍程度简直让人不敢想象！古代针对宫女的残酷刑罚，残忍程度简直让人不敢想象！古代针对宫女的残酷刑罚，残忍程度简直让人不敢想象！古代针对宫女的残酷刑罚，残忍程度简直让人不敢想象！','&lt;div class=&quot;article-title&quot;&gt;&lt;h2&gt;古代针对宫女的残酷刑罚，残忍程度简直让人不敢想象！&lt;/h2&gt;&lt;/div&gt;&lt;div class=&quot;article-desc clearfix&quot;&gt;&lt;div class=&quot;author-icon&quot;&gt;&lt;img src=&quot;https://timg01.bdimg.com/timg?pacompress&amp;amp;imgtype=0&amp;amp;sec=1439619614&amp;amp;autorotate=1&amp;amp;di=d561dfedd64fcbe82e978e344a54d8eb&amp;amp;quality=90&amp;amp;size=b200_200&amp;amp;src=http%3A%2F%2Fbos.nj.bpc.baidu.com%2Fv1%2Fmediaspot%2Ffde612a36930e3546ca6c7c4081ffd9e.jpeg&quot;&gt;&lt;/div&gt;&lt;div class=&quot;author-txt&quot;&gt;&lt;p class=&quot;author-name&quot;&gt;八字情感&lt;/p&gt;&lt;div class=&quot;article-source&quot;&gt;&lt;span class=&quot;source&quot;&gt;百家号&lt;/span&gt;&amp;nbsp;&lt;span class=&quot;date&quot;&gt;08-01&lt;/span&gt;&amp;nbsp;&lt;span class=&quot;time&quot;&gt;13:17&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;article-content&quot;&gt;&lt;div class=&quot;img-container&quot;&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=3982498427,4061177516&amp;amp;fm=175&amp;amp;s=42BB3BC54C9230CA18A8892203001043&amp;amp;w=640&amp;amp;h=431&amp;amp;img.JPEG&quot;&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;墩锁。听这名字大家应该都会猜到，这肯定会和锁有一定的关系。这种刑罚极为惨烈，首先是将犯了事的宫女锁在一直不大不小的木箱子里，把她的四肢顺着箱子的四个角拉出来，再将箱子锁上，她的四肢就会刚好卡在那一点点狭小的缝隙中。&lt;/p&gt;&lt;div class=&quot;img-container&quot;&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2657604497,833513019&amp;amp;fm=175&amp;amp;s=92305B8510471F450CBD5D1C0300E051&amp;amp;w=640&amp;amp;h=412&amp;amp;img.JPEG&quot;&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;这样一来，整个人几乎就是一个四脚朝天的样子，全身上下完全使不上一点力气。随着时间一点点过去，手脚会非常麻，血液不流通，严重一点的很有可能就会在这个姿势中死去。&lt;/p&gt;&lt;div class=&quot;img-container&quot;&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2735069826,910875387&amp;amp;fm=175&amp;amp;s=B68207E34E120DDC18202C0A03008055&amp;amp;w=639&amp;amp;h=417&amp;amp;img.JPEG&quot;&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;板著。这种刑罚比较简单，没有任何刑具，也不需要有人执行，只需要强迫宫女保持一个姿势不动就好。长久保持一个姿势，不许吃喝，直到将受刑者累死为止。&lt;/p&gt;&lt;div class=&quot;img-container&quot;&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=553636629,1834824733&amp;amp;fm=175&amp;amp;s=099A29D54A3647806605784F0300B072&amp;amp;w=639&amp;amp;h=385&amp;amp;img.JPEG&quot;&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;提铃。顾名思义就是提着铃铛呗，，这种刑罚是谁让宫女双手各举着一个铃铛在路上来回走，这种铃铛每个重二十斤，嘴里还必须一直唱着歌，同时不许让铃铛落在地上，也不可以让铃铛发出声音。&lt;/p&gt;&lt;div class=&quot;img-container&quot;&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=286914312,3128143232&amp;amp;fm=175&amp;amp;s=4CF23AC5641302771280B4AD0300C001&amp;amp;w=640&amp;amp;h=397&amp;amp;img.JPEG&quot;&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;对于古代宫女来说，尤其是清朝时期的宫女，她们的脸是绝绝对对不能打的，除非是皇帝亲自下令。&lt;/p&gt;&lt;/div&gt;','17','0','1','1','1','0'), ('55','时尚街拍：街拍女孩儿的牛仔裤，最后那个腿是真的好看！','2017-08-02 11:37:20','时尚街拍：街拍女孩儿的牛仔裤，最后那个腿是真的好看！时尚街拍：街拍女孩儿的牛仔裤，最后那个腿是真的好看！时尚街拍：街拍女孩儿的牛仔裤，最后那个腿是真的好看！时尚街拍：街拍女孩儿的牛仔裤，最后那个腿是真','&lt;div class=&quot;article-title&quot;&gt;&lt;h2&gt;时尚街拍：街拍女孩儿的牛仔裤，最后那个腿是真的好看！&lt;/h2&gt;&lt;/div&gt;&lt;div class=&quot;article-desc clearfix&quot;&gt;&lt;div class=&quot;author-icon&quot;&gt;&lt;img src=&quot;https://timg01.bdimg.com/timg?pacompress&amp;amp;imgtype=0&amp;amp;sec=1439619614&amp;amp;autorotate=1&amp;amp;di=458ae607f798cec7b62c88924e7c3e88&amp;amp;quality=90&amp;amp;size=b200_200&amp;amp;src=http%3A%2F%2Fbos.nj.bpc.baidu.com%2Fv1%2Fmediaspot%2Fe701cd8a09230da831464d104d9e07e2.jpeg&quot;&gt;&lt;/div&gt;&lt;div class=&quot;author-txt&quot;&gt;&lt;p class=&quot;author-name&quot;&gt;球哥影视&lt;/p&gt;&lt;div class=&quot;article-source&quot;&gt;&lt;span class=&quot;source&quot;&gt;百家号&lt;/span&gt;&amp;nbsp;&lt;span class=&quot;date&quot;&gt;08-02&lt;/span&gt;&amp;nbsp;&lt;span class=&quot;time&quot;&gt;01:15&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;article-content&quot;&gt;&lt;div class=&quot;img-container&quot;&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2387809306,283216571&amp;amp;fm=175&amp;amp;s=9B9063810E1306D81688E49F03008083&amp;amp;w=640&amp;amp;h=960&amp;amp;img.JPEG&quot;&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;牛仔短裤和破洞牛仔裤，最经典的时尚单品&lt;/p&gt;&lt;div class=&quot;img-container&quot;&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=750792544,3597660227&amp;amp;fm=175&amp;amp;s=F781B0094A0102D8E5BDFD8F0300F0C0&amp;amp;w=640&amp;amp;h=960&amp;amp;img.JPEG&quot;&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;高腰直筒牛仔裤，浅蓝色是个最常见也最百搭的颜色&lt;/p&gt;&lt;div class=&quot;img-container&quot;&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=910312946,2794938808&amp;amp;fm=175&amp;amp;s=D9986791226132B89E8D988C030080E2&amp;amp;w=640&amp;amp;h=960&amp;amp;img.JPEG&quot;&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;深蓝色修身牛仔裤，深色在视觉上更会显瘦&lt;/p&gt;&lt;div class=&quot;img-container&quot;&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=963665756,3042370448&amp;amp;fm=175&amp;amp;s=B3A0F8012A1032D86505049E0300C0E3&amp;amp;w=640&amp;amp;h=960&amp;amp;img.JPEG&quot;&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;破洞牛仔裤，两个大开洞比较个性&lt;/p&gt;&lt;div class=&quot;img-container&quot;&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3021396645,2056576985&amp;amp;fm=175&amp;amp;s=5189BD55441533D85399848F030030C3&amp;amp;w=640&amp;amp;h=960&amp;amp;img.JPEG&quot;&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;修身浅灰色九分牛仔裤，九分设计很显身材&lt;/p&gt;&lt;div class=&quot;img-container&quot;&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=85746034,3104748607&amp;amp;fm=175&amp;amp;s=F3905989660060FC15AD4C9F0300C0A3&amp;amp;w=640&amp;amp;h=960&amp;amp;img.JPEG&quot;&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;黑色破洞牛仔裤，黑色破洞裤确实没有浅色好看些&lt;/p&gt;&lt;div class=&quot;img-container&quot;&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=248911744,3198209155&amp;amp;fm=175&amp;amp;s=AC2AEA1546364F9EC814B4C603002013&amp;amp;w=640&amp;amp;h=960&amp;amp;img.JPEG&quot;&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;白色休闲裤，这个只是为了好看&lt;/p&gt;&lt;/div&gt;','11','0','1','1','1','0'), ('56','街拍：出行逛街的姐妹闺蜜，欢笑中钱包厚度锐减','2017-08-02 11:37:57','街拍：出行逛街的姐妹闺蜜，欢笑中钱包厚度锐减街拍：出行逛街的姐妹闺蜜，欢笑中钱包厚度锐减街拍：出行逛街的姐妹闺蜜，欢笑中钱包厚度锐减街拍：出行逛街的姐妹闺蜜，欢笑中钱包厚度锐减街拍：出行逛街的姐妹闺蜜','&lt;div class=&quot;article-title&quot;&gt;&lt;h2&gt;街拍：出行逛街的姐妹闺蜜，欢笑中钱包厚度锐减&lt;/h2&gt;&lt;/div&gt;&lt;div class=&quot;article-desc clearfix&quot;&gt;&lt;div class=&quot;author-icon&quot;&gt;&lt;img src=&quot;https://timgmb.bdimg.com/timg?searchbox_feed&amp;amp;sec=0&amp;amp;di=221fc32250d3199a1129b15aa3e2979d&amp;amp;src=http%3A%2F%2Ftimg01.bdimg.com%2Ftimg%3Fpa%26imgtype%3D0%26sec%3D1439619614%26di%3Dfd8d76a884511b165035d9d2a8b41b40%26quality%3D90%26size%3Db870_10000%26src%3Dhttp%3A%2F%2Fbos.nj.bpc.baidu.com%2Fv1%2Fmediaspot%2Ff43e57d6378c232c8e367376032798db.jpeg&quot;&gt;&lt;/div&gt;&lt;div class=&quot;author-txt&quot;&gt;&lt;p class=&quot;author-name&quot;&gt;荒古棋盘&lt;/p&gt;&lt;div class=&quot;article-source&quot;&gt;&lt;span class=&quot;source&quot;&gt;百家号&lt;/span&gt;&amp;nbsp;&lt;span class=&quot;date&quot;&gt;08-02&lt;/span&gt;&amp;nbsp;&lt;span class=&quot;time&quot;&gt;06:26&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;article-content&quot;&gt;&lt;div class=&quot;img-container&quot;&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2822427102,678055348&amp;amp;fm=175&amp;amp;s=7AB429C0C41AADD4C0E430890300E0D1&amp;amp;w=640&amp;amp;h=960&amp;amp;img.JPEG&quot;&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;美女的牛仔背带热裤，背带放下来更加时尚，白色紧身衣更加凸显身材，轻轻拨动着秀发，与闺蜜开心的交谈着&lt;/p&gt;&lt;div class=&quot;img-container&quot;&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1456161492,3535297629&amp;amp;fm=175&amp;amp;s=B59753914E436CDC002DD8CA030070B0&amp;amp;w=640&amp;amp;h=960&amp;amp;img.JPEG&quot;&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;浅色镂空无袖连衣裙与黑色紧身一步裙，闺蜜二人身材样貌都没得说，美女与美女在一起总有聊不完的话题&lt;/p&gt;&lt;div class=&quot;img-container&quot;&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=4142334875,4012881669&amp;amp;fm=175&amp;amp;s=8D606C801ECA4CDC43B520930300D0C3&amp;amp;w=640&amp;amp;h=960&amp;amp;img.JPEG&quot;&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;遮阳帽美女，黑与白的搭配，索然比较宽松的搭配，但是给人感觉非常有气质，紧身牛仔的姑娘身材非常好，一双异形跟鞋子，今年非常流行&lt;/p&gt;&lt;div class=&quot;img-container&quot;&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3306377976,312169148&amp;amp;fm=175&amp;amp;s=DE3229C546622CB4588558880300E092&amp;amp;w=640&amp;amp;h=960&amp;amp;img.JPEG&quot;&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;胸衣不一定紧身才能够秀出自己的身材曲线，要看设计款式，看看美女这款白色胸衣，将自己身材完美展示出来，与热裤相搭配，露出肚脐和腿部线条&lt;/p&gt;&lt;div class=&quot;img-container&quot;&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=4141202430,1668275387&amp;amp;fm=175&amp;amp;s=C7B43CC45413E9DC0E1CC59B0300D092&amp;amp;w=640&amp;amp;h=960&amp;amp;img.JPEG&quot;&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;牛仔裤与牛仔裙给你不一样的时尚感觉&lt;/p&gt;&lt;div class=&quot;img-container&quot;&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=732347558,2431091683&amp;amp;fm=175&amp;amp;s=D2A4BE440C1B06D4012C9D8B030090C0&amp;amp;w=640&amp;amp;h=960&amp;amp;img.JPEG&quot;&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;闺蜜在一起，她们会互相搭配和互相参谋，在一家店里面都会买到自己心仪的服饰&lt;/p&gt;&lt;div class=&quot;img-container&quot;&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=3644735593,1559396536&amp;amp;fm=175&amp;amp;s=93A667A14C033ADC5029840D0300F0C0&amp;amp;w=640&amp;amp;h=960&amp;amp;img.JPEG&quot;&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;都是热裤装扮，一个是牛仔，一个是针织，带着两种风格&lt;/p&gt;&lt;div class=&quot;img-container&quot;&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1453222519,3358225496&amp;amp;fm=175&amp;amp;s=1E9079855C5A06DA57F9E4070300F0C3&amp;amp;w=640&amp;amp;h=960&amp;amp;img.JPEG&quot;&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;墨镜带给你的神秘感觉真的非常大，一个是长裤飘飘，一个是热裤清凉，但是两位美女带来那种酷酷的感觉，真的是非常强烈&lt;/p&gt;&lt;/div&gt;','11','0','1','1','1','0'), ('57','发的说法','2017-08-03 11:22:41','','&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;header&gt;&lt;span&gt;&lt;a href=&quot;http://m.people.cn/&quot;&gt;&lt;img src=&quot;http://m.people.cn/img/WIRELESS/2014/07/85/images/logo2.gif&quot; alt=&quot;手机人民网&quot; height=&quot;40&quot;&gt;&lt;/a&gt;&lt;/span&gt;&lt;span&gt;&lt;a href=&quot;http://m.people.cn/30/index.html&quot; class=&quot;nav-title&quot;&gt;社会&lt;/a&gt;&amp;gt;&lt;a href=&quot;http://m.people.cn/30/676/index.html&quot;&gt;今日要闻&lt;/a&gt;&lt;/span&gt;&lt;/header&gt;&lt;ul class=&quot;list_ad list_ad1  o_h&quot;&gt;&lt;li style=&quot;text-align: left;&quot;&gt;&lt;span style=&quot;text-align: center;&quot;&gt;推广&lt;/span&gt;&lt;div id=&quot;BAIDU_SSP__wrapper_958723_0&quot;&gt;&lt;/div&gt;&lt;/li&gt;&lt;/ul&gt;&lt;div class=&quot;wb_content&quot;&gt;&lt;h1&gt;一段偷拍视频意外曝光，竟揭开了飞机上这么多不得人知的秘密！&lt;/h1&gt;&lt;h4 class=&quot;o_h&quot;&gt;&lt;p&gt;2017-08-03 09:33 京华时报&amp;nbsp;&amp;nbsp;作者：京华时报&lt;/p&gt;&lt;span class=&quot;red&quot;&gt;&lt;a href=&quot;http://m.people.cn/getmore/-1_1_1.html&quot;&gt;&lt;span id=&quot;pinglun_n&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;/h4&gt;&lt;div class=&quot;wb_txt&quot; id=&quot;p_content&quot;&gt;&lt;div class=&quot;wb_img center clear mt10&quot; style=&quot;text-align: center;&quot;&gt;&lt;/div&gt;&lt;div class=&quot;wb_img center clear mt10&quot; style=&quot;text-align: center;&quot;&gt;&lt;/div&gt;&lt;p&gt;日前，&lt;/p&gt;&lt;p&gt;一段不到一秒的偷拍视频，&lt;/p&gt;&lt;p&gt;在外网火热传播，&lt;/p&gt;&lt;p&gt;更是有人直指飞机的做法&ldquo;令人作呕&rdquo;！&lt;/p&gt;&lt;p&gt;到底发生了什么？&lt;/p&gt;&lt;p class=&quot;we_img&quot; style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://mobile.pic.people.com.cn/thumbs/320/323/data/cms/mediafile/pic/20170803/39/11123930667691283391.jpg&quot;&gt;&lt;/p&gt;&lt;p&gt;视频的拍摄者Yevgeny，从俄罗斯出发，乘坐某航空商务舱，准备前往迪拜进行公事访问。他被机舱内的设备深深震撼到了，不由自主地掏出了手机，&lt;strong&gt;对机场内饰进行了360&deg;无死角的拍摄&lt;/strong&gt;。&lt;/p&gt;&lt;p&gt;可能大多数人第一眼看完，&lt;/p&gt;&lt;p&gt;并没有什么特别的感受，&lt;/p&gt;&lt;p&gt;Yevgeny　其实一开始也没发现亮点，&lt;/p&gt;&lt;p&gt;发布到了Instagram上就睡觉了。&lt;/p&gt;&lt;p&gt;结果第二天一觉醒来，&lt;/p&gt;&lt;p&gt;他发现他Instagram的回复已经炸了。&lt;/p&gt;&lt;p&gt;&lt;strong&gt;底下竟然都是在骂航空公司的！&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;他再仔细一看视频，&lt;/p&gt;&lt;p&gt;原来，&lt;/p&gt;&lt;p&gt;都是因为这个空姐！&lt;/p&gt;&lt;p class=&quot;we_img&quot; style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://mobile.pic.people.com.cn/thumbs/320/236/data/cms/mediafile/pic/20170803/42/15208981981049121990.jpg&quot;&gt;&lt;/p&gt;&lt;p&gt;他竟然无意中拍下了机舱背后隐藏的秘密&mdash;&mdash;&lt;/p&gt;&lt;p&gt;这名空姐，&lt;/p&gt;&lt;p&gt;正将乘客喝剩下的红酒，&lt;/p&gt;&lt;p&gt;&lt;strong&gt;倒回到酒瓶里，&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;准备给别的乘客饮用！！&lt;/strong&gt;&lt;/p&gt;&lt;p class=&quot;we_img&quot; style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://mobile.pic.people.com.cn/thumbs/320/186/data/cms/mediafile/pic/20170803/58/11795801358900789070.gif&quot;&gt;&lt;/p&gt;&lt;p&gt;这一下，他不能淡定了，&lt;/p&gt;&lt;p&gt;&lt;strong&gt;想想他刚才喝的红酒里，&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;可能掺着其他乘客的口水！&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;更何况，&lt;strong&gt;很多疾病都是通过唾液传播的&lt;/strong&gt;，&lt;/p&gt;&lt;p&gt;如果一个有传染病的人，&lt;/p&gt;&lt;p&gt;喝剩下的红酒，&lt;/p&gt;&lt;p&gt;被这样传递给不知情的乘客&lt;/p&gt;&lt;p&gt;那后果真是不敢想&hellip;&hellip;&lt;/p&gt;&lt;p class=&quot;we_img&quot; style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://mobile.pic.people.com.cn/thumbs/320/297/data/cms/mediafile/pic/20170803/47/2499731236616340519.jpg&quot;&gt;&lt;/p&gt;&lt;p&gt;于是，这段视频就这样疯狂传播&hellip;&hellip;&lt;/p&gt;&lt;p&gt;就在这个时候！&lt;/p&gt;&lt;div class=&quot;wb_page center&quot; style=&quot;text-align: center;&quot;&gt;&lt;a&gt;余下全文&lt;/a&gt;&lt;/div&gt;&lt;/div&gt;&lt;div style=&quot;text-align: right;&quot;&gt;(责任编辑：王珩)&lt;/div&gt;&lt;/div&gt;&lt;div id=&quot;_ykp8rhtg74x2chp115v4e7b9&quot;&gt;&lt;/div&gt;&lt;div id=&quot;_113ft07gnre5ilxrz2bnkoi529&quot;&gt;&lt;/div&gt;&lt;div class=&quot;wb_share p10&quot;&gt;&lt;div class=&quot;share&quot;&gt;&lt;span&gt;分享到：&lt;/span&gt;&lt;div class=&quot;bdsharebuttonbox&quot;&gt;&lt;a data-cmd=&quot;more&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div id=&quot;SOHUCS&quot; sid=&quot;9447155&quot;&gt;&lt;/div&gt;&lt;p class=&quot;all_pinglun&quot; style=&quot;text-align: center;&quot;&gt;&lt;a href=&quot;http://m2.people.cn/c?id=9447155&quot; class=&quot;wb_more&quot;&gt;查看全部评论&lt;/a&gt;&lt;/p&gt;&lt;div id=&quot;_8zuu5p74bo4vfd7o8gdox647vi&quot;&gt;&lt;/div&gt;&lt;div id=&quot;_r48n3gspdktmcag1192g9zfr&quot;&gt;&lt;/div&gt;&lt;div class=&quot;channl_con mt20 clear&quot;&gt;&lt;h3&gt;&lt;span&gt;&lt;span&gt;精彩推荐&lt;img src=&quot;/image/b8bd21012aef4df3a9ca069a3c2f1fe3.jpg&quot; alt=&quot;undefined&quot;&gt;&lt;img src=&quot;/image/2ccf64f473d64bb992fe4c15614ba489.jpg&quot; alt=&quot;undefined&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/h3&gt;&lt;/div&gt;','11','0','1','1','1','0');
INSERT INTO `csair_articleclassify` VALUES ('11','&lt;span&gt;&lt;#if&gt;$%wo 我','1','1','2017-07-11 16:25:58','26'), ('17','霸天虎','1','1','2017-07-11 16:27:24','21'), ('19','testTop2PageEdit','4','1','2017-07-10 11:35:12','26'), ('49','宇宙大帝','1','1','2017-07-11 16:47:20','35'), ('50','宇宙大帝','1','1','2017-07-11 16:47:20','35'), ('59','testFenlei1937','2','1','2017-07-11 19:38:23','26'), ('61','asdf','1','1','2017-07-12 11:38:48','35'), ('62','测试完成','1','1','2017-07-12 11:52:38','37'), ('64','搭噶','1','1','2017-07-12 14:54:51','35'), ('66','&lt;span&gt;333&lt;/span&gt;','9','1','2017-07-12 19:50:38','26'), ('67','统一项目测试1','1','1','2017-07-25 10:52:31','2');
INSERT INTO `csair_articleclassify_parent` VALUES ('1','顶级分类','0'), ('2','南航头条','2'), ('14','和人特好文化馆','3'), ('19','测试1','3'), ('20','成功11','2'), ('21','统一调试1','2'), ('22','统一测试111','2'), ('23','统一测试1111','2'), ('24','统一测试11','2'), ('25','号首府大好时光','3'), ('26','testTopPage','21'), ('35','6666666666666','1'), ('37','你好','1'), ('38','&lt;csdhti&gt;$%#$^','1'), ('39','{}ertertqt','1');
INSERT INTO `csair_banner` VALUES ('1','domain.com/test1.jpg','domain.com/url1','1'), ('2','domain.com/test2.jpg','domain.com/url2','2'), ('3','domain.com/test3.jpg','domain.com/url3','3');
INSERT INTO `csair_brand` VALUES ('9','免税品','bd861e694ece4fa2b1f30d960b4afc27.jpg','small_bd861e694ece4fa2b1f30d960b4afc27.jpg','www.miansui.com','免税','1','1',NULL,NULL), ('10','跨境购','bd861e694ece4fa2b1f30d960b4afc27.jpg','small_bd861e694ece4fa2b1f30d960b4afc27.jpg','www.kuajinggou.com','跨境购','211111111','1',NULL,NULL), ('11','航空精品','072115bf1c9049678e6d6f76d5d40f6c.jpg','small_072115bf1c9049678e6d6f76d5d40f6c.jpg','www.hkjp.com','航空精品','3','1',NULL,NULL), ('12','航易购','bd861e694ece4fa2b1f30d960b4afc27.jpg','small_c98de6a79f9740bda809b64b555e9674.jpg','www.hyg.com','航易购','4','1','2017-06-20 17:35:10','3'), ('13','里程专属','bd861e694ece4fa2b1f30d960b4afc27.jpg','small_c98de6a79f9740bda809b64b555e9674.jpg','www.lczs.com','里程专属','5','1','2017-06-20 17:35:10','4'), ('14','小米','bd861e694ece4fa2b1f30d960b4afc27.jpg','small_bd861e694ece4fa2b1f30d960b4afc27.jpg','http://www.baidu.com','&lt;img src=&quot;/html/img/0d24a521ac384c75a45dc3c42172db64.jpg&quot; alt=&quot;undefined&quot;&gt;1222&lt;u&gt;222222222211&lt;/u&gt;1111111111111','10','1',NULL,NULL), ('15','华为','c98de6a79f9740bda809b64b555e9674.jpg','small_c98de6a79f9740bda809b64b555e9674.jpg','http://www.baidu.com','12222&lt;img src=&quot;/html/img/bfb92e4600a44357a42e07e189d37efb.jpg&quot; alt=&quot;undefined&quot;&gt;','20','1','2017-07-26 15:24:24','3'), ('62','21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL), ('63','21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL), ('64','21','8a03961bef7f445cbe08d90cf34a0ed6.jpg','small_8a03961bef7f445cbe08d90cf34a0ed6.jpg','1221','21211212212121','2121','1',NULL,NULL), ('65','21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL), ('66','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `csair_category_brand` VALUES ('1','1','1');
INSERT INTO `csair_category_spec` VALUES ('1','1');
INSERT INTO `csair_certificate` VALUES ('1','单身证书','单身','3','2017-07-24 18:25:12',NULL), ('2','四级证书','四级1','3','2017-07-24 20:32:44','2017-07-24 20:39:46'), ('15','七级证书','七级1','3','2017-07-31 14:15:28','2017-07-31 14:15:35'), ('16','卫生证书','12','3','2017-07-31 14:15:48',NULL);
INSERT INTO `csair_config` VALUES ('162','smsConfig','{\"password\":\"EM6565388\",\"userName\":\"EMALL\",\"key\":\"8756JKLjhdfjklL7890543jklJLlkgt7979KLHjklgfd8\"}','2017-07-25 14:31:02','2017-07-26 11:52:18'), ('163','emailConfig','{\"password\":\"EM6565388\",\"userName\":\"EMALL\",\"key\":\"8756JKLjhdfjklL7890543jklJLlkgt7979KLHjklgfd8\"}','2017-07-25 14:34:04','2017-07-26 14:17:08'), ('164','smsConfig3','{\"password\":\"EM656538812321312312\",\"userName\":\"EMALL21313123\",\"key\":\"8756JKLjhdfjklL7890543jklJLlkgt7979KLHjklgfd8\"}','2017-07-25 14:31:02','2017-07-25 18:59:56'), ('165','emailConfig2','{\"password\":\"EM6565388\",\"userName\":\"EMALL\",\"key\":\"8756JKLjhdfjklL7890543jklJLlkgt7979KLHjklgfd8\"}','2017-07-25 14:34:04','2017-07-26 14:17:08');
INSERT INTO `csair_goods` VALUES ('1','iPhone 100','0001','1','1','1','1','100.00','0','手机','某果手机','10000.00','9000.00','9999.00','no','no','1','2017-06-20 16:54:44','2017-06-20 16:54:54','1','1','0','1','1','1','apple','1','1','1','1','/images/goods/1.jpg','1','1','/images/goods/1.jpg','1','1','1','1','1','1','1.00','1','1','33.3%'), ('2','移动优盘','0001','2','1','1','1','100.00','0','手机','某果手机','10000.00','9000.00','9999.00','no','no','1','2017-06-20 16:54:44','2017-06-20 16:54:54','1','1','0','1','1','1','apple','1','1','1','1','/images/goods/2.jpg','1','1','/images/goods/2.jpg','1','1','1','1','1','1','1.00','1','1',NULL), ('3','水杯','0001','3','1','1','1','100.00','0','手机','某果手机','10000.00','9000.00','9999.00','no','no','1','2017-06-20 16:54:44','2017-06-20 16:54:54','1','1','0','1','1','1','apple','1','1','1','1','/images/goods/3.jpg','1','1','/images/goods/3.jpg','1','1','1','1','1','1','1.00','1','1',NULL), ('4','雨伞','0001','4','6','1','1','100.00','0','手机','某果手机','10000.00','9000.00','9999.00','no','no','1','2017-06-20 16:54:44','2017-06-20 16:54:54','1','1','0','1','1','1','apple','1','1','1','1','/images/goods/4.jpg','1','1','/images/goods/4.jpg','1','1','1','1','1','1','1.00','1','1',NULL), ('5','电脑','0001','5','3','1','1','100.00','0','手机','某果手机','10000.00','9000.00','9999.00','no','no','1','2017-06-20 16:54:44','2017-06-20 16:54:54','1','1','0','1','1','1','apple','1','1','1','1','/images/goods/5.jpg','1','1','/images/goods/5.jpg','1','1','1','1','1','1','1.00','1','1',NULL), ('6','创意礼品','0001','5','1','1','1','100.00','0','手机','某果手机','10000.00','9000.00','9999.00','no','no','1','2017-06-20 16:54:44','2017-06-20 16:54:54','1','1','0','1','1','1','apple','1','1','1','1','/images/goods/6.jpg','1','1','/images/goods/6.jpg','1','1','1','1','1','1','1.00','1','1',NULL), ('7','葡萄酒','0001','1','1','1','1','100.00','0','手机','某果手机','10000.00','9000.00','9999.00','no','no','1','2017-06-20 16:54:44','2017-06-20 16:54:54','1','1','0','1','1','1','apple','1','1','1','1','/images/goods/7.jpg','1','1','/images/goods/7.jpg','1','1','1','1','1','1','1.00','1','1',NULL), ('8','手机','0001','5','3','1','1','100.00','0','手机','某果手机','10000.00','9000.00','9999.00','no','no','1','2017-06-20 16:54:44','2017-06-20 16:54:54','1','1','0','1','1','1','apple','1','1','1','1','/images/goods/5.jpg','1','1','/images/goods/5.jpg','1','1','1','1','1','1','1.00','1','1',NULL);
INSERT INTO `csair_goods_cart` VALUES ('1','1','wffdf','2017-08-04 11:26:14');
INSERT INTO `csair_goods_category` VALUES ('1','免税店','0','/img/notax.jpg','/img/notax#_thumb.jpg','免税','免税','1','2017-06-20 17:17:01','1','1','1'), ('2','商务礼品','1','/img/elec.jpg','/img/elec_thumb.jpg','3c','商务礼品','1','2017-06-20 17:17:01','1','1',NULL), ('3','电子产品','2','/img/elec.jpg','/img/elec_thumb.jpg','3c','电器产品','1','2017-06-20 17:17:01','1','1',NULL), ('4','精品','2','/img/elec.jpg','/img/elec_thumb.jpg','3c','商务礼品','1','2017-06-20 17:17:01','1','1',NULL), ('5','服装','0','/img/notax.jpg','/img/notax#_thumb.jpg','免税','免税','1','2017-06-20 17:17:01','1','1','1'), ('6','生活用品','1','/img/elec.jpg','/img/elec_thumb.jpg','3c','商务礼品','1','2017-06-20 17:17:01','1','1',NULL), ('7','家具电器','2','/img/elec.jpg','/img/elec_thumb.jpg','3c','电器产品','1','2017-06-20 17:17:01','1','1',NULL), ('8','航空系列','2','/img/elec.jpg','/img/elec_thumb.jpg','3c','商务礼品','1','2017-06-20 17:17:01','1','1',NULL), ('9','电子商品',NULL,'94d025cb16cb43238a77d3b125e794f3.jpg','a.jpg','笔记本、电脑','一级类目，电子商品','3',NULL,NULL,'1','1'), ('10','毛绒玩具','0','/img/notax.jpg','/img/notax#_thumb.jpg','免税','免税','1','2017-06-20 17:17:01','1','1','1'), ('11','衣服',NULL,'a.jpg','a.jpg',NULL,NULL,'1','2017-07-20 19:52:44','3','1','1'), ('15','品牌笔记本','9','a.jpg','a.jpg',NULL,NULL,'2','2017-07-20 20:58:55','3','1','2'), ('16','上衣','11','a.jpg','a.jpg',NULL,NULL,'1','2017-07-21 08:42:02','3','1','2'), ('19','小米笔记本','15','a.jpg','a.jpg',NULL,NULL,'2','2017-07-21 14:26:53','3','1','3'), ('20','联想笔记本','15','a.jpg','a.jpg',NULL,NULL,'1',NULL,NULL,NULL,'3'), ('21','大牌台式机','9','a.jpg','a.jpg',NULL,NULL,'1',NULL,NULL,NULL,'3'), ('23','上衣三级类目1','16','',NULL,NULL,NULL,'4','2017-07-31 11:44:49','3','1','3'), ('24','上衣三级类目2','16','',NULL,NULL,NULL,'3','2017-07-31 11:45:35','3','1','3'), ('25','上衣三级类目4','16','',NULL,NULL,NULL,'1','2017-07-31 11:45:55','3','1','3'), ('26','上衣三级类目3','16','',NULL,NULL,NULL,'2','2017-07-31 11:45:57','3','1','3'), ('27','一级类目',NULL,'',NULL,NULL,NULL,'2','2017-07-31 15:11:52','3','1','1'), ('28','二级类目','27','',NULL,NULL,NULL,'1','2017-07-31 15:12:11','3','1','2'), ('31','三级类目1','28','',NULL,NULL,NULL,'1','2017-07-31 15:22:22','3','1','3'), ('32','三级类目2','28','',NULL,NULL,NULL,'2','2017-07-31 15:22:24','3','1','3'), ('40','衣服二级类目1','11','',NULL,NULL,NULL,'2','2017-07-31 15:30:28','3','1','2'), ('41','衣服二级类目2','11','',NULL,NULL,NULL,'3','2017-07-31 15:30:31','3','1','2'), ('42','衣服二级类目3','11','',NULL,NULL,NULL,'4','2017-07-31 15:30:31','3','1','2'), ('43','衣服三级类目','40','',NULL,NULL,NULL,'1','2017-08-02 17:26:40','3','1','3'), ('44','一级类目0729',NULL,'92f88b4881aa456681df0ba5f84147ef.jpg','small_92f88b4881aa456681df0ba5f84147ef.jpg',NULL,NULL,'5','2017-08-04 08:53:18','3','1','1'), ('45','二级类目11','44','0140fd3e287d4d6a8dd330b7a6aacd8f.jpg','small_0140fd3e287d4d6a8dd330b7a6aacd8f.jpg',NULL,NULL,'1','2017-08-04 10:32:10','3','1','2'), ('46','三级类目22','45','8ed9f56d540a4d1fb82bb82a908d7abf.jpg','small_8ed9f56d540a4d1fb82bb82a908d7abf.jpg',NULL,NULL,'1','2017-08-04 10:32:46','3','1','3'), ('47','三级类目222','45','1524df9f50814471a4a4afd536ee221b.jpg','small_1524df9f50814471a4a4afd536ee221b.jpg',NULL,NULL,'2','2017-08-04 10:33:14','3','1','3'), ('48','67589',NULL,'',NULL,NULL,NULL,'4','2017-08-04 15:56:13','3','1','1');
INSERT INTO `csair_goods_category_property` VALUES ('6','11.00','12222.000000',NULL,NULL,NULL), ('7','122121.00','1221.000000',NULL,NULL,NULL), ('8','21.00','12.000000',NULL,NULL,NULL), ('9','11.01','11.010010',NULL,NULL,NULL), ('10','1.00','1.000000',NULL,NULL,NULL), ('11','10.00','2121.000000',NULL,NULL,NULL), ('19',NULL,NULL,NULL,NULL,'1'), ('15',NULL,NULL,'2',NULL,NULL), ('24',NULL,NULL,NULL,NULL,NULL), ('26',NULL,NULL,NULL,NULL,NULL), ('27','122112.00','1111.000000',NULL,NULL,NULL), ('28',NULL,NULL,'2',NULL,NULL), ('28',NULL,NULL,'15',NULL,NULL), ('31',NULL,NULL,NULL,NULL,'11'), ('31',NULL,NULL,NULL,NULL,'12'), ('31',NULL,NULL,NULL,NULL,NULL), ('32',NULL,NULL,NULL,NULL,'11'), ('32',NULL,NULL,NULL,NULL,'12'), ('32',NULL,NULL,NULL,NULL,NULL), ('37',NULL,NULL,NULL,NULL,'11'), ('37',NULL,NULL,NULL,NULL,'12'), ('37',NULL,NULL,NULL,NULL,NULL), ('38',NULL,NULL,NULL,NULL,'11'), ('38',NULL,NULL,NULL,NULL,'12'), ('38',NULL,NULL,NULL,NULL,NULL), ('39',NULL,NULL,NULL,NULL,'11'), ('39',NULL,NULL,NULL,NULL,'12'), ('39',NULL,NULL,NULL,NULL,NULL), ('40',NULL,NULL,'2',NULL,NULL), ('41',NULL,NULL,'2',NULL,NULL), ('42',NULL,NULL,'2',NULL,NULL), ('44','1.00','1000.000000',NULL,NULL,NULL), ('16',NULL,NULL,'15',NULL,NULL), ('16',NULL,NULL,'16',NULL,NULL), ('23',NULL,NULL,NULL,NULL,'9'), ('23',NULL,NULL,NULL,NULL,'10'), ('23',NULL,NULL,NULL,NULL,'11'), ('23',NULL,NULL,NULL,NULL,'12'), ('23',NULL,NULL,NULL,NULL,'13'), ('23',NULL,NULL,NULL,NULL,'14'), ('23',NULL,NULL,NULL,NULL,'15'), ('23',NULL,NULL,NULL,'23',NULL), ('45',NULL,NULL,'2',NULL,NULL), ('45',NULL,NULL,'15',NULL,NULL), ('48','678.00','678.000000',NULL,NULL,NULL), ('43',NULL,NULL,NULL,NULL,'9'), ('43',NULL,NULL,NULL,NULL,'10'), ('43',NULL,NULL,NULL,'43',NULL), ('46',NULL,NULL,NULL,NULL,'10'), ('46',NULL,NULL,NULL,NULL,'62'), ('46',NULL,NULL,NULL,NULL,'63'), ('46',NULL,NULL,NULL,'46',NULL), ('47',NULL,NULL,NULL,'47',NULL);
INSERT INTO `csair_goods_category_property_templet` VALUES ('尺寸','2','8','2017-08-01 10:19:24',NULL), ('尺寸','2','12',NULL,NULL), ('CPU','i5','23','2017-08-02 17:22:52','联想笔记本属性模板'), ('CPU','i6','23','2017-08-02 17:22:52','联想笔记本属性模板'), ('CPU','i7','23','2017-08-02 17:22:52','联想笔记本属性模板'), ('CPU','i9','23','2017-08-02 17:22:52','联想笔记本属性模板'), ('屏幕大小','24寸','23','2017-08-02 17:22:52','联想笔记本属性模板'), ('屏幕大小','29寸','23','2017-08-02 17:22:52','联想笔记本属性模板'), ('屏幕大小','32寸','23','2017-08-02 17:22:52','联想笔记本属性模板'), ('版本','旗舰版','23','2017-08-02 17:22:52','联想笔记本属性模板'), ('版本','黄金版','23','2017-08-02 17:22:52','联想笔记本属性模板'), ('版本','高配版','23','2017-08-02 17:22:52','联想笔记本属性模板'), ('版本','土豪版','23','2017-08-02 17:22:52','联想笔记本属性模板'), ('1','1','1',NULL,NULL), ('1','1','2',NULL,NULL), ('1','1','3',NULL,NULL), ('1','1','34',NULL,NULL), ('1','1','4',NULL,NULL), ('1','1','4',NULL,NULL), ('1','1','5',NULL,NULL), ('1','1','8',NULL,NULL), ('1','1','9',NULL,NULL), ('1','1','10',NULL,NULL), ('1','1','11',NULL,NULL), ('1','1','12',NULL,NULL), ('1','1','12',NULL,NULL), ('1','1','13',NULL,NULL), ('1','1','14',NULL,NULL), ('1','1','15',NULL,NULL), ('12','12','43','2017-08-04 16:43:23','1221'), ('12','12','43','2017-08-04 16:43:23','1221'), ('12','12','43','2017-08-04 16:43:23','1221'), ('21','212','43','2017-08-04 16:43:23','1221'), ('21','121','43','2017-08-04 16:43:23','1221'), ('21','12','43','2017-08-04 16:43:23','1221'), ('2121','12','46','2017-08-04 17:10:31','122112'), ('21','21','47','2017-08-04 17:20:45','122121');
INSERT INTO `csair_goods_comment` VALUES ('1','1','1','1','1','2017-07-20 18:30:30','2017-07-20 18:30:40','妙哉妙哉','xxx','zzz','2017-07-13 18:31:07','1','1','1'), ('2','1','1','1','1','2017-07-20 18:30:30','2017-07-20 18:30:40','妙哉妙哉','xxx','zzz','2017-07-13 18:31:07','2','1','1'), ('3','1','1','1','1','2017-07-20 18:30:30','2017-07-20 18:30:40','妙哉妙哉','xxx','zzz','2017-07-13 18:31:07','3','1','1'), ('4','1','1','1','1','2017-07-20 18:30:30','2017-07-20 18:30:40','妙哉妙哉','xxx','zzz','2017-07-13 18:31:07','4','1','1'), ('5','1','1','1','1','2017-07-20 18:30:30','2017-07-20 18:30:40','妙哉妙哉','xxx','zzz','2017-07-13 18:31:07','5','1','1'), ('6','1','1','1','1','2017-07-20 18:30:30','2017-07-20 18:30:40','妙哉妙哉','xxx','zzz','2017-07-13 18:31:07','1','1','1'), ('7','1','1','1','1','2017-07-20 18:30:30','2017-07-20 18:30:40','妙哉妙哉','xxx','zzz','2017-07-13 18:31:07','2','1','1'), ('8','1','1','1','1','2017-07-20 18:30:30','2017-07-20 18:30:40','妙哉妙哉','xxx','zzz','2017-07-13 18:31:07','3','1','1'), ('9','1','1','1','1','2017-07-20 18:30:30','2017-07-20 18:30:40','妙哉妙哉','xxx','zzz','2017-07-13 18:31:07','4','1','1'), ('10','1','1','1','1','2017-07-20 18:30:30','2017-07-20 18:30:40','妙哉妙哉','xxx','zzz','2017-07-13 18:31:07','5','1','1'), ('11','1','1','1','1','2017-07-20 18:30:30','2017-07-20 18:30:40','妙哉妙哉','xxx','zzz','2017-07-13 18:31:07','1','1','1'), ('12','1','1','1','1','2017-07-20 18:30:30','2017-07-20 18:30:40','妙哉妙哉','xxx','zzz','2017-07-13 18:31:07','2','1','1');
INSERT INTO `csair_goods_sku` VALUES ('1','1','',NULL,'0','0','100.00','1','0.80','1.00','0'), ('2',NULL,NULL,NULL,'0','0',NULL,NULL,NULL,NULL,'0');
INSERT INTO `csair_goods_spec` VALUES ('1','1','1','1','1'), ('2','2','1','1','1');
INSERT INTO `csair_log_operation` VALUES ('22','3','修改菜单','菜单id:74菜单名：营销中二级菜单','2017-07-11 15:35:55','10.108.151.11'), ('23','3','修改菜单','菜单id:72菜单名：cms二级管理','2017-07-11 15:37:01','10.108.151.11'), ('24','3','修改菜单','菜单id:72菜单名：cms二级管理2','2017-07-11 15:37:58','10.108.151.11'), ('25','3','添加菜单','菜单id:84     菜单名：测试用菜单','2017-07-11 16:03:29','10.108.151.11'), ('26','3','添加菜单','菜单id:85     菜单名：管理权限','2017-07-11 17:28:18','10.108.151.11'), ('27','3','修改菜单','菜单id:50     菜单名：用户账号','2017-07-11 17:28:38','10.108.151.11'), ('28','3','修改菜单','菜单id:59     菜单名：新建账号','2017-07-11 17:28:50','10.108.151.11'), ('29','3','删除菜单','菜单id:85菜单名：管理权限','2017-07-11 17:31:37','0:0:0:0:0:0:0:1'), ('30','3','新增用户','用户邮箱aaa@qq.com；用户id22','2017-07-12 11:39:16','0:0:0:0:0:0:0:1'), ('31','3','修改角色权限','角色的id2；增加角色的id集合：152,151；删除角色的id集合：63,64,65,116,70,63,64,65,66,67,68,69,70,71,73,74,75,96,98,99,107,111,116,119','2017-07-12 11:40:49','0:0:0:0:0:0:0:1'), ('32','3','新增权限','权限的id：null权限的名字：查看菜单:交易查询  权限的url：/tr','2017-07-12 11:46:50','0:0:0:0:0:0:0:1'), ('33','3','添加菜单','菜单id:86     菜单名：交易查询','2017-07-12 11:46:50','0:0:0:0:0:0:0:1'), ('34','3','删除菜单','菜单id:42菜单名：商品列表','2017-07-12 11:46:58','0:0:0:0:0:0:0:1'), ('35','3','修改用户','用户邮箱alice@test.com；用户id3','2017-07-12 11:51:44','0:0:0:0:0:0:0:1'), ('36','2','新增权限','权限的id：135权限的名字：查看菜单:交易审批  权限的url：/trade/list','2017-07-12 14:22:24','0:0:0:0:0:0:0:1'), ('37','2','修改菜单','菜单id:79；菜单名：交易审批；菜单的url：/trade/list','2017-07-12 14:22:24','0:0:0:0:0:0:0:1'), ('38','3','修改角色权限','角色的id2；增加角色的id集合：144,143','2017-07-12 15:01:59','0:0:0:0:0:0:0:1'), ('39','3','新增权限','权限的id：156权限的名字：修改自己的密码  权限的url：/user/changePassword','2017-07-12 16:36:44','0:0:0:0:0:0:0:1'), ('40','3','修改角色权限','角色的id2；增加角色的id集合：156,139','2017-07-12 16:37:09','0:0:0:0:0:0:0:1'), ('2085','3','新增用户','用户邮箱：2112211221；用户id：23','2017-07-18 10:02:02','0:0:0:0:0:0:0:1'), ('2086','3','修改用户','用户邮箱：ilh；用户id：17','2017-07-18 10:05:48','0:0:0:0:0:0:0:1'), ('2087','2','删除菜单','菜单id:68；菜单名：建立模型；菜单的url：/model/add','2017-07-18 11:39:34','10.108.151.11'), ('2088','3','新增用户','用户邮箱：testCerate@test.com；用户id：24','2017-07-18 11:57:17','10.108.151.11'), ('2089','3','删除菜单','菜单id:99；菜单名：合同管理；菜单的url：null','2017-07-18 16:42:03','0:0:0:0:0:0:0:1'), ('2090','3','删除菜单','菜单id:101；菜单名：商家续约；菜单的url：null','2017-07-18 16:42:11','0:0:0:0:0:0:0:1'), ('2091','3','删除菜单','菜单id:102；菜单名：保证金管理；菜单的url：null','2017-07-18 16:42:18','0:0:0:0:0:0:0:1'), ('2092','3','删除角色下用户','角色名字：编辑；被删除的用户的id3,12,13','2017-07-18 16:54:12','0:0:0:0:0:0:0:1'), ('2093','3','添加商户','：操作人id:3','2017-07-19 09:06:59','；操作人Ip：0:0:0:0:0:0:0:1'), ('2094','3','修改商户','：操作人id:3','2017-07-19 09:07:35','；操作人Ip：0:0:0:0:0:0:0:1'), ('2095','3','删除菜单','菜单id:91；菜单名：店铺管理；菜单的url：/shop/addshop','2017-07-19 09:36:09','0:0:0:0:0:0:0:1'), ('2096','3','删除菜单','菜单id:43；菜单名：发布商品；菜单的url：null','2017-07-19 09:36:28','0:0:0:0:0:0:0:1'), ('2097','3','删除菜单','菜单id:65；菜单名：删除商品；菜单的url：/good/delete','2017-07-19 09:36:34','0:0:0:0:0:0:0:1'), ('2098','3','短信服务配置','用户名：aaaaa发件人姓名：cccc','2017-07-19 09:39:28','0:0:0:0:0:0:0:1'), ('2099','3','短信服务配置','发送账号：123','2017-07-19 09:44:26','0:0:0:0:0:0:0:1'), ('2100','3','新增权限','权限的id：181权限的名字：查看菜单:入驻店铺信息管理  权限的url：/shop/selectshop','2017-07-19 10:02:42','0:0:0:0:0:0:0:1'), ('2101','3','新增权限','权限的id：182权限的名字：查看菜单:入驻店铺信息管理  权限的url：/shop/selectshop','2017-07-19 10:02:57','0:0:0:0:0:0:0:1'), ('2102','3','删除菜单','菜单id:115；菜单名：入驻店铺信息管理；菜单的url：/shop/selectshop','2017-07-19 10:03:21','0:0:0:0:0:0:0:1'), ('2103','3','新增权限','权限的id：183权限的名字：查看菜单:店铺信息审核  权限的url：','2017-07-19 10:03:58','0:0:0:0:0:0:0:1'), ('2104','3','新增权限','权限的id：184权限的名字：查看菜单:商家信息管理  权限的url：','2017-07-19 10:04:31','0:0:0:0:0:0:0:1'), ('2105','3','新增权限','权限的id：185权限的名字：查看菜单:资质变更审核列表  权限的url：','2017-07-19 10:04:57','0:0:0:0:0:0:0:1'), ('2106','3','新增权限','权限的id：186权限的名字：查看菜单:合同管理  权限的url：','2017-07-19 10:05:29','0:0:0:0:0:0:0:1'), ('2107','3','新增权限','权限的id：186权限的名字：查看菜单:合同管理  权限的url：','2017-07-19 10:05:47','0:0:0:0:0:0:0:1'), ('2108','3','修改菜单','菜单id:119；菜单名：合同管理；菜单的url：','2017-07-19 10:05:47','0:0:0:0:0:0:0:1'), ('2109','3','新增权限','权限的id：187权限的名字：查看菜单:商家续约  权限的url：','2017-07-19 10:06:09','0:0:0:0:0:0:0:1'), ('2110','3','邮箱服务配置','用户名：1;发件人姓名：<script>alert(\'xss\')</script>','2017-07-19 10:48:17','0:0:0:0:0:0:0:1'), ('2111','3','邮箱服务配置','用户名：1;发件人姓名：\"><script>alert(&#039;xss&#039;)</script>','2017-07-19 10:53:19','0:0:0:0:0:0:0:1'), ('2112','3','新增权限','权限的id：145权限的名字：角色编辑页面  权限的url：/role/inputRole','2017-07-19 11:48:14','127.0.0.1'), ('2113','3','新增权限','权限的id：188权限的名字：修改角色  权限的url：/role/addOrUpdataRole','2017-07-19 11:49:38','127.0.0.1'), ('2114','3','新增权限','权限的id：189权限的名字：删除角色下用户  权限的url：/role/removeRoleUser','2017-07-19 14:07:20','0:0:0:0:0:0:0:1'), ('2115','3','短信服务配置','发送账号：1','2017-07-19 14:28:25','0:0:0:0:0:0:0:1'), ('2116','3','短信服务配置','发送账号：1','2017-07-19 14:37:17','0:0:0:0:0:0:0:1'), ('2117','3','短信服务配置','发送账号：1','2017-07-19 14:48:46','0:0:0:0:0:0:0:1'), ('2118','3','短信服务配置','发送账号：1','2017-07-19 15:08:16','0:0:0:0:0:0:0:1'), ('2119','3','短信服务配置','发送账号：1','2017-07-19 15:09:08','0:0:0:0:0:0:0:1'), ('2120','3','短信服务配置','发送账号：1','2017-07-19 15:10:03','0:0:0:0:0:0:0:1'), ('2121','3','新增权限','权限的id：190权限的名字：添加文章  权限的url：/cms/add','2017-07-19 15:48:42','10.108.151.11'), ('2122','3','邮箱服务配置','用户名：1;发件人姓名：1','2017-07-19 16:13:12','0:0:0:0:0:0:0:1'), ('2123','3','邮箱服务配置','用户名：1;发件人姓名：1','2017-07-19 16:13:13','0:0:0:0:0:0:0:1'), ('2124','3','邮箱服务配置','用户名：1;发件人姓名：1','2017-07-19 16:14:56','0:0:0:0:0:0:0:1'), ('2125','3','邮箱服务配置','用户名：1;发件人姓名：1','2017-07-19 16:14:58','0:0:0:0:0:0:0:1'), ('2126','3','邮箱服务配置','用户名：1;发件人姓名：1','2017-07-19 16:15:42','0:0:0:0:0:0:0:1'), ('2127','3','邮箱服务配置','用户名：1;发件人姓名：1','2017-07-19 16:15:43','0:0:0:0:0:0:0:1'), ('2128','3','邮箱服务配置','用户名：1;发件人姓名：1','2017-07-19 16:19:46','0:0:0:0:0:0:0:1'), ('2129','3','短信服务配置','发送账号：1','2017-07-19 16:34:59','0:0:0:0:0:0:0:1'), ('2130','3','短信服务配置','发送账号：<script>','2017-07-19 16:37:48','0:0:0:0:0:0:0:1'), ('2131','3','短信服务配置','发送账号：1','2017-07-19 16:58:56','0:0:0:0:0:0:0:1'), ('2132','3','短信服务配置','发送账号：&lt;span&gt;你好&lt;/span&gt;','2017-07-19 17:01:51','0:0:0:0:0:0:0:1'), ('2133','3','短信服务配置','发送账号：&lt;span&gt;你好&lt;/span&gt;','2017-07-19 17:05:10','0:0:0:0:0:0:0:1'), ('2134','3','短信服务配置','发送账号：1','2017-07-19 17:05:47','0:0:0:0:0:0:0:1'), ('2135','3','邮箱服务配置','用户名：1;发件人姓名：1','2017-07-19 17:09:07','0:0:0:0:0:0:0:1'), ('2136','3','短信服务配置','发送账号：1','2017-07-19 17:10:57','0:0:0:0:0:0:0:1'), ('2137','3','短信服务配置','发送账号：1','2017-07-19 17:13:44','0:0:0:0:0:0:0:1'), ('2138','3','短信服务配置','发送账号：1','2017-07-19 20:14:11','0:0:0:0:0:0:0:1'), ('2139','3','短信服务配置','发送账号：test','2017-07-19 20:40:12','0:0:0:0:0:0:0:1'), ('2140','3','短信服务配置','发送账号：test','2017-07-19 20:43:38','0:0:0:0:0:0:0:1'), ('2141','3','短信服务配置','发送账号：sms','2017-07-19 20:45:46','0:0:0:0:0:0:0:1'), ('2142','3','邮箱服务配置','用户名：email;发件人姓名：email','2017-07-19 20:46:14','0:0:0:0:0:0:0:1'), ('2143','3','短信服务配置','发送账号：sms','2017-07-19 20:48:44','0:0:0:0:0:0:0:1'), ('2144','3','短信服务配置','发送账号：1','2017-07-20 08:41:26','0:0:0:0:0:0:0:1'), ('2145','3','短信服务配置','发送账号：test11','2017-07-20 08:44:04','0:0:0:0:0:0:0:1'), ('2146','3','邮箱服务配置','用户名：test11;发件人姓名：test11','2017-07-20 08:44:23','0:0:0:0:0:0:0:1'), ('2147','3','新增权限','权限的id：77权限的名字：查看菜单:商品管理  权限的url：','2017-07-20 10:43:30','0:0:0:0:0:0:0:1'), ('2148','3','修改菜单','菜单id:2；菜单名：商品管理；菜单的url：','2017-07-20 10:43:30','0:0:0:0:0:0:0:1'), ('2149','3','删除菜单','菜单id:41；菜单名：商品管理；菜单的url：null','2017-07-20 10:43:44','0:0:0:0:0:0:0:1'), ('2150','3','新增权限','权限的id：191权限的名字：查看菜单:类目管理  权限的url：/GoodCategory/queryAllGoodCategory','2017-07-20 10:46:14','0:0:0:0:0:0:0:1'), ('2151','3','添加菜单','菜单id:121；菜单名：类目管理；菜单的url：/GoodCategory/queryAllGoodCategory','2017-07-20 10:46:14','0:0:0:0:0:0:0:1'), ('2152','3','新增权限','权限的id：191权限的名字：查看菜单:类目管理  权限的url：','2017-07-20 10:57:37','0:0:0:0:0:0:0:1'), ('2153','3','修改菜单','菜单id:121；菜单名：类目管理；菜单的url：','2017-07-20 10:57:37','0:0:0:0:0:0:0:1'), ('2154','3','新增权限','权限的id：192权限的名字：查看菜单:类目列表  权限的url：/GoodCategory/queryAllGoodCategory','2017-07-20 10:58:14','0:0:0:0:0:0:0:1'), ('2155','3','添加菜单','菜单id:122；菜单名：类目列表；菜单的url：/GoodCategory/queryAllGoodCategory','2017-07-20 10:58:14','0:0:0:0:0:0:0:1'), ('2156','3','新增权限','权限的id：193权限的名字：查看菜单:短信测试  权限的url：/messsage/sendSms','2017-07-20 15:01:56','0:0:0:0:0:0:0:1'), ('2157','3','添加菜单','菜单id:123；菜单名：短信测试；菜单的url：/messsage/sendSms','2017-07-20 15:01:56','0:0:0:0:0:0:0:1'), ('2158','3','新增权限','权限的id：194权限的名字：查看菜单:短信测试  权限的url：message/sendSms','2017-07-20 15:02:55','0:0:0:0:0:0:0:1'), ('2159','3','添加菜单','菜单id:124；菜单名：短信测试；菜单的url：message/sendSms','2017-07-20 15:02:55','0:0:0:0:0:0:0:1'), ('2160','3','添加类目','类目id:7 ; 类目名字： null 。','2017-07-20 19:23:15','0:0:0:0:0:0:0:1'), ('2161','3','添加类目','类目id:8 ; 类目名字： null 。','2017-07-20 19:25:28','0:0:0:0:0:0:0:1'), ('2162','3','添加类目','类目id:9 ; 类目名字： 电子商品 。','2017-07-20 19:40:59','0:0:0:0:0:0:0:1'), ('2163','3','添加类目','类目id:10 ; 类目名字： 1 。','2017-07-20 19:49:59','0:0:0:0:0:0:0:1'), ('2164','3','添加类目','类目id:11 ; 类目名字： 衣服 。','2017-07-20 19:52:44','0:0:0:0:0:0:0:1'), ('2165','3','添加类目','类目id:12 ; 类目名字： null 。','2017-07-20 20:19:56','0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2166','3','添加类目','类目id:13 ; 类目名字： null 。','2017-07-20 20:23:30','0:0:0:0:0:0:0:1'), ('2167','3','添加类目','类目id:14 ; 类目名字： null 。','2017-07-20 20:25:19','0:0:0:0:0:0:0:1'), ('2168','3','添加类目','类目id:15 ; 类目名字： 品牌笔记本 。','2017-07-20 20:58:55','0:0:0:0:0:0:0:1'), ('2169','3','添加类目','类目id:16 ; 类目名字： 上衣 。','2017-07-21 08:42:02','0:0:0:0:0:0:0:1'), ('2170','3','新增权限','权限的id：185权限的名字：查看菜单:资质变更审核列表  权限的url：/shop/selectshop','2017-07-21 11:15:36','0:0:0:0:0:0:0:1'), ('2171','3','修改菜单','菜单id:118；菜单名：资质变更审核列表；菜单的url：/shop/selectshop','2017-07-21 11:15:37','0:0:0:0:0:0:0:1'), ('2172','3','删除菜单','菜单id:73；菜单名：cms三级菜单1；菜单的url：null','2017-07-21 11:38:52','0:0:0:0:0:0:0:1'), ('2173','3','新增权限','权限的id：127权限的名字：查看菜单:文章  权限的url：/article/Article_list','2017-07-21 11:41:48','0:0:0:0:0:0:0:1'), ('2174','3','修改菜单','菜单id:72；菜单名：文章；菜单的url：/article/Article_list','2017-07-21 11:41:49','0:0:0:0:0:0:0:1'), ('2175','3','新增权限','权限的id：126权限的名字：查看菜单:文章分类  权限的url：/articleclassify/ArtiCleclassify_list','2017-07-21 11:47:04','0:0:0:0:0:0:0:1'), ('2176','3','修改菜单','菜单id:71；菜单名：文章分类；菜单的url：/articleclassify/ArtiCleclassify_list','2017-07-21 11:47:04','0:0:0:0:0:0:0:1'), ('2177','3','新增权限','权限的id：195权限的名字：查看菜单:品牌管理  权限的url：/brand/addbrand','2017-07-21 11:52:21','0:0:0:0:0:0:0:1'), ('2178','3','添加菜单','菜单id:125；菜单名：品牌管理；菜单的url：/brand/addbrand','2017-07-21 11:52:21','0:0:0:0:0:0:0:1'), ('2179','3','新增权限','权限的id：195权限的名字：查看菜单:添加品牌  权限的url：/brand/addbrand','2017-07-21 14:14:24','0:0:0:0:0:0:0:1'), ('2180','3','修改菜单','菜单id:125；菜单名：添加品牌；菜单的url：/brand/addbrand','2017-07-21 14:14:24','0:0:0:0:0:0:0:1'), ('2181','3','添加类目','类目id:18 ; 类目名字： 小米笔记本 。','2017-07-21 14:25:08','127.0.0.1'), ('2182','3','添加类目','类目id:19 ; 类目名字： 小米笔记本 。','2017-07-21 14:26:53','127.0.0.1'), ('2183','3','删除菜单','菜单id:123；菜单名：短信测试；菜单的url：/messsage/sendSms','2017-07-24 09:37:16','0:0:0:0:0:0:0:1'), ('2184','3','删除菜单','菜单id:124；菜单名：短信测试；菜单的url：message/sendSms','2017-07-24 09:37:33','0:0:0:0:0:0:0:1'), ('2185','3','短信服务配置','发送账号：null','2017-07-24 11:41:13','0:0:0:0:0:0:0:1'), ('2186','3','短信服务配置','发送账号：null','2017-07-24 11:45:21','0:0:0:0:0:0:0:1'), ('2187','3','短信服务配置','发送账号：null','2017-07-24 11:45:23','0:0:0:0:0:0:0:1'), ('2188','3','新增权限','权限的id：196权限的名字：查看菜单:字典库管理  权限的url：','2017-07-24 16:15:10','0:0:0:0:0:0:0:1'), ('2189','3','添加菜单','菜单id:126；菜单名：字典库管理；菜单的url：','2017-07-24 16:15:10','0:0:0:0:0:0:0:1'), ('2190','3','新增权限','权限的id：197权限的名字：查看菜单:类目证书管理  权限的url：/certificate/list','2017-07-24 16:16:55','0:0:0:0:0:0:0:1'), ('2191','3','添加菜单','菜单id:127；菜单名：类目证书管理；菜单的url：/certificate/list','2017-07-24 16:16:55','0:0:0:0:0:0:0:1'), ('2192','3','短信服务配置','发送账号：345','2017-07-24 17:26:01','0:0:0:0:0:0:0:1'), ('2193','3','邮箱服务配置','用户名：uhiu;发件人姓名：iii','2017-07-24 17:28:45','0:0:0:0:0:0:0:1'), ('2194','3','删除文章','：操作人id:3','2017-07-24 18:50:22','；操作人Ip：0:0:0:0:0:0:0:1'), ('2195','3','删除文章','：操作人id:3','2017-07-24 18:52:27','；操作人Ip：0:0:0:0:0:0:0:1'), ('2196','3','删除文章','：操作人id:3','2017-07-24 18:55:42','；操作人Ip：0:0:0:0:0:0:0:1'), ('2197','3','添加文章','：操作人id:3','2017-07-24 19:23:29','；操作人Ip：0:0:0:0:0:0:0:1'), ('2198','3','添加文章','：操作人id:3','2017-07-24 19:33:21','；操作人Ip：0:0:0:0:0:0:0:1'), ('2199','3','添加证书','证书id:10;','2017-07-24 19:41:01','0:0:0:0:0:0:0:1'), ('2200','3','添加证书','证书id:9;','2017-07-24 19:41:07','0:0:0:0:0:0:0:1'), ('2201','3','添加证书','证书id:8;','2017-07-24 19:41:09','0:0:0:0:0:0:0:1'), ('2202','3','添加证书','证书id:7;','2017-07-24 19:41:11','0:0:0:0:0:0:0:1'), ('2203','3','添加证书','证书id:6;','2017-07-24 19:41:20','0:0:0:0:0:0:0:1'), ('2204','3','短信服务配置','发送账号：null','2017-07-24 19:44:42','0:0:0:0:0:0:0:1'), ('2205','3','修改文章','：操作人id:3','2017-07-24 20:00:47','；操作人Ip：0:0:0:0:0:0:0:1'), ('2206','3','添加证书','证书id:2;','2017-07-24 20:02:36','0:0:0:0:0:0:0:1'), ('2207','3','修改文章','：操作人id:3','2017-07-24 20:03:25','；操作人Ip：0:0:0:0:0:0:0:1'), ('2208','3','修改文章','：操作人id:3','2017-07-24 20:05:29','；操作人Ip：0:0:0:0:0:0:0:1'), ('2209','3','修改文章','：操作人id:3','2017-07-24 20:08:04','；操作人Ip：0:0:0:0:0:0:0:1'), ('2210','3','短信服务配置','发送账号：null','2017-07-24 20:08:46','0:0:0:0:0:0:0:1'), ('2211','3','短信服务配置','发送账号：null','2017-07-24 20:16:31','0:0:0:0:0:0:0:1'), ('2212','3','修改文章','：操作人id:3','2017-07-24 20:23:35','；操作人Ip：0:0:0:0:0:0:0:1'), ('2213','3','短信服务配置','发送账号：null','2017-07-24 20:23:59','0:0:0:0:0:0:0:1'), ('2214','3','修改证书','证书id:2;证书名字null;','2017-07-24 20:27:14','0:0:0:0:0:0:0:1'), ('2215','3','修改证书','证书id:2;证书名字四级证书;','2017-07-24 20:29:17','0:0:0:0:0:0:0:1'), ('2216','3','短信服务配置','发送账号：null','2017-07-24 20:31:31','0:0:0:0:0:0:0:1'), ('2217','3','修改证书','证书id:2;证书名字四级证书;','2017-07-24 20:34:26','0:0:0:0:0:0:0:1'), ('2218','3','修改证书','证书id:2;证书名字四级证书;','2017-07-24 20:36:33','0:0:0:0:0:0:0:1'), ('2219','3','短信服务配置','发送账号：null','2017-07-24 20:37:09','0:0:0:0:0:0:0:1'), ('2220','3','短信服务配置','发送账号：null','2017-07-24 20:39:37','0:0:0:0:0:0:0:1'), ('2221','3','修改证书','证书id:2;证书名字四级证书;','2017-07-24 20:39:46','0:0:0:0:0:0:0:1'), ('2222','3','添加证书','证书id:5;','2017-07-24 20:58:24','0:0:0:0:0:0:0:1'), ('2223','3','添加文章分类','：操作人id:3','2017-07-25 10:41:42','；操作人Ip：0:0:0:0:0:0:0:1'), ('2224','3','添加文章分类','：操作人id:3','2017-07-25 10:52:31','；操作人Ip：0:0:0:0:0:0:0:1'), ('2225','3','添加文章分类','：操作人id:3','2017-07-25 11:15:02','；操作人Ip：0:0:0:0:0:0:0:1'), ('2226','3','修改文章分类','：操作人id:3','2017-07-25 11:15:33','；操作人Ip：0:0:0:0:0:0:0:1'), ('2227','3','短信服务配置','发送账号：null','2017-07-25 11:33:18','0:0:0:0:0:0:0:1'), ('2228','3','删除文章分类','：操作人id:3','2017-07-25 11:35:57','；操作人Ip：0:0:0:0:0:0:0:1'), ('2229','3','短信服务配置','发送账号：null','2017-07-25 14:31:02','0:0:0:0:0:0:0:1'), ('2230','3','邮箱服务配置','用户名：emailusername;发件人姓名：null','2017-07-25 14:31:39','0:0:0:0:0:0:0:1'), ('2231','3','邮箱服务配置','用户名：emailusername;发件人姓名：null','2017-07-25 14:34:05','0:0:0:0:0:0:0:1'), ('2232','3','邮箱服务配置','用户名：emailusername123456;发件人姓名：null','2017-07-25 14:34:23','0:0:0:0:0:0:0:1'), ('2233','3','添加证书','证书id:11;','2017-07-25 15:17:39','0:0:0:0:0:0:0:1'), ('2234','3','添加证书','证书id:12;','2017-07-25 15:24:11','0:0:0:0:0:0:0:1'), ('2235','3','添加证书','证书id:13;证书名字12;','2017-07-25 15:24:53','0:0:0:0:0:0:0:1'), ('2236','3','添加证书','证书id:13;','2017-07-25 15:25:00','0:0:0:0:0:0:0:1'), ('2237','3','添加证书','证书id:13;','2017-07-25 15:25:02','0:0:0:0:0:0:0:1'), ('2238','3','添加证书','证书id:14;证书名字12222222;','2017-07-25 15:25:18','0:0:0:0:0:0:0:1'), ('2239','3','添加证书','证书id:14;','2017-07-25 15:25:27','0:0:0:0:0:0:0:1'), ('2240','3','添加证书','证书id:14;','2017-07-25 15:25:28','0:0:0:0:0:0:0:1'), ('2241','3','邮箱服务配置','用户名：测试测试;发件人姓名：null','2017-07-25 15:53:58','0:0:0:0:0:0:0:1'), ('2242','3','短信服务配置','发送账号：null','2017-07-25 15:54:36','0:0:0:0:0:0:0:1'), ('2243','3','短信服务配置','发送账号：null','2017-07-25 16:00:56','0:0:0:0:0:0:0:1'), ('2244','3','短信服务配置','发送账号：null','2017-07-25 16:01:17','0:0:0:0:0:0:0:1'), ('2245','3','邮箱服务配置','用户名：测试测试;发件人姓名：null','2017-07-25 16:01:46','0:0:0:0:0:0:0:1'), ('2246','3','邮箱服务配置','用户名：测试测试;发件人姓名：null','2017-07-25 16:02:08','0:0:0:0:0:0:0:1'), ('2247','3','短信服务配置','发送账号：null','2017-07-25 16:03:16','0:0:0:0:0:0:0:1'), ('2248','3','新增权限','权限的id：195权限的名字：查看菜单:品牌管理  权限的url：','2017-07-25 16:09:37','0:0:0:0:0:0:0:1'), ('2249','3','修改菜单','菜单id:125；菜单名：品牌管理；菜单的url：','2017-07-25 16:09:37','0:0:0:0:0:0:0:1'), ('2250','3','新增权限','权限的id：198权限的名字：查看菜单:品牌列表  权限的url：/brand/list','2017-07-25 16:10:37','0:0:0:0:0:0:0:1'), ('2251','3','添加菜单','菜单id:129；菜单名：品牌列表；菜单的url：/brand/list','2017-07-25 16:10:37','0:0:0:0:0:0:0:1'), ('2252','3','新增权限','权限的id：199权限的名字：查看菜单:会员管理  权限的url：','2017-07-25 16:13:47','192.168.1.222'), ('2253','3','添加菜单','菜单id:130；菜单名：会员管理；菜单的url：','2017-07-25 16:13:48','192.168.1.222'), ('2254','3','新增权限','权限的id：200权限的名字：查看菜单:会员列表  权限的url：','2017-07-25 16:14:56','192.168.1.222'), ('2255','3','添加菜单','菜单id:131；菜单名：会员列表；菜单的url：','2017-07-25 16:14:56','192.168.1.222'), ('2256','3','新增权限','权限的id：201权限的名字：查看菜单:会员信息  权限的url：','2017-07-25 16:15:23','192.168.1.222'), ('2257','3','添加菜单','菜单id:132；菜单名：会员信息；菜单的url：','2017-07-25 16:15:24','192.168.1.222'), ('2258','3','新增权限','权限的id：202权限的名字：查看菜单:会员信息  权限的url：','2017-07-25 16:16:44','192.168.1.222'), ('2259','3','添加菜单','菜单id:133；菜单名：会员信息；菜单的url：','2017-07-25 16:16:44','192.168.1.222'), ('2260','3','删除菜单','菜单id:133；菜单名：会员信息；菜单的url：null','2017-07-25 16:17:31','192.168.1.222'), ('2261','3','短信服务配置','配置用户名：EMALL','2017-07-25 16:16:50','0:0:0:0:0:0:0:1'), ('2262','3','添加证书','证书id:4;','2017-07-25 16:26:55','0:0:0:0:0:0:0:1'), ('2263','3','添加证书','证书id:3;','2017-07-25 16:27:32','0:0:0:0:0:0:0:1'), ('2264','3','添加证书','证书id:3;','2017-07-25 16:27:34','0:0:0:0:0:0:0:1'), ('2265','3','删除文章分类','：操作人id:3','2017-07-25 16:40:46','；操作人Ip：0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2266','3','删除文章分类','：操作人id:3','2017-07-25 16:40:56','；操作人Ip：0:0:0:0:0:0:0:1'), ('2267','3','新增权限','权限的id：197权限的名字：查看菜单:类目证书管理  权限的url：/certificate/list','2017-07-25 18:40:11','0:0:0:0:0:0:0:1'), ('2268','3','修改菜单','菜单id:127；菜单名：类目证书管理；菜单的url：/certificate/list','2017-07-25 18:40:11','0:0:0:0:0:0:0:1'), ('2269','3','短信服务配置','配置用户名：EMALL21313123','2017-07-25 18:59:57','0:0:0:0:0:0:0:1'), ('2270','3','新增权限','权限的id：200权限的名字：查看菜单:会员列表  权限的url：/user/list','2017-07-25 19:06:07','0:0:0:0:0:0:0:1'), ('2271','3','修改菜单','菜单id:131；菜单名：会员列表；菜单的url：/user/list','2017-07-25 19:06:07','0:0:0:0:0:0:0:1'), ('2272','3','删除菜单','菜单id:132；菜单名：会员信息；菜单的url：null','2017-07-25 19:11:23','0:0:0:0:0:0:0:1'), ('2273','3','添加商户','：操作人id:3','2017-07-25 05:29:15','；操作人Ip：0:0:0:0:0:0:0:1'), ('2274','3','添加商户','：操作人id:3','2017-07-25 05:29:43','；操作人Ip：0:0:0:0:0:0:0:1'), ('2275','3','新增用户','用户邮箱：ateate；用户id：25','2017-07-26 09:19:33','0:0:0:0:0:0:0:1'), ('2276','3','修改商户','：操作人id:3','2017-07-25 19:59:59','；操作人Ip：0:0:0:0:0:0:0:1'), ('2277','3','添加商户','：操作人id:3','2017-07-25 20:00:35','；操作人Ip：0:0:0:0:0:0:0:1'), ('2278','3','短信服务配置','配置用户名：EMALL','2017-07-26 11:52:18','0:0:0:0:0:0:0:1'), ('2279','3','邮箱服务配置','配置用户名ID:EMALL','2017-07-26 14:17:09','0:0:0:0:0:0:0:1'), ('2280','3','添加品牌','品牌名字：小米','2017-07-26 14:46:12','0:0:0:0:0:0:0:1'), ('2281','3','添加品牌','品牌名字：华为','2017-07-26 15:24:24','0:0:0:0:0:0:0:1'), ('2282','3','添加品牌','品牌名字：华为','2017-07-26 15:26:57','0:0:0:0:0:0:0:1'), ('2283','3','新增权限','权限的id：187权限的名字：查看菜单:商家续约  权限的url：','2017-07-26 16:40:52','0:0:0:0:0:0:0:1'), ('2284','3','修改菜单','菜单id:120；菜单名：商家续约；菜单的url：','2017-07-26 16:40:52','0:0:0:0:0:0:0:1'), ('2285','3','添加品牌','品牌名字：小米','2017-07-26 17:27:30','0:0:0:0:0:0:0:1'), ('2584','3','删除文章','：操作人id:3','2017-07-27 10:03:55','0:0:0:0:0:0:0:1'), ('2585','3','添加商户','：操作人id:3','2017-07-27 10:43:44','0:0:0:0:0:0:0:1'), ('2586','3','添加商户','：操作人id:3','2017-07-27 10:46:17','0:0:0:0:0:0:0:1'), ('2587','3','新增权限','权限的id：186权限的名字：查看菜单:合同管理  权限的url：','2017-07-27 12:00:45','0:0:0:0:0:0:0:1'), ('2588','3','修改菜单','菜单id:119；菜单名：合同管理；菜单的url：','2017-07-27 12:00:45','0:0:0:0:0:0:0:1'), ('2589','3','删除菜单','菜单id:5；菜单名：模型管理；菜单的url：null','2017-07-27 14:23:54','0:0:0:0:0:0:0:1'), ('2590','3','批量删除品牌','品牌ID：（17）。','2017-07-27 14:33:43','0:0:0:0:0:0:0:1'), ('2591','3','批量删除品牌','品牌ID：（19,20）。','2017-07-27 14:35:34','0:0:0:0:0:0:0:1'), ('2592','3','批量删除品牌','品牌ID：（22,23,24,25,26）。','2017-07-27 14:38:58','0:0:0:0:0:0:0:1'), ('2593','3','批量删除品牌','品牌ID：（18）。','2017-07-27 14:39:12','0:0:0:0:0:0:0:1'), ('2594','3','添加商户','：操作人id:3','2017-07-27 14:41:01','0:0:0:0:0:0:0:1'), ('2595','3','添加商户','：操作人id:3','2017-07-27 14:43:35','0:0:0:0:0:0:0:1'), ('2596','3','批量删除品牌','品牌ID：（16）。','2017-07-27 14:48:14','0:0:0:0:0:0:0:1'), ('2597','3','删除商户','：操作人id:3','2017-07-27 14:59:51','0:0:0:0:0:0:0:1'), ('2598','3','批量删除品牌','品牌ID：（29,30,31,32,33,34,35,36,37,38）。','2017-07-27 15:02:15','0:0:0:0:0:0:0:1'), ('2599','3','批量删除品牌','品牌ID：（39,40,41,42,43,44,45,46,47,48）。','2017-07-27 15:02:25','0:0:0:0:0:0:0:1'), ('2600','3','批量删除品牌','品牌ID：（28）。','2017-07-27 15:19:22','0:0:0:0:0:0:0:1'), ('2601','3','修改商户','：操作人id:3','2017-07-27 16:01:26','0:0:0:0:0:0:0:1'), ('2602','3','修改商户','：操作人id:3','2017-07-27 16:01:36','0:0:0:0:0:0:0:1'), ('2603','3','修改商户','：操作人id:3','2017-07-27 16:07:31','0:0:0:0:0:0:0:1'), ('2604','3','修改商户','：操作人id:3','2017-07-27 16:07:54','0:0:0:0:0:0:0:1'), ('2605','3','新增权限','权限的id：185权限的名字：查看菜单:资质变更审核列表  权限的url：','2017-07-27 16:34:43','0:0:0:0:0:0:0:1'), ('2606','3','修改菜单','菜单id:118；菜单名：资质变更审核列表；菜单的url：','2017-07-27 16:34:43','0:0:0:0:0:0:0:1'), ('2607','3','新增权限','权限的id：147权限的名字：用户查询  权限的url：/user/list||/user/downloadUser','2017-07-27 16:34:59','0:0:0:0:0:0:0:1'), ('2608','3','新增权限','权限的id：181权限的名字：查看菜单:入驻店铺信息管理  权限的url：','2017-07-27 16:36:02','0:0:0:0:0:0:0:1'), ('2609','3','修改菜单','菜单id:114；菜单名：入驻店铺信息管理；菜单的url：','2017-07-27 16:36:02','0:0:0:0:0:0:0:1'), ('2610','3','新增权限','权限的id：181权限的名字：查看菜单:入驻店铺信息管理  权限的url：','2017-07-27 16:36:45','0:0:0:0:0:0:0:1'), ('2611','3','修改菜单','菜单id:114；菜单名：入驻店铺信息管理；菜单的url：','2017-07-27 16:36:45','0:0:0:0:0:0:0:1'), ('2612','3','新增权限','权限的id：203权限的名字：查看菜单:商铺增删该查操作  权限的url：/shop/selectshop','2017-07-27 16:39:33','0:0:0:0:0:0:0:1'), ('2613','3','添加菜单','菜单id:134；菜单名：商铺增删该查操作；菜单的url：/shop/selectshop','2017-07-27 16:39:33','0:0:0:0:0:0:0:1'), ('2614','3','新增权限','权限的id：186权限的名字：查看菜单:合同管理  权限的url：','2017-07-27 16:55:33','0:0:0:0:0:0:0:1'), ('2615','3','修改菜单','菜单id:119；菜单名：合同管理；菜单的url：','2017-07-27 16:55:33','0:0:0:0:0:0:0:1'), ('2616','3','新增权限','权限的id：204权限的名字：查看菜单:资质变更审核列表  权限的url：','2017-07-27 16:57:39','0:0:0:0:0:0:0:1'), ('2617','3','添加菜单','菜单id:135；菜单名：资质变更审核列表；菜单的url：','2017-07-27 16:57:40','0:0:0:0:0:0:0:1'), ('2618','3','新增权限','权限的id：181权限的名字：查看菜单:入驻店铺信息管理  权限的url：','2017-07-27 16:58:25','0:0:0:0:0:0:0:1'), ('2619','3','修改菜单','菜单id:114；菜单名：入驻店铺信息管理；菜单的url：','2017-07-27 16:58:25','0:0:0:0:0:0:0:1'), ('2620','3','新增权限','权限的id：205权限的名字：编辑品牌  权限的url：/editBrand||/brand/toEditBrand','2017-07-27 17:17:23','0:0:0:0:0:0:0:1'), ('2621','3','新增权限','权限的id：206权限的名字：删除品牌  权限的url：/brand/batchDeleteBrand','2017-07-27 17:31:40','0:0:0:0:0:0:0:1'), ('2622','3','新增权限','权限的id：207权限的名字：编辑品牌  权限的url：/editBrand','2017-07-27 17:32:54','0:0:0:0:0:0:0:1'), ('2623','3','新增权限','权限的id：207权限的名字：编辑品牌  权限的url：/brand/editBrand','2017-07-27 17:33:31','0:0:0:0:0:0:0:1'), ('2624','3','修改角色权限','角色的id2；删除角色的id集合：80,125','2017-07-28 10:47:38','0:0:0:0:0:0:0:1'), ('2625','3','修改品牌','品牌ID:9；品牌名字：免税品','2017-07-28 10:52:41','0:0:0:0:0:0:0:1'), ('2626','3','修改权限','权限的id：195权限的名字：查看菜单:品牌管理  权限的url：/brand/list','2017-07-28 10:54:34','0:0:0:0:0:0:0:1'), ('2627','3','修改菜单','菜单id:125；菜单名：品牌管理；菜单的url：/brand/list','2017-07-28 10:54:35','0:0:0:0:0:0:0:1'), ('2628','3','添加商户','：操作人id:3','2017-07-28 14:35:15','0:0:0:0:0:0:0:1'), ('2629','3','添加商户','：操作人id:3','2017-07-28 14:54:34','0:0:0:0:0:0:0:1'), ('2630','3','添加商户','：操作人id:3','2017-07-28 15:01:19','0:0:0:0:0:0:0:1'), ('2631','3','审核通过创建用户管理商户','：操作人id:3','2017-07-28 15:01:20','0:0:0:0:0:0:0:1'), ('2632','3','删除菜单','菜单id:74；菜单名：营销中二级菜单；菜单的url：yxzx/ef333','2017-07-28 15:09:39','0:0:0:0:0:0:0:1'), ('2633','3','删除菜单','菜单id:69；菜单名：测试用根菜单；菜单的url：/test/a','2017-07-28 15:10:23','0:0:0:0:0:0:0:1'), ('2634','3','新增权限','权限的id：204权限的名字：查看菜单:资质变更审核列表  权限的url：/aptitude/list','2017-07-28 15:50:29','0:0:0:0:0:0:0:1'), ('2635','3','修改菜单','菜单id:135；菜单名：资质变更审核列表；菜单的url：/aptitude/list','2017-07-28 15:50:29','0:0:0:0:0:0:0:1'), ('2636','3','添加商户','：操作人id:3','2017-07-28 16:14:12','0:0:0:0:0:0:0:1'), ('2637','3','审核通过创建用户管理商户','：操作人id:3','2017-07-28 16:14:12','0:0:0:0:0:0:0:1'), ('2638','3','添加商户','：操作人id:3','2017-07-28 16:18:20','0:0:0:0:0:0:0:1'), ('2639','3','审核通过创建用户管理商户','：操作人id:3','2017-07-28 16:18:20','0:0:0:0:0:0:0:1'), ('2640','3','添加商户','：操作人id:3','2017-07-28 16:21:28','0:0:0:0:0:0:0:1'), ('2641','3','审核通过创建用户管理商户','：操作人id:3','2017-07-28 16:21:29','0:0:0:0:0:0:0:1'), ('2642','3','添加商户','操作人id:3','2017-07-28 16:39:36','0:0:0:0:0:0:0:1'), ('2643','3','审核通过创建用户管理商户','操作人id:3','2017-07-28 16:39:36','0:0:0:0:0:0:0:1'), ('2644','3','添加商户','操作人id:3','2017-07-28 16:45:22','0:0:0:0:0:0:0:1'), ('2645','3','添加商户','操作人id:3','2017-07-28 16:52:29','0:0:0:0:0:0:0:1'), ('2646','3','审核通过创建用户管理商户','操作人id:3','2017-07-28 16:52:29','0:0:0:0:0:0:0:1'), ('2647','3','添加商户','操作人id:3','2017-07-28 16:52:38','0:0:0:0:0:0:0:1'), ('2648','3','审核通过创建用户管理商户','操作人id:3','2017-07-28 16:52:38','0:0:0:0:0:0:0:1'), ('2649','3','添加商户','操作人id:3','2017-07-28 16:55:42','0:0:0:0:0:0:0:1'), ('2650','3','审核通过创建用户管理商户','操作人id:3','2017-07-28 16:55:43','0:0:0:0:0:0:0:1'), ('2651','3','修改商户','操作人id:3','2017-07-28 17:01:50','0:0:0:0:0:0:0:1'), ('2652','3','删除商户','操作人id:3','2017-07-28 17:01:57','0:0:0:0:0:0:0:1'), ('2653','3','添加类目','类目id:22 ; 类目名字： 一级类目0728 。','2017-07-28 17:15:57','0:0:0:0:0:0:0:1'), ('2654','3','添加商户','操作人id:3','2017-07-28 17:23:51','0:0:0:0:0:0:0:1'), ('2655','3','审核通过创建用户管理商户','操作人id:3','2017-07-28 17:23:51','0:0:0:0:0:0:0:1'), ('2656','3','添加商户','操作人id:3','2017-07-28 17:28:38','0:0:0:0:0:0:0:1'), ('2657','3','审核通过创建用户管理商户','操作人id:3','2017-07-28 17:28:38','0:0:0:0:0:0:0:1'), ('2658','3','添加商户','操作人id:3','2017-07-28 17:31:23','0:0:0:0:0:0:0:1'), ('2659','3','审核通过创建用户管理商户','操作人id:3','2017-07-28 17:31:23','0:0:0:0:0:0:0:1'), ('2660','3','添加商户','操作人id:3','2017-07-28 17:40:03','0:0:0:0:0:0:0:1'), ('2661','3','审核通过创建用户管理商户','操作人id:3','2017-07-28 17:40:03','0:0:0:0:0:0:0:1'), ('2662','3','新增权限','权限的id：208权限的名字：查看菜单:订单管理  权限的url：','2017-07-31 09:50:58','0:0:0:0:0:0:0:1'), ('2663','3','添加菜单','菜单id:136；菜单名：订单管理；菜单的url：','2017-07-31 09:50:58','0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2664','3','新增权限','权限的id：209权限的名字：查看菜单:订单列表  权限的url：order/list','2017-07-31 09:53:28','0:0:0:0:0:0:0:1'), ('2665','3','添加菜单','菜单id:137；菜单名：订单列表；菜单的url：order/list','2017-07-31 09:53:28','0:0:0:0:0:0:0:1'), ('2666','3','修改权限','权限的id：209权限的名字：查看菜单:订单列表  权限的url：/order/list','2017-07-31 09:53:40','0:0:0:0:0:0:0:1'), ('2667','3','修改菜单','菜单id:137；菜单名：订单列表；菜单的url：/order/list','2017-07-31 09:53:40','0:0:0:0:0:0:0:1'), ('2668','3','添加商户','操作人id:3','2017-07-31 10:43:35','0:0:0:0:0:0:0:1'), ('2669','3','审核通过创建用户管理商户','操作人id:3','2017-07-31 10:43:36','0:0:0:0:0:0:0:1'), ('2670','3','添加商户','操作人id:3','2017-07-31 11:02:09','0:0:0:0:0:0:0:1'), ('2671','3','审核通过创建用户管理商户','操作人id:3','2017-07-31 11:02:10','0:0:0:0:0:0:0:1'), ('2672','3','修改类目的序号','类目的id：9,11,15,20,19,21,16,17','2017-07-31 11:07:49','0:0:0:0:0:0:0:1'), ('2673','3','修改类目的序号','类目的id：11,9,21,15,20,19','2017-07-31 11:08:46','0:0:0:0:0:0:0:1'), ('2674','3','修改类目的序号','类目的id：9,11','2017-07-31 11:09:39','0:0:0:0:0:0:0:1'), ('2675','3','添加商户','操作人id:3','2017-07-31 11:15:54','0:0:0:0:0:0:0:1'), ('2676','3','审核通过创建用户管理商户','操作人id:3','2017-07-31 11:15:54','0:0:0:0:0:0:0:1'), ('2677','3','删除商户','操作人id:3','2017-07-31 11:16:01','0:0:0:0:0:0:0:1'), ('2678','3','添加商户','操作人id:3','2017-07-31 11:20:50','0:0:0:0:0:0:0:1'), ('2679','3','审核通过创建用户管理商户','操作人id:3','2017-07-31 11:20:51','0:0:0:0:0:0:0:1'), ('2680','3','添加商户','操作人id:3','2017-07-31 11:20:54','0:0:0:0:0:0:0:1'), ('2681','3','审核通过创建用户管理商户','操作人id:3','2017-07-31 11:20:54','0:0:0:0:0:0:0:1'), ('2682','3','修改商户','操作人id:3','2017-07-31 11:21:10','0:0:0:0:0:0:0:1'), ('2683','3','删除商户','操作人id:3','2017-07-31 11:21:14','0:0:0:0:0:0:0:1'), ('2684','3','修改类目的序号','类目的id：15,20,19,21','2017-07-31 11:24:03','0:0:0:0:0:0:0:1'), ('2685','3','修改类目的序号','类目的id：21,15,20,19','2017-07-31 11:24:23','0:0:0:0:0:0:0:1'), ('2686','3','修改类目的序号','类目的id：15,20,19,21','2017-07-31 11:32:25','0:0:0:0:0:0:0:1'), ('2687','3','修改类目的序号','类目的id：21,15,20,19','2017-07-31 11:32:41','0:0:0:0:0:0:0:1'), ('2688','3','修改类目的序号','类目的id：15,20,19,21','2017-07-31 11:35:01','0:0:0:0:0:0:0:1'), ('2689','3','添加类目','类目id:23 ; 类目名字： 上衣三级类目1 。','2017-07-31 11:44:49','0:0:0:0:0:0:0:1'), ('2690','3','添加类目','类目id:24 ; 类目名字： 上衣三级类目2 。','2017-07-31 11:45:35','0:0:0:0:0:0:0:1'), ('2691','3','添加类目','类目id:25 ; 类目名字： 上衣三级类目3 。','2017-07-31 11:45:55','0:0:0:0:0:0:0:1'), ('2692','3','添加类目','类目id:26 ; 类目名字： 上衣三级类目3 。','2017-07-31 11:45:57','0:0:0:0:0:0:0:1'), ('2693','3','添加证书','证书id:15;证书名字七级证书;','2017-07-31 14:15:28','0:0:0:0:0:0:0:1'), ('2694','3','修改证书','证书id:15;证书名字七级证书;','2017-07-31 14:15:35','0:0:0:0:0:0:0:1'), ('2695','3','添加证书','证书id:16;证书名字卫生证书;','2017-07-31 14:15:48','0:0:0:0:0:0:0:1'), ('2696','3','删除文章','：操作人id:3','2017-07-31 14:33:43','0:0:0:0:0:0:0:1'), ('2697','3','删除文章分类','：操作人id:3','2017-07-31 14:34:55','0:0:0:0:0:0:0:1'), ('2698','3','修改类目的序号','类目的id：21,15,20,19,23,24,25,26','2017-07-31 14:42:17','0:0:0:0:0:0:0:1'), ('2699','3','修改类目的序号','类目的id：15,20,19,21','2017-07-31 14:42:29','0:0:0:0:0:0:0:1'), ('2700','3','删除类目','类目ID:22。','2017-07-31 14:43:40','0:0:0:0:0:0:0:1'), ('2701','3','删除类目','类目ID:17。','2017-07-31 14:44:17','0:0:0:0:0:0:0:1'), ('2702','3','添加类目','类目id:27 ; 类目名字： 一级类目 。','2017-07-31 15:11:52','0:0:0:0:0:0:0:1'), ('2703','3','添加类目','类目id:28 ; 类目名字： 二级类目 。','2017-07-31 15:12:11','0:0:0:0:0:0:0:1'), ('2704','3','添加类目','类目id:29 ; 类目名字： 三级类目 。','2017-07-31 15:13:18','0:0:0:0:0:0:0:1'), ('2705','3','添加类目','类目id:30 ; 类目名字： 三级类目 。','2017-07-31 15:13:21','0:0:0:0:0:0:0:1'), ('2706','3','修改类目的序号','类目的id：9,11,27,23,24,25,26,28,29,30','2017-07-31 15:14:46','0:0:0:0:0:0:0:1'), ('2707','null','修改商户','：操作人id:null','2017-07-31 15:19:18',NULL), ('2708','3','删除类目','类目ID:30,类目名字：三级类目。','2017-07-31 15:21:22','0:0:0:0:0:0:0:1'), ('2709','3','删除类目','类目ID:29,类目名字：三级类目。','2017-07-31 15:22:01','0:0:0:0:0:0:0:1'), ('2710','3','添加类目','类目id:31 ; 类目名字： 三级类目 。','2017-07-31 15:22:22','0:0:0:0:0:0:0:1'), ('2711','3','添加类目','类目id:32 ; 类目名字： 三级类目 。','2017-07-31 15:22:24','0:0:0:0:0:0:0:1'), ('2712','3','添加类目','类目id:33 ; 类目名字： 三级类目 。','2017-07-31 15:22:24','0:0:0:0:0:0:0:1'), ('2713','3','添加类目','类目id:34 ; 类目名字： 三级类目 。','2017-07-31 15:22:25','0:0:0:0:0:0:0:1'), ('2714','3','添加类目','类目id:35 ; 类目名字： 三级类目 。','2017-07-31 15:22:25','0:0:0:0:0:0:0:1'), ('2715','3','添加类目','类目id:36 ; 类目名字： 三级类目 。','2017-07-31 15:22:25','0:0:0:0:0:0:0:1'), ('2716','3','添加类目','类目id:37 ; 类目名字： 三级类目 。','2017-07-31 15:22:25','0:0:0:0:0:0:0:1'), ('2717','3','添加类目','类目id:38 ; 类目名字： 三级类目 。','2017-07-31 15:22:25','0:0:0:0:0:0:0:1'), ('2718','3','添加类目','类目id:39 ; 类目名字： 三级类目 。','2017-07-31 15:22:25','0:0:0:0:0:0:0:1'), ('2719','3','修改类目的序号','类目的id：31,32,33,34,35,36','2017-07-31 15:23:39','0:0:0:0:0:0:0:1'), ('2720','null','修改商户','：操作人id:null','2017-07-31 15:25:03',NULL), ('2721','3','修改品牌','品牌ID:11；品牌名字：航空精品','2017-07-31 15:24:36','0:0:0:0:0:0:0:1'), ('2722','null','修改商户','：操作人id:null','2017-07-31 15:25:27',NULL), ('2723','null','修改商户','：操作人id:null','2017-07-31 15:26:19',NULL), ('2724','null','修改商户','：操作人id:null','2017-07-31 15:30:03',NULL), ('2725','3','添加类目','类目id:40 ; 类目名字： 衣服二级类目 。','2017-07-31 15:30:28','0:0:0:0:0:0:0:1'), ('2726','3','添加类目','类目id:41 ; 类目名字： 衣服二级类目 。','2017-07-31 15:30:31','0:0:0:0:0:0:0:1'), ('2727','3','添加类目','类目id:42 ; 类目名字： 衣服二级类目 。','2017-07-31 15:30:31','0:0:0:0:0:0:0:1'), ('2728','3','修改类目的序号','类目的id：40,42,41','2017-07-31 15:30:59','0:0:0:0:0:0:0:1'), ('2729','null','修改商户','：操作人id:null','2017-07-31 15:33:23',NULL), ('2730','3','修改类目的序号','类目的id：21,15,20,19,42,40','2017-07-31 15:32:59','0:0:0:0:0:0:0:1'), ('2731','null','修改商户','：操作人id:null','2017-07-31 15:37:13',NULL), ('2732','3','修改类目的序号','类目的id：40,41,42','2017-07-31 15:40:00','0:0:0:0:0:0:0:1'), ('2733','null','修改商户','：操作人id:null','2017-07-31 15:41:44',NULL), ('2734','null','修改商户','：操作人id:null','2017-07-31 15:41:54',NULL), ('2735','null','修改商户','：操作人id:null','2017-07-31 15:42:33',NULL), ('2736','null','修改商户','：操作人id:null','2017-07-31 15:45:46',NULL), ('2737','null','修改商户','：操作人id:null','2017-07-31 16:47:18',NULL), ('2738','null','修改商户','：操作人id:null','2017-07-31 16:52:21',NULL), ('2739','3','修改商户','操作人id:3','2017-07-31 20:08:20','0:0:0:0:0:0:0:1'), ('2740','3','修改商户','操作人id:3','2017-07-31 20:08:28','0:0:0:0:0:0:0:1'), ('2741','3','修改商户','操作人id:3','2017-07-31 20:08:39','0:0:0:0:0:0:0:1'), ('2742','3','修改商户','操作人id:3','2017-07-31 20:08:46','0:0:0:0:0:0:0:1'), ('2743','3','修改商户','操作人id:3','2017-07-31 20:11:46','0:0:0:0:0:0:0:1'), ('2744','3','修改商户','操作人id:3','2017-07-31 20:12:09','0:0:0:0:0:0:0:1'), ('2745','3','添加商户','操作人id:3','2017-08-01 09:15:35','0:0:0:0:0:0:0:1'), ('2746','3','审核通过创建用户管理商户','操作人id:3','2017-08-01 09:15:36','0:0:0:0:0:0:0:1'), ('2747','3','添加商户','操作人id:3','2017-08-01 09:26:51','0:0:0:0:0:0:0:1'), ('2748','3','添加商户','操作人id:3','2017-08-01 09:29:24','0:0:0:0:0:0:0:1'), ('2749','3','审核通过创建用户管理商户','操作人id:3','2017-08-01 09:29:24','0:0:0:0:0:0:0:1'), ('2750','3','添加商户','操作人id:3','2017-08-01 09:30:01','0:0:0:0:0:0:0:1'), ('2751','3','审核通过创建用户管理商户','操作人id:3','2017-08-01 09:30:01','0:0:0:0:0:0:0:1'), ('2752','3','添加商户','操作人id:3','2017-08-01 09:31:05','0:0:0:0:0:0:0:1'), ('2753','3','审核通过创建用户管理商户','操作人id:3','2017-08-01 09:31:05','0:0:0:0:0:0:0:1'), ('2754','3','添加文章','：操作人id:3','2017-08-01 10:06:13','0:0:0:0:0:0:0:1'), ('2755','3','添加文章','：操作人id:3','2017-08-01 10:12:05','0:0:0:0:0:0:0:1'), ('2756','3','修改文章','：操作人id:3','2017-08-01 10:12:37','0:0:0:0:0:0:0:1'), ('2757','3','添加文章','：操作人id:3','2017-08-01 10:13:22','0:0:0:0:0:0:0:1'), ('2758','3','新增权限','权限的id：210权限的名字：查看菜单:商品属性模板列表  权限的url：/goodCategoryPropertyTemplet/list','2017-08-01 10:15:21','0:0:0:0:0:0:0:1'), ('2759','3','添加菜单','菜单id:138；菜单名：商品属性模板列表；菜单的url：/goodCategoryPropertyTemplet/list','2017-08-01 10:15:21','0:0:0:0:0:0:0:1'), ('2760','3','修改商户','操作人id:3','2017-08-01 10:19:27','0:0:0:0:0:0:0:1'), ('2761','3','修改商户','操作人id:3','2017-08-01 10:19:33','0:0:0:0:0:0:0:1'), ('2762','3','修改商户','操作人id:3','2017-08-01 10:19:45','0:0:0:0:0:0:0:1'), ('2763','3','修改商户','操作人id:3','2017-08-01 10:20:08','0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2764','3','修改商户','操作人id:3','2017-08-01 10:20:16','0:0:0:0:0:0:0:1'), ('2765','3','修改商户','操作人id:3','2017-08-01 10:44:36','0:0:0:0:0:0:0:1'), ('2766','3','修改商户','操作人id:3','2017-08-01 10:51:12','0:0:0:0:0:0:0:1'), ('2767','3','删除商户','操作人id:3','2017-08-01 10:51:21','0:0:0:0:0:0:0:1'), ('2768','3','添加商户','操作人id:3','2017-08-01 10:55:30','0:0:0:0:0:0:0:1'), ('2769','3','添加商户','操作人id:3','2017-08-01 10:59:00','0:0:0:0:0:0:0:1'), ('2770','3','审核通过创建用户管理商户','操作人id:3','2017-08-01 10:59:00','0:0:0:0:0:0:0:1'), ('2771','3','添加商户','操作人id:3','2017-08-01 11:08:40','0:0:0:0:0:0:0:1'), ('2772','3','添加商户','操作人id:3','2017-08-01 11:11:49','0:0:0:0:0:0:0:1'), ('2773','3','审核通过创建用户管理商户','操作人id:3','2017-08-01 11:11:49','0:0:0:0:0:0:0:1'), ('2774','null','修改商户','操作人id:null','2017-08-01 11:50:05',NULL), ('2775','3','添加文章','：操作人id:3','2017-08-01 16:38:15','0:0:0:0:0:0:0:1'), ('2776','3','添加商户','商户名称南航7','2017-08-02 09:46:38','0:0:0:0:0:0:0:1'), ('2777','3','审核通过创建用户','用户名称:alice1','2017-08-02 09:46:39','0:0:0:0:0:0:0:1'), ('2778','3','修改商户','商户名称:南航2','2017-08-02 09:47:05','0:0:0:0:0:0:0:1'), ('2779','3','修改商户','商户名称:南航4','2017-08-02 09:55:00','0:0:0:0:0:0:0:1'), ('2780','3','删除商户','商户名称:null','2017-08-02 09:55:14','0:0:0:0:0:0:0:1'), ('2781','3','添加商户','商户名称南航8','2017-08-02 09:59:56','0:0:0:0:0:0:0:1'), ('2782','3','审核通过创建用户','用户名称:alice1','2017-08-02 09:59:57','0:0:0:0:0:0:0:1'), ('2783','3','修改类目的序号','类目的id：11,9','2017-08-02 10:25:08','0:0:0:0:0:0:0:1'), ('2784','3','修改类目的序号','类目的id：9,11','2017-08-02 10:25:15','0:0:0:0:0:0:0:1'), ('2785','3','新增或修改属性模板','模板类目id:5;模板名字：21','2017-08-02 10:28:13','0:0:0:0:0:0:0:1'), ('2786','3','新增或修改属性模板','模板类目id:5;模板名字：三级类目模板','2017-08-02 10:39:00','0:0:0:0:0:0:0:1'), ('2787','3','批量删除品牌','品牌ID：（56,57）。','2017-08-02 11:23:10','192.168.1.215'), ('2788','3','批量删除品牌','品牌ID：（58,59）。','2017-08-02 11:23:18','192.168.1.215'), ('2789','3','批量删除品牌','品牌ID：（60,61）。','2017-08-02 11:24:15','192.168.1.215'), ('2790','3','添加文章','添加的文章名称时尚街拍：街拍女孩儿的牛仔裤，最后那个腿是真的好看！','2017-08-02 11:37:20','0:0:0:0:0:0:0:1'), ('2791','3','添加文章','添加的文章名称街拍：出行逛街的姐妹闺蜜，欢笑中钱包厚度锐减','2017-08-02 11:37:57','0:0:0:0:0:0:0:1'), ('2792','3','新增权限','权限的id：211权限的名字：查看菜单:配送管理  权限的url：','2017-08-02 11:41:18','0:0:0:0:0:0:0:1'), ('2793','3','添加菜单','菜单id:139；菜单名：配送管理；菜单的url：','2017-08-02 11:41:19','0:0:0:0:0:0:0:1'), ('2794','3','新增权限','权限的id：212权限的名字：查看菜单:自取点列表  权限的url：','2017-08-02 11:43:36','0:0:0:0:0:0:0:1'), ('2795','3','添加菜单','菜单id:140；菜单名：自取点列表；菜单的url：','2017-08-02 11:43:36','0:0:0:0:0:0:0:1'), ('2796','3','新增权限','权限的id：213权限的名字：查看菜单:添加自取点  权限的url：','2017-08-02 11:44:21','0:0:0:0:0:0:0:1'), ('2797','3','添加菜单','菜单id:141；菜单名：添加自取点；菜单的url：','2017-08-02 11:44:22','0:0:0:0:0:0:0:1'), ('2798','3','新增权限','权限的id：214权限的名字：查看菜单:物流公司列表  权限的url：','2017-08-02 11:45:10','0:0:0:0:0:0:0:1'), ('2799','3','添加菜单','菜单id:142；菜单名：物流公司列表；菜单的url：','2017-08-02 11:45:10','0:0:0:0:0:0:0:1'), ('2800','3','删除类目','类目ID:35,类目名字：三级类目5。','2017-08-02 14:18:25','192.168.1.215'), ('2801','3','删除类目','类目ID:36,类目名字：三级类目6。','2017-08-02 14:18:25','192.168.1.215'), ('2802','3','批量删除品牌','品牌ID：（1,2,3）。','2017-08-02 15:42:37','0:0:0:0:0:0:0:1'), ('2803','3','删除属性模板','模板类目ID：11','2017-08-02 15:46:40','0:0:0:0:0:0:0:1'), ('2804','3','删除属性模板','模板类目ID：9','2017-08-02 15:48:06','0:0:0:0:0:0:0:1'), ('2805','3','删除属性模板','模板类目ID：10','2017-08-02 15:48:06','0:0:0:0:0:0:0:1'), ('2806','3','修改品牌','品牌ID:64；品牌名字：21','2017-08-02 17:13:43','0:0:0:0:0:0:0:1'), ('2807','3','新增或修改属性模板','模板类目id:20;模板名字：联想笔记本属性模板','2017-08-02 17:18:36','0:0:0:0:0:0:0:1'), ('2808','3','新增或修改属性模板','模板类目id:20;模板名字：联想笔记本属性模板','2017-08-02 17:22:53','0:0:0:0:0:0:0:1'), ('2809','3','添加类目','类目id:43 ; 类目名字： 衣服三级类目 。','2017-08-02 17:26:40','0:0:0:0:0:0:0:1'), ('2810','null','修改商户','商户名称:南航','2017-08-02 17:31:30',NULL), ('2811','null','修改商户','商户名称:南航','2017-08-02 17:34:28',NULL), ('2812','3','修改品牌','品牌ID:64；品牌名字：21','2017-08-02 17:37:26','0:0:0:0:0:0:0:1'), ('2813','3','修改品牌','品牌ID:14；品牌名字：小米','2017-08-02 19:04:31','0:0:0:0:0:0:0:1'), ('2814','3','修改品牌','品牌ID:14；品牌名字：小米','2017-08-02 19:04:44','0:0:0:0:0:0:0:1'), ('2815','3','修改品牌','品牌ID:14；品牌名字：小米','2017-08-02 19:04:56','0:0:0:0:0:0:0:1'), ('2816','3','修改品牌','品牌ID:10；品牌名字：跨境购','2017-08-02 19:09:19','0:0:0:0:0:0:0:1'), ('2817','3','删除属性模板','模板类目ID：5','2017-08-03 08:47:36','0:0:0:0:0:0:0:1'), ('2818','3','删除属性模板','模板类目ID：6','2017-08-03 08:47:44','0:0:0:0:0:0:0:1'), ('2819','3','删除属性模板','模板类目ID：7','2017-08-03 08:47:44','0:0:0:0:0:0:0:1'), ('2820','null','修改商户','商户名称:南航','2017-08-03 08:59:13',NULL), ('2821','3','修改角色权限','角色的id2；删除角色的id集合：78,79,86','2017-08-03 09:04:23','0:0:0:0:0:0:0:1'), ('2822','3','修改角色权限','角色的id2；删除角色的id集合：118,88,118','2017-08-03 09:05:43','0:0:0:0:0:0:0:1'), ('2823','3','修改角色权限','角色的id4；删除角色的id集合：63,64,65,66,67,68,69,70,71,73,74,75,78,79,80,83,86,87,88,96,98,99,107,111,116,118,119,125','2017-08-03 09:08:01','0:0:0:0:0:0:0:1'), ('2824','3','修改角色权限','角色的id5；删除角色的id集合：63,64,65,66,67,68,69,70,71,73,74,75,78,79,80,83,85,86,87,88,96,98,99,107,111,116,118,119,125','2017-08-03 09:08:27','0:0:0:0:0:0:0:1'), ('2825','null','修改商户','商户名称:南航','2017-08-03 09:26:53',NULL), ('2826','null','修改商户','商户名称:南航7','2017-08-03 09:29:35',NULL), ('2827','null','修改商户','商户名称:南航8','2017-08-03 09:32:01',NULL), ('2828','null','修改商户','商户名称:南航','2017-08-03 09:35:36',NULL), ('2829','null','修改商户','商户名称:南航7','2017-08-03 09:41:34',NULL), ('2830','3','禁止用户登录','用户ID：25','2017-08-03 10:12:59','0:0:0:0:0:0:0:1'), ('2831','3','禁止用户登录','用户ID：24','2017-08-03 10:13:08','0:0:0:0:0:0:0:1'), ('2832','3','开放用户登录','用户ID：25','2017-08-03 10:29:40','0:0:0:0:0:0:0:1'), ('2833','3','禁止用户登录','用户ID：25','2017-08-03 10:29:56','0:0:0:0:0:0:0:1'), ('2834','3','禁止用户登录','用户ID：2','2017-08-03 10:30:02','0:0:0:0:0:0:0:1'), ('2835','3','开放用户登录','用户ID：2','2017-08-03 10:30:30','0:0:0:0:0:0:0:1'), ('2836','3','删除属性模板','模板类目ID：3','2017-08-03 10:32:09','0:0:0:0:0:0:0:1'), ('2837','3','删除属性模板','模板类目ID：4','2017-08-03 10:32:09','0:0:0:0:0:0:0:1'), ('2838','3','新增用户','用户邮箱：2121；用户id：53','2017-08-03 10:45:54','0:0:0:0:0:0:0:1'), ('2839','null','修改商户','商户名称:南航','2017-08-03 10:55:09',NULL), ('2840','null','修改商户','商户名称:南航6','2017-08-03 10:55:22',NULL), ('2841','3','新增用户','用户邮箱：221221；用户id：54','2017-08-03 11:08:57','0:0:0:0:0:0:0:1'), ('2842','3','添加文章','添加的文章名称发的说法','2017-08-03 11:22:41','0:0:0:0:0:0:0:1'), ('2843','null','修改商户','商户名称:南航7','2017-08-03 11:35:40',NULL), ('2844','3','新增用户','用户邮箱：1；用户id：55','2017-08-03 11:58:08','0:0:0:0:0:0:0:1'), ('2845','3','新增用户','用户邮箱：1；用户id：56','2017-08-03 11:59:32','0:0:0:0:0:0:0:1'), ('2846','3','新增用户','用户邮箱：11；用户id：57','2017-08-03 14:34:06','0:0:0:0:0:0:0:1'), ('2847','3','修改权限','权限的id：184权限的名字：查看菜单:商家信息管理  权限的url：/shop/sellerMessageList','2017-08-03 16:30:22','0:0:0:0:0:0:0:1'), ('2848','3','修改菜单','菜单id:117；菜单名：商家信息管理；菜单的url：/shop/sellerMessageList','2017-08-03 16:30:22','0:0:0:0:0:0:0:1'), ('2849','3','添加类目','类目id:44 ; 类目名字： 一级类目0728 。','2017-08-04 08:53:18','0:0:0:0:0:0:0:1'), ('2850','3','修改类目','类目ID16;类目名字上衣','2017-08-04 09:31:58','0:0:0:0:0:0:0:1'), ('2851','3','修改类目','类目ID16;类目名字上衣','2017-08-04 09:32:40','0:0:0:0:0:0:0:1'), ('2852','3','修改类目','类目ID23;类目名字上衣三级类目1','2017-08-04 09:59:20','0:0:0:0:0:0:0:1'), ('2853','3','修改类目','类目ID23;类目名字上衣三级类目1','2017-08-04 10:01:55','0:0:0:0:0:0:0:1'), ('2854','3','修改商家消息','商家消息ID:3, 商家消息标题：商城正式上线','2017-08-04 10:03:19','0:0:0:0:0:0:0:1'), ('2855','3','修改商家消息','商家消息ID:3, 商家消息标题：商城正式上线','2017-08-04 10:03:21','0:0:0:0:0:0:0:1'), ('2856','3','修改商家消息','商家消息ID:3, 商家消息标题：商城正式上线','2017-08-04 10:03:24','0:0:0:0:0:0:0:1'), ('2857','3','修改商家消息','商家消息ID:1, 商家消息标题：测试a','2017-08-04 10:04:01','0:0:0:0:0:0:0:1'), ('2858','3','添加商家消息','商家消息ID:4, 商家消息标题：aaaaaaaaaaa。','2017-08-04 10:09:37','0:0:0:0:0:0:0:1'), ('2859','3','修改商家消息','商家消息ID:4, 商家消息标题：aaaaaaaaaaa','2017-08-04 10:09:50','0:0:0:0:0:0:0:1'), ('2860','3','修改商家消息','商家消息ID:1, 商家消息标题：测试a','2017-08-04 10:10:39','0:0:0:0:0:0:0:1'), ('2861','3','修改商家消息','商家消息ID:3, 商家消息标题：商城正式上线','2017-08-04 10:10:45','0:0:0:0:0:0:0:1'), ('2862','3','修改商家消息','商家消息ID:1, 商家消息标题：测试a','2017-08-04 10:10:50','0:0:0:0:0:0:0:1'), ('2863','3','修改商家消息','商家消息ID:3, 商家消息标题：商城正式上线','2017-08-04 10:10:52','0:0:0:0:0:0:0:1');
INSERT INTO `csair_log_operation` VALUES ('2864','3','修改类目','类目ID44;类目名字一级类目0729','2017-08-04 10:31:39','0:0:0:0:0:0:0:1'), ('2865','3','添加类目','类目id:45 ; 类目名字： 二级类目11 。','2017-08-04 10:32:10','0:0:0:0:0:0:0:1'), ('2866','3','修改类目','类目ID45;类目名字二级类目11','2017-08-04 10:32:19','0:0:0:0:0:0:0:1'), ('2867','3','添加类目','类目id:46 ; 类目名字： 三级类目22 。','2017-08-04 10:32:46','0:0:0:0:0:0:0:1'), ('2868','3','添加类目','类目id:47 ; 类目名字： 三级类目222 。','2017-08-04 10:33:14','0:0:0:0:0:0:0:1'), ('2869','3','修改类目','类目ID25;类目名字上衣三级类目4','2017-08-04 11:10:03','0:0:0:0:0:0:0:1'), ('2870','3','修改类目的序号','类目的id：44,20,19,40,41,42,23,24,25,26,43,31,32,33,34,45,46,47','2017-08-04 11:15:18','0:0:0:0:0:0:0:1'), ('2871','3','修改类目的序号','类目的id：26,25','2017-08-04 11:15:31','0:0:0:0:0:0:0:1'), ('2872','3','修改类目的序号','类目的id：25,26,24,23','2017-08-04 11:15:53','0:0:0:0:0:0:0:1'), ('2873','3','添加商家消息','商家消息ID:5, 商家消息标题：bbbbbbbb。','2017-08-04 11:20:51','0:0:0:0:0:0:0:1'), ('2874','3','新增或修改属性模板','模板类目id:47;模板名字：1212121','2017-08-04 11:22:41','0:0:0:0:0:0:0:1'), ('2875','3','修改商家消息','商家消息ID:1, 商家消息标题：测试huangbiao。','2017-08-04 11:27:53','0:0:0:0:0:0:0:1'), ('2876','3','新增或修改属性模板','模板类目id:46;模板名字：三级类目22','2017-08-04 11:29:55','0:0:0:0:0:0:0:1'), ('2877','3','删除类目','类目ID:33,类目名字：三级类目3。','2017-08-04 11:30:59','0:0:0:0:0:0:0:1'), ('2878','3','删除类目','类目ID:34,类目名字：三级类目4。','2017-08-04 11:30:59','0:0:0:0:0:0:0:1'), ('2879','3','修改商家消息','商家消息ID:3, 商家消息标题：商城正式上线','2017-08-04 11:38:48','0:0:0:0:0:0:0:1'), ('2880','3','修改商家消息','商家消息ID:3, 商家消息标题：商城正式上线','2017-08-04 11:39:59','0:0:0:0:0:0:0:1'), ('2881','3','修改商家消息','商家消息ID:1, 商家消息标题：测试huangbiao','2017-08-04 11:41:19','0:0:0:0:0:0:0:1'), ('2882','3','修改商家消息','商家消息ID:1, 商家消息标题：测试huangbiao','2017-08-04 11:44:27','0:0:0:0:0:0:0:1'), ('2883','3','修改商家消息','商家消息ID:2, 商家消息标题：测试b','2017-08-04 11:44:28','0:0:0:0:0:0:0:1'), ('2884','3','修改商家消息','商家消息ID:5, 商家消息标题：bbbbbbbb','2017-08-04 11:45:26','0:0:0:0:0:0:0:1'), ('2885','3','修改商家消息','商家消息ID:5, 商家消息标题：bbbbbbbb','2017-08-04 11:45:42','0:0:0:0:0:0:0:1'), ('2886','3','修改商家消息','商家消息ID:4, 商家消息标题：aaaaaaaaaaa','2017-08-04 11:45:50','0:0:0:0:0:0:0:1'), ('2887','3','修改商家消息','商家消息ID:1, 商家消息标题：测试huangbiao','2017-08-04 11:46:24','0:0:0:0:0:0:0:1'), ('2888','3','修改商家消息','商家消息ID:2, 商家消息标题：测试b','2017-08-04 11:46:29','0:0:0:0:0:0:0:1'), ('2889','3','修改商家消息','商家消息ID:3, 商家消息标题：商城正式上线','2017-08-04 11:46:35','0:0:0:0:0:0:0:1'), ('2890','3','修改商家消息','商家消息ID:1, 商家消息标题：测试huangbiao','2017-08-04 11:46:37','0:0:0:0:0:0:0:1'), ('2891','3','修改商家消息','商家消息ID:1, 商家消息标题：测试huangbiao','2017-08-04 11:46:43','0:0:0:0:0:0:0:1'), ('2892','3','修改商家消息','商家消息ID:1, 商家消息标题：测试huangbiao','2017-08-04 11:46:49','0:0:0:0:0:0:0:1'), ('2893','3','修改商家消息','商家消息ID:5, 商家消息标题：bbbbbbbb','2017-08-04 11:47:08','0:0:0:0:0:0:0:1'), ('2894','3','修改商家消息','商家消息ID:5, 商家消息标题：bbbbbbbb','2017-08-04 11:47:14','0:0:0:0:0:0:0:1'), ('2895','3','修改商家消息','商家消息ID:5, 商家消息标题：bbbbbbbb。','2017-08-04 11:47:49','0:0:0:0:0:0:0:1'), ('2896','3','修改商家消息','商家消息ID:5, 商家消息标题：bbbbbbbb','2017-08-04 11:48:01','0:0:0:0:0:0:0:1'), ('2897','3','修改商家消息','商家消息ID:2, 商家消息标题：测试b','2017-08-04 11:48:42','0:0:0:0:0:0:0:1'), ('2898','3','删除商家消息','商家消息ID:2','2017-08-04 11:54:42','0:0:0:0:0:0:0:1'), ('2899','3','修改商家消息','商家消息ID:4, 商家消息标题：aaaaaaaaaaa','2017-08-04 11:55:47','0:0:0:0:0:0:0:1'), ('2900','3','修改商家消息','商家消息ID:1, 商家消息标题：测试huangbiao','2017-08-04 11:55:58','0:0:0:0:0:0:0:1'), ('2901','3','修改商家消息','商家消息ID:5, 商家消息标题：bbbbbbbb','2017-08-04 11:57:19','0:0:0:0:0:0:0:1'), ('2902','3','修改商家消息','商家消息ID:1, 商家消息标题：测试huangbiao','2017-08-04 14:22:33','0:0:0:0:0:0:0:1'), ('2903','3','新增权限','权限的id：215权限的名字：查看菜单:店铺信息列表  权限的url：/shop/shopInfoList','2017-08-04 14:26:09','0:0:0:0:0:0:0:1'), ('2904','3','添加菜单','菜单id:143；菜单名：店铺信息列表；菜单的url：/shop/shopInfoList','2017-08-04 14:26:11','0:0:0:0:0:0:0:1'), ('2905','3','新增权限','权限的id：216权限的名字：查看菜单:店铺首页装修  权限的url：/shop/shopHomePageUpdate','2017-08-04 14:32:32','0:0:0:0:0:0:0:1'), ('2906','3','添加菜单','菜单id:144；菜单名：店铺首页装修；菜单的url：/shop/shopHomePageUpdate','2017-08-04 14:32:33','0:0:0:0:0:0:0:1'), ('2907','3','删除属性模板','模板类目ID：1','2017-08-04 14:56:37','0:0:0:0:0:0:0:1'), ('2908','3','删除属性模板','模板类目ID：2','2017-08-04 14:56:37','0:0:0:0:0:0:0:1'), ('2909','null','修改商户','商户名称:南航8','2017-08-04 15:07:11',NULL), ('2910','3','删除菜单','菜单id:134；菜单名：商铺增删该查操作；菜单的url：/shop/selectshop','2017-08-04 15:28:09','0:0:0:0:0:0:0:1'), ('2911','3','新增权限','权限的id：217权限的名字：查看菜单:保证金管理  权限的url：','2017-08-04 15:32:09','0:0:0:0:0:0:0:1'), ('2912','3','添加菜单','菜单id:145；菜单名：保证金管理；菜单的url：','2017-08-04 15:32:10','0:0:0:0:0:0:0:1'), ('2913','3','修改权限','权限的id：215权限的名字：查看菜单:店铺信息列表  权限的url：/shop/selectshop','2017-08-04 15:34:41','0:0:0:0:0:0:0:1'), ('2914','3','修改菜单','菜单id:143；菜单名：店铺信息列表；菜单的url：/shop/selectshop','2017-08-04 15:34:41','0:0:0:0:0:0:0:1'), ('2915','3','修改权限','权限的id：215权限的名字：查看菜单:店铺信息列表  权限的url：/shop/shopInfoList','2017-08-04 15:37:44','0:0:0:0:0:0:0:1'), ('2916','3','修改菜单','菜单id:143；菜单名：店铺信息列表；菜单的url：/shop/shopInfoList','2017-08-04 15:37:44','0:0:0:0:0:0:0:1'), ('2917','3','删除属性模板','模板类目ID：6','2017-08-04 15:47:16','0:0:0:0:0:0:0:1'), ('2918','3','删除属性模板','模板类目ID：7','2017-08-04 15:47:16','0:0:0:0:0:0:0:1'), ('2919','3','添加类目','类目id:48 ; 类目名字： 67589 。','2017-08-04 15:56:13','0:0:0:0:0:0:0:1'), ('2920','3','修改商家消息','商家消息ID:4, 商家消息标题：aaaaaaaaaaa','2017-08-04 16:12:46','0:0:0:0:0:0:0:1'), ('2921','3','修改类目的序号','类目的id：11,27,9,48,44','2017-08-04 16:31:28','0:0:0:0:0:0:0:1'), ('2922','3','新增或修改属性模板','模板类目id:43;模板名字：1221','2017-08-04 16:43:23','0:0:0:0:0:0:0:1'), ('2923','3','修改属性模板','模板类目id:46;模板名字：212112','2017-08-04 17:03:13','0:0:0:0:0:0:0:1'), ('2924','3','修改权限','权限的id：215权限的名字：查看菜单:店铺信息列表  权限的url：/shop/selectshop','2017-08-04 17:10:10','0:0:0:0:0:0:0:1'), ('2925','3','修改菜单','菜单id:143；菜单名：店铺信息列表；菜单的url：/shop/selectshop','2017-08-04 17:10:10','0:0:0:0:0:0:0:1'), ('2926','3','修改属性模板','模板类目id:46;模板名字：122112','2017-08-04 17:10:31','0:0:0:0:0:0:0:1'), ('2927','3','新增权限','权限的id：218权限的名字：查看菜单:商品增刪改查  权限的url：/shop/selectshop','2017-08-04 17:18:02','0:0:0:0:0:0:0:1'), ('2928','3','添加菜单','菜单id:146；菜单名：商品增刪改查；菜单的url：/shop/selectshop','2017-08-04 17:18:02','0:0:0:0:0:0:0:1'), ('2929','3','修改权限','权限的id：215权限的名字：查看菜单:店铺信息列表  权限的url：/shop/shopInfoList','2017-08-04 17:18:20','0:0:0:0:0:0:0:1'), ('2930','3','修改菜单','菜单id:143；菜单名：店铺信息列表；菜单的url：/shop/shopInfoList','2017-08-04 17:18:20','0:0:0:0:0:0:0:1'), ('2931','3','修改权限','权限的id：215权限的名字：查看菜单:店铺信息列表  权限的url：/shop/shopInfoList','2017-08-04 17:19:12','0:0:0:0:0:0:0:1'), ('2932','3','修改菜单','菜单id:143；菜单名：店铺信息列表；菜单的url：/shop/shopInfoList','2017-08-04 17:19:14','0:0:0:0:0:0:0:1'), ('2933','3','新增属性模板','模板类目id:47;模板名字：122121','2017-08-04 17:19:06','0:0:0:0:0:0:0:1'), ('2934','3','修改属性模板','模板类目id:47;模板名字：122121','2017-08-04 17:20:45','0:0:0:0:0:0:0:1');
INSERT INTO `csair_news` VALUES ('1','1','头条1','头条描述1','xxx/xxx1','内容','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL), ('2','2','头条2','头条描述2','xxx/xxx2','内容','2',NULL,'2017-07-31 14:32:25','',NULL,'','2017-07-31 14:32:07',NULL,'2017-07-31 14:32:03',NULL);
INSERT INTO `csair_order` VALUES ('10','10056','10001','1','1',NULL,'1','1','1','陈小明1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-08-01 11:30:16','2017-08-01 11:14:11','2017-08-01 11:13:56','2017-08-02 11:14:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL), ('11','10056','10001','1','1',NULL,'1','1','1','陈小明2','','','',NULL,NULL,NULL,NULL,'','11.00','11.00','11.00','11.00','2017-08-01 11:30:16','2017-08-01 11:14:11','2017-08-01 11:13:56','2017-08-02 11:14:04',NULL,'','',NULL,'11.00','11','11.00','11.00','11','111.00','11',NULL,'',NULL,NULL), ('12','10066','10002','2','2',NULL,'2','1',NULL,'陈小猪3','','','',NULL,NULL,NULL,NULL,'','123.00','123.00','123.00','123.00','2017-07-31 09:02:17','2017-07-31 09:02:32','2017-07-31 09:02:39','2017-07-31 09:02:43',NULL,'123','123',NULL,'123.00','123','123.00','123.00','123','213.00','213',NULL,'',NULL,NULL), ('13','10066','10002','2','2',NULL,'2','1',NULL,'陈小猪4','','','',NULL,NULL,NULL,NULL,'','123.00','123.00','123.00','123.00','2017-07-31 09:02:17','2017-07-31 09:02:32','2017-07-31 09:02:39','2017-07-31 09:02:43',NULL,'123','123',NULL,'123.00','123','123.00','123.00','123','213.00','213',NULL,'',NULL,NULL), ('14','10067','10006','3','1',NULL,'3','1',NULL,'猪小明5','','','',NULL,NULL,NULL,NULL,'','123.00','123.00','123.00','123.00','2017-07-31 09:02:17','2017-07-31 09:02:32','2017-07-31 09:02:39','2017-07-31 09:02:43',NULL,'123','123',NULL,'123.00','123','123.00','123.00','123','213.00','213',NULL,'',NULL,NULL), ('15','10067','10006','3','1',NULL,'3','1',NULL,'猪小明6','','','',NULL,NULL,NULL,NULL,'','123.00','123.00','123.00','123.00','2017-07-31 09:02:17','2017-07-31 09:02:32','2017-07-31 09:02:39','2017-07-31 09:02:43',NULL,'123','123',NULL,'123.00','123','123.00','123.00','123','213.00','213',NULL,'',NULL,NULL), ('16','10056','10001','1','1',NULL,'1','1','1','陈小明7','','','',NULL,NULL,NULL,NULL,'','11.00','11.00','11.00','11.00','2017-08-01 11:30:16','2017-08-01 11:14:11','2017-08-01 11:13:56','2017-08-02 11:14:04',NULL,'11','11',NULL,'11.00','11','1.00','1.00','1','1.00','1',NULL,'',NULL,NULL), ('17','10066','10002','2','2',NULL,'2','1',NULL,'陈小猪8','','','',NULL,NULL,NULL,NULL,'','123.00','123.00','123.00','123.00','2017-07-31 09:02:17','2017-07-31 09:02:32','2017-07-31 09:02:39','2017-07-31 09:02:43',NULL,'123','123',NULL,'123.00','123','123.00','123.00','123','213.00','213',NULL,'',NULL,NULL), ('18','10067','10006','3','1',NULL,'3','1',NULL,'猪小明9','','','',NULL,NULL,NULL,NULL,'','123.00','123.00','123.00','123.00','2017-07-31 09:02:17','2017-07-31 09:02:32','2017-07-31 09:02:39','2017-07-31 09:02:43',NULL,'123','123',NULL,'123.00','123','123.00','123.00','123','213.00','213',NULL,'',NULL,NULL), ('19','10056','10001','1','1',NULL,'1','1','1','陈小明10','','','',NULL,NULL,NULL,NULL,'','11.00','11.00','11.00','11.00','2017-08-01 11:30:16','2017-08-01 11:14:11','2017-08-01 11:13:56','2017-08-02 11:14:04',NULL,'','',NULL,'11.00','11','11.00','11.00','11','111.00','11',NULL,'',NULL,NULL), ('20','10066','10002','2','2',NULL,'2','1',NULL,'陈小猪11','','','',NULL,NULL,NULL,NULL,'','123.00','123.00','123.00','123.00','2017-07-31 09:02:17','2017-07-31 09:02:32','2017-07-31 09:02:39','2017-07-31 09:02:43',NULL,'123','123',NULL,'123.00','123','123.00','123.00','123','213.00','213',NULL,'',NULL,NULL), ('21','10067','10006','3','1',NULL,'3','1',NULL,'猪小明12','','','',NULL,NULL,NULL,NULL,'','123.00','123.00','123.00','123.00','2017-07-31 09:02:17','2017-07-31 09:02:32','2017-07-31 09:02:39','2017-07-31 09:02:43',NULL,'123','123',NULL,'123.00','123','123.00','123.00','123','213.00','213',NULL,'',NULL,NULL), ('22','10066','10002','2','2',NULL,'2','1',NULL,'陈小猪13','','','',NULL,NULL,NULL,NULL,'','123.00','123.00','123.00','123.00','2017-07-31 09:02:17','2017-07-31 09:02:32','2017-07-31 09:02:39','2017-07-31 09:02:43',NULL,'123','123',NULL,'123.00','123','123.00','123.00','123','213.00','213',NULL,'',NULL,NULL), ('23','10067','10006','3','1',NULL,'3','1',NULL,'猪小明14','','','',NULL,NULL,NULL,NULL,'','123.00','123.00','123.00','123.00','2017-07-31 09:02:17','2017-07-31 09:02:32','2017-07-31 09:02:39','2017-07-31 09:02:43',NULL,'123','123',NULL,'123.00','123','123.00','123.00','123','213.00','213',NULL,'',NULL,NULL), ('24','10056','10001','1','1',NULL,'1','1','1','陈小明15','','','',NULL,NULL,NULL,NULL,'','11.00','11.00','11.00','11.00','2017-08-01 11:30:16','2017-08-01 11:14:11','2017-08-01 11:13:56','2017-08-02 11:14:04',NULL,'','',NULL,'11.00','11','11.00','11.00','11','111.00','11',NULL,'',NULL,NULL), ('25','10066','10002','2','2',NULL,'2','1',NULL,'陈小猪16','','','',NULL,NULL,NULL,NULL,'','123.00','123.00','123.00','123.00','2017-07-31 09:02:17','2017-07-31 09:02:32','2017-08-02 09:02:39','2017-07-31 09:02:43',NULL,'123','123',NULL,'123.00','123','123.00','123.00','123','213.00','213',NULL,'',NULL,NULL), ('26','10067','10006','3','1',NULL,'3','1',NULL,'猪小明17','','','',NULL,NULL,NULL,NULL,'','123.00','123.00','123.00','123.00','2017-07-31 09:02:17','2017-07-31 09:02:32','2017-08-02 09:02:39','2017-07-31 09:02:43',NULL,'123','123',NULL,'123.00','123','123.00','123.00','123','213.00','213',NULL,'',NULL,NULL), ('27','10056','10001','1','1',NULL,'1','1','1','陈小明18','','','',NULL,NULL,NULL,NULL,'','11.00','11.00','11.00','11.00','2017-08-01 11:30:16','2017-08-01 11:14:11','2017-08-03 11:13:56','2017-08-02 11:14:04',NULL,'11','11',NULL,'11.00','11','1.00','1.00','1','1.00','1',NULL,'',NULL,NULL), ('28','10066','10002','2','2',NULL,'2','1',NULL,'陈小猪19','','','',NULL,NULL,NULL,NULL,'','123.00','123.00','123.00','123.00','2017-07-31 09:02:17','2017-07-31 09:02:32','2017-07-31 09:02:39','2017-07-31 09:02:43',NULL,'123','123',NULL,'123.00','123','123.00','123.00','123','213.00','213',NULL,'',NULL,NULL), ('29','10067','10006','3','1',NULL,'3','1',NULL,'猪小明20','','','',NULL,NULL,NULL,NULL,'','123.00','123.00','123.00','123.00','2017-07-31 09:02:17','2017-07-31 09:02:32','2017-07-31 09:02:39','2017-07-31 09:02:43',NULL,'123','123',NULL,'123.00','123','123.00','123.00','123','213.00','213',NULL,'',NULL,NULL), ('30','10056','10001','1','1',NULL,'1','1','1','陈小明21','','','',NULL,NULL,NULL,NULL,'','11.00','11.00','11.00','11.00','2017-08-01 11:30:16','2017-08-01 11:14:11','2017-08-01 11:13:56','2017-08-02 11:14:04',NULL,'','',NULL,'11.00','11','11.00','11.00','11','111.00','11',NULL,'',NULL,NULL), ('31','10066','10002','2','2',NULL,'2','1',NULL,'陈小猪22','','','',NULL,NULL,NULL,NULL,'','123.00','123.00','123.00','123.00','2017-07-31 09:02:17','2017-07-31 09:02:32','2017-07-31 09:02:39','2017-07-31 09:02:43',NULL,'123','123',NULL,'123.00','123','123.00','123.00','123','213.00','213',NULL,'',NULL,NULL), ('32','10067','10006','3','1',NULL,'3','1',NULL,'猪小明23','','','',NULL,NULL,NULL,NULL,'','123.00','123.00','123.00','123.00','2017-07-31 09:02:17','2017-07-31 09:02:32','2017-07-31 09:02:39','2017-07-31 09:02:43',NULL,'123','123',NULL,'123.00','123','123.00','123.00','123','213.00','213',NULL,'',NULL,NULL);
INSERT INTO `csair_remind_me` VALUES ('2','1','1','2','2017-07-14 19:22:43'), ('3','1','1','3','2017-08-05 19:22:35'), ('4','2','1','1','2017-07-15 19:26:02');
INSERT INTO `csair_search` VALUES ('1','1','搜索1','192.168.1.222','2017-08-01 09:58:21','0'), ('2','1','搜索2','192.168.1.222','2017-08-01 07:58:21','0'), ('3','1','搜索3','192.168.1.222','2017-08-22 09:58:21','0'), ('4','1','搜索3','192.168.1.222','2017-08-25 09:58:21','0'), ('5','1','搜索3','192.168.1.222','2017-08-30 09:58:21','0'), ('6','1','搜索3','192.168.1.222','2017-08-20 09:58:21','0'), ('7','1','搜索7','192.168.1.222','2017-08-01 09:58:21','0'), ('8','1','搜索8','192.168.1.222','2017-08-01 09:58:21','0'), ('9','1','搜索9','192.168.1.222','2017-02-01 09:58:21','0'), ('10','1','搜索1','192.168.1.222','2017-08-14 09:58:21','0'), ('11','1','搜索1','192.168.1.222','2017-08-22 09:58:21','0'), ('12','1','搜索2','192.168.1.222','2017-08-01 09:58:21','0');
INSERT INTO `csair_seller_message` VALUES ('1','测试huangbiao','测试测试','2','2017-08-02 18:28:13','2017-08-03 18:28:15','2017-08-04 11:27:51',NULL,'1','0'), ('2','测试b','测试测试','3','2017-08-02 18:50:05','2017-08-02 18:50:07',NULL,'2017-08-04 11:54:42','1','1'), ('3','商城正式上线','商城正式上线','0','2017-08-04 10:01:59','2017-01-04 09:54:33',NULL,NULL,'1','0'), ('4','aaaaaaaaaaa','商城正式上线','1','2017-08-04 10:09:34','2017-01-04 10:04:01',NULL,NULL,'1','0'), ('5','bbbbbbbb','商城正式上线','0','2017-08-04 11:20:47','2017-08-04 11:09:34','2017-08-04 11:47:49',NULL,'1','0');
INSERT INTO `csair_shop` VALUES ('1','南航','2017-07-31 11:20:50','0','1','尼古拉斯.二狗子','2341@qq.com','3122131','13122333212','好店','1','1.00','1','1','1','1','1','0','2017-07-31 11:20:50','','43','1'), ('2','南航6','2017-08-01 11:11:49','0','1','二狗子6237','sabvfdja@qq.com','3122131','18822333212','efgtwq','6','6.00','6','6','6','6','6','0','2017-08-01 11:11:49','','50','2'), ('3','南航7','2017-08-02 09:46:38','0','0','王麻子','129129129@qq.com','1291291','13122333212','王麻子二店','6','6.00','6','6','6','6','6','0','2017-08-02 09:46:38','','51','3'), ('4','南航8','2017-08-02 09:59:56','0','0','王麻子4','2341@qq.com','3122131','18822333212','为什么','7','7.00','77','7','7','7','7','2','2017-08-02 09:59:56','审核不通过,请修改; 太丑啦啦啦啦啦','52','4');
INSERT INTO `csair_shop_apply` VALUES ('1','1','南方航空','南航',NULL,NULL,NULL,NULL,'尼古拉斯.狗子','555555555555555555','1',NULL,NULL,NULL,NULL,NULL,'17091098601','北京北京市东城区东华门街道',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'招商银行',NULL,'232454343434',NULL,NULL,NULL,NULL,NULL,NULL,'e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg'), ('2','2','南方航空2','南航2',NULL,NULL,NULL,NULL,'尼古拉斯.狗子2','555555555555555555','1',NULL,NULL,NULL,NULL,NULL,'17091098601','北京北京市东城区东华门街道2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'招商银行',NULL,'232454343434',NULL,NULL,NULL,NULL,NULL,NULL,'e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg'), ('3','3','南方航空3','南航3',NULL,NULL,NULL,NULL,'尼古拉斯.狗子3','555555555555555555','1',NULL,NULL,NULL,NULL,NULL,'17091098601','北京北京市东城区东华门街道3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'招商银行',NULL,'232454343434',NULL,NULL,NULL,NULL,NULL,NULL,'e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg'), ('4','4','南方航空4','南航4',NULL,NULL,NULL,NULL,'尼古拉斯.狗子4','555555555555555555','1',NULL,NULL,NULL,NULL,NULL,'17091098601','北京北京市东城区东华门街道4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'招商银行',NULL,'232454343434',NULL,NULL,NULL,NULL,NULL,NULL,'e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg'), ('5','5','南方航空5','南航5',NULL,NULL,NULL,NULL,'尼古拉斯.狗子5','555555555555555555','1',NULL,NULL,NULL,NULL,NULL,'17091098601','北京北京市东城区东华门街道5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'招商银行',NULL,'232454343434',NULL,NULL,NULL,NULL,NULL,NULL,'e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg'), ('6','6','南方航空6','南航6',NULL,NULL,NULL,NULL,'尼古拉斯.狗子6','555555555555555555','1',NULL,NULL,NULL,NULL,NULL,'17091098601','北京北京市东城区东华门街道6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'招商银行',NULL,'232454343434',NULL,NULL,NULL,NULL,NULL,NULL,'e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg'), ('7','7','南方航空7','南航7',NULL,NULL,NULL,NULL,'尼古拉斯.狗子7','555555555555555555','1',NULL,NULL,NULL,NULL,NULL,'17091098601','北京北京市东城区东华门街道7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'招商银行',NULL,'232454343434',NULL,NULL,NULL,NULL,NULL,NULL,'e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg'), ('8','8','南方航空8','南航8',NULL,NULL,NULL,NULL,'尼古拉斯.狗子8','555555555555555555','1',NULL,NULL,NULL,NULL,NULL,'17091098601','北京北京市东城区东华门街道8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'招商银行',NULL,'232454343434',NULL,NULL,NULL,NULL,NULL,NULL,'e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg'), ('9','9','南方航空9','南航9',NULL,NULL,NULL,NULL,'尼古拉斯.狗子9','555555555555555555','1',NULL,NULL,NULL,NULL,NULL,'17091098601','北京北京市东城区东华门街道9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'招商银行',NULL,'232454343434',NULL,NULL,NULL,NULL,NULL,NULL,'e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg'), ('10','10','南方航空10','南航10',NULL,NULL,NULL,NULL,'尼古拉斯.狗子10','555555555555555555','1',NULL,NULL,NULL,NULL,NULL,'17091098601','北京北京市东城区东华门街道10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'招商银行',NULL,'232454343434',NULL,NULL,NULL,NULL,NULL,NULL,'e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg'), ('11','11','南方航空11','南航11',NULL,NULL,NULL,NULL,'尼古拉斯.狗子11','555555555555555555','1',NULL,NULL,NULL,NULL,NULL,'17091098601','北京北京市东城区东华门街道11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'招商银行',NULL,'232454343434',NULL,NULL,NULL,NULL,NULL,NULL,'e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg'), ('12','12','南方航空12','南航12',NULL,NULL,NULL,NULL,'尼古拉斯.狗子12','555555555555555555','1',NULL,NULL,NULL,NULL,NULL,'17091098601','北京北京市东城区东华门街道12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'招商银行',NULL,'232454343434',NULL,NULL,NULL,NULL,NULL,NULL,'e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg'), ('13','13','南方航空13','南航13',NULL,NULL,NULL,NULL,'尼古拉斯.狗子13','555555555555555555','1',NULL,NULL,NULL,NULL,NULL,'17091098601','北京北京市东城区东华门街道13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'招商银行',NULL,'232454343434',NULL,NULL,NULL,NULL,NULL,NULL,'e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg'), ('14','14','南方航空14','南航14',NULL,NULL,NULL,NULL,'尼古拉斯.狗子14','555555555555555555','1',NULL,NULL,NULL,NULL,NULL,'17091098601','北京北京市东城区东华门街道14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'招商银行',NULL,'232454343434',NULL,NULL,NULL,NULL,NULL,NULL,'e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg'), ('15','15','南方航空15','南航15',NULL,NULL,NULL,NULL,'尼古拉斯.狗子15','555555555555555555','1',NULL,NULL,NULL,NULL,NULL,'17091098601','北京北京市东城区东华门街道15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'招商银行',NULL,'232454343434',NULL,NULL,NULL,NULL,NULL,NULL,'e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg'), ('16','16','南方航空16','南航16',NULL,NULL,NULL,NULL,'尼古拉斯.狗子16','555555555555555555','1',NULL,NULL,NULL,NULL,NULL,'17091098601','北京北京市东城区东华门街道16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'招商银行',NULL,'232454343434',NULL,NULL,NULL,NULL,NULL,NULL,'e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg'), ('17','17','南方航空17','南航17',NULL,NULL,NULL,NULL,'尼古拉斯.狗子17','555555555555555555','1',NULL,NULL,NULL,NULL,NULL,'17091098601','北京北京市东城区东华门街道17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'招商银行',NULL,'232454343434',NULL,NULL,NULL,NULL,NULL,NULL,'e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg'), ('18','18','南方航空18','南航18',NULL,NULL,NULL,NULL,'尼古拉斯.狗子18','555555555555555555','1',NULL,NULL,NULL,NULL,NULL,'17091098601','北京北京市东城区东华门街道18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'招商银行',NULL,'232454343434',NULL,NULL,NULL,NULL,NULL,NULL,'e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg'), ('19','19','南方航空19','南航19',NULL,NULL,NULL,NULL,'尼古拉斯.狗子19','555555555555555555','1',NULL,NULL,NULL,NULL,NULL,'17091098601','北京北京市东城区东华门街道19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'招商银行',NULL,'232454343434',NULL,NULL,NULL,NULL,NULL,NULL,'e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg'), ('20','20','南方航空20','南航20',NULL,NULL,NULL,NULL,'尼古拉斯.狗子20','555555555555555555','1',NULL,NULL,NULL,NULL,NULL,'17091098601','北京北京市东城区东华门街道20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'招商银行',NULL,'232454343434',NULL,NULL,NULL,NULL,NULL,NULL,'e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg','e6a221c204774f589cbd7cd41207837c.jpg');
INSERT INTO `csair_shop_contract` VALUES ('1','南航e商城入驻店铺租赁合同1','1','1','2017-08-03 14:58:11','2017-08-03 14:58:14','2017-08-03 14:58:16','2017-08-18 14:58:25','南航e商城','尼古拉斯','9','1','南航','广州白云区机场路','13122333212','e6a221c204774f589cbd7cd41207837c.jpg','测试合同'), ('2','南航e商城入驻店铺租赁合同2','1','2','2017-08-03 14:58:11','2017-08-03 14:58:14','2017-08-03 14:58:16','2017-08-18 14:58:25','南航e商城','尼古拉斯','11','2','南航','广州白云区机场路','13122333212','e6a221c204774f589cbd7cd41207837c.jpg','测试合同'), ('3','南航e商城入驻店铺租赁合同3','1','2','2017-08-04 11:34:03','2017-08-04 11:34:11','2017-08-03 14:58:16','2017-08-18 14:58:25','南航e商城','尼古拉斯','11','2','南航','广州白云区机场路','13122333212','e6a221c204774f589cbd7cd41207837c.jpg','测试合同');
INSERT INTO `csair_specification` VALUES ('1','颜色','0','商品颜色','1','0'), ('2','大小','0','商品大小','2','0');
INSERT INTO `csair_spec_values` VALUES ('1','1','白色','','1','0'), ('2','1','红色','','2','0'), ('3','2','10寸',NULL,'1',NULL), ('4','2','15寸',NULL,'2',NULL), ('5',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `csair_user_info` VALUES ('1','10001','测试','test','明珠会员','13802514605','13802514605','2017-07-26','22.22','111@qq.com','430444933838','111@qq.com','7770990','2017-07-27 16:54:10'), ('2','10002','黄彪','huangbiao','E行会员','13802514605','13802514605','2017-07-27','55.33','222@qq.com','430444933838','222@qq.com','3445454','2017-07-27 16:54:16'), ('6','10006','彭珍','PENG/ZHEN','明珠会员','18600680089','18600680089','1977-09-19','0.00','123@qq.com','440901197709194316','123456@qq.com','18600680089','2017-07-31 17:22:47'), ('7','10003','test','huangbiao',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL), ('8','10004','test2','huangbiao',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL), ('9','10005','test2','huangbiao',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL), ('10','1006','huangbiao',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL), ('11','1006','huangbiao',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL), ('12','1006','huangbiao',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL), ('13','1006','huangbiao',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL), ('14','1006','huangbiao',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `e_admin_menu` VALUES ('2','商品管理',NULL,NULL,'1','1','1',NULL,NULL), ('3','商品分类',NULL,NULL,'1','700','1',NULL,NULL), ('4','品牌管理',NULL,NULL,'1','101','1',NULL,NULL), ('6','交易',NULL,NULL,'1','20','1',NULL,NULL), ('7','CMS',NULL,'cms/8joi','1','30','1',NULL,NULL), ('8','用户',NULL,NULL,'1','80','1',NULL,NULL), ('9','店铺管理',NULL,NULL,'1','18','1',NULL,NULL), ('10','营销',NULL,NULL,'1','70','1',NULL,NULL), ('11','财务与统计',NULL,NULL,'1','100','1',NULL,NULL), ('12','财务',NULL,NULL,'1','80','1',NULL,NULL), ('13','客服',NULL,'/service','1','90','1',NULL,NULL), ('14','系统设置',NULL,NULL,'1','40','1',NULL,NULL), ('15','权限设置','14',NULL,'1','1','2',NULL,NULL), ('16','管理角色','15','/role/list','1','1','3',NULL,NULL), ('47','文章列表','46',NULL,'1','1','3',NULL,NULL), ('49','管理菜单','15','/menu/list','1','1','3',NULL,NULL), ('50','用户账号','15','/user/list','1','50','3',NULL,NULL), ('59','新建账号','15','/user/toEditUser','1','60','3',NULL,NULL), ('64','首页第一','1','/index/list','1','100','2',NULL,NULL), ('66','客服列表','13','/service/list','1','10','2','09e25d833ded4abdb82b3acb494515aa.jpg',NULL), ('67','删除文章','46','/asf/delete','1','11','3',NULL,NULL), ('71','文章分类','7','/articleclassify/ArtiCleclassify_list','1','8','2',NULL,NULL), ('72','文章','7','/article/Article_list','1','1','2',NULL,NULL), ('78','交易列表','6','/trade/list','1','1','2',NULL,NULL), ('79','交易审批','6','/trade/list','1','20','2',NULL,NULL), ('80','交易新建','78',NULL,'1','1','3',NULL,NULL), ('81','账户安全','14','/use/safety','1','20','2',NULL,NULL), ('82','后台操作记录','81','/log/list','1','10','3',NULL,NULL), ('83','修改密码','81','/changePassword','1','20','3',NULL,NULL), ('86','交易查询','6','/tr','1','20','2',NULL,NULL), ('87','消息管理','14',NULL,'1','30','2',NULL,NULL), ('88','短信服务','87','/message/smsService','1','10','3',NULL,NULL), ('90','邮箱服务','87','/message/emailService','1','20','3',NULL,NULL), ('92','入驻店铺信息管理','91','/shop/selectshop','1','1','3',NULL,NULL), ('95','店铺信息审核','91',NULL,'1','2','3',NULL,NULL), ('96','商家消息管理','91',NULL,'1','3','3',NULL,NULL), ('98','资质详情','97',NULL,'1','1','5',NULL,NULL), ('103','店铺信息列表','95',NULL,'1','1','4',NULL,NULL), ('104','店铺详情','103',NULL,'1','1','5',NULL,NULL), ('105','经营类目','104',NULL,'1','1','6',NULL,NULL), ('106','经营品牌','104',NULL,'1','2','6',NULL,NULL), ('107','店铺首页装修','103',NULL,'1','2','5',NULL,NULL), ('108','添加消息','96',NULL,'1','1','4',NULL,NULL), ('109','添加消息','96',NULL,'1','1','4',NULL,NULL), ('114','入驻店铺信息管理','9','/shop/selectshop','1','1','2',NULL,NULL), ('116','店铺信息审核','9',NULL,'1','2','2',NULL,NULL), ('117','商家信息管理','9','/shop/sellerMessageList','1','3','2',NULL,NULL), ('119','合同管理','114',NULL,'1','2','3',NULL,NULL), ('120','商家续约','114',NULL,'1','31','3',NULL,NULL), ('121','类目管理','2','/GoodCategory/queryAllGoodCategory','1','20','2','5da6a174bd434d3b912479898bde072b.jpg',NULL), ('122','类目列表','121','/GoodCategory/queryAllGoodCategory','1','10','3',NULL,NULL), ('125','品牌管理','2','/brand/list','1','3','2',NULL,NULL), ('126','字典库管理','14',NULL,'1','40','2',NULL,NULL), ('127','类目证书管理','126','/certificate/list','1','10','3','021ce40fceb54770be73e2f059d1607a.jpg',NULL), ('129','品牌列表','125','/brand/list','1','10','3',NULL,NULL), ('130','会员管理',NULL,NULL,'1','1',NULL,NULL,NULL), ('131','会员列表','130','/member/list','1','1',NULL,NULL,NULL), ('135','资质变更审核列表','114','/aptitude/list','1','1','3',NULL,NULL), ('136','订单管理',NULL,NULL,'1','15',NULL,NULL,NULL), ('137','订单列表','136','/order/list','1','10',NULL,NULL,NULL), ('138','商品属性模板列表','2','/goodCategoryPropertyTemplet/list','1','30','2',NULL,NULL), ('139','配送管理',NULL,NULL,'1','30',NULL,NULL,NULL), ('140','自取点列表','139',NULL,'1','1',NULL,NULL,NULL), ('141','添加自取点','140',NULL,'1','1',NULL,NULL,NULL), ('142','物流公司列表','139',NULL,'1','1',NULL,NULL,NULL), ('143','店铺信息列表','116','/shop/shopInfoList','1','1','3',NULL,NULL), ('144','店铺首页装修','116','/shop/shopHomePageUpdate','1','1','3',NULL,NULL), ('145','保证金管理','114',NULL,'1','1','3',NULL,NULL), ('146','商品增刪改查','114','/shop/selectshop','1','1','3',NULL,NULL);
INSERT INTO `e_admin_permission` VALUES ('77','','查看菜单:商品管理','2',NULL), ('78','','查看菜单:商品分类','3',NULL), ('79','','查看菜单:品牌管理','4',NULL), ('81','','查看菜单:交易','6',NULL), ('82','cms/8joi','查看菜单:CMS','7',NULL), ('83','','查看菜单:用户','8',NULL), ('84','','查看菜单:店铺','9',NULL), ('85','','查看菜单:营销','10',NULL), ('86','','查看菜单:财务与统计','11',NULL), ('87','','查看菜单:财务','12',NULL), ('88','/service','查看菜单:客服','13',NULL), ('89','','查看菜单:系统设置','14',NULL), ('90',NULL,'查看菜单:权限设置','15',NULL), ('91',NULL,'管理角色','16',NULL), ('96',NULL,'查看菜单:品牌列表','45',NULL), ('98',NULL,'查看菜单:文章列表','47',NULL), ('99',NULL,'查看菜单:客服人员列表','48',NULL), ('100',NULL,'管理菜单','49',NULL), ('101','/user/list','查看菜单:用户账号','50',NULL), ('107','/brand/add','查看菜单:添加品牌','56',NULL), ('110','/user/toEditUser','查看菜单:新建账号','59',NULL), ('111','/menu/add','查看菜单:新建菜单','60',NULL), ('116','/index/list','查看菜单:首页第一','64',NULL), ('118','/service/list','查看菜单:客服列表','66',NULL), ('119','/asf/delete','查看菜单:删除文章','67',NULL), ('122','/permission/addMenu','权限编辑','16',NULL), ('124','/menu/delete','删除菜单','16',NULL), ('125','/user','查看菜单:管理电脑','70',NULL), ('126','/articleclassify/ArtiCleclassify_list','查看菜单:文章分类','71',NULL), ('127','/article/Article_list','查看菜单:文章','72',NULL), ('130','/user/sss','查看菜单:2','75',NULL), ('134','/trade/list','查看菜单:交易列表','78',NULL), ('135','/trade/list','查看菜单:交易审批','79',NULL), ('136','','查看菜单:交易新建','80',NULL), ('137','/use/safety','查看菜单:账户安全','81',NULL), ('138','/log/list','查看菜单:后台操作记录','82',NULL), ('139','/changePassword','查看菜单:修改密码','83',NULL), ('140','','查看菜单:测试用菜单','84',NULL), ('142','/permission/edit','权限添加','16',NULL), ('143','/menu/list','菜单查询','16',NULL), ('144','/role/list','角色查询','16',NULL), ('145','/role/inputRole','角色编辑页面','16',NULL), ('146','/user/editUser','用户编辑','59',NULL), ('147','/user/list||/user/downloadUser','用户查询','50',NULL), ('148','/permission/list','权限查询','16',NULL), ('149','/role/editRolePermission','角色权限编辑','16',NULL), ('150','/user/downloadUser||/user/aaaa','用户数据下载','50',NULL), ('151','/role/deleteRole','角色删除','16',NULL), ('152','/role/userList','角色成员查询','16',NULL), ('153','/user/edit12','用户修改','8',NULL), ('155','/tr','查看菜单:交易查询','86',NULL), ('156','/user/changePassword','修改自己的密码','83',NULL), ('157','','查看菜单:消息管理','87',NULL), ('158','/message/smsService','查看菜单:短信服务','88',NULL), ('159','/message/upedit','修改短信设置','88',NULL), ('161','/message/emailService','查看菜单:邮箱服务','90',NULL), ('163','/shop/selectshop','查看菜单:入驻店铺信息管理','92',NULL), ('166','','查看菜单:店铺信息审核','95',NULL), ('167','','查看菜单:商家消息管理','96',NULL), ('169','','查看菜单:资质详情','98',NULL), ('174','','查看菜单:店铺信息列表','103',NULL), ('175','','查看菜单:店铺详情','104',NULL), ('176','','查看菜单:经营类目','105',NULL), ('177','','查看菜单:经营品牌','106',NULL), ('178','','查看菜单:店铺首页装修','107',NULL), ('179','','查看菜单:添加消息','108',NULL), ('180','','查看菜单:添加消息','109',NULL), ('181','','查看菜单:入驻店铺信息管理','114',NULL), ('183','','查看菜单:店铺信息审核','116',NULL), ('184','/shop/sellerMessageList','查看菜单:商家信息管理','117',NULL), ('185','','查看菜单:资质变更审核列表','118',NULL), ('186','','查看菜单:合同管理','119',NULL), ('187','','查看菜单:商家续约','120',NULL), ('188','/role/addOrUpdataRole','修改角色','16',NULL), ('189','/role/removeRoleUser','删除角色下用户','16',NULL), ('190','/cms/add','添加文章','71',NULL), ('191','','查看菜单:类目管理','121',NULL), ('192','/GoodCategory/queryAllGoodCategory','查看菜单:类目列表','122',NULL), ('195','/brand/list','查看菜单:品牌管理','125',NULL), ('196','','查看菜单:字典库管理','126',NULL), ('197','/certificate/list','查看菜单:类目证书管理','127',NULL), ('198','/brand/list','查看菜单:品牌列表','129',NULL), ('199','','查看菜单:会员管理','130',NULL), ('200','/user/list','查看菜单:会员列表','131',NULL), ('204','/aptitude/list','查看菜单:资质变更审核列表','135',NULL), ('205','/editBrand||/brand/toEditBrand','编辑品牌','129',NULL), ('206','/brand/batchDeleteBrand','删除品牌','129',NULL), ('207','/brand/editBrand','编辑品牌','129',NULL), ('208','','查看菜单:订单管理','136',NULL), ('209','/order/list','查看菜单:订单列表','137',NULL), ('210','/goodCategoryPropertyTemplet/list','查看菜单:商品属性模板列表','138',NULL), ('211','','查看菜单:配送管理','139',NULL), ('212','','查看菜单:自取点列表','140',NULL), ('213','','查看菜单:添加自取点','141',NULL), ('214','','查看菜单:物流公司列表','142',NULL), ('215','/shop/shopInfoList','查看菜单:店铺信息列表','143',NULL), ('216','/shop/shopHomePageUpdate','查看菜单:店铺首页装修','144',NULL), ('217','','查看菜单:保证金管理','145',NULL), ('218','/shop/selectshop','查看菜单:商品增刪改查','146',NULL);
INSERT INTO `e_admin_role` VALUES ('1','管理员','admin','超级管理员1',NULL), ('2','编辑','编辑','编辑',NULL), ('4','普通用户','normal','90-',NULL), ('5','21','1221','2121',NULL), ('7','测试员2','root','99999',NULL);
INSERT INTO `e_admin_role_permission` VALUES ('1','63'), ('1','64'), ('1','65'), ('1','66'), ('1','67'), ('1','68'), ('1','69'), ('1','70'), ('1','71'), ('1','72'), ('1','73'), ('1','74'), ('1','75'), ('1','107'), ('1','109'), ('1','110'), ('1','111'), ('1','112'), ('1','77'), ('1','78'), ('1','79'), ('1','80'), ('1','81'), ('1','82'), ('1','83'), ('1','84'), ('1','85'), ('1','86'), ('1','87'), ('1','88'), ('1','89'), ('1','90'), ('1','91'), ('1','96'), ('1','98'), ('1','99'), ('1','100'), ('1','101'), ('1','116'), ('2','100'), ('1','118'), ('1','119'), ('1','121'), ('1','122'), ('7','81'), ('7','82'), ('1','124'), ('1','125'), ('1','126'), ('1','127'), ('1','63'), ('1','64'), ('1','65'), ('1','66'), ('1','67'), ('1','68'), ('1','69'), ('1','70'), ('1','71'), ('1','73'), ('1','74'), ('1','75'), ('1','77'), ('1','78'), ('1','79'), ('1','80'), ('1','81'), ('1','82'), ('1','83'), ('1','84'), ('1','85'), ('1','86'), ('1','87'), ('1','88'), ('1','89'), ('1','90'), ('1','91'), ('1','96'), ('1','98'), ('1','99'), ('1','100'), ('1','101'), ('1','107'), ('1','110'), ('1','111'), ('1','116'), ('1','118'), ('1','119'), ('1','122'), ('1','124'), ('1','125'), ('1','126'), ('1','127'), ('2','77'), ('2','81'), ('2','82'), ('2','83'), ('2','84'), ('2','85'), ('2','87');
INSERT INTO `e_admin_role_permission` VALUES ('2','89'), ('2','90'), ('2','91'), ('2','100'), ('2','101'), ('2','110'), ('2','122'), ('2','124'), ('2','126'), ('2','127'), ('4','77'), ('4','81'), ('4','82'), ('4','84'), ('4','85'), ('4','89'), ('4','90'), ('4','91'), ('4','100'), ('4','101'), ('4','110'), ('4','122'), ('4','124'), ('4','126'), ('4','127'), ('5','77'), ('5','81'), ('5','82'), ('5','84'), ('5','89'), ('5','90'), ('5','91'), ('5','100'), ('5','101'), ('5','110'), ('5','122'), ('5','124'), ('5','126'), ('5','127'), ('1','63'), ('1','64'), ('1','65'), ('1','66'), ('1','67'), ('1','68'), ('1','69'), ('1','70'), ('1','71'), ('1','73'), ('1','74'), ('1','75'), ('1','77'), ('1','78'), ('1','79'), ('1','80'), ('1','81'), ('1','82'), ('1','83'), ('1','84'), ('1','85'), ('1','86'), ('1','87'), ('1','88'), ('1','89'), ('1','90'), ('1','91'), ('1','96'), ('1','98'), ('1','99'), ('1','100'), ('1','101'), ('1','107'), ('1','110'), ('1','111'), ('1','116'), ('1','118'), ('1','119'), ('1','122'), ('1','124'), ('1','125'), ('1','126'), ('1','127'), ('1','63'), ('1','64'), ('1','65'), ('1','66'), ('1','67'), ('1','68'), ('1','69'), ('1','70'), ('1','71'), ('1','73'), ('1','74'), ('1','75'), ('1','77'), ('1','78'), ('1','79'), ('1','80'), ('1','81'), ('1','82');
INSERT INTO `e_admin_role_permission` VALUES ('1','83'), ('1','84'), ('1','85'), ('1','86'), ('1','87'), ('1','88'), ('1','89'), ('1','90'), ('1','91'), ('1','96'), ('1','98'), ('1','99'), ('1','100'), ('1','101'), ('1','107'), ('1','110'), ('1','111'), ('1','116'), ('1','118'), ('1','119'), ('1','122'), ('1','124'), ('1','125'), ('1','126'), ('1','127'), ('1','130'), ('1','134'), ('1','135'), ('1','136'), ('1','137'), ('1','138'), ('1','139'), ('1','140'), ('1','142'), ('1','143'), ('1','144'), ('1','145'), ('1','146'), ('1','147'), ('1','148'), ('1','149'), ('1','150'), ('1','151'), ('1','152'), ('1','153'), ('1','154'), ('2','152'), ('2','151'), ('1','155'), ('2','144'), ('2','143'), ('1','156'), ('2','156'), ('2','139'), ('1','157'), ('1','158'), ('1','159'), ('1','161'), ('1','163'), ('1','166'), ('1','167'), ('1','169'), ('1','174'), ('1','175'), ('1','176'), ('1','177'), ('1','178'), ('1','179'), ('1','180'), ('1','181'), ('1','183'), ('1','184'), ('1','185'), ('1','186'), ('1','187'), ('1','188'), ('1','189'), ('1','190'), ('1','191'), ('1','192'), ('1','195'), ('1','196'), ('1','197'), ('1','198'), ('1','199'), ('1','200'), ('1','204'), ('1','205'), ('1','206'), ('1','207'), ('1','208'), ('1','209'), ('1','210'), ('1','211'), ('1','212'), ('1','213'), ('1','214'), ('1','215'), ('1','216'), ('1','217');
INSERT INTO `e_admin_role_permission` VALUES ('1','218');
INSERT INTO `e_admin_user` VALUES ('1','julice','julice@test.com','F54C5F3213B11DDD2692C4E53301C66B','2017-03-29 08:49:00','2017-03-29 08:49:00','1','222','222','222','2222','1','222','csair_admin','aaaaaa'), ('2','bob','bob@test.com','F54C5F3213B11DDD2692C4E53301C66B','2017-03-29 08:49:00','2017-08-03 09:08:33','1',NULL,NULL,'0:0:0:0:0:0:0:1',NULL,NULL,NULL,'csair_admin','aaaaaa'), ('3','alice1','alice@test.com','F54C5F3213B11DDD2692C4E53301C66B','2017-03-29 08:49:00','2017-08-26 16:27:50','1',NULL,NULL,'0:0:0:0:0:0:0:1',NULL,NULL,NULL,'csair_admin','aaaaaa'), ('23','123','2112211221','783ED423A9D32A96DD84135D8F7EF87A','2017-07-18 10:02:02',NULL,'1',NULL,NULL,NULL,'1221','1',NULL,'csair_admin','aaaaaa'), ('24','testCreate','testCerate@test.com','685228DC8CB1074BD2E9A87F69F103A3','2017-07-18 11:57:17',NULL,'0',NULL,NULL,NULL,'12','1',NULL,'csair_admin','kT0OpD'), ('25','dsgfsad ','ateate','5CED7152440C7125D028EF8CF6389334','2017-07-26 09:19:33',NULL,'0',NULL,NULL,NULL,'','1',NULL,'csair_admin','Nfio2Y'), ('43','userAdmin',NULL,'123',NULL,NULL,'2',NULL,NULL,NULL,NULL,'2','1','1',NULL), ('50','userAdmin',NULL,'123',NULL,NULL,'2',NULL,NULL,NULL,NULL,'2','2','1',NULL), ('51','userAdmin',NULL,'123',NULL,NULL,'2',NULL,NULL,NULL,NULL,'2','3','1',NULL), ('52','userAdmin',NULL,'123',NULL,NULL,'2',NULL,NULL,NULL,NULL,'2','4','1',NULL), ('54','alice@test.com','1','C1CA17EDD59C7A159B88A3980B8B7ABB','2017-08-03 11:08:57',NULL,'1',NULL,NULL,NULL,'','1',NULL,'csair_admin','ZAFhve'), ('57','alice@test.com','11','741D677BB4A90D5027B0D06BEC00EDC5','2017-08-03 14:34:06',NULL,'1',NULL,NULL,NULL,'','1',NULL,'csair_admin','90cBlA');
INSERT INTO `e_admin_user_role` VALUES ('1','3'), ('3','3'), ('4','2'), ('4','3'), ('5','3'), ('5','4'), ('6','4'), ('2','5'), ('2','2'), ('2','4'), (NULL,'1'), ('1','6'), ('3','1'), ('4','2'), ('5','2'), ('14','7'), ('15','7'), ('16','2'), ('17','4'), ('18','5'), ('19','7'), ('21','2'), ('16','7'), ('22','2'), ('23','2'), ('54','1'), ('55','2'), ('56','2'), ('57','2');
INSERT INTO `test` VALUES ('1','1');
