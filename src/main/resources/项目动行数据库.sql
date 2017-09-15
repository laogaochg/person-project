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

INSERT INTO `csair_articleclassify_parent` VALUES ('1','顶级分类','0'), ('2','南航头条','2'), ('14','和人特好文化馆','3'), ('19','测试1','3'), ('20','成功11','2'), ('21','统一调试1','2'), ('22','统一测试111','2'), ('23','统一测试1111','2'), ('24','统一测试11','2'), ('25','号首府大好时光','3'), ('26','testTopPage','21'), ('35','6666666666666','1'), ('37','你好','1'), ('38','&lt;csdhti&gt;$%#$^','1'), ('39','{}ertertqt','1');
INSERT INTO `csair_banner` VALUES ('1','domain.com/test1.jpg','domain.com/url1','1'), ('2','domain.com/test2.jpg','domain.com/url2','2'), ('3','domain.com/test3.jpg','domain.com/url3','3');
INSERT INTO `csair_brand` VALUES ('9','免税品','bd861e694ece4fa2b1f30d960b4afc27.jpg','small_bd861e694ece4fa2b1f30d960b4afc27.jpg','www.miansui.com','免税','1','1',NULL,NULL), ('10','跨境购','bd861e694ece4fa2b1f30d960b4afc27.jpg','small_bd861e694ece4fa2b1f30d960b4afc27.jpg','www.kuajinggou.com','跨境购','211111111','1',NULL,NULL), ('11','航空精品','072115bf1c9049678e6d6f76d5d40f6c.jpg','small_072115bf1c9049678e6d6f76d5d40f6c.jpg','www.hkjp.com','航空精品','3','1',NULL,NULL), ('12','航易购','bd861e694ece4fa2b1f30d960b4afc27.jpg','small_c98de6a79f9740bda809b64b555e9674.jpg','www.hyg.com','航易购','4','1','2017-06-20 17:35:10','3'), ('13','里程专属','bd861e694ece4fa2b1f30d960b4afc27.jpg','small_c98de6a79f9740bda809b64b555e9674.jpg','www.lczs.com','里程专属','5','1','2017-06-20 17:35:10','4'), ('14','小米','bd861e694ece4fa2b1f30d960b4afc27.jpg','small_bd861e694ece4fa2b1f30d960b4afc27.jpg','http://www.baidu.com','&lt;img src=&quot;/html/img/0d24a521ac384c75a45dc3c42172db64.jpg&quot; alt=&quot;undefined&quot;&gt;1222&lt;u&gt;222222222211&lt;/u&gt;1111111111111','10','1',NULL,NULL), ('15','华为','c98de6a79f9740bda809b64b555e9674.jpg','small_c98de6a79f9740bda809b64b555e9674.jpg','http://www.baidu.com','12222&lt;img src=&quot;/html/img/bfb92e4600a44357a42e07e189d37efb.jpg&quot; alt=&quot;undefined&quot;&gt;','20','1','2017-07-26 15:24:24','3'), ('62','21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL), ('63','21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL), ('64','21','8a03961bef7f445cbe08d90cf34a0ed6.jpg','small_8a03961bef7f445cbe08d90cf34a0ed6.jpg','1221','21211212212121','2121','1',NULL,NULL), ('65','21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL), ('66','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `csair_category_brand` VALUES ('1','1','1');
INSERT INTO `csair_category_spec` VALUES ('1','1');
INSERT INTO `csair_certificate` VALUES ('1','单身证书','单身','3','2017-07-24 18:25:12',NULL), ('2','四级证书','四级1','3','2017-07-24 20:32:44','2017-07-24 20:39:46'), ('15','七级证书','七级1','3','2017-07-31 14:15:28','2017-07-31 14:15:35'), ('16','卫生证书','12','3','2017-07-31 14:15:48',NULL);
INSERT INTO `csair_config` VALUES ('162','smsConfig','{\"password\":\"EM6565388\",\"userName\":\"EMALL\",\"key\":\"8756JKLjhdfjklL7890543jklJLlkgt7979KLHjklgfd8\"}','2017-07-25 14:31:02','2017-07-26 11:52:18'), ('163','emailConfig','{\"password\":\"EM6565388\",\"userName\":\"EMALL\",\"key\":\"8756JKLjhdfjklL7890543jklJLlkgt7979KLHjklgfd8\"}','2017-07-25 14:34:04','2017-07-26 14:17:08'), ('164','smsConfig3','{\"password\":\"EM656538812321312312\",\"userName\":\"EMALL21313123\",\"key\":\"8756JKLjhdfjklL7890543jklJLlkgt7979KLHjklgfd8\"}','2017-07-25 14:31:02','2017-07-25 18:59:56'), ('165','emailConfig2','{\"password\":\"EM6565388\",\"userName\":\"EMALL\",\"key\":\"8756JKLjhdfjklL7890543jklJLlkgt7979KLHjklgfd8\"}','2017-07-25 14:34:04','2017-07-26 14:17:08');
INSERT INTO `csair_goods_category_property_templet` VALUES ('尺寸','2','8','2017-08-01 10:19:24',NULL), ('尺寸','2','12',NULL,NULL), ('CPU','i5','23','2017-08-02 17:22:52','联想笔记本属性模板'), ('CPU','i6','23','2017-08-02 17:22:52','联想笔记本属性模板'), ('CPU','i7','23','2017-08-02 17:22:52','联想笔记本属性模板'), ('CPU','i9','23','2017-08-02 17:22:52','联想笔记本属性模板'), ('屏幕大小','24寸','23','2017-08-02 17:22:52','联想笔记本属性模板'), ('屏幕大小','29寸','23','2017-08-02 17:22:52','联想笔记本属性模板'), ('屏幕大小','32寸','23','2017-08-02 17:22:52','联想笔记本属性模板'), ('版本','旗舰版','23','2017-08-02 17:22:52','联想笔记本属性模板'), ('版本','黄金版','23','2017-08-02 17:22:52','联想笔记本属性模板'), ('版本','高配版','23','2017-08-02 17:22:52','联想笔记本属性模板'), ('版本','土豪版','23','2017-08-02 17:22:52','联想笔记本属性模板'), ('1','1','1',NULL,NULL), ('1','1','2',NULL,NULL), ('1','1','3',NULL,NULL), ('1','1','34',NULL,NULL), ('1','1','4',NULL,NULL), ('1','1','4',NULL,NULL), ('1','1','5',NULL,NULL), ('1','1','8',NULL,NULL), ('1','1','9',NULL,NULL), ('1','1','10',NULL,NULL), ('1','1','11',NULL,NULL), ('1','1','12',NULL,NULL), ('1','1','12',NULL,NULL), ('1','1','13',NULL,NULL), ('1','1','14',NULL,NULL), ('1','1','15',NULL,NULL), ('12','12','43','2017-08-04 16:43:23','1221'), ('12','12','43','2017-08-04 16:43:23','1221'), ('12','12','43','2017-08-04 16:43:23','1221'), ('21','212','43','2017-08-04 16:43:23','1221'), ('21','121','43','2017-08-04 16:43:23','1221'), ('21','12','43','2017-08-04 16:43:23','1221'), ('2121','12','46','2017-08-04 17:10:31','122112'), ('21','21','47','2017-08-04 17:20:45','122121');
INSERT INTO `csair_goods_sku` VALUES ('1','1','',NULL,'0','0','100.00','1','0.80','1.00','0'), ('2',NULL,NULL,NULL,'0','0',NULL,NULL,NULL,NULL,'0');
INSERT INTO `csair_goods_spec` VALUES ('1','1','1','1','1'), ('2','2','1','1','1');
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
