/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : ndnu-covid-system

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 12/05/2022 17:39:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for epidemic
-- ----------------------------
DROP TABLE IF EXISTS `epidemic`;
CREATE TABLE `epidemic`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `area` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `confirm` int NULL DEFAULT NULL,
  `now_confirm` int NULL DEFAULT NULL,
  `dead` int NULL DEFAULT NULL,
  `heal` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of epidemic
-- ----------------------------

-- ----------------------------
-- Table structure for graph
-- ----------------------------
DROP TABLE IF EXISTS `graph`;
CREATE TABLE `graph`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `confirm` int NULL DEFAULT NULL,
  `suspect` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 847 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of graph
-- ----------------------------

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '物品id',
  `name` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '物品名称',
  `quantity` int NULL DEFAULT NULL COMMENT '数量',
  `specification` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '规格',
  `inbound_date` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '最后入库时间',
  `source` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '来源',
  `remark` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES (3, '医用手套', 4000, '小型', '2022-05-08', '淘宝购买', '无');
INSERT INTO `material` VALUES (4, '医用口罩', 5000, '小型', '2022-05-09', '淘宝购买', '无');
INSERT INTO `material` VALUES (5, '医用酒精', 500, '小型', '2022-05-09', '厂商订购', '无');

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '电话号码',
  `identification_number` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '身份证号',
  `sex` char(1) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `address` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '住址',
  `hospitalization_date` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '入院日期',
  `infection_source` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '感染来源',
  `death_date` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '死亡日期',
  `discharge_date` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '治愈日期',
  `category` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '患者类别（确诊，疑似，治愈，死亡）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient
