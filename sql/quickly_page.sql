/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50635
Source Host           : localhost:3306
Source Database       : quickly_page

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

Date: 2017-08-19 00:28:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`) USING BTREE,
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`) USING BTREE,
  CONSTRAINT `auth_permission_ibfk_1` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add city', '7', 'add_city');
INSERT INTO `auth_permission` VALUES ('20', 'Can change city', '7', 'change_city');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete city', '7', 'delete_city');
INSERT INTO `auth_permission` VALUES ('22', 'Can add province', '8', 'add_province');
INSERT INTO `auth_permission` VALUES ('23', 'Can change province', '8', 'change_province');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete province', '8', 'delete_province');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$24000$GkLxNeCIvQpO$DA36m3PrzAqlbQzGOW4ZwPJCPQV9tkkHKHGHw9zAZiE=', '2017-06-12 14:07:15', '1', 'admin', '', '', 'zsdzzydos@gmail.cm', '1', '1', '2017-06-12 14:07:01');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`) USING BTREE,
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`) USING BTREE,
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`) USING BTREE,
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_ibfk_1` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'tour', 'city');
INSERT INTO `django_content_type` VALUES ('8', 'tour', 'province');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2017-06-11 23:30:51');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2017-06-11 23:31:03');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2017-06-11 23:31:06');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2017-06-11 23:31:06');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2017-06-11 23:31:08');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2017-06-11 23:31:10');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2017-06-11 23:31:11');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2017-06-11 23:31:12');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2017-06-11 23:31:13');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2017-06-11 23:31:13');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2017-06-11 23:31:13');
INSERT INTO `django_migrations` VALUES ('12', 'sessions', '0001_initial', '2017-06-11 23:31:16');
INSERT INTO `django_migrations` VALUES ('13', 'tour', '0001_initial', '2017-06-11 23:31:17');
INSERT INTO `django_migrations` VALUES ('14', 'tour', '0002_auto_20170612_1414', '2017-06-12 14:14:17');
INSERT INTO `django_migrations` VALUES ('15', 'tour', '0003_province', '2017-08-17 18:11:46');
INSERT INTO `django_migrations` VALUES ('16', 'auth', '0008_alter_user_username_max_length', '2017-08-17 21:30:58');
INSERT INTO `django_migrations` VALUES ('17', 'tour', '0004_city_distance', '2017-08-17 21:30:58');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('en689lq4y2t2yvr80cw139pan1qiqdw7', 'MGJhMGExYjAyMGJlZGNiZGI0OTM3MWVmNzQzMDUwYThkMDUwNjE0Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjY0YmE3YWE1Yzg3NGI2OWUzZTE2ODc0MTc1MWU5ZjU1ODNhNjBlMmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-06-26 14:07:15');

-- ----------------------------
-- Table structure for tour_city
-- ----------------------------
DROP TABLE IF EXISTS `tour_city`;
CREATE TABLE `tour_city` (
  `id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  `province_id` int(11) NOT NULL,
  `pointx` double NOT NULL,
  `pointy` double NOT NULL,
  `desc` longtext,
  `image` varchar(100) NOT NULL,
  `hot` int(11) NOT NULL,
  `distance` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tour_city
-- ----------------------------
INSERT INTO `tour_city` VALUES ('1', '10', '七台河市', '10', '131.003138', '45.771726', '七台河位于黑龙江省东部，是一座因煤而生、缘煤而兴、以煤为主、多业并举的新兴工业城市。\n七台河市共有旅游涉外星级饭店3...', 'city/qitaihe.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('2', '7', '万宁市', '24', '110.391075', '18.795143', '地势西高东低。东部海岸线曲折，多港湾，地势较平坦。西部、西南及西北部峰峦起伏，连绵不断，海拔在500-1200米之间...', 'city/wanning.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('3', '2', '三亚市', '24', '109.511909', '18.252847', '是个旅游度假的好地方，气候宜人，有很多好玩的地方。海水很清澈，号称中国最美的海滩，海风凉爽，沙滩海水蓝天人气都是一流的。这里的水果和海鲜都很好吃，但是价格也很贵。', 'city/sanya.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('4', '4', '三明市', '14', '117.638678', '26.263406', '三明地处福建西北部，位于武夷山与戴云山脉之间的闽西北山区，是福建省新兴的工业城市和重点的“绿三角”旅游区。独特的历史...', 'city/sanming.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('5', '12', '三门峡市', '17', '111.200135', '34.772493', '三门峡地处中原豫、晋、陕三省交界处，豫西重镇，东与千年帝都洛阳市为邻，南依伏牛山与南阳市相接，西望古城长安，北隔黄河...', 'city/sanmenxia.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('6', '1', '上海市', '3', '121.473701', '31.230416', '现代化的大都市，外滩的夜景值得一看。商业发达，交通便利。美食方面推荐浓油赤酱的本帮菜，也可以去城隍庙品尝地道的上海小吃。上海这座城市的节奏很快，东西也比较贵。', 'city/shanghai.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('7', '11', '上饶市', '15', '117.943436', '28.454863', '上饶市，简称饶，位于赣东北，自古就有“豫章第一门户”和“四省通衢”之称。上饶多名山胜迹，风景点星罗棋布，早在唐朝就已...', 'city/shangrao.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('8', '8', '东方市', '24', '108.651817', '19.09535', '东方市位于海南岛西部偏南，昌化江下游，南及东南与乐东县接壤，北及东北隔昌化江与昌江县交界，西临北部湾与越南隔海相望。...', 'city/dongfang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('9', '17', '东莞市', '20', '113.751765', '23.020536', '东莞市位于广东省中南部、珠江三角洲东北部，是广东历史文化名城。距今1700多年前的三国时期建郡，是岭南文明的重要发源...', 'city/dongguan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('10', '5', '东营市', '16', '118.674767', '37.434751', '东营市位于山东省北部黄河三角洲地区，中华民族的母亲河——黄河，在东营市境流入渤海。东、北临渤海，西与滨州市毗邻，南与...', 'city/dongying.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('11', '5', '中卫市', '30', '105.196902', '37.499972', '中卫，宁夏最年轻的地级市，有“世界枸杞之都”的美称，历史文化底蕴深厚，又被誉为“塞上文化明珠”。境内有集沙、山、河、...', 'city/zhongwei.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('12', '18', '中山市', '20', '113.392782', '22.517645', '中山市位于珠江三角洲中南部，北连广州，毗邻港澳，是中国伟大的革命先行者孙中山的故乡，又是著名的侨乡。中山市是中国广东...', 'city/zhongshan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('13', '13', '临夏回族自治州', '21', '103.210538', '35.601182', '临夏回族自治州位于黄河上游，甘肃省中部西南面，东临洮河与定西地区相望，西倚巍峨雄壮的积石山与青海省毗邻，南靠奇峻翠秀...', 'city/linxia.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('14', '10', '临汾市', '6', '111.518976', '36.088005', '临汾市位于山西省南部，东枕太岳余支，西依吕梁山脉，中部是广阔的河谷平原，汾河干流纵横南北，两岸土地肥沃。\n临汾是一座...', 'city/linfen.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('15', '13', '临沂市', '16', '118.356448', '35.104672', '素以沂蒙山区著称的山东省临沂，位于山东省东南部，属鲁中低山丘陵区，低山和丘陵占其总面积的60％；泰沂山脉和蒙山为骨架...', 'city/linyi.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('16', '8', '临沧市', '25', '100.079583', '23.877573', '临沧，濒临澜沧江而得名，是中国佤文化的荟萃之地，占全国佤族总人口的三分之二。临沧是世界著名的“滇红”之乡，世界种茶的...', 'city/lincang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('17', '12', '临高县', '24', '109.690508', '19.912026', '临高县，位于海南岛西北部。西北濒临北部湾，北临琼州海峡。全境东西宽34公里，南北长47公里。面积1317平方公里。有...', 'city/lingao.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('18', '6', '丹东市', '8', '124.354706', '40.000499', '海鲜特别香，丹东的烧烤也很好吃，而且环境还不错。历史的尘埃飘散在清新简单的空气中，来这里待上一两天，你会发现这里是真正的宜居之地。', 'city/dandong.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('19', '11', '丽水市', '12', '119.922796', '28.46763', '丽（Lí）水是浙江省辖地级市，位于该省西南部、南邻福建，古称处州，始名于589年（隋文帝开皇九年），是浙西南的政治、...', 'city/lishui.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('20', '6', '丽江市', '25', '100.22775', '26.855047', '古城里很舒服，既能够感受到纳西族的古朴淳风，又富有现代商业气息，是体验慢节奏的理想之地。丽江古城里传说中的东西太多，特色小吃没特色，晚上酒吧一条街很热闹。', 'city/lijiang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('21', '9', '乌兰察布市', '32', '113.132585', '40.994785', '乌兰察布市位于内蒙古中部，在蒙古语中意为“红山口”。乌兰察布市属呼包银经济区和京津唐经济带的结合部，区位优越。东距首...', 'city/wulanchabu.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('22', '3', '乌海市', '32', '106.794249', '39.655388', '乌海市是一座新兴的资源型工业城市。二十世纪五十年代后期，随着包兰铁路的开通、包钢等国家重点项目的建设，乌海作为资源富...', 'city/wuhai.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('23', '21', '乌苏市', '31', '84.713736', '44.418887', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('24', '1', '乌鲁木齐市', '31', '87.616848', '43.825592', '纯净的天山天池，灿烂欢笑的维吾尔族姑娘，激情的乌鲁木齐为你打开走向西域的大门，美丽的乌鲁木齐，一个很不错的地方。', 'city/wulumuqi.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('25', '15', '乐东黎族自治县', '24', '109.173055', '18.75026', '乐东黎族自治县位于海南省西南部，靠山临海，东南与著名旅游胜地三亚市毗邻，西北靠海南新兴工业城东方市，总面积2747平...', 'city/ledong.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('26', '10', '乐山市', '22', '103.765572', '29.552107', '是一座名副其实的“山水之城”，蜀地胜境。最有名的就是乐山大佛，美食与小吃相当多。佛像雄伟，大佛真的很壮观。', 'city/leshan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('27', '4', '九江市', '15', '116.00193', '29.705077', '很不错的风景啊，骑车很舒服，很棒的地方。九江不仅江山殊秀，而且座座“洞天”别开。彭泽的龙宫洞、沙河的狮子洞与涌泉洞、瑞昌的峨眉洞群，千奇百怪、鬼斧神工、浑然天成。', 'city/jiujiang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('28', '16', '云林县', '7', '0', '0', '云林县位于彰化与嘉义两县之间，东接南投县，西临台湾海峡。地处嘉南平原，以养殖渔业和丰硕的农产为云林最傲人的资源。云林...', 'city/yunlin.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('29', '21', '云浮市', '20', '112.044491', '22.915094', '云浮，又被称为广东大西关，是连接广东珠三角和大西南的枢纽，系著名历史文化、旅游风景名城，全国有名的“石材王国”，素有...', 'city/yunfu.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('30', '6', '五家渠市', '31', '87.543243', '44.166756', '五家渠市是共和国最年轻的城市之一，2004年1月19日正式挂牌设立，为新疆生产建设兵团直辖的县级市，按师市合一的体制...', 'city/wujiaqu.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('31', '3', '五指山市', '24', '109.516922', '18.775146', '五指山风景区是海南第一高山，是海南岛的象征，也是我国名山之一，被国际旅游组织列为A级旅游点。该山位于海南岛中部，峰峦...', 'city/wuzhishan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('32', '15', '亳州市', '13', '115.778676', '33.844582', '亳州市是安徽省省辖市，位于皖西北边陲，黄淮平原南端，西北与河南省接壤，西南与阜阳市毗连，东与淮北市、蚌埠市相倚，东南...', 'city/bozhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('33', '13', '仙桃市', '18', '113.44297', '30.328407', '仙桃市原名沔阳县，已有1400多年的建制历史，位于湖北省中部美丽富饶的江汉平原，有“鄂中宝地、江汉明珠”之称。东靠特...', 'city/xiantao.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('34', '7', '伊春市', '10', '128.841147', '47.727536', '伊春是座美丽的林业城市，是国家的重要木材生产基地。这里因盛产珍贵珍树“红松”，被誉为“红松故乡”、“祖国林都”。在伊...', 'city/yichun.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('35', '18', '伊宁市', '31', '81.27795', '43.908558', '位于新疆维吾尔自治区西部，是伊犁哈萨克自治州的首府，距乌鲁木齐市公路里程702千米。\n伊宁市北倚天山雪峰，南临悠然西...', 'city/yining.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('36', '6', '佛山市', '20', '113.121416', '23.021548', '佛山简称“禅”，是一座历史悠久的文化名城，这里是黄飞鸿、李小龙的故乡，是珠三角的经济重地，一个荣耀千年的商贸名城，用...', 'city/foshan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('37', '9', '佳木斯市', '10', '130.318917', '46.799922', '佳木斯地处黑龙江、乌苏里江和松花江汇流的三江平原腹地，东西长340公里，南北宽190公里，隔黑龙江、乌苏里江与俄罗斯...', 'city/jiamusi.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('38', '17', '保亭黎族苗族自治县', '24', '109.70259', '18.63913', '保亭黎族苗族自治县位于海南省南部内陆五指山南麓，山青水绿，景色秀丽。面积1160.6平方公里，人口16万人。县城通往...', 'city/baoting.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('39', '6', '保定市', '5', '115.464806', '38.873891', '保定市位于河北省中部，地处北京、天津、石家庄三角地带，素有“京畿重地”、“首都南大门”之称。\n\n保定虽然是一个小城，...', 'city/baoding.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('40', '4', '保山市', '25', '99.161761', '25.112046', '保山地处云南西部， 历史悠久，是古人类的发祥地之一。保山市蒲缥乡塘子沟发现的中石器时代的石器、灰炉及动物化石等遗存，...', 'city/baoshan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('41', '15', '信阳市', '17', '114.091023', '32.146983', '信阳市位于河南省南部，历史悠久，人杰地灵，是华夏文明的发祥地之一，有8000多年的悠久历史。信阳是华夏文明的发祥地之...', 'city/xinyang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('42', '5', '儋州市', '24', '109.580811', '19.521134', '儋州市古称儋耳郡，儋耳郡是海南岛最早建于汉代的两个郡之一。儋州市位于海南岛西北部，境内有大小山岭160座，多在东南部...', 'city/danzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('43', '2', '克拉玛依市', '31', '84.889207', '45.579888', '克拉玛依，系维吾尔语“黑油”的音译，得名于市区附近的一座天然沥青丘——黑油山。1955年10月29日黑油山第一口油井...', 'city/kelamayi.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('44', '14', '六安市', '13', '116.521854', '31.733699', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('45', '2', '六盘水市', '23', '104.830359', '26.592666', '六盘水，别称“中国凉都”，位于贵州西部，市名来自最初下辖的六枝、盘县和水城三个特区的头一个字组成，是“三线建设”诞生...', 'city/liupanshui.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('46', '1', '兰州市', '21', '103.834303', '36.061089', '黄河给西北高原带来了生命的慰藉，而兰州就是喷涌在这片大地上的民族之井。兰州美食名不虚传，美味的正宁路小吃很正宗。', 'city/lanzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('47', '11', '兴安盟', '32', '122.067042', '46.077561', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('48', '9', '内江市', '22', '105.058433', '29.580228', '内江市，东汉置县，曾名汉安，中江。沱江北段叫牛鞞水，为北江；南段为枝江，称南江，此为中江。隋初，为避太祖杨忠之讳，改...', 'city/neijiang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('49', '21', '凉山彝族自治州', '22', '102.267335', '27.88161', '凉山彝族自治州是我国最大的彝族聚居区。位于四川省西南川滇交界处幅员面积6万余平方公里。境内有汉、彝、藏、蒙古、纳西等...', 'city/liangshan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('50', '2', '包头市', '32', '109.840347', '40.657449', '这里没有喧嚣和纷扰，之余美丽和热烈的草原生活，正宗的蒙餐，豪放欢快的蒙族歌舞。空气比较清新，宽广的草原。草原很美。', 'city/baotou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('51', '1', '北京市', '1', '116.407526', '39.90403', '北京文化底蕴深厚，是一个古典与现代结合的城市。旅游资源十分丰富，景色都很宏伟壮观。北京的交通和购物都很方便，也有很多美食，小吃和北京烤鸭好吃，雾霾比较严重，空气质量不行。', 'city/beijing.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('52', '5', '北海市', '28', '109.119927', '21.481254', '北海市地处广西南端，北部湾东北岸。位于东经108°50′45″～109°47′28″，北纬21°29′～21°55′...', 'city/beihai.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('53', '3', '十堰市', '18', '110.79799', '32.629397', '十堰市位于湖北省西北部，地处鄂、豫、渝、陕交界地带，是一个美丽的山城，新兴的现代车城，又是一个我国内陆山区唯一的国家...', 'city/shiyan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('54', '1', '南京市', '11', '118.796877', '32.060255', '是一个美丽的城市，历史底蕴深厚，自然景观和人文景观都很不赖，有很多很好看的地方能够领略到浓郁的文化气息。总统府印象深刻，夜游秦淮河也很不错。但是人太多，空气质量也不好。', 'city/nanjing.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('55', '11', '南充市', '22', '106.110698', '30.837793', '南充市位于四川盆地东北部嘉陵江中游，有“丝绸之乡”和“果城”之称。每年的丝绸节吸引海内外众多游客。拥有全国和省、县三...', 'city/nanchong.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('56', '1', '南宁市', '28', '108.366543', '22.817002', '“半城绿树半城楼”的南宁，绿荫如盖、繁花似锦，是个宜居之城。多姿多彩的民族文化风情和丰富多彩的民俗活动，又使得南宁成为一座活力之城。', 'city/nanning.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('57', '7', '南平市', '14', '118.177708', '26.641768', '南平市地处福建省北部，武夷山脉北段东南侧，位于闽、浙、赣三省交界处，俗称“闽北”，占福建省的五分之一，具有中国南方典...', 'city/nanping.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('58', '15', '南投县', '7', '0', '0', '南投县位于台湾的地理中心，是全台唯一不临海的县份，境内80%以上为山地，翻开南投的开发史，举凡人文史迹，或自然资源，...', 'city/nantou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('59', '1', '南昌市', '15', '115.858197', '28.682892', '宏伟的滕王阁、穿城而过的赣江，古老的南昌，因为有了八一起义的历史，似乎更添了几分英雄气概。特色美食很多，美味滋补的瓦罐汤、地道的米粉肉，让人胃口大开。', 'city/nanchang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('60', '6', '南通市', '11', '120.894291', '31.980171', '南通，中国历史文化名城。“据江海之会、扼南北之喉”，地处长江三角洲北部，与中国经济最发达的上海及苏州隔江相望，被誉为...', 'city/nantong.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('61', '13', '南阳市', '17', '112.528321', '32.990833', '南阳市位于河南省西南部，北靠伏牛山，东扶桐柏山，西依秦岭，南临汉江。现辖1市2区10县，总面积2．66万平方公里，人...', 'city/nanyang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('62', '17', '博乐市', '31', '82.051005', '44.85387', '博乐市位于新疆维吾尔自治区西北部，与哈萨克斯坦共和国接壤,边境线长150公里,距离自治区首府乌鲁木齐市524公里,是...', 'city/bole.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('63', '2', '厦门市', '14', '118.089425', '24.479833', '厦门是一个秀丽清新的城市，空气和阳光都很好。厦门大学的校园整洁优美，鼓浪屿有很多特色店铺，都是可以去看看的。厦门的街道很干净，慢节奏的生活很惬意。海鲜不错，当地小吃很棒。', 'city/xiamen.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('64', '4', '双鸭山市', '10', '131.159133', '46.646508', '双鸭山市（Shuang Yashan Shi），位于黑龙江省东北部，西与佳木斯、七台河等城市相毗邻，双鸭山市下辖的饶...', 'city/shuangyashan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('65', '22', '台东县', '7', '0', '0', '台东县位于台湾东南方，由于终年气温高，台东又被称为太阳的故乡。台东地区拥有极丰富的观光资源，海洋旅游发达；从平原到高...', 'city/taidong.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('66', '13', '台中县', '7', '0', '0', '台中市是台湾第三大城市，是台湾省中部经济、文化与交通中心。这里曾是台湾政治权力中心，清朝时为台湾首府，日本侵占台湾后...', 'city/taizhong.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('67', '4', '台中市', '7', '119.330345', '26.085552', '台中市是台湾第三大城市，是台湾省中部经济、文化与交通中心。这里曾是台湾政治权力中心，清朝时为台湾首府，日本侵占台湾后...', 'city/taizhong.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('68', '8', '台北县', '7', '0', '0', '在101大楼看夕阳超赞，在西门町享受夜市的热闹，时尚与怀旧，现代与传统，激情与慢热，在这座城市自由释放。', 'city/taibei.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('69', '1', '台北市', '7', '120.014725', '40.767109', '在101大楼看夕阳超赞，在西门町享受夜市的热闹，时尚与怀旧，现代与传统，激情与慢热，在这座城市自由释放。', 'city/taibei.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('70', '18', '台南县', '7', '0', '0', '台南，台湾五大直辖市之一，位于台湾省西南部的嘉南平原，是台湾重要的农业及蔗糖产区。\n今天的台南以美食、滨海生态、历史...', 'city/tainan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('71', '5', '台南市', '7', '0', '0', '台南，台湾五大直辖市之一，位于台湾省西南部的嘉南平原，是台湾重要的农业及蔗糖产区。\n今天的台南以美食、滨海生态、历史...', 'city/tainan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('72', '10', '台州市', '12', '121.420757', '28.656386', '泰州市地处江苏省中部、长江沿岸，为长三角经济区16座中心城市之一，有凤凰城的美誉、“水陆要津，咽喉据郡”之称。泰州具...', 'city/taizhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('73', '1', '合肥市', '13', '117.227239', '31.820586', '三国故地，包公故里，淮右襟喉，江南唇齿，这里美丽的风光和人文底蕴交织成熠熠生辉的徽山皖水。', 'city/hefei.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('74', '8', '吉安市', '15', '114.992509', '27.113443', '集安位于吉林省东南部，东南与朝鲜民主主义人民共和国隔鸭绿江相望，边境线长203.5公里，是我国对朝三大口岸之一。西南...', 'city/jian.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('75', '2', '吉林市', '9', '126.549576', '43.837883', '吉林省位于中国东北中部，处于日本、俄罗斯、朝鲜、韩国、蒙古与中国东北部组成的东北亚几何中心地带。早在远古时期，就有人...', 'city/jilin.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('76', '7', '吐鲁番市', '31', '89.189651', '42.951382', '吐鲁番市是吐鲁番地区经济、政治和文化的中心，位于新疆维吾尔自治区中东部，天山支脉博格达峰南麓，吐鲁番盆地中部。东邻鄯...', 'city/tulufan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('77', '11', '吕梁市', '6', '111.144319', '37.518314', '吕梁地区是中华民族的发祥地之一。远在旧石器时代，就有人类在这里生息、繁衍。解放后特别是党的十一届三中全会以来，积极推...', 'city/lvliang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('78', '3', '吴忠市', '30', '106.198393', '37.99746', '吴忠，占全宁夏总面积一半以上的地级市，位于宁夏回族自治区中部，南靠固原，北连银川，东部与陕西省榆林市定边县毗邻，东北...', 'city/wuzhong.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('79', '16', '周口市', '17', '114.696951', '33.626149', '周口镇历史悠久，1965年以前是淮阳专区管辖的下属乡镇。古时属陈楚，睡始祖都于宛丘（今淮阳），上古时期，三皇五帝都曾...', 'city/zhoukou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('80', '7', '呼伦贝尔市', '32', '119.765744', '49.211574', '在这片地域辽阔、风光旖旎的地方，有水草丰美的草原、松涛激荡的大兴安岭林海……走进这样一幅绚丽的画卷，你只愿做一只草原上幸福的小羊。', 'city/hulunbeier.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('81', '1', '呼和浩特市', '32', '111.74918', '40.842585', '呼和浩特为蒙古语，汉意为“青色的城市”，即青城，也被称为“呼市”。因召庙云集，又称“召城”。\n它位于内蒙古自治区中部...', 'city/huhehaote.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('82', '11', '和田市', '31', '79.913534', '37.112149', '新疆历史上曾以三条闪耀着丝绸之光的商业通道而名扬天下，和田则是丝绸之路上光彩夺目的绢都。其南枕昆仑、北卧大漠；东南和...', 'city/hetian.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('83', '11', '咸宁市', '18', '114.322492', '29.841443', '', 'city/xianning.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('84', '4', '咸阳市', '27', '108.708992', '34.329605', '咸阳位于陕西省八百里秦川腹地。渭水穿南，宗山亘北，山水俱阳，故称咸阳。它东邻省会西安，北与甘肃接壤，是古丝绸之路的第...', 'city/xianyang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('85', '10', '哈密市', '31', '93.514916', '42.818501', '哈密是新疆维吾尔自治区的“东大门”，素有“西域咽喉，东西孔道”之称。哈密被天山分割为南北两处，天山南部是哈密绿洲，天...', 'city/hami.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('86', '1', '哈尔滨市', '10', '126.534967', '45.803775', '东北人民很豪爽。夏天气候凉爽，地方也很干净。松花江蜿蜒而过，这座冰雪构成的城市仿佛一颗明珠，绚烂在祖国的东北面，中国古老文化和欧洲文明在这里碰撞出梦幻的场景。', 'city/haerbin.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('87', '2', '唐山市', '5', '118.180193', '39.630867', '唐山地处环渤海中心地带，素有“京东宝地”之称，是具有百年历史的中国沿海重镇。在这里诞生了中国第一座现代化煤井、第一条...', 'city/tangshan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('88', '14', '商丘市', '17', '115.65637', '34.414172', '商丘地处黄淮平原腹地，独特的区位、便利的交通使商丘成为重要的交通枢纽、物资集散地和区域性商贸中心。商丘是先商和商业的...', 'city/shangqiu.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('89', '10', '商洛市', '27', '109.940477', '33.870422', '商洛，因境内有商山、洛水而得名，位于陕西省东南部，秦岭南麓，与鄂豫两省交界 。 东与河南省的灵宝、卢氏、西峡、淅川县...', 'city/shangluo.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('90', '9', '喀什市', '31', '75.989755', '39.4704', '喀什地区位于中国西陲，地理坐标东经73°20′－79°57′，北纬35°20′－40°18′。东临塔克拉玛干沙漠，南...', 'city/kashi.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('91', '17', '嘉义县', '7', '0', '0', '嘉义县位于嘉南平原的中央，东连阿里山、玉山山脉，西濒台湾海峡，南以曾文水库、关子岭与台南县接壤，北界云林斗六。岛内纵...', 'city/jiayi.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('92', '7', '嘉义市', '7', '0', '0', '嘉义县位于嘉南平原的中央，东连阿里山、玉山山脉，西濒台湾海峡，南以曾文水库、关子岭与台南县接壤，北界云林斗六。岛内纵...', 'city/jiayi.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('93', '4', '嘉兴市', '12', '120.755486', '30.746129', '嘉兴是一个清静的地方，古镇很不错。嘉兴历史悠久，文化灿烂，为中国江南文化的发源地。早在六、七千年前，先民们就在此孕育了长江下游太湖流域早期新石器文化的代表马家浜文化。', 'city/jiaxing.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('94', '5', '嘉峪关市', '21', '98.289152', '39.77313', '嘉峪关市位于甘肃省西北部，河西走廊中部，东临河西重镇酒泉市，距省会兰州776公里；西连石油城玉门市，至新疆哈密650...', 'city/jiayuguan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('95', '3', '四平市', '9', '124.350398', '43.166419', '四平市地处东北松辽平原腹地，是吉林省的南大门，东接长白山余脉，西邻内蒙古科尔沁草原。辖公主岭市、双辽市、梨树县、伊通...', 'city/siping.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('96', '4', '固原市', '30', '106.24261', '36.015855', '固原市是宁夏回族自治区回族聚居地区，历史悠久。曾是经济重地，交通枢纽，军事要地，这里物产丰富，山川秀美伊斯兰文明与中...', 'city/guyuan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('97', '5', '图木舒克市', '31', '79.074089', '39.868969', '图木舒克是国务院于2002年9月批准设立的新疆维吾尔自治区直辖县级市，位于塔里木盆地西北边缘，是古丝绸之路必经要道。...', 'city/tumushuke.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('98', '3', '基隆市', '7', '0', '0', '基隆市，古名鸡笼，位于台湾本岛北端，是台湾地区五个市之一，以深水谷湾之天然良港著名。基隆是台湾最北端的城市，而有“台...', 'city/jilong.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('99', '20', '塔城市', '31', '82.978928', '46.748523', '塔城位于中国的西北角，位于新疆维吾尔自治区的西北部、伊犁哈萨克自治州的中部。塔城地区是哈萨克、汉、维吾尔、蒙古、回、...', 'city/tacheng.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('100', '6', '大庆市', '10', '125.103784', '46.589309', '大庆市地处黑龙江省西部、松嫩平原中部，，是黑龙江省西部中心城市，被誉为天然百湖之城、绿色油化之都、北国温泉之乡。\n大...', 'city/daqing.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('101', '13', '大兴安岭地区', '10', '124.71108', '52.335206', '大兴区，地处北京南郊平原，东经116°13′-116°43′，北纬 39°26′-39°51′，区位优势得天独厚。大...', 'city/daxing.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('102', '2', '大同市', '6', '113.300129', '40.076762', '遗存下来的古迹、艺术却成为人类历史无法替代的珍宝。好地方美食很不错，好玩的风景也很多。给人留下留下很好的印象，整个城市也很不错。', 'city/datong.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('103', '13', '大理白族自治州', '25', '100.267638', '25.606486', '风花雪月的大理相比丽江更安静，民风更淳朴，适合长住。崇圣寺三塔特别漂亮，苍山洱海也是很好的自然景观。大理有很多白族特色风格的建筑，历史悠久。小吃很好吃，推荐喜洲粑粑。大', 'city/dali.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('104', '2', '大连市', '8', '121.614682', '38.914003', '大连环境非常好，街道很干净，绿化做得很美，绝对是适合生活的城市。海景特别漂亮，吹吹惬意的海风很不错。发现王国印象最深刻，建设的也很好。海鲜很好吃，而且价格也不贵。', 'city/dalian.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('105', '4', '天水市', '21', '105.724947', '34.580863', '天水市地处陕、甘、川三省交界，东连祖国内地华中、华东及沿海各地，西通青海、西藏、新疆、直至欧亚大陆桥上的欧洲各国，南...', 'city/tianshui.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('106', '1', '天津市', '2', '117.200983', '39.084158', '天津有很多欧式建筑，能感受到浓郁的异域风情。风景不错，意大利风情区和五大道都值得走走看看。美食更是独树一帜，很有特色，推荐煎饼果子、狗不理包子和十八街麻花，还能吃到海鲜。', 'city/tianjin.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('107', '14', '天门市', '18', '113.166557', '30.663719', '天门市古称竟陵，素有“三乡宝地”的美誉，是闻名全国的内地侨乡、文化之乡、蒸菜之乡和棉花之乡。还是茶圣故里、状元之乡、...', 'city/tianmen.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('108', '1', '太原市', '6', '112.548879', '37.87059', '一座龙城宝地，兵家必争之地，岁月重新雕琢的古老石窟，中国的面食之都，在各种美食与历史遗迹中领略这座历经沧桑的历史文化名城。', 'city/taiyuan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('109', '19', '奎屯市', '31', '84.903267', '44.426529', '奎屯市是中华人民共和国新疆维吾尔自治区伊犁哈萨克自治州直辖的县级市，位于新疆西北部，地处天山北麓和准噶尔盆地西南缘。...', 'city/kuitun.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('110', '10', '威海市', '16', '122.120419', '37.513068', '威海的气候是最宜人的，环境好，干净的海边城市，风景非常好，而且海鲜很便宜也很新鲜。', 'city/weihai.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('111', '13', '娄底市', '19', '111.993497', '27.700062', '娄底市位于湖南省中部，因相传是天上28个星宿中的“娄星”和“氐星”交相辉映之处而得名。\n 娄底境内山脉纵横，群峰起伏...', 'city/loudi.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('112', '9', '孝感市', '18', '113.916902', '30.924568', '孝感是中国湖北省下辖的一个地级市，地处湖北省东北部。长江以北、汉水之东。南邻“九省通衢”的武汉市，北连河南省的南大门...', 'city/xiaogan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('113', '9', '宁德市', '14', '119.547932', '26.665617', '宁德俗称“闽东”，位于福建东北部，东临东海，西靠武夷山，南与福州市毗连，北与浙江省接壤。地形属丘陵山地，海滨有狭长的...', 'city/ningde.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('114', '2', '宁波市', '12', '121.550357', '29.874556', '宁波市全国历史文化名城，是浙江的三大经济中心之一。山清水秀、文化荟萃，城隍庙的小吃还有三江边的夜景让人流连忘返的。', 'city/ningbo.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('115', '8', '安庆市', '13', '117.063754', '30.543494', '安庆，皖西南中心城市，安徽省“皖江开发”的重点城市之一，长江沿岸著名的港口城市，中国民族工业的发源地，中国传统戏剧黄...', 'city/anqing.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('116', '9', '安康市', '27', '109.029022', '32.684714', '安康古称金州，地处重要的南北过渡地带，北靠秦岭，南依巴山，北接西安，南连三峡、张家界著名国家旅游区，东接湖北道教圣地...', 'city/ankang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('117', '5', '安阳市', '17', '114.392392', '36.097577', '安阳市位于中国河南省的最北部，地处山东省、山西省、河北省、河南省四省毗邻处。从中国版图上看，它正居于中心部位。西倚巍...', 'city/anyang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('118', '4', '安顺市', '23', '105.947593', '26.253072', '安顺是黄果树瀑布和龙宫风景名胜区所在地,是全国甲类旅游开放城市,是世界喀斯特风光旅游优选地区,是全国六大黄金旅游热线...', 'city/anshun.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('119', '10', '定安县', '24', '110.358891', '19.681434', '0定安县位于海南岛东北，南渡江中游。定安县面积1187平方公里，人口28万，县政府驻定城镇，县辖10镇4乡，有3个...', 'city/dingan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('120', '11', '定西市', '21', '104.626282', '35.580662', '定西地处黄河上游，位于甘肃中部，是一片古老、广袤、神奇的土地。全市辖安定、通渭、陇西、临洮、渭源、漳县、岷县1区6县...', 'city/dingxi.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('121', '9', '宜兰县', '7', '0', '0', '', 'city/yilan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('122', '13', '宜宾市', '22', '104.643215', '28.751768', '宜宾，位于中国四川省中南部。因金沙江、岷江在此汇合，长江至此始称“长江”，故宜宾也被称为“万里长江第一城”，长江宜宾...', 'city/yibin.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('123', '5', '宜昌市', '18', '111.286471', '30.691967', '宜昌，古代时候称为“夷陵”，因“水至此而夷，山至此而陵”而得名。宜昌位于长江中游和上游的分界处，沿江而上，经三峡可达...', 'city/yichang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('124', '9', '宜春市', '15', '114.416778', '27.815619', '伊春是座美丽的林业城市，是国家的重要木材生产基地。这里因盛产珍贵珍树“红松”，被誉为“红松故乡”、“祖国林都”。在伊...', 'city/yichun.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('125', '3', '宝鸡市', '27', '107.237974', '34.361979', '宝鸡位于陕西关中西部，地处陕、甘、宁、川四省（区）结合部，处于西安、兰州、银川、成都四个省会（首府）城市的中心位置，...', 'city/baoji.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('126', '17', '宣城市', '13', '118.758816', '30.940718', '宣城位于安徽省东南部，与江苏、浙江两省接壤，是东南沿海沟通内地的重要通道。东连天目，南倚黄山，西靠九华，域内襟山带水...', 'city/xuancheng.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('127', '12', '宿州市', '13', '116.964356', '33.646373', '城市很秀气，风景和人文感觉都很好。知名旅游景点非常多，苏州园林则是最有名的景点。山塘街夜景很美，很有特色，观前街很热闹小吃也多。温婉的江南水乡是一座适合生活的安逸城市。', 'city/suzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('128', '13', '宿迁市', '11', '118.275198', '33.963232', '宿迁，位于江苏省北部，属淮海经济带、沿海经济带、沿江经济带的交叉辐射区。宿迁境内发现的长臂猿化石，距今1000多万年...', 'city/suqian.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('129', '20', '屏东县', '7', '0', '0', '屏东是台湾最南的县，终年长夏，但因有季风的调节，气候并不酷热，素有“台湾的南洋”之称。\r\n屏东开发甚早，早期有鲁凯、...', 'city/pingdong.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('130', '11', '屯昌县', '24', '110.103415', '19.351766', '屯昌县位于海南岛中部偏北，地处五指山北麓，南渡江南岸。北距省会海口市中心85公里，东与定安、琼海接壤，南与琼中交界，...', 'city/tunchang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('131', '4', '山南地区', '29', '91.766525', '29.236023', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('132', '6', '岳阳市', '19', '113.128958', '29.357104', '岳阳历史悠久，名胜古迹多，旅游资源异常丰富。岳阳市区及周围的景点以岳阳10景最为著名，即洞庭浮黛（君山岛），名楼仰哲...', 'city/yueyang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('133', '14', '崇左市', '28', '107.364711', '22.376532', '崇左市位于广西的西南部，于2003年8月6日正式挂牌成立。境内有宁明、龙州、大新、凭祥四个县（市）与越南接壤，边境线...', 'city/chongzuo.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('134', '13', '巢湖市', '13', '117.8618', '31.598628', '很少有一个地方像巢湖一样，襟江而又拥湖，大江大湖在这里交汇，江南江北文化在这里集聚。景区环境非常优美...', 'city/chaohu.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('135', '17', '巴中市', '22', '106.747477', '31.867903', '巴中市位于四川省东北部，属盆周边远山区，东邻达川，南接南充，西抵广元，北接陕西汉中。巴中历史悠久，远古时期就有人类活...', 'city/bazhong.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('136', '8', '巴彦淖尔市', '32', '107.387657', '40.743213', '巴彦淖尔是内蒙古自治区西部的一个新兴城市，东接包头市，西邻阿拉善盟，南隔黄河与鄂尔多斯市相望，北与蒙古国接壤。聚居着...', 'city/bayannaoer.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('137', '4', '常州市', '11', '119.973987', '31.810689', '常州位于美丽富饶的长江三角洲中心地带，地处江苏省南部，北携长江，南衔太湖，与上海、南京等距相望，沪宁铁路、沪宁高速公...', 'city/changzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('138', '7', '常德市', '19', '111.698497', '29.031673', '常德位于湖南省西北部，地处长江中游洞庭湖水系沅江下游和澧水中下游以及武陵山脉、雪峰山脉东北端。常德市东据西洞庭湖，与...', 'city/changde.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('139', '8', '平凉市', '21', '106.66524', '35.543051', '平凉市位于甘肃省东部，陕、甘、宁三省（区）交汇处，横跨陇山(关山)，东邻陕西咸阳，西连甘肃定西、白银，南接陕西宝鸡和...', 'city/pingliang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('140', '4', '平顶山市', '17', '113.192661', '33.766169', '平顶山市位于河南省中部，是国家重要的能源原材料工业基地、中国优秀旅游城市和中原城市群9个中心城市之一。\n平顶山市历史...', 'city/pingdingshan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('141', '7', '广元市', '22', '105.843357', '32.435435', '广元市古称利州，已有2300多年的历史，位于四川省北部，川陕甘三省交汇处，为四川的北大门，是进出川的咽喉重地，素有“...', 'city/guangyuan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('142', '14', '广安市', '22', '106.633212', '30.455961', '广安是中国改革开放和社会主义现代化建设总设计师邓小平同志的故乡。1993年7月设立地区，1998年7月撤地设市，是四...', 'city/guangan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('143', '1', '广州市', '20', '113.264434', '23.129162', '广州作为中国最发达的城市之一，交通还算方便。好玩的地方很多，珠江夜景很漂亮，上下九步行街十分美丽，有空的时候还是值得看看的。广州的小吃众多，早茶和粤菜都很有特色。', 'city/guangzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('144', '10', '庆阳市', '21', '107.643631', '35.709077', '庆阳，位于甘肃省东部，陕甘宁三省区的交会处，习称“陇东”，素有“陇东粮仓”之称。庆阳市东接陕西省，北接陕西和宁夏，西...', 'city/qingyang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('145', '13', '库尔勒市', '31', '86.174633', '41.725892', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('146', '10', '廊坊市', '5', '116.683752', '39.538047', '廊坊位于河北省中部偏东，地处京津两大城市之间，被誉为“京津走廊上的明珠”。早在公元前4300年，廊坊人的祖先就在这片...', 'city/langfang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('147', '6', '延安市', '27', '109.489727', '36.585455', '延安位于陕西省北部，黄土高原的中南部，北连榆林地区，南接关中咸阳、铜川、渭南三市，东隔黄河与山西省临汾、吕梁地区相望...', 'city/yanan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('148', '9', '延边朝鲜族自治州', '9', '129.508946', '42.891253', '延边朝鲜族自治州位于吉林省东部，东与俄罗斯滨海边疆区毗邻，南与朝鲜咸境北道、两江道隔图们江相望，是一个有山皆绿、有水...', 'city/yanbian.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('149', '2', '开封市', '17', '114.307581', '34.797239', '清明上河园是开封最好玩的地方了吧，山脚下风景不错。印象最深刻的是湖很多，深厚的文化积淀，很漂亮的地方。', 'city/kaifeng.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('150', '7', '张家口市', '5', '114.887543', '40.824418', '张家口市地处京晋冀蒙交界处，距北京约180公里，这里地势险要，有“塞外山城”之称。全市地势西北高、东南低，阴山山脉横...', 'city/zhangjiakou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('151', '8', '张家界市', '19', '110.479191', '29.117096', '张家界景色很美，门票有点贵，火车站建得太小气了，不过森林公园太赞了，它美妙得展现了大自然的美丽，雄伟的山峰直插云霄。森林公园里环境优美，空气很清新，是真正的大自然风光。', 'city/zhangjiajie.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('152', '7', '张掖市', '21', '100.449818', '38.925875', '张掖取“张国臂掖，以通西域”而得名，是古丝绸之路上一颗璀璨的明珠，素有“金张掖”之称。悠久的历史，灿烂的文化，秀丽的...', 'city/zhangye.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('153', '14', '彰化县', '7', '0', '0', '彰化县位于台湾中部，西临台湾海峡，东以平缓的八卦山脉和南投相邻，北以大肚溪和台中相接，南部则和云林县以浊水溪相隔，幅...', 'city/zhanghua.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('154', '3', '徐州市', '11', '117.284124', '34.205768', '古称彭城，中国历史文化名城。淮海经济区中心城市，为华夏九州之一。地处南北方过渡地带，为北国锁钥，南国门户，向来为兵家...', 'city/xuzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('155', '14', '德宏傣族景颇族自治州', '25', '98.584895', '24.433353', '', 'city/dehong.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('156', '14', '德州市', '16', '116.357464', '37.434092', '德州市位于黄河下游北岸，山东省西北部。德州自古就有“九达天衢”、“神京门户”之称，是华东、华北重要的交通枢纽。主要景...', 'city/dezhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('157', '5', '德阳市', '22', '104.397894', '31.126855', '德阳市位于四川盆地成都平原东北边缘，是川西平原上一颗璀璨的明珠，是中国重大技术装备制造业基地，联合国工业发展组织。德...', 'city/deyang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('158', '9', '忻州市', '6', '112.734174', '38.416663', '位于武汉市东部，长江中游北岸。东北与黄冈的团风县、麻城市、红安县接壤，西与黄陂区毗连，南与洪山区和鄂州市华容区隔江相...', 'city/xinzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('159', '12', '怀化市', '19', '109.998488', '27.554978', '怀化市是东中部地区通向大西南的桥头堡和国内重要交通枢纽城市，南接广西（桂林、柳州），西连贵州（铜仁、黔东南），与湖南...', 'city/huaihua.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('160', '15', '怒江傈傈族自治州', '25', '98.853097', '25.852547', '怒江傈僳族自治州位于云南省西北部，因怒江由北向南纵贯全境而得名。怒江是中国西南地区的大河之一，又称潞江，上游藏语叫“...', 'city/nujiang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('161', '7', '思茅市', '25', '99.583235', '22.325014', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('162', '17', '恩施土家族苗族自治州', '18', '109.488172', '30.272156', '恩施是土家族苗族自治州首府，位于湖北省西南部，地处湘、鄂、渝三省（市）交汇处。恩施是上古巴文化发源地，文化优势得天独...', 'city/enshi.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('163', '11', '惠州市', '20', '114.416196', '23.111847', '徽州，简称“徽”，古称歙州，又名新安，宋徽宗宣和三年（公元1121年），改歙州为徽州，从此历宋元明清四代，统一府六县...', 'city/huizhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('164', '1', '成都市', '22', '104.066541', '30.572269', '成都是很悠闲的城市，文化底蕴深厚，生活节奏慢，周边有很多好玩的景点。成都的美食实在是让人流连忘返，最最最推荐的就是吃，宽窄巷子很多好吃的，走饿了可以吃吃小吃和正宗的川菜。', 'city/chengdu.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('165', '10', '扬州市', '11', '119.412966', '32.39421', '印象最深的是吃了一晚阳春面，精致的城市安静的城市，而且园林还好吧。美味的扬州美食，东关街的小吃很诱人。', 'city/yangzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('166', '8', '承德市', '5', '117.96241', '40.954071', '著名的避暑胜地，空气清新，名气很大。壮观宏伟的皇家园林，气派而风光优美的狩猎场，承德的大气和美丽让人大开眼界。夏天很凉快，面积很大，旺季人很多。', 'city/chengde.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('167', '10', '抚州市', '15', '116.358181', '27.949217', '福州空气质量超级好，闽江夜景也是非常赞，都映像深刻。当地有很多特色小吃，三坊七巷不仅有着深厚的闵文化底蕴，还拥有文艺与小资', 'city/fuzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('168', '4', '抚顺市', '8', '123.957208', '41.880872', '富顺县地处四川盆地南部、沱江下游，被誉为“千年古县”、“巴蜀才子之乡” 、“中国豆花之城” 。\n富顺县旅游资源概括为...', 'city/fushun.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('169', '1', '拉萨市', '29', '91.140856', '29.645554', '“日光之城”拉萨是多少人心灵的家园，在3700多米的海拔上，浓厚的宗教氛围和悠久的历史遗迹让人激动的眩晕。', 'city/lasa.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('170', '20', '揭阳市', '20', '116.372831', '23.549993', '揭阳市位于广东省东南部，北靠兴梅，南濒南海，东邻汕头、潮州，西接汕尾，中部、南部和东南部都是广阔肥沃的榕江冲积平原和...', 'city/jieyang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('171', '3', '攀枝花市', '22', '101.718637', '26.582347', '攀枝花是全国唯一以花命名的市，位于中国西南川滇交界部，东北面与会理、德昌、盐源3县接壤；西南面与华坪、永仁2县，宁蒗...', 'city/panzhihua.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('172', '9', '文山壮族苗族自治州', '25', '104.216248', '23.400733', '文山，中国“三七之乡”，盛产被称为“金不换”的三七（田七）。文山是个壮族苗族自治州，是云南省的东南门户。文三境内有世...', 'city/wenshan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('173', '6', '文昌市', '24', '110.797714', '19.543423', '文昌旅游简介文昌市在西汉时建紫贝县，唐贞观元年（公元627年）改文昌县，历经2000多年，1995年撤县建市。是海南...', 'city/wenchang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('174', '7', '新乡市', '17', '113.9268', '35.303004', '新乡市为豫北政治、经济、文化和交通中心城市。历史遗迹众多，文物资源丰富。0\n0   全市拥有各类自然景观数百处，...', 'city/xinxiang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('175', '5', '新余市', '15', '114.917346', '27.817808', '　　新余市位于江西省中部偏西，浙赣铁路西段，全境东西最长处101.9公里，南北最宽处65公里，东距省会南昌市150公...', 'city/xinyu.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('176', '11', '新竹县', '7', '0', '0', '新竹县北与桃园县毗连，南接苗栗县，县内地势起伏多变，涵盖平原、丘陵、断崖、盆地、高山等地形，自然景观丰富，山林溪壑之...', 'city/xinzhu.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('177', '6', '新竹市', '7', '0', '0', '新竹县北与桃园县毗连，南接苗栗县，县内地势起伏多变，涵盖平原、丘陵、断崖、盆地、高山等地形，自然景观丰富，山林溪壑之...', 'city/xinzhu.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('178', '2', '无锡市', '11', '120.31191', '31.491169', '江南烟雨、太湖碧波，孕育了无锡的过往和现在。糯软的锡剧唱腔，和着灵山的佛音，佐以二泉映月的曲调，再配上无锡排骨等各色小吃，时间就可以在此停住了。', 'city/wuxi.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('179', '5', '日喀则地区', '29', '0', '0', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('180', '11', '日照市', '16', '119.526888', '35.416377', '因日光先照而得名，是一个美丽的海滨小城。沿海从南到北六十公里金沙滩，日照最主要的景点都集中于此。空气很新鲜，海鲜还挺便宜，而且感觉当地人很热情。', 'city/rizhao.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('181', '1', '昆明市', '25', '102.832891', '24.880095', '春城的生活节奏很慢，城市干净整洁，长水机场相当漂亮。市区内有许多好玩的地方，气候十分宜人，空气也很好。石林很雄伟，滇池的海鸥也挺好看，如果3月份到昆明可以去圆通寺赏樱花。', 'city/kunming.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('182', '14', '昌吉市　', '31', '0', '0', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('183', '14', '昌江黎族自治县', '24', '109.055724', '19.298062', '昌江黎族自治县位于海南省西北偏西部，地跨北纬18°53\'～19°30\'、东经108°38\'～109°17\'之间。东与...', 'city/changjiang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('184', '3', '昌都地区', '29', '0', '0', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('185', '5', '昭通市', '25', '103.717465', '27.338257', '昭通位于云南省东北部，与贵州、四川两省接壤。昭通历史上曾是云南通向川黔两省的重要门户，是中原文化进入云南的重要通道，...', 'city/zhaotong.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('186', '7', '晋中市', '6', '112.752694', '37.687024', '晋中位于山西省中部，东依太行，西临汾河，北与省会太原市毗邻。晋中乃是一座历史文化底蕴非常深厚、文化气质十分独特鲜明，...', 'city/jinzhong.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('187', '5', '晋城市', '6', '112.851831', '35.490701', '晋城，华夏文明的发祥地之一。女娲补天、神农播种、禹凿石门、愚公移山、精卫填海等历史传说在晋城都有实地可指。晋城还是“...', 'city/jincheng.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('188', '2', '景德镇市', '15', '117.178419', '29.268835', '景德镇是一座很神奇的城市，如果你是过往的客人，除了在莲社北路买点精致的瓶瓶罐罐，在素以作旧仿古著称的樊家井吟唱“假作...', 'city/jingdezhen.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('189', '2', '曲靖市', '25', '103.796167', '25.489999', '曲靖好玩的地方有好多，风景也很漂亮。罗平油菜花全国有名，优雅含蓄的麒麟公园，而且好美的梯田。而且还有秀美的多依河。', 'city/qujing.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('190', '6', '朔州市', '6', '112.432825', '39.331595', '朔州市位于山西省北部，是一座新崛起的能源工业城市，地处大同盆地南沿，西北部与内蒙古高原毗邻，正处在我国东西部经济地带...', 'city/shuozhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('191', '13', '朝阳市', '8', '120.450372', '41.573734', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('192', '5', '本溪市', '8', '123.766485', '41.294175', '本溪是一座闻名遐尔的煤铁之城，是国家重要的原材料工业基地。这里峰岭耸翠，重峦叠嶂，山地约占总面积的80％。本溪市依山...', 'city/benxi.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('193', '13', '来宾市', '28', '109.221465', '23.750306', '来宾市为广西壮族自治区管辖的地级市，于2002年12月28日正式成立。来宾市位于北纬23°16′至26°29′、东经...', 'city/laibin.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('194', '1', '杭州市', '12', '120.15507', '30.274084', '杭州风景美丽，人间天堂名不虚传。整个城市的绿化很好，空气很清新。最著名的景点就是西湖，西溪湿地也很舒服。杭州的生活节奏不快，租借一辆自行车在市区骑行也很不错。', 'city/hangzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('195', '7', '松原市', '9', '124.825117', '45.141789', '松原市位于吉林省中西部，地处哈尔滨、长春、大庆三角地带。松嫩平原南端，坐落在美丽的松花江畔。入选2009中国魅力中小...', 'city/songyuan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('196', '7', '林芝地区', '29', '94.361557', '29.648943', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('197', '6', '果洛藏族自治州', '26', '100.244808', '34.471431', '果洛藏族自治州地处青藏高原腹地，黄河源头，位于青海省的东南部。地处青南高原东南部，巴颜喀拉山自西北向东南贯穿州境西南...', 'city/guoluo.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('198', '4', '枣庄市', '16', '117.323725', '34.810487', '枣庄市位于山东省南部，东偎山清水秀的沂蒙山区，西临碧波荡漾的微山湖，南枕京杭古运河，北连孔孟之乡——曲阜。枣庄旅游资...', 'city/zaozhuang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('199', '2', '柳州市', '28', '109.415953', '24.325502', '柳州，又称龙城，是广西重要的区域中心城市，广西工业名城、历史名城、文化名城、旅游名城。全市辖6县4区，总面积1.8万...', 'city/liuzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('200', '2', '株洲市', '19', '113.134002', '27.82755', '　　株洲是一座历史文化古城。古称建宁，是炎黄文化的重要发祥地。中华民族的始祖、农耕文化的创始人――炎帝神农氏，就长眠...', 'city/zhuzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('201', '3', '桂林市', '28', '110.290194', '25.273566', '桂林是个旅游的好地方，风景绝对独特。漓江两岸风光秀丽，空气十分清新，泛舟漓江看十里画廊非常惬意，喀斯特地貌风光也很不错。自然风光之外桂林还有很多美食，推荐桂林米粉。', 'city/guilin.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('202', '10', '桃园县', '7', '118.591385', '31.856173', '桃园县位于台湾西北部，除了西面靠海之外分别与台北县、新竹县、宜兰县相邻，面积为1220.954平方公里，桃园名称的由...', 'city/taoyuan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('203', '12', '梅州市', '20', '116.122238', '24.288615', '梅州市位于广东省东北部，是历史上客家民系的最终形成地、聚居地和繁衍地，更是全世界客家华侨的祖籍地和精神家园，被尊为“...', 'city/meizhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('204', '4', '梧州市', '28', '111.279115', '23.476962', '梧州市，位于广西东部，市区紧接两广边界，为广西东大门。梧州遥连五岭，俯视三江。山清水秀，风光旖旎，四季宜人，山在城中...', 'city/wuzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('205', '12', '楚雄彝族自治州', '25', '101.528068', '25.045532', '被誉为美丽的彝州，是亚洲的人类摇篮，这里发现了亚洲最早的元谋人和禄丰古猿，也是著名的恐龙之乡。楚雄明清时期曾是滇西佛教圣地，林木参天、古藤缠树，草坪如茵。', 'city/chuxiong.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('206', '8', '榆林市', '27', '109.734589', '38.28539', '榆林市位于陕西省的最北部，在黄土高原和毛乌素沙漠的交界处，东临黄河与山西相望，西连宁夏、甘肃，北邻内蒙鄂尔多斯市，南...', 'city/yulin.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('207', '6', '武威市', '21', '102.638011', '37.928264', '武威，亦称凉州，地处甘肃省河西走廊东端，历史上曾是丝绸之路的要冲。公元前121年，因汉武帝派骠骑大将军霍去病远征河西...', 'city/wuwei.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('208', '1', '武汉市', '18', '114.305392', '30.593098', '文化底蕴浓厚，古典与现代并存的城市。风景还不错，好玩的景点很多。江汉路的建筑让人印象深刻，长江大桥夜景很美，户部巷的美食值得花时间去寻觅，还可以在樱花盛开的季节来赏樱。', 'city/wuhan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('209', '6', '毕节地区', '23', '105.285011', '27.301693', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('210', '11', '永州市', '19', '111.613445', '26.420394', '永州位于中国中南部，湘江上游南岸，潇、湘二水汇合永州，自古雅称潇湘，别称“竹城”。永州市区（零陵区、冷水滩区）是湖南...', 'city/yongzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('211', '7', '汉中市', '27', '107.023323', '33.06748', '汉中市简称“汉”，位于陕西省西南部，汉江上游，北倚秦岭、南屏大巴山。汉中市历史悠久，是汉家的发祥地。汉中在夏商时期称...', 'city/hanzhong.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('212', '4', '汕头市', '20', '116.681972', '23.354091', '汕头市，别名“鮀城“，位于中国广东省东南部，濒临南海，地处韩江、榕江、练江出海口，处于“大珠三角”和“泛珠三角”经济...', 'city/shantou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('213', '13', '汕尾市', '20', '115.375278', '22.786211', '汕尾地处粤东沿海，地势北高南低，雨量充沛，气候宜人。汕尾市汕尾原名因“汕”的意思是海滩的高处，这里景色优美，故曰“汕...', 'city/shanwei.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('214', '7', '江门市', '20', '113.081901', '22.578738', '江门位于广东省中南部，地势西北高，东南低。有12种属国家级和省级珍稀濒危保护植物。江门市是珠江三角土地、海洋资源极为...', 'city/jiangmen.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('215', '16', '池州市', '13', '117.491568', '30.6648', '池州市位于安徽省西南部，长江下游南岸，东连铜陵，南接黄山，西邻江西，北濒长江。池州地理优越，区位优势明显。地处长江经...', 'city/chizhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('216', '1', '沈阳市', '8', '123.431474', '41.805698', '是东北地区的经济、文化、交通和商贸中心、东北地区第一大城市。印象最深的是棋盘山滑雪，历史积淀深厚，是一座风景优美现代化的大都市，世博园也很美。', 'city/shenyang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('217', '9', '沧州市', '5', '116.838834', '38.304477', '沧州地处河北省东南部，东临渤海，北靠京津，与山东半岛及辽东半岛隔海相望。现辖10县4市2区和2个县级国营农场，面积1...', 'city/cangzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('218', '12', '河池市', '28', '108.085261', '24.692931', '河池市地处广西西北边陲、云贵高原南麓，是大西南通向沿海港口的重要通道，东连柳州，南界南宁，西接百色市，北邻贵州省黔南...', 'city/hechi.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('219', '14', '河源市', '20', '114.700447', '23.743538', '人不算太多，何园兜兜逛逛还是很惬意的。门票很便宜，导游也很热情。很精致的院子。建筑很气派，复道回廊是...', 'city/heyuan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('220', '5', '泉州市', '14', '118.675675', '24.874132', '700多年前被意大利人马可波罗称为“光明之城”的泉州，在中世纪有着400多年的辉煌。千古遗风依然会在不经意间多次闪现，既古朴清雅又精致婉约，既内敛深沉又舒展奔放。', 'city/quanzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('221', '9', '泰安市', '16', '117.087614', '36.200252', '国泰而民安，境内有”五岳之首“泰山，雄伟壮丽，乃华夏文化的缩影，山顶的风景醉人至极，而且名不虚传。', 'city/taian.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('222', '12', '泰州市', '11', '119.923116', '32.455778', '泰州市地处江苏省中部、长江沿岸，为长三角经济区16座中心城市之一，有凤凰城的美誉、“水陆要津，咽喉据郡”之称。泰州具...', 'city/taizhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('223', '4', '泸州市', '22', '105.442261', '28.871811', '泸州市位于中国四川省东南部，长江和沱江交汇处，地处中国白酒金三角核心，是中国著名的酒城，出产闻名遐尔的名酒泸州老窖和...', 'city/luzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('224', '3', '洛阳市', '17', '112.45404', '34.619682', '洛阳的牡丹和石窟很出名，龙门石窟特别好看。让人们不得不赞叹中国古代人民的智慧，很有历史的沉淀的气息。很多有地方特色的小吃都集中在市内，强烈推荐。', 'city/luoyang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('225', '1', '济南市', '16', '117.119999', '36.651216', '济南素有“天下泉城”的美誉，是个文化底蕴很深厚的城市。在这里可以感受到老舍笔下冬天的“温晴”，可以看到“四面荷花三面柳，一城山色半城湖”的美景。', 'city/jinan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('226', '8', '济宁市', '16', '116.587098', '35.414921', '济宁，孔孟之乡、运河之都，位于山东省的西南部，是中国优秀旅游城市、山东省鲁南城市带中心城市。济宁，具有7000年的文...', 'city/jining.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('227', '18', '济源市', '17', '112.602341', '35.069031', '济源市位于河南省西北部，是我国经济由东向西梯度推进的前沿地带，北依太行，西距王屋，南临黄河，东接华北平原，地处焦作、...', 'city/jiyuan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('228', '2', '海东地区', '26', '121.198479', '31.89315', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('229', '3', '海北藏族自治州', '26', '100.900997', '36.954413', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('230', '5', '海南藏族自治州', '26', '100.620373', '36.286437', '海南（英文名：Hai Nan），是中国南海上的一颗璀璨的明珠，是仅次于台湾的全国第二大岛。海南省是中国陆地面积最小，...', 'city/hainan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('231', '1', '海口市', '24', '110.198293', '20.044001', '迷人的碧海蓝天，旖旎的海底世界，茂密的热带丛林，传奇的少数民族风情，奇特的火山地质遗迹，海口，休闲度假首选之地。气候环境都不错，很美的地方。', 'city/haikou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('232', '8', '海西蒙古族藏族自治州', '26', '97.369751', '37.377139', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('233', '3', '淄博市', '16', '118.054927', '36.813487', '淄博市位于山东中部，南依泰沂山麓，北濒九曲黄河，西邻省会济南，东接潍坊、青岛。淄博历史悠久，是齐文化的发祥地。临淄为...', 'city/zibo.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('234', '6', '淮北市', '13', '116.798265', '33.955844', '淮北市位于安徽北部，地处苏豫皖三省交界处。淮北全市平原广袤，低山丘陵点缀其间，水域宽阔。淮北为安徽省9个省辖市之一，...', 'city/huaibei.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('235', '4', '淮南市', '13', '116.999932', '32.625478', '淮南是欣欣向荣的能源城市。位于安徽省中北部，横跨淮河两岸。淮南是一个工矿城市，也是一个山水园林城市。\r\n淮南是风景秀...', 'city/huainan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('236', '8', '淮安市', '11', '119.015285', '33.610353', '淮安旅游资源丰富，淮安历史悠久，曾是南船北马交汇之地，清乾隆年间盛极一时，与运河沿线的扬州、苏州、杭州并称为“四大都...', 'city/huaian.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('237', '2', '深圳市', '20', '114.057868', '22.543099', '深圳人的生活节奏很快，非常美丽的城市。深圳的道路比较宽阔，交通方便，规划很好。这里可以感受大都市的繁华和繁忙。世界之窗是不错的地方，气候也很适合居住。经济高度发达。', 'city/shenzhen.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('238', '16', '清远市', '20', '113.056031', '23.681763', '清远是一座年轻而充满魅力的城市。广东省地域最大的地级市和广东省少数民族主要聚居地。清远的良好地区形象已日益深入人心，...', 'city/qingyuan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('239', '3', '温州市', '12', '120.699366', '27.994267', '温州位于浙江省东南部，东濒东海。温州历史悠久，人杰地灵。浙南一带称作瓯。《山海经》里说：瓯居海中。新石器时代晚期，就...', 'city/wenzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('240', '5', '渭南市', '27', '109.509786', '34.499995', '渭南市地处陕西关中渭河平原东部，东濒黄河与山西、河南毗邻，西与西安、咸阳相接，南倚秦岭与商洛为界，北靠桥山与延安、铜...', 'city/weinan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('241', '5', '湖州市', '12', '120.086823', '30.894348', '湖州是中国环太湖地区唯一因湖而得名的城市。它地处浙江省北部，东临上海，南接杭州，西近南京，北与苏州、无锡隔太湖相望，...', 'city/huzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('242', '3', '湘潭市', '19', '112.944049', '27.829738', '湘潭市位于湖南省中部偏东地区，湘江中下游，是一代伟人毛泽东的故乡，是彭德怀、陈赓、谭政等老一辈无产阶级革命家的故乡。...', 'city/xiangtan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('243', '14', '湘西土家族苗族自治州', '19', '109.739172', '28.311947', '湘西土家族苗族自治州位于湖南省西北部、云贵高原东侧的武陵山区，与湖北省、贵州省、重庆市接壤；境内居住着土家、苗、汉、...', 'city/xiangxi.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('244', '8', '湛江市', '20', '110.359377', '21.270707', '湛江市位于中国大陆最南端，广东省西南部，包括中国三大半岛之一的雷州半岛全部和半岛以北一部分。地处粤桂琼三省（区）交汇...', 'city/zhanjiang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('245', '10', '滁州市', '13', '118.317106', '32.301556', '滁州位于安徽东部，地处江淮要冲，滨临长江，距省会合肥120公里。郡起元徽，州建大同，名始开皇，文扬庆历，开天首郡，逾...', 'city/chuzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('246', '16', '滨州市', '16', '117.970703', '37.38199', '滨州市位于黄河下游、鲁北平原，地处黄河三角洲腹地，是山东的北大门。滨州历史悠久，文化渊源流长。是黄河文化和齐文化的发...', 'city/binzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('247', '11', '漯河市', '17', '114.016539', '33.581412', '漯河位于河南省中部偏南，伏牛山东麓平原和淮北平原交错带，沙河与澧河在此交汇，“沙澧”二字成为漯河的代名词。漯河是河南...', 'city/luohe.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('248', '6', '漳州市', '14', '117.647481', '24.512948', '漳州地处福建省最南端，与台湾岛、厦门隔海相望，西南与广东的汕头毗邻，漳州平原是福建第一大平原。这块美丽的土地是水仙的...', 'city/zhangzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('249', '7', '潍坊市', '16', '119.161755', '36.706774', '潍坊市位于山东半岛中部，有“世界风筝都”的别名 。潍坊是历史上著名的手工业城市，清乾隆年间便有“南苏州、北潍县”之称...', 'city/weifang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('250', '15', '潜江市', '18', '112.900284', '30.401947', '潜江位于湖北省中南部江汉平原腹地，境内地势平坦，地面高程在26米至31米之间，属亚热带季风性湿润气候，雨量充沛，气候...', 'city/qianjiang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('251', '19', '潮州市', '20', '116.622603', '23.65695', '潮州，又称“凤城”，一个既有历史文化名城风貌，又具现代化气息的城市，潮州文化的重要发源地，素有“海滨邹鲁”、“岭海名...', 'city/chaozhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('252', '9', '澄迈县', '24', '110.006755', '19.738521', '澄迈县，位于海南岛北部。地理坐标为北纬19°23\'-20°01\'， 东经109°45\'-110°15\'。北面与东面同...', 'city/chengmai.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('253', '21', '澎湖县', '7', '0', '0', '澎湖县位于台湾海峡中流，全县由澎湖本岛及周围64个岛屿组成，统称澎湖列岛，极东是查某屿；极西是花屿；极南是七美岛；极...', 'city/penghu.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('254', '1', '澳门特别行政区', '33', '113.549088', '22.19895', '威尼斯人酒店真的很棒，小吃也不错，而且推荐去银河赌场。交通很方便，博彩业发达。奢华气息十足啊，悠闲的赌城。景色是很不错的，景点非常的多。', 'city/aomen.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('255', '9', '濮阳市', '17', '115.029215', '35.761829', '濮阳市位于中国河南省的东北部，黄河下游北岸，冀、鲁、豫三省交界处。濮阳是随着中原油田的开发而兴建的一座石油化工城市，...', 'city/puyang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('256', '6', '烟台市', '16', '121.447935', '37.463822', '光着脚丫踏在金色沙滩上，任细浪拂过脚背；登阁远眺，那仙境一般的烟台如梦如幻。海边建设的很好，海滩很美的。环境很不错，气候还算好。', 'city/yantai.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('257', '8', '焦作市', '17', '113.241823', '35.215892', '焦作位于河南省西北部，东连新乡，西接洛阳，南临黄河与省会一衣带水，北依太行与晋东南一脉相连。\n焦作的自然风光秀美壮丽...', 'city/jiaozuo.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('258', '8', '牡丹江市', '10', '129.633168', '44.551653', '牡丹江市位于黑龙江省东南部，素有“塞北江南”之称。风光旖旎，景色天成。　世界第二大火山熔岩堰塞湖、世界地质公园——镜...', 'city/mudanjiang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('259', '9', '玉林市', '28', '110.164756', '22.636379', '榆林市位于陕西省的最北部，在黄土高原和毛乌素沙漠的交界处，东临黄河与山西相望，西连宁夏、甘肃，北邻内蒙鄂尔多斯市，南...', 'city/yulin.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('260', '7', '玉树藏族自治州', '26', '97.091934', '33.011674', '青海省玉树藏族自治州，位于青海省西南青藏高原腹地的三江源头，北与该省海西蒙古藏族自治州相连，西北角与新疆的巴音郭楞自...', 'city/yushu.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('261', '3', '玉溪市', '25', '102.546543', '24.352036', '这里的生活已休闲精致出了名，就像漫步在自家的后花园里。喜欢那些从寻常生活中透出来的浪漫和情调，每个小地方都有自己的特色。', 'city/yuxi.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('262', '3', '珠海市', '20', '113.576726', '22.270715', '百岛之市，毗邻澳门使她成为经济特区，典型的亚热带风光、宁静休闲的生活方式使人们对她流连忘返。温泉不错，空气非常好。生活很悠闲，还有浪漫的情侣路。', 'city/zhuhai.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('263', '18', '琼中黎族苗族自治县', '24', '109.838389', '19.033369', '琼中地处海南岛中部，五指山北麓。全境东西长79.22公里，南北宽76.69公里，面积2693.1平方公里。人口196...', 'city/qiongzhong.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('264', '4', '琼海市', '24', '110.474579', '19.25914', '在海南岛东部，万泉河下游。境内地势自西北向东南倾斜，大部分为沿海低平地带。地形主要由平原、丘陵、山地三部分构成。东部...', 'city/qionghai.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('265', '14', '甘南藏族自治州', '21', '102.911027', '34.983385', '甘南藏族自治州位于中国甘肃省南部，是全国十个藏族自治州之一，地处青藏高原东北边缘，南与四川阿坝州相连，西南与青海黄南...', 'city/gannan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('266', '20', '甘孜藏族自治州', '22', '101.96231', '30.04952', '甘孜县位于甘孜藏族自治州西北部，雅砻江上游。“甘孜”系藏语，意为洁白、美丽，原为寺庙名，古称“朵甘思”。甘孜，藏语意...', 'city/ganzi.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('267', '8', '白城市', '9', '122.839024', '45.619641', '拜城县位于天山中段南麓、却勒塔格山北缘的山间盆地、渭干河上游流域。北依天山与昭苏、特克斯县相连，南隔却勒塔格山与新和...', 'city/baicheng.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('268', '6', '白山市', '9', '126.423587', '41.939994', '白山市，位于吉林省东南部自然风景秀丽的长白山西侧，东与延边州相邻；西与通化接壤；北与吉林毗连；南与朝鲜惠山市隔鸭绿江...', 'city/baishan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('269', '13', '白沙黎族自治县', '24', '109.451484', '19.224823', '江边的夕阳真的很美，景色也是怡人的，而且显得美景更加的美了。很美丽的一个地方，安静的去处。民风很淳朴...', 'city/baisha.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('270', '3', '白银市', '21', '104.138559', '36.544756', '白银市位于中国甘肃省中部，黄河上游，又称铜城。白银市是一块宝地，早在汉代就有采矿业。据文字记载，可以追溯到明朝洪武年...', 'city/baiyin.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('271', '10', '百色市', '28', '106.618201', '23.902333', '百色地处广西西部，西部与云南相接，北部与贵州毗邻，东与首府南宁紧连，南与越南接壤，是滇、黔、桂三省中心城市，是我国大...', 'city/baise.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('272', '9', '益阳市', '19', '112.35518', '28.55386', '益阳历史悠久，人文环境优美，是一座令人神往的文化古城。主要的益阳旅游景点——创办于440年前的龙洲书院，是古代湖南四...', 'city/yiyang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('273', '9', '盐城市', '11', '120.163561', '33.347382', '盐城，风光秀丽，生态环境独具特色，生态旅游资源十分丰富。盐城因盐得名，以产盐闻名于世，历史悠久，人文荟萃。盐城旅游景...', 'city/yancheng.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('274', '11', '盘锦市', '8', '122.070714', '41.119997', '盘锦地处渤海之滨、辽河三角洲的中心地带，是辽宁省西部沿海的一座新兴石油化工城市，也是我国沿海对外开放城市之一。辖双台...', 'city/panjin.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('275', '12', '眉山市', '22', '103.848538', '30.075439', '眉山市位于四川盆地成都平原西南边缘，2000年7月经国务院批准设立眉山市，辖东坡区、仁寿、彭山、洪雅、丹棱、青神一区...', 'city/meishan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('276', '2', '石嘴山市', '30', '106.383303', '38.983236', '石嘴山市位居黄河中游上段、宁夏回族自治区北部，东西宽约88.8公里，南北长119.5平方公里。因贺兰山脉与黄河交汇之...', 'city/shizuishan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('277', '1', '石家庄市', '5', '114.514859', '38.042306', '对石家庄印象还不错，古代称“常山、真定”，历史上曾与北京、保定并称“北方三雄镇”；近几年污染的确严重，整个城市很破旧的感觉。', 'city/shijiazhuang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('278', '3', '石河子市　', '31', '86.08046', '44.305428', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('279', '16', '神农架林区', '18', '110.675758', '31.744898', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('280', '1', '福州市', '14', '119.296494', '26.074507', '福州空气质量超级好，闽江夜景也是非常赞，都映像深刻。当地有很多特色小吃，三坊七巷不仅有着深厚的闵文化底蕴，还拥有文艺与小资', 'city/fuzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('281', '3', '秦皇岛市', '5', '119.600492', '39.935385', '海边日出特别美，北方最好的海和沙滩。气候真好，翡翠岛挺好玩的。环境很好，带的海鲜挺好吃，而且整体都不错。', 'city/qinhuangdao.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('282', '16', '米泉市', '31', '0', '0', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('283', '10', '红河哈尼族彝族自治州', '25', '103.374799', '23.36313', '发源于云南中部，至越南入海。红河也不仅仅是红河，这是一个县的名字，更是一个州的简称。神奇壮丽景观的红河哈尼梯田，梯田也很壮观。', 'city/honghe.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('284', '6', '绍兴市', '12', '120.580232', '30.029752', '绍兴的文化底蕴浓厚，具有江南水乡的灵秀，鲁迅故居保存完好。绍兴的风土人情，以乌蓬船、乌毡帽、乌干菜这“三乌”为代表，积淀了丰富的文化内涵并呈现独特的地方风采，令人神往。', 'city/shaoxing.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('285', '12', '绥化市', '10', '126.968887', '46.653845', '素以“北国大粮仓”著称的绥化市，盛产玉米、大豆、水稻等粮食作物和烤烟、亚麻、甜菜等经济作物，是国家重要商品粮基地、畜...', 'city/suihua.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('286', '6', '绵阳市', '22', '104.679114', '31.46745', '绵阳城市始建于公元前201年，距今已有2200余年的历史。绵阳，古称“涪城”、“绵州”，自古有“蜀道明珠”、“富乐之...', 'city/mianyang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('287', '15', '聊城市', '16', '115.985371', '36.456703', '聊城位于山东省西部，是著名的历史文化名城。历史悠久，有2500年的历史，文化底蕴非常丰富，文物古迹众多，如光岳楼、山...', 'city/liaocheng.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('288', '10', '肇庆市', '20', '112.465091', '23.047191', '肇庆市位于中国广东省，属珠江三角洲，西靠桂东南，珠江主干流西江穿境而过，北回归线横贯其中。背枕北岭，面临西江，上控苍...', 'city/zhaoqing.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('289', '2', '自贡市', '22', '104.778442', '29.33903', '自贡市地处四川省南部、沱江支流釜溪河畔。自贡历史悠久，因盐建镇、置县、设市。自贡具有两千年的盐业史和73年的建市史，...', 'city/zigong.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('290', '9', '舟山市', '12', '122.207215', '29.985295', '奇崖岩穴、名刹寺院、金沙浴场、渔港夜景，舟山就宛如一串翡翠般的珍珠，散落在东海洋面上。空气质量很好，有很好吃的海鲜。', 'city/zhoushan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('291', '2', '芜湖市', '13', '118.432941', '31.352859', '芜湖地处长江下游南岸，南倚皖南山系，北望江淮平原，浩浩长江自城西南向东北缓缓流过，青弋江自东南向西北，穿城而过，汇入...', 'city/wuhu.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('292', '23', '花莲县', '7', '0', '0', '花莲是台湾最后一个被汉人移居的地方之一。古称“奇莱”，为台湾面积第一大县。花莲东边以海岸山脉滨临太平洋，西边是高耸的...', 'city/hualian.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('293', '5', '苏州市', '11', '120.585315', '31.298886', '城市很秀气，风景和人文感觉都很好。知名旅游景点非常多，苏州园林则是最有名的景点。山塘街夜景很美，很有特色，观前街很热闹小吃也多。温婉的江南水乡是一座适合生活的安逸城市。', 'city/suzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('294', '12', '苗栗县', '7', '0', '0', '苗栗县是典型的客家县，客家人占总人口的七成左右，约是闽南人的两倍。苗栗县在地理上分为海线、山线与中港溪三个地区。\r\n...', 'city/miaoli.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('295', '9', '茂名市', '20', '110.925456', '21.662999', '茂名市位于广东省西南部，海岸线曲折多湾，迂回220多公里，盛产龙虾、对虾、海参、鲈鱼膏蟹等，全市水产品产量居全省第一...', 'city/maoming.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('296', '4', '荆州市', '18', '112.239741', '30.335165', '荆州旅游资源得天独厚，文化旅游、生态旅游蔚为大观。全市旅游景点呈现“一城三片”的格局。“一城”即闻名遐迩的荆州古城，...', 'city/jingzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('297', '8', '荆门市', '18', '112.199265', '31.035423', '荆门市地处湖北省腹地中心，位于美丽富饶的江汉平原北部。素有“地接江汉，门锁荆楚”之称，自商周（约公元前16世纪）以来...', 'city/jingmen.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('298', '3', '莆田市', '14', '119.007777', '25.454084', '莆田县古称“蒲口”，因盛产荔枝，别称“荔城”。\r\n莆田是海上和平女神妈祖的故乡，位于湄洲岛上的湄洲天后宫是世界上20...', 'city/putian.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('299', '12', '莱芜市', '16', '117.676723', '36.213813', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('300', '17', '菏泽市', '16', '115.480656', '35.23375', '菏泽古称曹州，以水名称县，始于1735年（清雍正十三年），曹州升州为府，设附郭县，赐名“菏泽”。“菏泽”原系天然古泽...', 'city/heze.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('301', '3', '萍乡市', '15', '113.854556', '27.622768', '萍乡为江西省所辖的十一个地级市之一，位于江西省西部，东与江西宜春、南与江西吉安、西与湖南醴陵、北与湖南浏阳接壤。毗邻...', 'city/pingxiang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('302', '8', '营口市', '8', '122.235417', '40.667012', '营口市位于辽东半岛西北部，大辽河入海口左岸。西临渤海辽东湾，与锦州、葫芦岛隔海相望；北与大洼、海城为邻；东与岫岩、庄...', 'city/yingkou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('303', '14', '葫芦岛市', '8', '120.836932', '40.711052', '葫芦岛市地处辽宁省西南部，1989年建市，原名锦西市，是环渤海经济圈最年轻的城市。葫芦岛东邻锦州，西接山海关，南临辽...', 'city/huludao.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('304', '3', '蚌埠市', '13', '117.389719', '32.916287', '蚌埠市地处淮河流域，因古代盛产河蚌而得名，有“珍珠城”的美誉。同时也是是安徽省重要的工业城市。蚌埠，有着悠久的历史和...', 'city/bengbu.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('305', '11', '衡水市', '5', '115.670177', '37.73892', '在纵贯河北省东南部的滏阳河畔，有一座新兴的城市--衡水市。滏阳河由市西南方向蜿蜒入境，贯穿衡水全境。衡水是大京九上靠...', 'city/hengshui.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('306', '4', '衡阳市', '19', '112.571997', '26.89323', '衡阳地处南岳衡山之南，因山南水北为“阳”，故得此名。而因“北雁南飞，至此歇翅停回”，栖息于城南回雁峰，故雅称“雁城”...', 'city/hengyang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('307', '8', '衢州市', '12', '118.859457', '28.970079', '衢州位于浙江省西部，钱塘江上游，金华衢州盆地西端，南接福建 南平，西连江西 上饶、景德镇，北邻安徽 黄山，东与省内金...', 'city/quzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('308', '6', '襄樊市', '18', '112.14415', '32.042427', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('309', '11', '西双版纳傣族自治州', '25', '100.797777', '22.007351', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('310', '1', '西宁市', '26', '101.778228', '36.617144', '羊肉真的很好吃，皇光的小吃烤肉啦麻团啦都不错。至今印象很深刻，一个风沙很大的城市。夜入得好迟，晚上八九点钟都还能见到蓝天。', 'city/xining.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('311', '1', '西安市', '27', '108.940174', '34.341568', '西安历史文化底蕴深厚，同时也是时尚的现代化大都市。兵马俑十分壮观，古城很雄伟，明城墙保存的非常好，钟鼓楼后面的回民小吃街有很多美食。但是节假日期间人很多。', 'city/xian.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('312', '10', '许昌市', '17', '113.85264', '34.035506', ']许昌市位于河南省中部，中原腹地。许昌历史悠久，人杰地灵，是华夏民族重要的发祥地之一。在远古时期，许由部落在此繁衍生...', 'city/xuchang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('313', '8', '贵港市', '28', '109.598926', '23.11153', '贵港是广西壮族自治区的一个下辖市，位于广西东南部、西江流域的中游。贵港东临梧州、南临玉林和钦州、西临南宁、北临来宾。...', 'city/guigang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('314', '1', '贵阳市', '23', '106.630153', '26.647661', '贵阳是一座神奇的城市，当夏日炎炎别的城市如火炉一般酷热难耐的时候，这里还是舒爽依然。食物很好吃，小吃很美味。风景很好，挺好的地方。', 'city/guiyang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('315', '11', '贺州市', '28', '111.566694', '24.403582', '贺州市位于广西壮族自治区东部,北挨湖南省永州市，东达广东省清远市、肇庆市，南临梧州市，西靠桂林市。地理坐标:北纬23...', 'city/hezhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('316', '18', '资阳市', '22', '104.627636', '30.128901', '资阳位于东经104°21′—105°27′,北纬29°15′—30°17′，处于成都和重庆两大城市的中间。北靠成都（...', 'city/ziyang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('317', '7', '赣州市', '15', '114.935029', '25.831829', '赣州是江西下辖的一个地级市，是江西第二大城市，常称为赣南地区，赣州东接福建三明和龙岩，南至西南临广东梅州、河源和韶关...', 'city/ganzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('318', '4', '赤峰市', '32', '118.886856', '42.257817', '在中国的北方有一片神奇的土地，因为城区北部有一座赭红色山峰，所以命名赤峰。\r\n它是兴隆洼文化发源地，因为8000年前...', 'city/chifeng.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('319', '4', '辽源市', '9', '125.143532', '42.887918', '富庶美丽的辽源位于吉林省东南部，地处长白山余脉和松嫩平原过渡地带；被称为东辽河畔的一颗明珠。辽源的历史源远流长，清代...', 'city/liaoyuan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('320', '10', '辽阳市', '8', '123.236944', '41.267244', '辽宁省辽阳市位于辽东半岛城市群的中部，是一座有着2400年历史的文化古城，也是新兴的现代石化轻纺工业基地，2004年...', 'city/liaoyang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('321', '15', '达州市', '22', '107.468023', '31.209571', '达州市的名山大川、河湖风光、花草树木、飞禽走兽等，自然景色绚丽多姿，被明代著名地理学家徐霞客赞为“西南奇胜”。达州市...', 'city/dazhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('322', '8', '运城市', '6', '111.007528', '35.026412', '运城，被称为“中华民族的滥觞之地”，华夏之祖，炎黄之根，中国之本。有人说：只有到了运城，才能最直观地感知华夏文明的始...', 'city/yuncheng.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('323', '7', '连云港市', '11', '119.221611', '34.596653', '在中国的沿海港口城市中，连云港旅游的古迹较为丰富，历史久远。连云港素有“东海第一胜境”之称，是全国49个重点旅游城市...', 'city/lianyungang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('324', '16', '迪庆藏族自治州', '25', '99.702234', '27.818882', '天空很美，广阔的依拉草原纳帕海。风景很美，很不错的地方。 悠久的历史，古老的文化和丰富多彩而团结合睦的民族和民族之间的依存关系又谱写着浑厚诱人的人文景观丰姿。', 'city/diqing.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('325', '5', '通化市', '9', '125.939697', '41.728401', '“北国山城”通化，位于吉林省东南部，与朝鲜民主主义人民共和国隔鸭绿江相望，是国家批准的边境开放城市。\n\n     通...', 'city/tonghua.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('326', '5', '通辽市', '32', '122.243444', '43.65289', '通辽历史悠久，古迹众多。先秦时期的燕长城、元代的佛塔、清时的福源寺等，向众人讲述曾经的辉煌。地处科尔沁草原腹地的通辽...', 'city/tongliao.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('327', '8', '遂宁市', '22', '105.592898', '30.532847', '遂宁位于四川盆地中部腹心，涪江中游，地处成都和重庆两座特大城市的中心节点。东西宽90.3公里，南北长108.9公里，...', 'city/suining.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('328', '3', '遵义市', '23', '106.927389', '27.725654', '遵义俗称黔北，扼川黔渝交通要冲，为川黔渝门户，有铁路、公路呈南北向贯穿全市中部，距省会贵阳154公里，离重庆市300...', 'city/zunyi.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('329', '5', '邢台市', '5', '114.504844', '37.070589', '邢台的历史悠久，源远流长，距今已有3500多年的文明史，历史上曾4次建国，两次定都，商代祖乙帝曾迁都于此，战国时是赵...', 'city/xingtai.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('330', '2', '那曲地区', '29', '92.051239', '31.476202', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('331', '4', '邯郸市', '5', '114.538961', '36.625657', '邯郸位于河北省南部，地处太行山东麓、淦阳河上，是晋冀鲁豫四省接壤的腹地。邯郸市是河北省最古老的城市，也是我国古代著名...', 'city/handan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('332', '5', '邵阳市', '19', '111.467791', '27.238892', '邵阳境内山环水复，风光秀美，景色宜人，旅游资源丰富。有被誉为“山水甲桂林”的丹霞地貌国家AAAA级、世界自然遗产地-...', 'city/shaoyang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('333', '1', '郑州市', '17', '113.625368', '34.746599', '曾经华夏文明的发源地，承载着璀璨的千年文明，现在的它虽已洗尽铅华，在时代的推动下孕育出新的繁荣。', 'city/zhengzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('334', '10', '郴州市', '19', '113.014717', '25.770509', '郴州市位于湖南省东南部，地处南岭山脉中段与罗霄山脉南段交汇地带。\n\n郴州，生态王国。“四面青山翠屏，草色花香尽得春”...', 'city/chenzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('335', '6', '鄂尔多斯市', '32', '109.781327', '39.608266', '鄂尔多斯草原旅游区，2004年8月开始运营，国家AAAA级旅游景区，位于内蒙古鄂尔多斯市杭锦旗锡尼镇西南9公里处，是...', 'city/eerduosi.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('336', '7', '鄂州市', '18', '114.894843', '30.39194', '鄂州位于湖北省东部，长江中游南岸，是全国著名的“百湖之市”、“鱼米之乡”，是中国佛教净土宗的发源地、驰名中外的“武昌...', 'city/ezhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('337', '9', '酒泉市', '21', '98.494483', '39.73241', '酒泉市位于甘肃省西北部河西走廊西端的阿尔金山、祁连山与马鬃山（北山）之间。甘肃省名“肃”字由来地。东接张掖市和内蒙古...', 'city/jiuquan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('338', '1', '重庆市', '4', '106.551556', '29.563009', '它依山建筑是“山城”，它云轻雾重是“雾都”，它夏长酷热是“火炉”，风景秀美的城市。重庆小吃挺不错，吃货大爱，美食美景美人。', 'city/chongqing.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('339', '7', '金华市', '12', '119.647444', '29.079059', '金华是一座人文荟萃，教育鼎盛的历史文化名城；是山川秀丽，环境优雅的旅游胜地；是一个生态环境良好，整洁亮绿、文明有序、...', 'city/jinhua.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('340', '2', '金昌市', '21', '102.188043', '38.520089', '行政区域名，位于东经101°04′35″—102°43′40″，北纬37°47′10″—39°00′30″。地处甘肃...', 'city/jinchang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('341', '7', '钦州市', '28', '108.654146', '21.979933', '钦州地处祖国西南沿海，广西南部。背靠大西南，面临北部湾，是大西南最便捷的出海通道。\n钦州是广西沿海金三角上的一块宝地...', 'city/qinzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('342', '12', '铁岭市', '8', '123.726166', '42.223769', '铁岭市是辽宁省14个省辖地级城市之一，中国知名城市。位于辽宁省北部，松辽平原中段。铁岭原为“铁岭卫”的简称，如同天津...', 'city/tieling.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('343', '5', '铜仁地区', '23', '109.191551', '27.718346', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('344', '2', '铜川市', '27', '108.945233', '34.896756', '铜川市位于陕西腹地，南接古城西安，北通黄帝陵和革命胜地延安。铜川在历史上属京畿重镇，历史文物古迹丰富。这里有唐代名医...', 'city/tongchuan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('345', '7', '铜陵市', '13', '117.812079', '30.945429', '铜陵，是中华民族青铜文化的发源地之一，也是迄今为止江南地区发现的规模最大的我国著名的古代采铜、冶铜基地。金牛洞古采矿...', 'city/tongling.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('346', '1', '银川市', '30', '106.230909', '38.487193', '自古有“天下黄河富宁夏”之说，银川素有“塞上江南”、“鱼米之乡”的美誉。绿化比好多地方都不错，风景确实不错。', 'city/yinchuan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('347', '10', '锡林郭勒盟', '32', '116.048222', '43.933454', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('348', '7', '锦州市', '8', '121.127003', '41.095119', '锦州市是中国环渤海地区的重要开放城市，地处辽宁省西南部，北依松岭山脉，南临渤海辽东湾，扼“辽西走廊”东端。\n锦州市地...', 'city/jinzhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('349', '11', '镇江市', '11', '119.425836', '32.187849', '镇江旅游资源丰富，名胜古迹众多。镇江旅游景点以其城在山中，山在城中，形成了“城市山林”、“真山真水”的独特风貌。镇江...', 'city/zhenjiang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('350', '1', '长春市', '9', '125.323544', '43.817071', '汽车+电影，这个神奇的组合把长春催化出一副江南小资的模样。来到此地，你会发现这座北方的园林城市，确实和想象中的那片黑土地有点儿不一样。', 'city/changchun.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('351', '1', '长沙市', '19', '112.938814', '28.228209', '青葱的岳麓山，火红的口味虾，深灰的西汉夫人，蓝黄间的酒吧，橙黄的芒果台，与每周末如约上演的橘洲焰火一样五彩斑斓，长沙，一座制造快乐的山水洲城。', 'city/changsha.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('352', '4', '长治市', '6', '113.116255', '36.195386', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('353', '15', '阜康市', '31', '87.946894', '44.168576', '阜康市位于新疆维吾尔自治区中北部，天山东段北麓，准噶尔盆地南缘，昌吉回族自治州中部，与乌鲁木齐米东区毗邻，地理坐标为...', 'city/fukang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('354', '9', '阜新市', '8', '121.670323', '42.021619', '阜新市位于辽宁省西部，北靠内蒙古自治区，东与沈阳市接壤，西南部分别同朝阳市、锦州市毗邻，是一座新兴的工业城市，辽宁省...', 'city/fuxin.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('355', '11', '阜阳市', '13', '115.814204', '32.890124', '富阳山清水秀，景色绮丽。“天下佳山水，古今推富春”。富阳地处“西湖——富春江——千岛湖——黄山”国家级黄金旅游线的前...', 'city/fuyang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('356', '6', '防城港市', '28', '108.353846', '21.68686', '防城港市位于广西省西南沿海，南濒北部湾，北临省会南宁，西南与越南交界，大陆海岸线长达584公里，边境线230多公里，...', 'city/fangchenggang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('357', '15', '阳江市', '20', '111.982232', '21.857958', '阳江市位于广东省西南沿海，扼粤西要冲。阳江古时候属于古越，居住的多是越人。古越语中，“牛”为“莫”，“羊”为“阳”，...', 'city/yangjiang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('358', '3', '阳泉市', '6', '113.580519', '37.856971', '阳泉是山西省东部地区政治、经济、教育、文化的中心，是我国能源重化工基地的重要组成部分。市区桃河横贯，境内山川叠翠，矿...', 'city/yangquan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('359', '8', '阿克苏市', '31', '80.260605', '41.168779', '阿克苏市位于新疆维吾尔自治区西部，东接巴音郭楞蒙古自治州，南隔塔克拉玛干沙漠与和田地区相望，西南连接喀什地区和克孜勒...', 'city/akesu.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('360', '22', '阿勒泰市', '31', '88.131842', '47.827309', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('361', '12', '阿图什市', '31', '76.1684', '39.71616', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('362', '19', '阿坝藏族羌族自治州', '22', '102.224653', '31.899413', '阿坝藏族羌族自治州地处青藏高原东南缘，横断山脉北端与川西北高山峡谷的结合部，位于四川省西北部，紧邻成都平原。\n优美的...', 'city/aba.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('363', '12', '阿拉善盟', '32', '105.728969', '38.851892', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('364', '4', '阿拉尔市', '31', '81.280525', '40.547653', '阿拉尔市，地处天山南麓，塔克拉玛干大沙漠北缘，阿克苏河与和田河、叶尔羌河三河交汇之处的塔里木河上游，东邻沙雅县，西依...', 'city/alaer.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('365', '6', '阿里地区', '29', '80.105804', '32.501111', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('366', '12', '陇南市', '21', '104.921841', '33.400684', '陇南市位于甘肃省东南边陲，是甘肃唯一的长江流域地区，东连陕西，南接四川，北靠天水，西连甘南，为甘肃南下东出之要冲。陇...', 'city/longnan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('367', '16', '陵水黎族自治县', '24', '110.037504', '18.506048', '位于广西南宁市武鸣县城南面，是个天然的泉水湖。\n灵水是全国三大恒温泉水湖之一，素有“龙津吐碧”之称，传说泉中曾有两只...', 'city/lingshui.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('368', '12', '随州市', '18', '113.382458', '31.690215', '随州市旅游资源极其丰富，以“炎帝神农故里、编钟古乐之乡”而闻名海内外，有着大量的人文景观和自然景观。\n\n      ...', 'city/suizhou.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('369', '16', '雅安市', '22', '103.013261', '29.980537', '雅安市位于川藏、川滇公路交会处，距成都120公里，是四川盆地与青藏高原的结合过渡地带、汉文化与民族文化结合过渡地带、...', 'city/yaan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('370', '2', '青岛市', '16', '120.382639', '36.067082', '青岛是一座美丽的滨海城市，空气很好，城市也很悠闲。海滩旁边海水清澈漂亮，能看到美丽的海岸线。崂山的风景不错，可以去看看。青岛的海鲜很便宜，海滨城市边吃海鲜边吹风很惬意。', 'city/qingdao.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('371', '3', '鞍山市', '8', '122.994329', '41.108647', '鞍山市位于辽宁省中部，是我国重要的钢铁生产基地，素称“钢都”。鞍山地理位置适中，在辽东半岛对外开放区域中是连接以大连...', 'city/anshan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('372', '5', '韶关市', '20', '113.597522', '24.810403', '韶关是广东省北部的一个地级市，是一座历史文化名城。说到韶关，可以用12个字来概括——“历史名城、山青水秀、民族风情”...', 'city/shaoguan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('373', '1', '香港特别行政区', '34', '114.173355', '22.320047', '风景很不错，但是城市人太多，街道比较拥挤。当地美食很多，小吃也十分丰富。除此之外香港也是购物的天堂，很多东西比大陆便宜。印象最深的当属迪斯尼乐园，建设得很好。', 'city/xianggang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('374', '5', '马鞍山市', '13', '118.506759', '31.670452', '马鞍山位于安徽省最东部，横跨长江、接壤南京、长三角的桥头堡，是安徽的东大门、南京的后花园。马鞍山是新兴的钢铁工业城市...', 'city/maanshan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('375', '17', '驻马店市', '17', '114.022298', '33.011529', '驻马店位于河南中南部，北接漯河，南临信阳，地处淮河上游的丘陵平原地区。古为历代官道，因设驿站而得名，素有“豫州之腹地...', 'city/zhumadian.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('376', '19', '高雄县', '7', '0', '0', '高雄市位于台湾南部，西、南面濒临台湾海峡，是台湾第二大都市，也是“行政院”辖市，更是世界著名港口，有台湾“港都”之称...', 'city/gaoxiong.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('377', '2', '高雄市', '7', '111.585587', '21.940174', '高雄市位于台湾南部，西、南面濒临台湾海峡，是台湾第二大都市，也是“行政院”辖市，更是世界著名港口，有台湾“港都”之称...', 'city/gaoxiong.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('378', '5', '鸡西市', '10', '130.969333', '45.295075', '位于安徽省南部，是徽州文化的发源地之一，被评为国家历史文化名城。\n自然山水雄奇秀丽，人文景观异彩纷呈。颇具徽派建筑特...', 'city/jixi.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('379', '3', '鹤岗市', '10', '130.297964', '47.349916', '鹤岗市位于黑龙江省东北部，地处小兴安岭向三江平原过渡地带，北隔黑龙江与俄罗斯相望，东南临松花江与佳木斯接壤，西屏小兴...', 'city/hegang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('380', '6', '鹤壁市', '17', '114.297272', '35.747225', '鹤壁因“仙鹤栖于南山峭壁”而得名，历史悠久，文化底蕴深厚。商代曾建都朝歌(今淇县)，历经四代共400余年；春秋时期卫...', 'city/hebi.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('381', '6', '鹰潭市', '15', '117.069202', '28.260189', '鹰潭市位于江西省的东北部，信江中下游。鹰潭因“涟漪旋其中，雄鹰舞其上”而得市名。鹰潭地理位置优越，史称“东连江浙，南...', 'city/yingtan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('382', '10', '黄冈市', '18', '114.872316', '30.453905', '黄冈市地处湖北省东部、大别山南麓、长江中游北岸，京九铁路中段。黄冈具有悠久的历史。早在旧石器时代，本区域即有人类居住...', 'city/huanggang.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('383', '4', '黄南藏族自治州', '26', '102.015248', '35.519548', '黄南藏族自治州位于青海省东南部，地处九曲黄河第一弯，东南与甘肃省甘南藏族自治州夏河县、碌曲县、玛曲县和本省果洛州玛沁...', 'city/huangnan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('384', '9', '黄山市', '13', '118.337481', '29.714655', '黄山归来不看岳，仿佛穿梭在人间与仙境。云海与日出很漂亮，天气好的时候光明顶上景色很美。空气很好有种洗...', 'city/huangshan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('385', '2', '黄石市', '18', '115.03852', '30.199652', '黄石市位于湖北省东南部，长江中游南岸。东北临长江，与浠水县、蕲春县、武穴市隔江相望，北接鄂州市，西靠武昌县，西南与咸...', 'city/huangshi.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('386', '11', '黑河市', '10', '127.52856', '50.245329', '黑河市位于小兴安岭的北麓，与俄罗斯的布拉戈维申斯克市隔江相望，是东西方文化的融汇点。\n黑河是中国首批沿边开放城市，地...', 'city/heihe.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('387', '8', '黔东南苗族侗族自治州', '23', '107.982859', '26.583442', '', '', '0', '0');
INSERT INTO `tour_city` VALUES ('388', '9', '黔南布依族苗族自治州', '23', '107.522097', '26.254092', '黔南布依族苗族自治州，位于中国贵州省中南部，1956年8月8日设立，邻接广西壮族自治区，是多民族聚居的地方，凭借着幽...', 'city/qiannan.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('389', '7', '黔西南布依族苗族自治', '23', '105.650525', '25.390904', '唐山市迁西县位于河北省东北部，燕山南麓，长城脚下，西距北京150公里，东距秦皇岛130公里，北距承德130公里，南距...', 'city/qianxi.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('390', '2', '齐齐哈尔市', '10', '123.918186', '47.354348', '齐齐哈尔是中国著名的魅力 城市和优秀旅游城市。齐齐哈尔旅游景点——世界著名的扎龙湿地是中国最大的国家级珍稀水禽自然保...', 'city/qiqihaer.jpg', '0', '0');
INSERT INTO `tour_city` VALUES ('391', '8', '龙岩市', '14', '117.017536', '25.075123', '龙岩东与福建省泉州、漳州两市接壤，西与江西省赣州市交界，南与广东省梅州市毗邻，北与福建省三明市相接。龙岩是距离厦门最...', 'city/longyan.jpg', '0', '0');

-- ----------------------------
-- Table structure for tour_province
-- ----------------------------
DROP TABLE IF EXISTS `tour_province`;
CREATE TABLE `tour_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(30) NOT NULL,
  `wm` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tour_province
-- ----------------------------
INSERT INTO `tour_province` VALUES ('1', '北京市', 'bj');
INSERT INTO `tour_province` VALUES ('2', '天津市', 'tj');
INSERT INTO `tour_province` VALUES ('3', '上海市', 'sh');
INSERT INTO `tour_province` VALUES ('4', '重庆市', 'cq');
INSERT INTO `tour_province` VALUES ('5', '河北省', 'hb');
INSERT INTO `tour_province` VALUES ('6', '山西省', 'sx');
INSERT INTO `tour_province` VALUES ('7', '台湾省', 'tw');
INSERT INTO `tour_province` VALUES ('8', '辽宁省', 'ln');
INSERT INTO `tour_province` VALUES ('9', '吉林省', 'jl');
INSERT INTO `tour_province` VALUES ('10', '黑龙江省', 'hlj');
INSERT INTO `tour_province` VALUES ('11', '江苏省', 'js');
INSERT INTO `tour_province` VALUES ('12', '浙江省', 'zj');
INSERT INTO `tour_province` VALUES ('13', '安徽省', 'ah');
INSERT INTO `tour_province` VALUES ('14', '福建省', 'fj');
INSERT INTO `tour_province` VALUES ('15', '江西省', 'jx');
INSERT INTO `tour_province` VALUES ('16', '山东省', 'sd');
INSERT INTO `tour_province` VALUES ('17', '河南省', 'hn');
INSERT INTO `tour_province` VALUES ('18', '湖北省', 'hb');
INSERT INTO `tour_province` VALUES ('19', '湖南省', 'hn');
INSERT INTO `tour_province` VALUES ('20', '广东省', 'gd');
INSERT INTO `tour_province` VALUES ('21', '甘肃省', 'gs');
INSERT INTO `tour_province` VALUES ('22', '四川省', 'sc');
INSERT INTO `tour_province` VALUES ('23', '贵州省', 'gz');
INSERT INTO `tour_province` VALUES ('24', '海南省', 'hn');
INSERT INTO `tour_province` VALUES ('25', '云南省', 'yn');
INSERT INTO `tour_province` VALUES ('26', '青海省', 'qh');
INSERT INTO `tour_province` VALUES ('27', '陕西省', 'sx');
INSERT INTO `tour_province` VALUES ('28', '广西壮族自治区', 'gx');
INSERT INTO `tour_province` VALUES ('29', '西藏自治区', 'xz');
INSERT INTO `tour_province` VALUES ('30', '宁夏回族自治区', 'nx');
INSERT INTO `tour_province` VALUES ('31', '新疆维吾尔自治区', 'xj');
INSERT INTO `tour_province` VALUES ('32', '内蒙古自治区', 'nm');
INSERT INTO `tour_province` VALUES ('33', '澳门特别行政区', 'am');
INSERT INTO `tour_province` VALUES ('34', '香港特别行政区', 'xg');