-- ----------------------------
INSERT INTO `patient` VALUES (1, '李四', '13860001234', '123456789123456789', '男', 30, '宁德师范学院', '2022-01-22', '宁德火车站', NULL, NULL, 'diagnose');
INSERT INTO `patient` VALUES (3, '张三', '12345678912', '123456789123456789', '男', 20, '宁德师范学院', '2022-05-05', '', NULL, NULL, 'suspected');
INSERT INTO `patient` VALUES (4, '吕丹南', '13912345896', '11010119900307715X', '男', 20, '安徽省安庆市宿松县南浦路266号', NULL, NULL, NULL, NULL, 'suspected');
INSERT INTO `patient` VALUES (5, '秦思楠', '13750576969', '350102199003071410', '女', 30, '四川省攀枝花市米易县天台路906号', NULL, NULL, NULL, NULL, 'isolate');
INSERT INTO `patient` VALUES (6, '郭韶美', '13750576969', '350102199003075593', '女', 20, '四川省成都市新都县飞翔路353号', NULL, NULL, '2022-05-07', NULL, 'death');
INSERT INTO `patient` VALUES (7, '江瑜文', '13912345896', '350102199003075593', '男', 30, '山东省淄博市沂源县飞翔路431号', NULL, NULL, NULL, '2022-05-10', 'cure');
INSERT INTO `patient` VALUES (8, '郑际红', '13862458654', '230102199003079191', '女', 40, '安徽省蚌埠市怀远县人民路79号', '2022-05-06', '亲戚家中', NULL, NULL, 'diagnose');
INSERT INTO `patient` VALUES (9, '华君武', '19544338908', '440102199706263752', '男', 40, '湖北省黄冈市蕲春县迎宾路203号', NULL, NULL, '2022-05-23', NULL, 'death');
INSERT INTO `patient` VALUES (10, '叶茗', '17463410795', '440102199706269476', '女', 30, '四川省遂宁市旭东路647号', '2022-05-08', '大润发超市', NULL, NULL, 'diagnose');
INSERT INTO `patient` VALUES (11, '刘真舒', '19458816189', '440102199706268473', '女', 30, '广东省肇庆市怀集县新魏路880号', NULL, NULL, NULL, NULL, 'suspected');
INSERT INTO `patient` VALUES (12, '张振义', '16688107612', '440102199706266718', '男', 25, '黑龙江省双鸭山市友谊县虹山南路198号', NULL, NULL, NULL, NULL, 'isolate');
INSERT INTO `patient` VALUES (13, '蒋碧云', '19331716527', '120102199606263478', '女', 35, '湖北省咸宁市崇阳县青山路118号', NULL, NULL, NULL, '2022-05-09', 'cure');
INSERT INTO `patient` VALUES (14, '刘思悦', '14281410340', '53012219830326362X', '男', 51, '云南省昆明市晋宁县果园路65号', '2022-05-11', '帕尼酒吧', NULL, NULL, 'diagnose');
INSERT INTO `patient` VALUES (15, '顾嘉敏', '14314939132', '41082119831011482X', '男', 25, '河南省焦作市修武县府星路264号', '2022-05-24', '阿发理发店', NULL, NULL, 'diagnose');
INSERT INTO `patient` VALUES (16, '陈昆仑', '19353955474', '341021197001113422', '男', 66, '安徽省黄山市歙县长江路213号', '2022-05-23', '安杉公园', NULL, NULL, 'diagnose');
INSERT INTO `patient` VALUES (17, '陶世明', '14193580220', '130526199701091525', '男', 34, '河北省邢台市任县岭城路924号', '2022-05-31', '共庆银行', NULL, NULL, 'diagnose');
INSERT INTO `patient` VALUES (18, '宫傲', '13278117998', '445222199502154920', '女', 22, '广东省揭阳市揭西县红卫路72号', '2022-05-31', '好嗨哟便利店', NULL, NULL, 'diagnose');
INSERT INTO `patient` VALUES (21, '邓克', '13647425337', '341324199604157824', '男', 84, '安徽省宿州市泗县金凤路792号', '2022-05-02', '一条龙足浴城', NULL, NULL, 'diagnose');
INSERT INTO `patient` VALUES (22, '肖焱', '15211346978', '51052219760901112X', '女', 55, '湖南省岳阳市平江县滨河北路742号', NULL, NULL, NULL, NULL, 'suspected');
INSERT INTO `patient` VALUES (23, '崔正方', '14287539138', '620321197112086722', '女', 31, '甘肃省嘉峪关市永昌县环城南路716号', NULL, NULL, NULL, NULL, 'suspected');
INSERT INTO `patient` VALUES (24, '周永丽', '15517325106', '36073219830602162X', '女', 35, '江西省赣州市兴国县黎明西路348号', NULL, NULL, NULL, NULL, 'suspected');
INSERT INTO `patient` VALUES (25, '林石城', '16999186378', '13112219860907262X', '女', 53, '河北省衡水市武邑县八角路411号', NULL, NULL, NULL, NULL, 'suspected');
INSERT INTO `patient` VALUES (26, '蔡志森', '18871946305', '610330199312115528', '女', 35, '陕西省宝鸡市凤县西津路60号', NULL, NULL, NULL, NULL, 'suspected');
INSERT INTO `patient` VALUES (27, '程建江', '19870925974', '341023197406016420', '男', 86, '安徽省黄山市黟县翠湖北路792号', NULL, NULL, NULL, NULL, 'suspected');
INSERT INTO `patient` VALUES (28, '丁冠英', '15653576741', '140423198701101423', '女', 42, '山西省长治市襄垣县商业路717号', NULL, NULL, NULL, NULL, 'suspected');
INSERT INTO `patient` VALUES (29, '刘世伟', '17642382400', '530127198310027029', '男', 43, '云南省昆明市嵩明县滨河路307号', NULL, NULL, NULL, NULL, 'suspected');
INSERT INTO `patient` VALUES (30, '邓相', '17328960708', '360222198711172026', '女', 43, '江西省景德镇市浮梁县滨河路768号', NULL, NULL, NULL, NULL, 'isolate');
INSERT INTO `patient` VALUES (31, '顾吉林', '15811399289', '130925199305207624', '男', 43, '河北省沧州市盐山县黎明西路691号', NULL, NULL, NULL, NULL, 'isolate');
INSERT INTO `patient` VALUES (32, '唐水平', '17681732797', '220521198411077026', '男', 53, '吉林省通化市通化县棋盘东路17号', NULL, NULL, NULL, NULL, 'isolate');
INSERT INTO `patient` VALUES (33, '黄成军', '18731048576', '610422198409245223', '男', 23, '陕西省咸阳市三原县辽宁路930号', NULL, NULL, NULL, NULL, 'isolate');
INSERT INTO `patient` VALUES (34, '崔朝晖', '16351544810', '130522200005272621', '男', 54, '河北省邢台市临城县紫薇南路240号', NULL, NULL, NULL, NULL, 'isolate');
INSERT INTO `patient` VALUES (35, '苏玲娟', '14404943936', '130224199906113629', '女', 43, '河北省唐山市滦南县文笔路917号', NULL, NULL, NULL, NULL, 'isolate');
INSERT INTO `patient` VALUES (38, '胡新梅', '19508301475', '41052219791227202X', '女', 33, '河南省安阳市安阳县明宇路272号', NULL, NULL, NULL, NULL, 'isolate');
INSERT INTO `patient` VALUES (39, '王昌锦', '16782988490', '220625198311016227', '男', 99, '吉林省白山市江源县八一路378号', NULL, NULL, '2022-05-30', NULL, 'death');
INSERT INTO `patient` VALUES (40, '袁永文', '17701961940', '230623198106207824', '女', 35, '黑龙江省大庆市林甸县矿工南路426号', NULL, NULL, '2022-05-30', NULL, 'death');
INSERT INTO `patient` VALUES (41, '余文虎', '17481306953', '13012919860622592X', '男', 65, '河北省石家庄市赞皇县纺城路196号', NULL, NULL, '2022-05-22', NULL, 'death');
INSERT INTO `patient` VALUES (42, '杨诗雨', '15125376145', '350526197112275221', '女', 73, '福建省泉州市德化县体育路396号', NULL, NULL, '2022-05-30', NULL, 'death');
INSERT INTO `patient` VALUES (43, '唐国莉', '16142472565', '411123199208185728', '女', 64, '河南省漯河市郾城县前进路406号', NULL, NULL, '2022-05-31', NULL, 'death');
INSERT INTO `patient` VALUES (44, '马国宇', '19832940188', '610428197904207623', '男', 56, '陕西省咸阳市长武县定安路938号', NULL, NULL, '2022-05-09', NULL, 'death');
INSERT INTO `patient` VALUES (47, '桑立新', '18362206052', '340323197012057022', '男', 98, '安徽省蚌埠市固镇县双林中横路274号', NULL, NULL, '2022-05-24', NULL, 'death');
INSERT INTO `patient` VALUES (48, '段文娟', '16666414874', '510129199111082125', '男', 57, '四川省成都市大邑县凤岗路188号', NULL, NULL, NULL, '2022-05-25', 'cure');
INSERT INTO `patient` VALUES (49, '孔琪', '17418039200', '330723199612146124', '女', 64, '浙江省金华市武义县乌兰路609号', NULL, NULL, NULL, '2022-05-23', 'cure');
INSERT INTO `patient` VALUES (50, '刘远桥', '16209002571', '370125197309087027', '男', 25, '山东省济南市济阳县武滨路978号', NULL, NULL, NULL, '2022-05-23', 'cure');
INSERT INTO `patient` VALUES (51, '周继梅', '13734320720', '440523198407024320', '女', 34, '广东省汕头市南澳县宽平大路833号', NULL, NULL, NULL, '2022-05-23', 'cure');
INSERT INTO `patient` VALUES (52, '宋艳静', '15554176175', '340828197301075226', '男', 53, '安徽省安庆市岳西县瑞丰路312号', NULL, NULL, NULL, '2022-05-01', 'cure');
INSERT INTO `patient` VALUES (53, '马泽平', '17290452958', '530324197801255023', '男', 85, '云南省曲靖市罗平县黎明西路451号', NULL, NULL, NULL, '2022-05-23', 'cure');
INSERT INTO `patient` VALUES (54, '黄伟兰', '16638396854', '410422199912114324', '男', 25, '河南省平顶山市叶县徐州路657号', NULL, NULL, NULL, '2022-05-23', 'cure');
INSERT INTO `patient` VALUES (55, '杨建鹏', '18318355259', '35042119780807632X', '女', 42, '福建省三明市明溪县大浒路804号', NULL, NULL, NULL, '2022-05-22', 'cure');
INSERT INTO `patient` VALUES (56, '孙红喜', '18927085014', '35043019710723722X', '男', 14, '福建省三明市建宁县同心路955号', NULL, NULL, NULL, '2022-05-23', 'cure');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('user', 'el-icon-user', 'icon');
INSERT INTO `sys_dict` VALUES ('house', 'el-icon-house', 'icon');
INSERT INTO `sys_dict` VALUES ('menu', 'el-icon-menu', 'icon');
INSERT INTO `sys_dict` VALUES ('s-custom', 'el-icon-s-custom', 'icon');
INSERT INTO `sys_dict` VALUES ('s-grid', 'el-icon-s-grid', 'icon');
INSERT INTO `sys_dict` VALUES ('document', 'el-icon-document', 'icon');
INSERT INTO `sys_dict` VALUES ('coffee', 'el-icon-coffee\r\n', 'icon');
INSERT INTO `sys_dict` VALUES ('s-marketing', 'el-icon-s-marketing', 'icon');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图标',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `pid` int NULL DEFAULT NULL COMMENT '父级id',
  `page_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '页面路径',
  `sort_num` int NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (4, '疫情患者管理', NULL, 'el-icon-s-grid', NULL, NULL, NULL, 300);
INSERT INTO `sys_menu` VALUES (5, '确诊患者管理', '/user', 'el-icon-s-custom', NULL, 4, 'PatientList', 301);
INSERT INTO `sys_menu` VALUES (6, '疑似患者管理', '/role', 'el-icon-s-custom', NULL, 4, 'SuspectedPerson', 302);
INSERT INTO `sys_menu` VALUES (7, '隔离患者管理', '/menu', 'el-icon-s-custom', NULL, 4, 'IsolatePersonnel', 303);
INSERT INTO `sys_menu` VALUES (8, '死亡患者管理', '/file', 'el-icon-s-custom', NULL, 4, 'DeadPatients', 304);
INSERT INTO `sys_menu` VALUES (10, '主页', '/home', 'el-icon-house', NULL, NULL, 'Home', 0);
INSERT INTO `sys_menu` VALUES (39, '防疫物资管理', '/course', 'el-icon-menu', NULL, NULL, 'MaterialManagement', 400);
INSERT INTO `sys_menu` VALUES (40, '系统权限管理', '/map', 'el-icon-user', NULL, NULL, 'SystemPermissionsManagement', 500);
INSERT INTO `sys_menu` VALUES (42, '治愈患者管理', '/cure', 'el-icon-s-custom', NULL, 4, 'CurePatients', 305);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `flag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', '管理员', 'Root');
INSERT INTO `sys_role` VALUES (3, '用户', '用户', 'User');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int NOT NULL COMMENT '角色id',
  `menu_id` int NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色菜单关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (1, 6);
INSERT INTO `sys_role_menu` VALUES (1, 7);
INSERT INTO `sys_role_menu` VALUES (1, 8);
INSERT INTO `sys_role_menu` VALUES (1, 9);
INSERT INTO `sys_role_menu` VALUES (1, 10);
INSERT INTO `sys_role_menu` VALUES (1, 39);
INSERT INTO `sys_role_menu` VALUES (1, 40);
INSERT INTO `sys_role_menu` VALUES (1, 41);
INSERT INTO `sys_role_menu` VALUES (1, 42);
INSERT INTO `sys_role_menu` VALUES (3, 2);
INSERT INTO `sys_role_menu` VALUES (3, 4);
INSERT INTO `sys_role_menu` VALUES (3, 5);
INSERT INTO `sys_role_menu` VALUES (3, 6);
INSERT INTO `sys_role_menu` VALUES (3, 7);
INSERT INTO `sys_role_menu` VALUES (3, 8);
INSERT INTO `sys_role_menu` VALUES (3, 10);
INSERT INTO `sys_role_menu` VALUES (3, 39);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '部门',
  `create_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建时间',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '654321', '李浩', '13899168642', '物资管理部', '2022-02-26', 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'Root');
INSERT INTO `sys_user` VALUES (2, 'user', '123456', '叶茗', '13899168642', '宁德师范学院', '2022-02-26', 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'ROLE_ROOT');
INSERT INTO `sys_user` VALUES (4, 'user', '123456', '李好', '17365421546', '无', '2022-05-08', NULL, 'Root');
INSERT INTO `sys_user` VALUES (5, 'user_1', '123456', '张龙', '13560211235', '无', '2022-05-09', NULL, 'User');

SET FOREIGN_KEY_CHECKS = 1;
