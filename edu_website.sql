/*
Navicat MySQL Data Transfer

Source Server         : localhost:root
Source Server Version : 50613
Source Host           : localhost:3306
Source Database       : edu_website

Target Server Type    : MYSQL
Target Server Version : 50613
File Encoding         : 65001

Date: 2016-05-26 17:42:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `freecms_adminlink`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_adminlink`;
CREATE TABLE `freecms_adminlink` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `isok` varchar(1) DEFAULT NULL,
  `ordernum` int(11) DEFAULT NULL,
  `img` varchar(500) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  `userid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台链接';

-- ----------------------------
-- Records of freecms_adminlink
-- ----------------------------

-- ----------------------------
-- Table structure for `freecms_answer`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_answer`;
CREATE TABLE `freecms_answer` (
  `id` varchar(50) NOT NULL,
  `questionid` varchar(50) DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `isok` char(1) DEFAULT NULL,
  `ordernum` int(11) DEFAULT NULL,
  `selectnum` int(11) DEFAULT NULL,
  `isselect` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_question_answer` (`questionid`),
  CONSTRAINT `FK_question_answer` FOREIGN KEY (`questionid`) REFERENCES `freecms_question` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网上调查选项';

-- ----------------------------
-- Records of freecms_answer
-- ----------------------------

-- ----------------------------
-- Table structure for `freecms_applyopen`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_applyopen`;
CREATE TABLE `freecms_applyopen` (
  `id` varchar(50) NOT NULL,
  `type` char(1) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `cardtype` varchar(50) DEFAULT NULL,
  `cardid` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `lpname` varchar(50) DEFAULT NULL,
  `unitcode` varchar(50) DEFAULT NULL,
  `legalperson` varchar(50) DEFAULT NULL,
  `linkman` varchar(50) DEFAULT NULL,
  `linkmantel` varchar(50) DEFAULT NULL,
  `lpfax` varchar(50) DEFAULT NULL,
  `buslicense` varchar(100) DEFAULT NULL,
  `lpaddress` varchar(100) DEFAULT NULL,
  `lppostcode` varchar(10) DEFAULT NULL,
  `lpemail` varchar(50) DEFAULT NULL,
  `detail` varchar(500) DEFAULT NULL,
  `touse` varchar(500) DEFAULT NULL,
  `pubtype` char(1) DEFAULT NULL,
  `gettype` char(1) DEFAULT NULL,
  `applyfree` char(1) DEFAULT NULL,
  `othertype` char(1) DEFAULT NULL,
  `infonum` varchar(50) DEFAULT NULL,
  `querycode` varchar(20) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `state` char(1) DEFAULT NULL,
  `recontent` varchar(1000) DEFAULT NULL,
  `retime` datetime DEFAULT NULL,
  `proflow` varchar(200) DEFAULT NULL,
  `userid` varchar(50) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='依申请公开';

-- ----------------------------
-- Records of freecms_applyopen
-- ----------------------------

-- ----------------------------
-- Table structure for `freecms_channel`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_channel`;
CREATE TABLE `freecms_channel` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `templet` varchar(50) DEFAULT NULL,
  `contentTemplet` varchar(50) DEFAULT NULL,
  `img` varchar(500) DEFAULT NULL,
  `description` text,
  `parId` varchar(50) DEFAULT NULL,
  `site` varchar(50) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  `orderNum` int(11) DEFAULT NULL,
  `clickNum` int(11) DEFAULT NULL,
  `navigation` varchar(1) DEFAULT NULL,
  `pagemark` varchar(50) DEFAULT NULL,
  `htmlChannel` varchar(1) DEFAULT NULL,
  `htmlChannelOld` varchar(1) DEFAULT NULL,
  `htmlParchannel` varchar(1) DEFAULT NULL,
  `htmlSite` varchar(1) DEFAULT NULL,
  `indexnum` int(11) NOT NULL AUTO_INCREMENT,
  `maxpage` int(11) DEFAULT NULL,
  `isSecNavigation` varchar(1) DEFAULT NULL COMMENT '是否是列表页导航1为是，0为不是',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `mdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `indexnum` (`indexnum`),
  KEY `FK_栏目_站点` (`site`),
  CONSTRAINT `FK_栏目_站点` FOREIGN KEY (`site`) REFERENCES `freecms_site` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=616 DEFAULT CHARSET=utf8 COMMENT='栏目';

-- ----------------------------
-- Records of freecms_channel
-- ----------------------------
INSERT INTO `freecms_channel` VALUES ('02c99d1e-d1c6-47ad-b11b-b260fc64f954', '初升高', '', '', '', '', '', 'dea0df0d-4346-44ba-9787-b370cfec224a', '', '1', '14', null, '1', 'csg', null, null, null, null, '608', '0', '0', '升学', '2016-04-23 10:23:55');
INSERT INTO `freecms_channel` VALUES ('0a7b556a-3593-4976-b695-d9d43bfce981', '友情链接', '', '', null, '', '', 'dea0df0d-4346-44ba-9787-b370cfec224a', '', '1', '90', null, '0', 'yqlj', null, null, null, null, '612', '0', '0', '友情链接', '2016-04-23 11:58:23');
INSERT INTO `freecms_channel` VALUES ('1cd98bde-1f3d-44d7-b1bd-71327a8ee6d1', '微电影', '', '', '', '', '', 'dea0df0d-4346-44ba-9787-b370cfec224a', '', '1', '9', null, '1', 'wdy', null, null, null, null, '604', '0', '0', '微电影,电影', '2016-04-23 10:23:24');
INSERT INTO `freecms_channel` VALUES ('21941f4f-5735-4311-9a25-e56da6c816e1', '小升初', '', '', '', '', '', 'dea0df0d-4346-44ba-9787-b370cfec224a', '', '1', '13', null, '1', 'xsc', null, null, null, null, '607', '0', '0', '升学', '2016-04-23 10:23:50');
INSERT INTO `freecms_channel` VALUES ('2a475529-81c7-4a5c-84b8-662404c7a6dd', '作文天地', '', '', '', '', '', 'dea0df0d-4346-44ba-9787-b370cfec224a', '', '1', '8', null, '1', 'zwtd', null, null, null, null, '602', '0', '0', '作文', '2016-04-23 10:23:19');
INSERT INTO `freecms_channel` VALUES ('364d1208-0487-4f16-ac48-4c7323964e6c', '诗词成语', '', '', '', '', '', 'dea0df0d-4346-44ba-9787-b370cfec224a', '', '1', '99', null, '0', 'sccy', null, null, null, null, '599', '0', '0', '诗词,成语', '2016-04-23 10:19:46');
INSERT INTO `freecms_channel` VALUES ('3c37abd4-5454-4f14-a839-224d2f2ddba0', '初中教育', '', '', null, '', '', 'dea0df0d-4346-44ba-9787-b370cfec224a', '', '1', '4', null, '1', 'czjy', null, null, null, null, '596', '0', '0', '初中,教育', '2016-03-26 16:28:49');
INSERT INTO `freecms_channel` VALUES ('42cc85a4-9cc0-4e05-9647-c3aee8c7c45e', '儿歌故事', '', '', '', '', '', 'dea0df0d-4346-44ba-9787-b370cfec224a', '', '1', '98', null, '0', 'eggs', null, null, null, null, '600', '0', '0', '儿歌,故事', '2016-04-23 12:10:44');
INSERT INTO `freecms_channel` VALUES ('4517633f-7f20-4dc3-9663-741b2062ac3f', '图片新闻', '', '', null, '', '', 'dea0df0d-4346-44ba-9787-b370cfec224a', '', '1', '96', null, '0', 'tpxw', null, null, null, null, '611', '0', '0', '新闻,图片', '2016-04-23 16:43:06');
INSERT INTO `freecms_channel` VALUES ('4701eafa-3eeb-4f01-9e9b-ef6dbd7b9e08', '红话筒', '', '', null, '', '0a7b556a-3593-4976-b695-d9d43bfce981', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'http://www.shaoerkoucai.org/', '1', null, null, '0', 'hht', null, null, null, null, '615', '0', '0', '少儿口才', '2016-04-23 12:01:50');
INSERT INTO `freecms_channel` VALUES ('4807b089-efdb-42e5-825f-23866e81a988', '首页', '', '', '', '', '', 'dea0df0d-4346-44ba-9787-b370cfec224a', '', '1', '1', null, '0', 'sy', null, null, null, null, '593', '0', '0', '儿童,教育,儿童教育,口才,培训', '2016-04-23 13:01:45');
INSERT INTO `freecms_channel` VALUES ('538055fa-fb2f-4b46-babb-d9030d3aa9cc', '高中教育', '', '', '', '', '', 'dea0df0d-4346-44ba-9787-b370cfec224a', '', '1', '5', null, '1', 'gzjy', null, null, null, null, '597', '0', '0', '高中,教育', '2016-03-26 16:29:18');
INSERT INTO `freecms_channel` VALUES ('62097e21-e994-4a9e-b237-210f5725e865', '口才教育', 'coucaikecheng_list.shtml', 'coucaikecheng_info.shtml', '', '', '', 'dea0df0d-4346-44ba-9787-b370cfec224a', '', '1', '6', null, '1', 'kcjy', null, null, null, null, '598', '0', '0', '口才,教育', '2016-04-23 15:05:22');
INSERT INTO `freecms_channel` VALUES ('66cbab3e-c163-43d4-a5bd-a03bb3d62c14', '舞蹈', '', '', '', '', '', 'dea0df0d-4346-44ba-9787-b370cfec224a', '', '1', '10', null, '1', 'wd', null, null, null, null, '605', '0', '0', '舞蹈', '2016-04-23 10:23:31');
INSERT INTO `freecms_channel` VALUES ('72316db1-7032-4c40-b6c5-aabddf3e438f', '幼儿园教育', '', '', null, '', '', 'dea0df0d-4346-44ba-9787-b370cfec224a', '', '1', '2', null, '1', 'yeyjy', null, null, null, null, '594', '0', '0', '幼儿园,教育', '2016-03-26 16:27:59');
INSERT INTO `freecms_channel` VALUES ('85887199-aa2f-490a-8259-6ccf77c560d8', '百度', '', '', null, '', '0a7b556a-3593-4976-b695-d9d43bfce981', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'https://www.baidu.com', '1', null, null, '1', 'bd', null, null, null, null, '613', '0', '0', '百度', '2016-04-23 11:59:24');
INSERT INTO `freecms_channel` VALUES ('96bdb76c-d099-4e8b-be07-e80245146b52', '谷歌', '', '', null, '', '0a7b556a-3593-4976-b695-d9d43bfce981', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'www.google.com', '1', null, null, '0', 'google', null, null, null, null, '614', '0', '0', 'google', '2016-04-23 12:00:59');
INSERT INTO `freecms_channel` VALUES ('98ad300f-c627-4c96-9d0e-056a8695e1e9', '罗宾逊绘本', 'huibenku_list.shtml', 'huibenku_info.shtml', '', '', '', 'dea0df0d-4346-44ba-9787-b370cfec224a', '', '1', '7', null, '1', 'lbxhb', null, null, null, null, '603', '0', '0', '绘本', '2016-05-26 16:48:25');
INSERT INTO `freecms_channel` VALUES ('b1214fed-1bba-4bac-b4bb-80fc06c28179', '新闻中心', 'youxiumengxiao_list.shtml', 'youxiumengxiao_info.shtml', '/upload/dea0df0d-4346-44ba-9787-b370cfec224a/730df395-979d-4829-b458-579cc0ec6e26.gif', '', '', 'dea0df0d-4346-44ba-9787-b370cfec224a', '', '1', '97', null, '0', 'xwzx', null, null, null, null, '610', '0', '0', '新闻', '2016-04-23 17:38:51');
INSERT INTO `freecms_channel` VALUES ('b8b16868-0301-44f1-8bc0-809e29e99fc3', '优秀盟校', 'youxiumengxiao_list.shtml', 'youxiumengxiao_info.shtml', '', '', '', 'dea0df0d-4346-44ba-9787-b370cfec224a', '', '1', '15', null, '0', 'yxmx', null, null, null, null, '609', '0', '0', '盟校', '2016-05-26 16:16:47');
INSERT INTO `freecms_channel` VALUES ('c909d345-5352-48ae-a3d5-e79e18ef6b0a', '央视大赛', '', '', '', '', '', 'dea0df0d-4346-44ba-9787-b370cfec224a', '', '1', '12', null, '1', 'ysds', null, null, null, null, '606', '0', '0', '央视,大赛', '2016-04-23 10:23:43');
INSERT INTO `freecms_channel` VALUES ('d3001698-7d12-4bd5-bb5f-291128eed4fc', '小学教育', '', '', null, '', '', 'dea0df0d-4346-44ba-9787-b370cfec224a', '', '1', '3', null, '1', 'xxjy', null, null, null, null, '595', '0', '0', '小学,教育', '2016-03-26 16:28:25');

-- ----------------------------
-- Table structure for `freecms_comment`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_comment`;
CREATE TABLE `freecms_comment` (
  `id` varchar(50) NOT NULL,
  `siteid` varchar(50) DEFAULT NULL,
  `memberid` varchar(50) DEFAULT NULL,
  `membername` varchar(50) DEFAULT NULL,
  `isAnonymous` char(1) DEFAULT NULL,
  `objid` varchar(50) DEFAULT NULL,
  `objtype` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `state` char(1) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `infotitle` varchar(255) DEFAULT NULL COMMENT '文章标题',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论';

-- ----------------------------
-- Records of freecms_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `freecms_config`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_config`;
CREATE TABLE `freecms_config` (
  `code` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `configValue` varchar(500) DEFAULT NULL,
  `orderNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置';

-- ----------------------------
-- Records of freecms_config
-- ----------------------------
INSERT INTO `freecms_config` VALUES ('attchType', '前台上传附件类型(多个用,号分隔)', 'jpg,jpeg,gif,png,doc,docx,ppt,xls,pdf,flv,wmv,rm,rmvb,avi,rar,zip', '10');
INSERT INTO `freecms_config` VALUES ('imgType', '前台上传图片类型(多个用,号分隔)', 'jpg,jpeg,gif,png', '11');
INSERT INTO `freecms_config` VALUES ('infoHotNum', '信息点击量超过多少自动设置为热点', '10', '12');
INSERT INTO `freecms_config` VALUES ('iscomment', '是否允许评论(是 或 否)', '是', '0');
INSERT INTO `freecms_config` VALUES ('mailAuth', '邮件 要求身份验证(是/否)', '是', '5');
INSERT INTO `freecms_config` VALUES ('mailCharset', '邮件 字符编码', 'UTF-8', '9');
INSERT INTO `freecms_config` VALUES ('mailFrom', '邮件 发信人邮件地址', 'test@qq.com', '6');
INSERT INTO `freecms_config` VALUES ('mailPort', '邮件 SMTP 端口', '25', '4');
INSERT INTO `freecms_config` VALUES ('mailPwd', '邮件 密码', 'test', '8');
INSERT INTO `freecms_config` VALUES ('mailServer', '邮件 SMTP 服务器', 'smtp.qq.com', '3');
INSERT INTO `freecms_config` VALUES ('mailType', '互动信件类型(多个用,号分隔)', '咨询,建议,投诉,指南,举报,其他', '1');
INSERT INTO `freecms_config` VALUES ('mailUsername', '邮件 用户名', 'test', '7');
INSERT INTO `freecms_config` VALUES ('memberLimitName', '会员禁用登录名(多个用,号分隔)', 'admin', '2');
INSERT INTO `freecms_config` VALUES ('releasePager', '获取系统配置中的列表页最多显示页数属性', '20', '13');
INSERT INTO `freecms_config` VALUES ('site', '默认站点(源文件目录名)', 'FreeCMS', '0');

-- ----------------------------
-- Table structure for `freecms_creditlog`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_creditlog`;
CREATE TABLE `freecms_creditlog` (
  `id` varchar(50) NOT NULL,
  `memberid` varchar(50) DEFAULT NULL,
  `membername` varchar(50) DEFAULT NULL,
  `creditruleid` varchar(50) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `credit` int(11) DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `credittime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_creditlog_rule` (`creditruleid`),
  KEY `FK_creditlog_member` (`memberid`),
  CONSTRAINT `FK_creditlog_member` FOREIGN KEY (`memberid`) REFERENCES `freecms_member` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_creditlog_rule` FOREIGN KEY (`creditruleid`) REFERENCES `freecms_creditrule` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分记录';

-- ----------------------------
-- Records of freecms_creditlog
-- ----------------------------

-- ----------------------------
-- Table structure for `freecms_creditrule`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_creditrule`;
CREATE TABLE `freecms_creditrule` (
  `id` varchar(50) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `orderNum` int(11) DEFAULT NULL,
  `rewardtype` int(11) DEFAULT NULL,
  `cycletype` int(11) DEFAULT NULL,
  `cycletime` int(11) DEFAULT NULL,
  `rewardnum` int(11) DEFAULT NULL,
  `credit` int(11) DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分规则';

-- ----------------------------
-- Records of freecms_creditrule
-- ----------------------------
INSERT INTO `freecms_creditrule` VALUES ('1b6a14a8-c5b2-4f92-8d9a-ab3dd0f60ecf', 'login', '登录', '1', '1', '1', null, null, '5', '5');
INSERT INTO `freecms_creditrule` VALUES ('36f75a79-10bc-436d-845b-1d4059a29e36', 'guestbook_del', '删除留言', '5', '0', '3', null, null, '5', '5');
INSERT INTO `freecms_creditrule` VALUES ('4216470b-ac74-4b81-a83c-5c550ae27e27', 'comment_del', '删除评论', '3', '0', '3', null, null, '5', '5');
INSERT INTO `freecms_creditrule` VALUES ('8dec7c78-8516-4ce8-a449-acf87b3971e9', 'guestbook_pub', '发表留言', '4', '1', '3', null, null, '5', '5');
INSERT INTO `freecms_creditrule` VALUES ('b0e11648-6320-426d-87a9-179bca82eee3', 'comment_pub', '发表评论', '2', '1', '3', null, null, '5', '5');

-- ----------------------------
-- Table structure for `freecms_demo`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_demo`;
CREATE TABLE `freecms_demo` (
  `id` varchar(50) NOT NULL,
  `textdemo` varchar(50) DEFAULT NULL,
  `radiodemo` varchar(50) DEFAULT NULL,
  `checkboxdemo` varchar(50) DEFAULT NULL,
  `selectdemo` varchar(50) DEFAULT NULL,
  `textareademo` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='演示';

-- ----------------------------
-- Records of freecms_demo
-- ----------------------------

-- ----------------------------
-- Table structure for `freecms_func`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_func`;
CREATE TABLE `freecms_func` (
  `id` varchar(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `isOk` char(1) NOT NULL,
  `orderNum` int(11) NOT NULL,
  `url` varchar(1000) NOT NULL,
  `parId` varchar(36) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能';

-- ----------------------------
-- Records of freecms_func
-- ----------------------------
INSERT INTO `freecms_func` VALUES ('003c47c5-7041-4cfa-8631-82c00ab3fb35', '菜单管理', '1', '101', 'func.jsp', 'a5452f4f-1a1b-4980-90a3-4a60a38ba373');
INSERT INTO `freecms_func` VALUES ('0189fa8e-462f-4a58-9769-bf75979f2a98', '评论频率统计', '1', '7', 'cms/stat_sysCommentUpdate.do', '8b8880d9-17f9-4f21-b1f9-531a9608afcb');
INSERT INTO `freecms_func` VALUES ('03902986-1ddb-40af-b6f8-4443e1ad7efb', '访问频率统计', '1', '6', 'cms/stat_visit.do', '80453df3-35df-4c63-bbb5-1c333eadc8ab');
INSERT INTO `freecms_func` VALUES ('08cfd343-2803-403e-b952-f7d41199d8e1', '快速添加', '1', '0', 'cms/info_edit.do', 'cb42d736-3386-42b8-a9f7-62840c4ecefa');
INSERT INTO `freecms_func` VALUES ('0af2a5d9-26e6-4b82-a07c-062a35b3a7e5', '会员权限', '1', '8', 'cms/memberauth_list.do', '8acc3be4-a2f6-4fe8-903f-9fd5867f985a');
INSERT INTO `freecms_func` VALUES ('0bec6b84-19be-4d99-bc44-ca1d8472148f', '图片链接管理', '1', '4', 'cms/link_list.do?link.type=2', '26622672-9a10-4e4e-93a7-7fe50a9208b3');
INSERT INTO `freecms_func` VALUES ('11061807-38b9-4d3a-bf30-71903949adde', '站内信', '1', '14', 'msg_list.do', '8acc3be4-a2f6-4fe8-903f-9fd5867f985a');
INSERT INTO `freecms_func` VALUES ('12187d67-5ab9-4ae4-bbee-9a772cebd0de', '用户管理', '1', '1', 'user_list.do', '15dfc8ac-bfda-40cc-abb1-f563c1a1d1d2');
INSERT INTO `freecms_func` VALUES ('14a4e894-1a48-4145-b467-0fe0499e8758', '会员组', '1', '9', 'cms/membergroup_list.do', '8acc3be4-a2f6-4fe8-903f-9fd5867f985a');
INSERT INTO `freecms_func` VALUES ('15dfc8ac-bfda-40cc-abb1-f563c1a1d1d2', '用户管理', '1', '100', '', 'a5452f4f-1a1b-4980-90a3-4a60a38ba373');
INSERT INTO `freecms_func` VALUES ('16f212d4-fc11-4d64-ba3f-fb1db9e2ae8c', '信息更新统计', '1', '3', 'cms/stat_sysInfoUpdate.do', '8b8880d9-17f9-4f21-b1f9-531a9608afcb');
INSERT INTO `freecms_func` VALUES ('18974989-cd85-48b2-8169-348bc3481ef8', '文字链接分类', '1', '5', 'cms/link_clazz.do?link.type=3', '26622672-9a10-4e4e-93a7-7fe50a9208b3');
INSERT INTO `freecms_func` VALUES ('19eebfb0-16b5-40eb-a909-1bd37ef7d745', '站点管理', '1', '0', 'cms/site_site.do', 'a5452f4f-1a1b-4980-90a3-4a60a38ba373');
INSERT INTO `freecms_func` VALUES ('2403873a-48fb-48ac-acd0-af4098df1a0a', '添加用户', '1', '0', 'userEdit.jsp', '15dfc8ac-bfda-40cc-abb1-f563c1a1d1d2');
INSERT INTO `freecms_func` VALUES ('26174cf0-2e8a-4526-8382-16e28d28a73c', '留言管理', '1', '9', 'cms/guestbook_list.do', '64f2084d-3fe7-4345-85c6-4dc835c1b939');
INSERT INTO `freecms_func` VALUES ('26622672-9a10-4e4e-93a7-7fe50a9208b3', '链接管理', '1', '5', '', '64f2084d-3fe7-4345-85c6-4dc835c1b939');
INSERT INTO `freecms_func` VALUES ('2b89c1fd-9e85-40d0-9ad8-9d401526d8fe', '网上调查', '1', '5', 'cms/question_list.do', '64f2084d-3fe7-4345-85c6-4dc835c1b939');
INSERT INTO `freecms_func` VALUES ('30414a93-fb43-4dad-ae6a-b65bbf551e88', '留言频率统计', '1', '7', 'cms/stat_guestbookUpdate.do', '80453df3-35df-4c63-bbb5-1c333eadc8ab');
INSERT INTO `freecms_func` VALUES ('3dc03dc5-56ba-46d9-b8ab-78d19c04cd86', '角色管理', '1', '99', '', 'a5452f4f-1a1b-4980-90a3-4a60a38ba373');
INSERT INTO `freecms_func` VALUES ('3e344b36-736e-4afd-8216-beb4fa54d467', '积分记录', '1', '12', 'cms/creditlog_list.do', '8acc3be4-a2f6-4fe8-903f-9fd5867f985a');
INSERT INTO `freecms_func` VALUES ('40312cc1-4005-4c92-b90f-b44dc96996e8', '站点评论统计', '1', '8', 'cms/stat_sysSiteComment.do', '8b8880d9-17f9-4f21-b1f9-531a9608afcb');
INSERT INTO `freecms_func` VALUES ('425d0211-0196-4456-a24b-3e8d614dec8b', '信息管理', '1', '1', 'cms/info_info.do', 'cb42d736-3386-42b8-a9f7-62840c4ecefa');
INSERT INTO `freecms_func` VALUES ('4331df96-2b8d-4dcf-9bdb-1015dfd0a759', '图片链接分类', '1', '3', 'cms/link_clazz.do?link.type=2', '26622672-9a10-4e4e-93a7-7fe50a9208b3');
INSERT INTO `freecms_func` VALUES ('440344ad-c7c2-4047-8d1f-b55ef4d2d168', '留言频率统计', '1', '5', 'cms/stat_sysGuestbookUpdate.do', '8b8880d9-17f9-4f21-b1f9-531a9608afcb');
INSERT INTO `freecms_func` VALUES ('47b80631-bb6e-4abd-8e47-5b99bce8b3bd', '操作日志', '1', '105', 'operLog_list.do', 'a5452f4f-1a1b-4980-90a3-4a60a38ba373');
INSERT INTO `freecms_func` VALUES ('5257f8fd-9da2-4e83-8538-b6ffca22e45a', '模板管理', '1', '3', 'cms/templet_list.do', '64f2084d-3fe7-4345-85c6-4dc835c1b939');
INSERT INTO `freecms_func` VALUES ('55480f1c-d96f-4b53-b596-fc930f488692', '在线申报', '1', '7', 'cms/report_list.do', '64f2084d-3fe7-4345-85c6-4dc835c1b939');
INSERT INTO `freecms_func` VALUES ('58fe298f-b448-40bb-a1c0-d81134efa4af', '信息页静态化', '1', '3', 'cms/html_info.do', 'e63b222f-3ccb-4e22-b8ab-7cd0dece9f06');
INSERT INTO `freecms_func` VALUES ('5a47681c-63c3-47b1-8e1f-34d4dbba7d85', '文字链接管理', '1', '6', 'cms/link_list.do?link.type=3', '26622672-9a10-4e4e-93a7-7fe50a9208b3');
INSERT INTO `freecms_func` VALUES ('5f3a8e01-4216-4982-b07b-ad367fe9ef96', '栏目页静态化', '1', '2', 'cms/html_channel.do', 'e63b222f-3ccb-4e22-b8ab-7cd0dece9f06');
INSERT INTO `freecms_func` VALUES ('64f2084d-3fe7-4345-85c6-4dc835c1b939', '站点', '1', '2', '', '');
INSERT INTO `freecms_func` VALUES ('66ecf6f7-1911-4e7e-8089-3a01f44a6d12', '单位管理', '1', '98', 'unit.jsp', 'a5452f4f-1a1b-4980-90a3-4a60a38ba373');
INSERT INTO `freecms_func` VALUES ('67025758-eb65-40b1-a59c-edee1b3ae938', '下拉链接分类', '1', '1', 'cms/link_clazz.do?link.type=1', '26622672-9a10-4e4e-93a7-7fe50a9208b3');
INSERT INTO `freecms_func` VALUES ('67705234-603a-47c7-8f0d-8cdd349fd7c6', '互动信件', '1', '6', '', '64f2084d-3fe7-4345-85c6-4dc835c1b939');
INSERT INTO `freecms_func` VALUES ('682b18ef-3308-48f6-8fa8-c224269ecc1f', '信息更新统计', '1', '3', 'cms/stat_infoUpdate.do', '80453df3-35df-4c63-bbb5-1c333eadc8ab');
INSERT INTO `freecms_func` VALUES ('6ad6b178-d6af-4fc6-9962-2b1ea49e0f2f', '依申请公开', '1', '8', 'cms/applyopen_list.do', '64f2084d-3fe7-4345-85c6-4dc835c1b939');
INSERT INTO `freecms_func` VALUES ('6bf700a4-2526-4603-9187-addc3f066750', '功能演示', '1', '1000', 'demo_list.do', 'a5452f4f-1a1b-4980-90a3-4a60a38ba373');
INSERT INTO `freecms_func` VALUES ('6c561fe7-2013-4ce5-bf9a-42874b07a99e', '站点设置', '1', '1', 'cms/site_config.do', '64f2084d-3fe7-4345-85c6-4dc835c1b939');
INSERT INTO `freecms_func` VALUES ('6f32a2b6-a552-4a91-a10c-2962af63eca7', '添加角色', '1', '0', 'role_edit.do', '3dc03dc5-56ba-46d9-b8ab-78d19c04cd86');
INSERT INTO `freecms_func` VALUES ('74007605-cdce-4313-b874-8a26a2e8df7a', '敏感词管理', '1', '1', 'cms/sensitive_list.do', 'a5452f4f-1a1b-4980-90a3-4a60a38ba373');
INSERT INTO `freecms_func` VALUES ('742470cc-eaf1-48c4-805c-44c9936a7622', '部门信件', '1', '1', 'cms/mail_list.do?mail.type=unit', '67705234-603a-47c7-8f0d-8cdd349fd7c6');
INSERT INTO `freecms_func` VALUES ('80453df3-35df-4c63-bbb5-1c333eadc8ab', '统计分析', '1', '100', '', '64f2084d-3fe7-4345-85c6-4dc835c1b939');
INSERT INTO `freecms_func` VALUES ('88749e6a-a8ec-47ef-aa4a-f7912d0ed12c', '下拉链接管理', '1', '2', 'cms/link_list.do?link.type=1', '26622672-9a10-4e4e-93a7-7fe50a9208b3');
INSERT INTO `freecms_func` VALUES ('8acc3be4-a2f6-4fe8-903f-9fd5867f985a', '会员', '1', '3', '', '');
INSERT INTO `freecms_func` VALUES ('8afb6f01-ae46-447c-acfa-1a6e0964bbba', '角色管理', '1', '1', 'role_list.do', '3dc03dc5-56ba-46d9-b8ab-78d19c04cd86');
INSERT INTO `freecms_func` VALUES ('8b8880d9-17f9-4f21-b1f9-531a9608afcb', '统计分析', '1', '102', '', 'a5452f4f-1a1b-4980-90a3-4a60a38ba373');
INSERT INTO `freecms_func` VALUES ('95088cf5-299d-495a-896e-b3eae1a404c0', '积分规则', '1', '11', 'cms/creditrule_list.do', '8acc3be4-a2f6-4fe8-903f-9fd5867f985a');
INSERT INTO `freecms_func` VALUES ('969d27f9-71f8-4cb8-a1bd-6343fe32bbb1', '评论管理', '1', '13', 'cms/comment_list.do', '8acc3be4-a2f6-4fe8-903f-9fd5867f985a');
INSERT INTO `freecms_func` VALUES ('98e94eff-8da7-4fcf-a175-2ad4cb6a42c0', '访问频率统计', '1', '4', 'cms/stat_sysVisit.do', '8b8880d9-17f9-4f21-b1f9-531a9608afcb');
INSERT INTO `freecms_func` VALUES ('a1a4cbf4-b6b1-4028-8476-0222a1671b60', '建站向导', '1', '0', 'cms/site_guide.do', '64f2084d-3fe7-4345-85c6-4dc835c1b939');
INSERT INTO `freecms_func` VALUES ('a5452f4f-1a1b-4980-90a3-4a60a38ba373', '系统', '1', '4', '', '');
INSERT INTO `freecms_func` VALUES ('b688f798-1ba8-48da-9786-de1a87579fe1', '站点信息统计', '1', '2', 'cms/stat_sysSiteStat.do', '8b8880d9-17f9-4f21-b1f9-531a9608afcb');
INSERT INTO `freecms_func` VALUES ('c0ac116b-2b2a-4a09-ba25-0c2fffc12b4d', '栏目管理', '1', '1', 'cms/channel_channel.do', '64f2084d-3fe7-4345-85c6-4dc835c1b939');
INSERT INTO `freecms_func` VALUES ('c1fea184-320f-4f65-89c1-e55fc4db9248', '栏目访问统计', '1', '4', 'cms/stat_channelVisit.do', '80453df3-35df-4c63-bbb5-1c333eadc8ab');
INSERT INTO `freecms_func` VALUES ('c49dc74e-9ad7-4252-95b1-d99e521718c0', '评论频率统计', '1', '8', 'cms/stat_commentUpdate.do', '80453df3-35df-4c63-bbb5-1c333eadc8ab');
INSERT INTO `freecms_func` VALUES ('c6f3ee9c-e7e1-4050-835e-70977581acf9', '工作量统计', '1', '1', 'cms/stat_workload.do', '80453df3-35df-4c63-bbb5-1c333eadc8ab');
INSERT INTO `freecms_func` VALUES ('ca420ae9-b139-480a-a53a-8021d4b0031b', '简历管理', '1', '11', 'cms/resume_list.do', '64f2084d-3fe7-4345-85c6-4dc835c1b939');
INSERT INTO `freecms_func` VALUES ('cb42d736-3386-42b8-a9f7-62840c4ecefa', '信息管理', '1', '2', '', '64f2084d-3fe7-4345-85c6-4dc835c1b939');
INSERT INTO `freecms_func` VALUES ('d301815a-1583-4eb9-b1a2-44f1b819cc9d', '系统链接', '1', '2', 'adminlink_list.do?adminlink.type=0', 'a5452f4f-1a1b-4980-90a3-4a60a38ba373');
INSERT INTO `freecms_func` VALUES ('d4a686b2-90b6-42db-ab11-1081d8587658', '站点留言统计', '1', '6', 'cms/stat_sysSiteGuestbook.do', '8b8880d9-17f9-4f21-b1f9-531a9608afcb');
INSERT INTO `freecms_func` VALUES ('dc48e8ad-331c-4f6e-967b-1d9240017d67', '栏目信息统计', '1', '2', 'cms/stat_channelStat.do', '80453df3-35df-4c63-bbb5-1c333eadc8ab');
INSERT INTO `freecms_func` VALUES ('dee27e76-ad55-45ff-b007-4f8a31db8621', '信息提取', '1', '3', 'cms/info_extract.do', 'cb42d736-3386-42b8-a9f7-62840c4ecefa');
INSERT INTO `freecms_func` VALUES ('df4647eb-8758-451c-bdcd-54c2d180c474', '会员管理', '1', '10', 'cms/member_list.do', '8acc3be4-a2f6-4fe8-903f-9fd5867f985a');
INSERT INTO `freecms_func` VALUES ('e01bb9aa-b122-41ac-b28c-e97993c2d250', '其他信件', '1', '3', 'cms/mail_list.do?mail.type=other', '67705234-603a-47c7-8f0d-8cdd349fd7c6');
INSERT INTO `freecms_func` VALUES ('e3066945-edb5-43ca-b29a-a0f96f98a50e', '首页静态化', '1', '1', 'cms/html_indexConfirm.do', 'e63b222f-3ccb-4e22-b8ab-7cd0dece9f06');
INSERT INTO `freecms_func` VALUES ('e5bf691a-ea9f-4970-bf35-cb4017665073', '职位管理', '1', '10', 'cms/job_list.do', '64f2084d-3fe7-4345-85c6-4dc835c1b939');
INSERT INTO `freecms_func` VALUES ('e63b222f-3ccb-4e22-b8ab-7cd0dece9f06', '静态化管理', '1', '4', '', '64f2084d-3fe7-4345-85c6-4dc835c1b939');
INSERT INTO `freecms_func` VALUES ('e9136c39-c814-4d6d-9a21-0f78da23f5fc', '信息访问统计', '1', '5', 'cms/stat_infoVisit.do', '80453df3-35df-4c63-bbb5-1c333eadc8ab');
INSERT INTO `freecms_func` VALUES ('ea3034c4-5a98-4a8a-a175-7c43e42aa939', '系统配置', '1', '102', 'config_config.do', 'a5452f4f-1a1b-4980-90a3-4a60a38ba373');
INSERT INTO `freecms_func` VALUES ('f0709c68-3af5-413b-8503-0f0bc2a3eb74', '个人信件', '1', '2', 'cms/mail_list.do?mail.type=user', '67705234-603a-47c7-8f0d-8cdd349fd7c6');
INSERT INTO `freecms_func` VALUES ('f7ed505c-069b-4a36-8bac-fa3e2fe5681e', '工作量统计', '1', '1', 'cms/stat_sysWorkload.do', '8b8880d9-17f9-4f21-b1f9-531a9608afcb');

-- ----------------------------
-- Table structure for `freecms_guestbook`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_guestbook`;
CREATE TABLE `freecms_guestbook` (
  `id` varchar(50) NOT NULL,
  `siteid` varchar(50) DEFAULT NULL,
  `memberid` varchar(50) DEFAULT NULL,
  `membername` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `qq` varchar(50) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  `recontent` varchar(1000) DEFAULT NULL,
  `retime` datetime DEFAULT NULL,
  `reuserid` varchar(50) DEFAULT NULL,
  `reusername` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='留言表';

-- ----------------------------
-- Records of freecms_guestbook
-- ----------------------------

-- ----------------------------
-- Table structure for `freecms_htmlquartz`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_htmlquartz`;
CREATE TABLE `freecms_htmlquartz` (
  `id` varchar(50) NOT NULL,
  `siteid` varchar(50) DEFAULT NULL,
  `channelid` varchar(50) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `exetimehour` int(11) DEFAULT NULL,
  `exetimemin` int(11) DEFAULT NULL,
  `intervaltype` char(1) DEFAULT NULL,
  `intervalhour` int(11) DEFAULT NULL,
  `intervalmin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='静态化调度';

-- ----------------------------
-- Records of freecms_htmlquartz
-- ----------------------------
INSERT INTO `freecms_htmlquartz` VALUES ('0265661a-c357-40ca-9e29-97f9fd28631c', 'dea0df0d-4346-44ba-9787-b370cfec224a', '364d1208-0487-4f16-ac48-4c7323964e6c', '', '0', '0', '0', '0', '0');
INSERT INTO `freecms_htmlquartz` VALUES ('09e1f294-8352-4b9d-9f1e-11e3beb5bc32', 'dea0df0d-4346-44ba-9787-b370cfec224a', '96bdb76c-d099-4e8b-be07-e80245146b52', '', '0', '0', '0', '0', '0');
INSERT INTO `freecms_htmlquartz` VALUES ('232aad1e-6747-4a11-b586-349d8216dbf8', 'dea0df0d-4346-44ba-9787-b370cfec224a', '538055fa-fb2f-4b46-babb-d9030d3aa9cc', '', '0', '0', '0', '0', '0');
INSERT INTO `freecms_htmlquartz` VALUES ('308b2779-d84f-49f9-bc02-cbe7590551e7', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'b8b16868-0301-44f1-8bc0-809e29e99fc3', '', '0', '0', '0', '0', '0');
INSERT INTO `freecms_htmlquartz` VALUES ('3857ac3c-7bcf-438a-89f5-7d02b9613fc0', 'dea0df0d-4346-44ba-9787-b370cfec224a', '1cd98bde-1f3d-44d7-b1bd-71327a8ee6d1', '', '0', '0', '0', '0', '0');
INSERT INTO `freecms_htmlquartz` VALUES ('38c27aa3-f0ad-46c4-9c09-ef2a1ca2c1c1', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'c909d345-5352-48ae-a3d5-e79e18ef6b0a', '', '0', '0', '0', '0', '0');
INSERT INTO `freecms_htmlquartz` VALUES ('3a1f1fc8-d8a9-4656-8b5e-614cbddbbbfc', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, '', '0', '0', '0', '0', '0');
INSERT INTO `freecms_htmlquartz` VALUES ('403c65e3-8ad5-4d6f-a547-a4e3aad7e03e', 'dea0df0d-4346-44ba-9787-b370cfec224a', '42cc85a4-9cc0-4e05-9647-c3aee8c7c45e', '', '0', '0', '0', '0', '0');
INSERT INTO `freecms_htmlquartz` VALUES ('458ff987-57e5-44f7-acfe-3970b9ccf346', 'dea0df0d-4346-44ba-9787-b370cfec224a', '66cbab3e-c163-43d4-a5bd-a03bb3d62c14', '', '0', '0', '0', '0', '0');
INSERT INTO `freecms_htmlquartz` VALUES ('567b9955-c688-4d6f-888d-0b2bea7c283e', 'dea0df0d-4346-44ba-9787-b370cfec224a', '72316db1-7032-4c40-b6c5-aabddf3e438f', '', '0', '0', '0', '0', '0');
INSERT INTO `freecms_htmlquartz` VALUES ('78afbca7-fe25-4dec-9d1b-9eee7eb53d88', 'dea0df0d-4346-44ba-9787-b370cfec224a', '4807b089-efdb-42e5-825f-23866e81a988', '', '0', '0', '0', '0', '0');
INSERT INTO `freecms_htmlquartz` VALUES ('7d8d6a4f-b70b-4602-88c2-a1841cd4166d', 'dea0df0d-4346-44ba-9787-b370cfec224a', '85887199-aa2f-490a-8259-6ccf77c560d8', '', '0', '0', '0', '0', '0');
INSERT INTO `freecms_htmlquartz` VALUES ('8c1db00a-1b13-42d3-acb1-4b3e94a57ccd', 'dea0df0d-4346-44ba-9787-b370cfec224a', '98ad300f-c627-4c96-9d0e-056a8695e1e9', '', '0', '0', '0', '0', '0');
INSERT INTO `freecms_htmlquartz` VALUES ('8f82caae-6a97-4380-8ed8-a40fb612db88', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'd3001698-7d12-4bd5-bb5f-291128eed4fc', '', '0', '0', '0', '0', '0');
INSERT INTO `freecms_htmlquartz` VALUES ('949ba2c6-29d6-4989-a904-213a283d1578', 'dea0df0d-4346-44ba-9787-b370cfec224a', '02c99d1e-d1c6-47ad-b11b-b260fc64f954', '', '0', '0', '0', '0', '0');
INSERT INTO `freecms_htmlquartz` VALUES ('a1dde579-bafc-4ca9-9759-703ab816b0c8', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'b1214fed-1bba-4bac-b4bb-80fc06c28179', '', '0', '0', '0', '0', '0');
INSERT INTO `freecms_htmlquartz` VALUES ('a2ea0648-f6f6-4345-9413-500bca658099', 'dea0df0d-4346-44ba-9787-b370cfec224a', '4517633f-7f20-4dc3-9663-741b2062ac3f', '', '0', '0', '0', '0', '0');
INSERT INTO `freecms_htmlquartz` VALUES ('c05b51ae-dc64-420e-8811-5ad0c9ca024d', 'dea0df0d-4346-44ba-9787-b370cfec224a', '2a475529-81c7-4a5c-84b8-662404c7a6dd', '', '0', '0', '0', '0', '0');
INSERT INTO `freecms_htmlquartz` VALUES ('c3cc9619-1937-40f3-b0da-4edd5446223c', 'dea0df0d-4346-44ba-9787-b370cfec224a', '4701eafa-3eeb-4f01-9e9b-ef6dbd7b9e08', '', '0', '0', '0', '0', '0');
INSERT INTO `freecms_htmlquartz` VALUES ('cdbc1b5e-daa0-4495-8e61-aeb9fa79b4f9', 'dea0df0d-4346-44ba-9787-b370cfec224a', '0a7b556a-3593-4976-b695-d9d43bfce981', '', '0', '0', '0', '0', '0');
INSERT INTO `freecms_htmlquartz` VALUES ('dc2b6bdb-f28e-493c-b65e-9f63a146611b', 'dea0df0d-4346-44ba-9787-b370cfec224a', '3c37abd4-5454-4f14-a839-224d2f2ddba0', '', '0', '0', '0', '0', '0');
INSERT INTO `freecms_htmlquartz` VALUES ('ed9d3f45-374d-4223-8ce1-e3e4fdbe62e4', 'dea0df0d-4346-44ba-9787-b370cfec224a', '62097e21-e994-4a9e-b237-210f5725e865', '', '0', '0', '0', '0', '0');
INSERT INTO `freecms_htmlquartz` VALUES ('f33892dd-2cd8-4b34-b436-5ec5a013ca23', 'dea0df0d-4346-44ba-9787-b370cfec224a', '21941f4f-5735-4311-9a25-e56da6c816e1', '', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `freecms_info`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_info`;
CREATE TABLE `freecms_info` (
  `id` varchar(50) NOT NULL,
  `site` varchar(50) DEFAULT NULL,
  `channel` varchar(50) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `shortTitle` varchar(100) DEFAULT NULL,
  `titleColor` varchar(10) DEFAULT NULL,
  `titleBlod` varchar(1) DEFAULT NULL,
  `source` varchar(50) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `content` longtext,
  `tags` varchar(1000) DEFAULT NULL,
  `img` varchar(500) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `attchs` varchar(5000) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `templet` varchar(50) DEFAULT NULL,
  `isHot` varchar(1) DEFAULT '0',
  `isTop` varchar(1) DEFAULT '0',
  `topEndTime` datetime DEFAULT NULL,
  `clickNum` int(11) DEFAULT NULL,
  `addUser` varchar(50) DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  `issign` varchar(1) DEFAULT NULL,
  `video` varchar(500) DEFAULT NULL,
  `iscomment` char(1) DEFAULT NULL,
  `indexnum` varchar(50) DEFAULT NULL,
  `opentype` varchar(1) DEFAULT NULL,
  `opentimetype` varchar(1) DEFAULT NULL,
  `openendtime` datetime DEFAULT NULL,
  `htmlIndexnum` int(11) NOT NULL AUTO_INCREMENT,
  `isimgs` varchar(1) DEFAULT NULL,
  `ischeck` varchar(1) DEFAULT '0' COMMENT '是否审核1为审核，默认为0',
  `editor` varchar(255) DEFAULT '' COMMENT '编辑',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键词',
  `firstvalue` int(11) DEFAULT '0' COMMENT '优先值',
  `isshowindex` varchar(3) DEFAULT '1' COMMENT '是否在首页显示，1为显示0为不显示，默认为1',
  `isshowlist` varchar(3) DEFAULT '1' COMMENT '是否在列表页显示，1为显示0为不显示，默认为1',
  `isrecommend` varchar(1) DEFAULT '1' COMMENT '是否推荐，1为推荐，0为不推荐，默认为1',
  `gzlm` varchar(300) DEFAULT NULL COMMENT '关注栏目',
  `bjyx` varchar(255) DEFAULT NULL COMMENT '编辑邮箱',
  `nper` int(11) DEFAULT NULL COMMENT '期数，第几期',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `mdtime` datetime DEFAULT NULL COMMENT '修改时间',
  `isshownewscenter` varchar(255) DEFAULT NULL,
  `istopnewscenter` varchar(255) DEFAULT NULL,
  `isrecommendnewscenter` varchar(255) DEFAULT NULL,
  `isquote` int(1) DEFAULT '0',
  `quoteinfoid` varchar(50) DEFAULT NULL,
  `recommendreason` varchar(255) DEFAULT NULL COMMENT '推荐理由',
  `suitage` varchar(255) DEFAULT NULL COMMENT '适合年龄',
  `depth` varchar(255) DEFAULT NULL COMMENT '深入的',
  PRIMARY KEY (`id`),
  UNIQUE KEY `htmlIndexnum` (`htmlIndexnum`),
  KEY `FK_信息_栏目` (`channel`),
  CONSTRAINT `FK_信息_栏目` FOREIGN KEY (`channel`) REFERENCES `freecms_channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='信息';

-- ----------------------------
-- Records of freecms_info
-- ----------------------------
INSERT INTO `freecms_info` VALUES ('11828035-20d7-41bb-bab5-3ec54d5a5868', 'dea0df0d-4346-44ba-9787-b370cfec224a', '62097e21-e994-4a9e-b237-210f5725e865', '少儿口才与主持强化版', '少儿口才与主持强化版', null, '0', '', '', '少儿口才与主持强化版少儿口才与主持强化版少儿口才与主持强化版少儿口才与主持强化版少儿口才与主持强化版少儿口才与主持强化版少儿口才与主持强化版少儿口才与主持强化版少儿口才与主持强化版少儿口才与主持强化版少儿口才与主持强化版少儿口才与主持强化版', '<p>\r\n	少儿口才与主持强化版少儿口才与主持强化版少儿口才与主持强化版少儿口才与主持强化版少儿口才与主持强化版少儿口才与主持强化版少儿口才与主持强化版少儿口才与主持强化版少儿口才与主持强化版少儿口才与主持强化版少儿口才与主持强化版少儿口才与主持强化版</p>', '', '/upload/201604/1461393406824.jpg', '', '', '2016-04-23 14:36:49', '', '1', '0', null, '285', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '15', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 15:02:51', '1', '1', '1', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('1878b7b0-0db9-4b7b-8d8e-fc3c22e094a6', 'dea0df0d-4346-44ba-9787-b370cfec224a', '62097e21-e994-4a9e-b237-210f5725e865', '幼儿口才与主持基础版', '幼儿口才与主持基础版', null, '0', '', '', '幼儿口才与主持基础版幼儿口才与主持基础版幼儿口才与主持基础版幼儿口才与主持基础版幼儿口才与主持基础版幼儿口才与主持基础版幼儿口才与主持基础版幼儿口才与主持基础版幼儿口才与主持基础版', '<p>\r\n	幼儿口才与主持基础版幼儿口才与主持基础版幼儿口才与主持基础版幼儿口才与主持基础版幼儿口才与主持基础版幼儿口才与主持基础版幼儿口才与主持基础版幼儿口才与主持基础版幼儿口才与主持基础版</p>', '', '/upload/201604/1461393275244.jpg', '', '', '2016-04-23 14:34:39', '', '0', '0', null, '109', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '13', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 14:34:39', '0', '0', '0', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('21b836ce-339e-4bb7-8d09-c358f4aecaf5', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'b1214fed-1bba-4bac-b4bb-80fc06c28179', '2015全国语言朗诵校长/教师培训认证会入册名单确认', '2015全国语言朗诵校长/教师培训认证会入册名单确认', null, '0', '', '', '2015全国语言朗诵校长/教师培训认证会入册名单确认2015全国语言朗诵校长/教师培训认证会入册名单确认2015全国语言朗诵校长/教师培训认证会入册名单确认2015全国语言朗诵校长/教师培训认证会入册名单确认2015全国语言朗诵校长/教师培训认证会入册名单确认2015全国语言朗诵校长/教师培训认证会入册名单确认', '<p>\r\n	<span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015全国语言朗诵校长/教师培训认证会入册名单确认</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015全国语言朗诵校长/教师培训认证会入册名单确认</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015全国语言朗诵校长/教师培训认证会入册名单确认</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015全国语言朗诵校长/教师培训认证会入册名单确认</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015全国语言朗诵校长/教师培训认证会入册名单确认</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015全国语言朗诵校长/教师培训认证会入册名单确认</span></p>', '', '', '', '', '2016-04-23 15:19:37', '', '0', '0', null, '398', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '39', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 15:19:37', '1', '1', '1', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('24390940-831f-4d42-a298-a4c7c4cab28e', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'b1214fed-1bba-4bac-b4bb-80fc06c28179', '红动中国•精湛风采暨《2016全国语言教师教学风采大赛》报名启动', '红动中国•精湛风采暨《2016全国语言教师教学风采大赛》报名启动', null, '0', '', '', '红动中国&bull;精湛风采暨《2016全国语言教师教学风采大赛》报名启动红动中国&bull;精湛风采暨《2016全国语言教师教学风采大赛》报名启动红动中国&bull;精湛风采暨《2016全国语言教师教学风采大赛》报名启动红动中国&bull;精湛风采暨《2016全国语言教师教学风采大赛》报名启动红动中国&bull;精湛风采暨《2016全国语言教师教学风采大赛》报名启动红动中国&bull;精湛风采暨《2016全国语言教师教学风采大赛》报名启动红动中国&bull;精湛风采暨《2016全国语言教师教学风采大赛》报名启动红动中国&bull;精湛风采暨《2016全国语言教师教学风采大赛》报名启动红动中国&bull;精湛风采暨《2016全国语言教师教学风采大赛》报名启动红动中国&bull;精湛风采暨《2016全国语言教师教学风采大赛》报名启动', '<p>\r\n	<span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">红动中国&bull;精湛风采暨《2016全国语言教师教学风采大赛》报名启动</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">红动中国&bull;精湛风采暨《2016全国语言教师教学风采大赛》报名启动</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">红动中国&bull;精湛风采暨《2016全国语言教师教学风采大赛》报名启动</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">红动中国&bull;精湛风采暨《2016全国语言教师教学风采大赛》报名启动</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">红动中国&bull;精湛风采暨《2016全国语言教师教学风采大赛》报名启动</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">红动中国&bull;精湛风采暨《2016全国语言教师教学风采大赛》报名启动</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">红动中国&bull;精湛风采暨《2016全国语言教师教学风采大赛》报名启动</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">红动中国&bull;精湛风采暨《2016全国语言教师教学风采大赛》报名启动</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">红动中国&bull;精湛风采暨《2016全国语言教师教学风采大赛》报名启动</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">红动中国&bull;精湛风采暨《2016全国语言教师教学风采大赛》报名启动</span></p>', '', '', '', '', '2016-04-23 15:16:11', '', '0', '0', null, '189', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '26', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 15:16:11', '1', '1', '1', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('26b72d68-d04a-4d6c-a444-fed81ec322d1', 'dea0df0d-4346-44ba-9787-b370cfec224a', '62097e21-e994-4a9e-b237-210f5725e865', '童话剧课堂', '童话剧课堂', null, '0', '', '', '童话剧课堂童话剧课堂童话剧课堂童话剧课堂童话剧课堂童话剧课堂童话剧课堂童话剧课堂童话剧课堂童话剧课堂童话剧课堂童话剧课堂童话剧课堂', '<p>\r\n	童话剧课堂童话剧课堂童话剧课堂童话剧课堂童话剧课堂童话剧课堂童话剧课堂童话剧课堂童话剧课堂童话剧课堂童话剧课堂童话剧课堂童话剧课堂</p>', '', '/upload/201604/1461393606263.jpg', '', '', '2016-04-23 14:40:08', '', '0', '0', null, '244', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '21', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 14:40:08', '1', '1', '1', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('291f9dc3-b2e1-4c72-8cbc-29c0c8450120', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'b1214fed-1bba-4bac-b4bb-80fc06c28179', '欢动五洲•梦想起航 暨《2016猴年红话筒少儿春晚大型新春盛典》', '欢动五洲•梦想起航 暨《2016猴年红话筒少儿春晚大型新春盛典》', null, '0', '', '', '欢动五洲&bull;梦想起航 暨《2016猴年红话筒少儿春晚大型新春盛典》欢动五洲&bull;梦想起航 暨《2016猴年红话筒少儿春晚大型新春盛典》欢动五洲&bull;梦想起航 暨《2016猴年红话筒少儿春晚大型新春盛典》欢动五洲&bull;梦想起航 暨《2016猴年红话筒少儿春晚大型新春盛典》欢动五洲&bull;梦想起航 暨《2016猴年红话筒少儿春晚大型新春盛典》欢动五洲&bull;梦想起航 暨《2016猴年红话筒少儿春晚大型新春盛典》欢动五洲&bull;梦想起航 暨《2016猴年红话筒少儿春晚大型新春盛典》欢动五洲&bull;梦想起航 暨《2016猴年红话筒少儿春晚大型新春盛典》欢动五洲&bull;梦想起航 暨《2016猴年红话筒少儿春晚大型新春盛典》欢动五洲&bull;梦想起航 暨《2016猴年红话筒少儿春晚大型新春盛典》欢动五洲&bull;梦想起航 暨《2016猴年红话筒少儿春晚大型新春盛典》欢动五洲&bull;梦想起航 暨《2016猴年红话筒少儿春晚大型新春盛典》', '<p>\r\n	<span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">欢动五洲&bull;梦想起航 暨《2016猴年红话筒少儿春晚大型新春盛典》</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">欢动五洲&bull;梦想起航 暨《2016猴年红话筒少儿春晚大型新春盛典》</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">欢动五洲&bull;梦想起航 暨《2016猴年红话筒少儿春晚大型新春盛典》</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">欢动五洲&bull;梦想起航 暨《2016猴年红话筒少儿春晚大型新春盛典》</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">欢动五洲&bull;梦想起航 暨《2016猴年红话筒少儿春晚大型新春盛典》</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">欢动五洲&bull;梦想起航 暨《2016猴年红话筒少儿春晚大型新春盛典》</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">欢动五洲&bull;梦想起航 暨《2016猴年红话筒少儿春晚大型新春盛典》</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">欢动五洲&bull;梦想起航 暨《2016猴年红话筒少儿春晚大型新春盛典》</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">欢动五洲&bull;梦想起航 暨《2016猴年红话筒少儿春晚大型新春盛典》</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">欢动五洲&bull;梦想起航 暨《2016猴年红话筒少儿春晚大型新春盛典》</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">欢动五洲&bull;梦想起航 暨《2016猴年红话筒少儿春晚大型新春盛典》</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">欢动五洲&bull;梦想起航 暨《2016猴年红话筒少儿春晚大型新春盛典》</span></p>', '', '', '', '', '2016-04-23 15:17:16', '', '0', '0', null, '490', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '30', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 15:17:16', '1', '1', '1', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('29f71619-42bb-4ee0-a237-4683b9ca8b59', 'dea0df0d-4346-44ba-9787-b370cfec224a', '62097e21-e994-4a9e-b237-210f5725e865', '幼儿口才系列盘', '幼儿口才系列盘', null, '0', '', '', '幼儿口才系列盘幼儿口才系列盘幼儿口才系列盘幼儿口才系列盘幼儿口才系列盘幼儿口才系列盘幼儿口才系列盘幼儿口才系列盘幼儿口才系列盘幼儿口才系列盘', '<p>\r\n	幼儿口才系列盘幼儿口才系列盘幼儿口才系列盘幼儿口才系列盘幼儿口才系列盘幼儿口才系列盘幼儿口才系列盘幼儿口才系列盘幼儿口才系列盘幼儿口才系列盘</p>', '', '/upload/201604/1461393506231.jpg', '', '', '2016-04-23 14:38:28', '', '1', '0', null, '356', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '17', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 15:05:22', '1', '1', '1', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('2ac083c3-ac77-47c5-b094-8335e1153a34', 'dea0df0d-4346-44ba-9787-b370cfec224a', '98ad300f-c627-4c96-9d0e-056a8695e1e9', '圣诞节的礼物', '圣诞节的礼物', null, '0', 'http://www.hui-ben.com/shijie.asp', '五味太郎', '《圣诞节礼物》内容简介：故事发生在圣诞节。在圣诞节，圣诞老公公送礼物，是每个孩子都知道的事。可是，在圣诞节，谁会送给圣诞老公公礼物呢？送给他的礼物，又会是什么呢？他会喜欢吗？五味太郎用可爱的画风、轻松幽默的叙事方法，表现了孩子们的纯真和圣诞老公公的善良', '<p>\r\n	<span style=\"color: rgb(102, 102, 102); font-family: Verdana; line-height: 20px;\">《圣诞节的礼物》编辑推荐：每年的圣诞节，都是小朋友们最期待的日子。因为在那天，世上最最可爱的圣诞老爷爷会派发礼物。不管你是调皮捣蛋，还是喜欢搞点小恶作剧，又或者学习成绩总是班里倒数。这都没关系，圣诞老人是最最善良的爷爷，他爱每个孩子。所以每个小朋友都会有礼物，永远不落空。那么，这个圣诞节会有什么特别呢？</span><br style=\"color: rgb(102, 102, 102); font-family: Verdana; line-height: 20px;\" />\r\n	<span style=\"color: rgb(102, 102, 102); font-family: Verdana; line-height: 20px;\">据说圣诞老人也会收到神秘礼物哦，是什么样的礼物呢？在人人有圣诞节惊喜时，圣诞老人也有意外收获！</span><br style=\"color: rgb(102, 102, 102); font-family: Verdana; line-height: 20px;\" />\r\n	<span style=\"color: rgb(102, 102, 102); font-family: Verdana; line-height: 20px;\">五味太郎用可爱的画风、轻松幽默的叙事方法，表现了孩子们的纯真和圣诞老公公的善良。这本书充满了创意、趣味和幽默感，朴实中带点淘气，顽皮而又纯真，如同我们的孩子们。也许圣诞老人在成人世界里是一个大大的&ldquo;谎言&rdquo;。可对孩子们来说，这无疑是件美好的事情。请不要揭穿这善意的&ldquo;谎言&rdquo;，让孩子们保留心中的完美世界，拥有一个幸福的童年。也让我们一起保护孩子纯真的天性吧&hellip;&hellip;《圣诞节的礼物》带给你一个与众不同的&ldquo;圣诞节的礼物。&rdquo;</span></p>', '', '/upload/201605/1464252503437.jpg', '', '', '2016-05-26 14:39:24', '', '0', '0', null, '336', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '40', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-05-26 16:48:24', '1', '1', '1', '0', null, '在艰难的日子里，用希望、勇气、坚忍、爱和智慧用心等待', '6岁以上亲子共读', '《小鲁的池塘》、《先左脚，再右脚》...');
INSERT INTO `freecms_info` VALUES ('2ced66f6-0179-44c9-8b38-d8816f28e736', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'b8b16868-0301-44f1-8bc0-809e29e99fc3', '贺美国-达拉斯市红话筒分校成立', '贺美国-达拉斯市红话筒分校成立', null, '0', '', '', '贺美国-达拉斯市红话筒分校成立贺美国-达拉斯市红话筒分校成立贺美国-达拉斯市红话筒分校成立贺美国-达拉斯市红话筒分校成立贺美国-达拉斯市红话筒分校成立贺美国-达拉斯市红话筒分校成立贺美国-达拉斯市红话筒分校成立', '<p>\r\n	贺美国-达拉斯市红话筒分校成立贺美国-达拉斯市红话筒分校成立贺美国-达拉斯市红话筒分校成立贺美国-达拉斯市红话筒分校成立贺美国-达拉斯市红话筒分校成立贺美国-达拉斯市红话筒分校成立贺美国-达拉斯市红话筒分校成立</p>', '', '', '', '', '2016-04-23 12:37:39', '', '1', '1', null, '111', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '8', '0', '1', '管理员', '', '0', '1', '1', '0', null, null, '0', '管理员', '2016-04-23 12:43:42', '0', '0', '0', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('330f3152-fb7a-4cca-96f4-fc3d2079b810', 'dea0df0d-4346-44ba-9787-b370cfec224a', '4517633f-7f20-4dc3-9663-741b2062ac3f', '图片新闻3333', '图片新闻3333', null, '0', '', '', '图片新闻3333图片新闻3333图片新闻3333图片新闻3333图片新闻3333图片新闻3333图片新闻3333图片新闻3333图片新闻3333', '<p>\r\n	图片新闻3333图片新闻3333图片新闻3333图片新闻3333图片新闻3333图片新闻3333图片新闻3333图片新闻3333图片新闻3333</p>', '', '/upload/201604/1461390051388.jpg', 'https://www.baidu.com', '', '2016-04-23 13:40:56', '', '0', '0', null, '268', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '11', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 13:42:04', '0', '0', '0', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('5497d600-473e-42b9-8f5c-da9191401e70', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'b1214fed-1bba-4bac-b4bb-80fc06c28179', '中国红，红话筒，话筒赢天下！我们的话筒，我们的声音，我们的舞台！2015暑假全国语言朗诵考级正式启动！', '中国红，红话筒，话筒赢天下！我们的话筒，我们的声音，我们的舞台！2015暑假全国语言朗诵考级正式启动！', null, '0', '', '', '中国红，红话筒，话筒赢天下！我们的话筒，我们的声音，我们的舞台！2015暑假全国语言朗诵考级正式启动！中国红，红话筒，话筒赢天下！我们的话筒，我们的声音，我们的舞台！2015暑假全国语言朗诵考级正式启动！中国红，红话筒，话筒赢天下！我们的话筒，我们的声音，我们的舞台！2015暑假全国语言朗诵考级正式启动！中国红，红话筒，话筒赢天下！我们的话筒，我们的声音，我们的舞台！2015暑假全国语言朗诵考级正式启动！中国红，红话筒，话筒赢天下！我们的话筒，我们的声音，我们的舞台！2015暑假全国语言朗诵考级正式启动！中国红，红话筒，话筒赢天下！我们的话筒，我们的声音，我们的舞台！2015暑假全国语言朗诵考级正式启动！中国红，红话筒，话筒赢天下！我们的话筒，我们的声音，我们的舞台！2015暑假全国语言朗诵考级正式启动！中国红，红话筒，话筒赢天下！我们的话筒，我们的声音，我们的舞台！2015暑假全国语言朗诵考级正式启动！', '<p>\r\n	<span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">中国红，红话筒，话筒赢天下！我们的话筒，我们的声音，我们的舞台！2015暑假全国语言朗诵考级正式启动！</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">中国红，红话筒，话筒赢天下！我们的话筒，我们的声音，我们的舞台！2015暑假全国语言朗诵考级正式启动！</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">中国红，红话筒，话筒赢天下！我们的话筒，我们的声音，我们的舞台！2015暑假全国语言朗诵考级正式启动！</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">中国红，红话筒，话筒赢天下！我们的话筒，我们的声音，我们的舞台！2015暑假全国语言朗诵考级正式启动！</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">中国红，红话筒，话筒赢天下！我们的话筒，我们的声音，我们的舞台！2015暑假全国语言朗诵考级正式启动！</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">中国红，红话筒，话筒赢天下！我们的话筒，我们的声音，我们的舞台！2015暑假全国语言朗诵考级正式启动！</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">中国红，红话筒，话筒赢天下！我们的话筒，我们的声音，我们的舞台！2015暑假全国语言朗诵考级正式启动！</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">中国红，红话筒，话筒赢天下！我们的话筒，我们的声音，我们的舞台！2015暑假全国语言朗诵考级正式启动！</span></p>', '', '', '', '', '2016-04-23 15:19:09', '', '0', '0', null, '158', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '37', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 15:19:09', '1', '1', '1', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('5586c92e-0cb4-402b-b95a-99252302fb07', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'b1214fed-1bba-4bac-b4bb-80fc06c28179', '关于2015下半年全国语言朗诵考级启动通知', '关于2015下半年全国语言朗诵考级启动通知', null, '0', '', '', '关于2015下半年全国语言朗诵考级启动通知关于2015下半年全国语言朗诵考级启动通知关于2015下半年全国语言朗诵考级启动通知关于2015下半年全国语言朗诵考级启动通知关于2015下半年全国语言朗诵考级启动通知关于2015下半年全国语言朗诵考级启动通知关于2015下半年全国语言朗诵考级启动通知关于2015下半年全国语言朗诵考级启动通知关于2015下半年全国语言朗诵考级启动通知关于2015下半年全国语言朗诵考级启动通知', '<p>\r\n	<span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">关于2015下半年全国语言朗诵考级启动通知</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">关于2015下半年全国语言朗诵考级启动通知</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">关于2015下半年全国语言朗诵考级启动通知</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">关于2015下半年全国语言朗诵考级启动通知</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">关于2015下半年全国语言朗诵考级启动通知</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">关于2015下半年全国语言朗诵考级启动通知</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">关于2015下半年全国语言朗诵考级启动通知</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">关于2015下半年全国语言朗诵考级启动通知</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">关于2015下半年全国语言朗诵考级启动通知</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">关于2015下半年全国语言朗诵考级启动通知</span></p>', '', '', '', '', '2016-04-23 15:17:47', '', '0', '0', null, '122', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '32', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 15:17:47', '1', '1', '1', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('5ba70345-87c7-49a9-9380-bc29f89a2fb4', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'b1214fed-1bba-4bac-b4bb-80fc06c28179', '关于2015《全国语言教师培训交流认证会》的通知', '关于2015《全国语言教师培训交流认证会》的通知', null, '0', '', '', '关于2015《全国语言教师培训交流认证会》的通知关于2015《全国语言教师培训交流认证会》的通知关于2015《全国语言教师培训交流认证会》的通知关于2015《全国语言教师培训交流认证会》的通知关于2015《全国语言教师培训交流认证会》的通知关于2015《全国语言教师培训交流认证会》的通知关于2015《全国语言教师培训交流认证会》的通知关于2015《全国语言教师培训交流认证会》的通知关于2015《全国语言教师培训交流认证会》的通知', '<p>\r\n	<span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">关于2015《全国语言教师培训交流认证会》的通知</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">关于2015《全国语言教师培训交流认证会》的通知</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">关于2015《全国语言教师培训交流认证会》的通知</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">关于2015《全国语言教师培训交流认证会》的通知</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">关于2015《全国语言教师培训交流认证会》的通知</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">关于2015《全国语言教师培训交流认证会》的通知</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">关于2015《全国语言教师培训交流认证会》的通知</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">关于2015《全国语言教师培训交流认证会》的通知</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">关于2015《全国语言教师培训交流认证会》的通知</span></p>', '', '', '', '', '2016-04-23 15:17:29', '', '0', '0', null, '468', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '31', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 15:17:29', '1', '1', '1', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('6b378204-0cb4-4f5d-a326-cf7e68247e6e', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'b8b16868-0301-44f1-8bc0-809e29e99fc3', '贺日本-东京市红话筒分校成立', '贺日本-东京市红话筒分校成立', null, '0', '', '', '贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立', '<p>\r\n	贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立贺日本-东京市红话筒分校成立</p>', '', '', '', '', '2016-04-23 12:35:49', '', '1', '0', null, '328', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '6', '0', '1', '管理员', '', '0', '1', '1', '0', null, null, '0', '管理员', '2016-04-23 12:36:57', '0', '0', '0', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('75e0d7cf-5eae-402c-8b07-971330c4867b', 'dea0df0d-4346-44ba-9787-b370cfec224a', '62097e21-e994-4a9e-b237-210f5725e865', '口语交际经典课例', '口语交际经典课例', null, '0', '', '', '口语交际经典课例口语交际经典课例口语交际经典课例口语交际经典课例口语交际经典课例口语交际经典课例口语交际经典课例口语交际经典课例', '<p>\r\n	口语交际经典课例口语交际经典课例口语交际经典课例口语交际经典课例口语交际经典课例口语交际经典课例口语交际经典课例口语交际经典课例</p>', '', '/upload/201604/1461393745134.jpg', '', '', '2016-04-23 14:42:28', '', '0', '0', null, '380', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '23', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 14:42:28', '1', '1', '1', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('7d44b4fb-037d-492b-b2f3-bc51c62f1042', 'dea0df0d-4346-44ba-9787-b370cfec224a', '62097e21-e994-4a9e-b237-210f5725e865', '礼仪课堂', '礼仪课堂', null, '0', '', '', '礼仪课堂礼仪课堂礼仪课堂礼仪课堂礼仪课堂礼仪课堂礼仪课堂礼仪课堂礼仪课堂礼仪课堂礼仪课堂礼仪课堂', '<p>\r\n	礼仪课堂礼仪课堂礼仪课堂礼仪课堂礼仪课堂礼仪课堂礼仪课堂礼仪课堂礼仪课堂礼仪课堂礼仪课堂礼仪课堂</p>', '', '/upload/201604/1461393768303.jpg', '', '', '2016-04-23 14:42:49', '', '0', '0', null, '209', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '24', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 14:42:49', '1', '1', '1', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('855bf14a-28ae-4c3c-b9bb-e2f0f96efa18', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'b1214fed-1bba-4bac-b4bb-80fc06c28179', '中国红话筒教育千家分校共贺新春', '中国红话筒教育千家分校共贺新春', null, '0', '', '', '中国红话筒教育千家分校共贺新春中国红话筒教育千家分校共贺新春中国红话筒教育千家分校共贺新春中国红话筒教育千家分校共贺新春中国红话筒教育千家分校共贺新春中国红话筒教育千家分校共贺新春中国红话筒教育千家分校共贺新春中国红话筒教育千家分校共贺新春中国红话筒教育千家分校共贺新春中国红话筒教育千家分校共贺新春中国红话筒教育千家分校共贺新春', '<p>\r\n	<span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">中国红话筒教育千家分校共贺新春</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">中国红话筒教育千家分校共贺新春</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">中国红话筒教育千家分校共贺新春</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">中国红话筒教育千家分校共贺新春</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">中国红话筒教育千家分校共贺新春</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">中国红话筒教育千家分校共贺新春</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">中国红话筒教育千家分校共贺新春</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">中国红话筒教育千家分校共贺新春</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">中国红话筒教育千家分校共贺新春</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">中国红话筒教育千家分校共贺新春</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">中国红话筒教育千家分校共贺新春</span></p>', '', '', '', '', '2016-04-23 15:16:58', '', '0', '0', null, '175', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '29', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 15:16:58', '1', '1', '1', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('86d4447e-9fb6-4d3c-bd20-a63f34332832', 'dea0df0d-4346-44ba-9787-b370cfec224a', '62097e21-e994-4a9e-b237-210f5725e865', '少儿精华系列盘', '少儿精华系列盘', null, '0', '', '', '少儿精华系列盘少儿精华系列盘少儿精华系列盘少儿精华系列盘少儿精华系列盘少儿精华系列盘少儿精华系列盘少儿精华系列盘少儿精华系列盘少儿精华系列盘少儿精华系列盘', '<p>\r\n	少儿精华系列盘少儿精华系列盘少儿精华系列盘少儿精华系列盘少儿精华系列盘少儿精华系列盘少儿精华系列盘少儿精华系列盘少儿精华系列盘少儿精华系列盘少儿精华系列盘</p>', '', '/upload/201604/1461393582182.jpg', '', '', '2016-04-23 14:39:44', '', '0', '0', null, '185', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '20', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 14:39:44', '1', '1', '1', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('8a733c65-1caf-44b6-9249-8dea017336f6', 'dea0df0d-4346-44ba-9787-b370cfec224a', '62097e21-e994-4a9e-b237-210f5725e865', '少儿口才与主持精华版', '少儿口才与主持精华版', null, '0', '', '', '少儿口才与主持精华版少儿口才与主持精华版少儿口才与主持精华版少儿口才与主持精华版少儿口才与主持精华版', '<p>\r\n	少儿口才与主持精华版少儿口才与主持精华版少儿口才与主持精华版少儿口才与主持精华版少儿口才与主持精华版</p>', '', '/upload/201604/1461393443325.jpg', '', '', '2016-04-23 14:37:25', '', '0', '0', null, '160', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '16', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 14:37:25', '1', '1', '1', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('8d091277-63cc-471a-967f-07535e8e2dd0', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'b8b16868-0301-44f1-8bc0-809e29e99fc3', '贺北京-北京市红话筒分校成立', '贺北京-北京市红话筒分校成立', null, '0', '', '', '贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立', '<p>\r\n	贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立贺北京-北京市红话筒分校成立</p>', '', '', '', '', '2016-04-23 12:34:39', '', '1', '0', null, '143', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '4', '0', '1', '管理员', '', '0', '1', '1', '0', null, null, '0', '管理员', '2016-04-23 12:34:39', '0', '0', '0', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('928cafce-df6e-41e8-9b84-7ed3c84cd463', 'dea0df0d-4346-44ba-9787-b370cfec224a', '4517633f-7f20-4dc3-9663-741b2062ac3f', '图片新闻1111', '图片新闻1111', null, '0', '', '', '图片新闻1111图片新闻1111图片新闻1111图片新闻1111图片新闻1111图片新闻1111图片新闻1111图片新闻1111图片新闻1111图片新闻1111', '<p>\r\n	图片新闻1111图片新闻1111图片新闻1111图片新闻1111图片新闻1111图片新闻1111图片新闻1111图片新闻1111图片新闻1111图片新闻1111</p>', '', '/upload/201604/1461389288523.jpg', 'https://www.baidu.com', '', '2016-04-23 13:30:02', '', '0', '0', null, '405', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '9', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 13:38:50', '0', '0', '0', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('a21db813-3492-4650-8185-bbacf25310bf', 'dea0df0d-4346-44ba-9787-b370cfec224a', '62097e21-e994-4a9e-b237-210f5725e865', '少儿口才与主持提高版', '少儿口才与主持提高版', null, '0', '', '', '少儿口才与主持提高版少儿口才与主持提高版少儿口才与主持提高版少儿口才与主持提高版少儿口才与主持提高版少儿口才与主持提高版少儿口才与主持提高版少儿口才与主持提高版少儿口才与主持提高版少儿口才与主持提高版', '<p>\r\n	少儿口才与主持提高版少儿口才与主持提高版少儿口才与主持提高版少儿口才与主持提高版少儿口才与主持提高版少儿口才与主持提高版少儿口才与主持提高版少儿口才与主持提高版少儿口才与主持提高版少儿口才与主持提高版</p>', '', '/upload/201604/1461393326498.jpg', '', '', '2016-04-23 14:35:28', '', '0', '0', null, '463', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '14', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 14:35:28', '1', '1', '1', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('a37b409c-3c22-4f10-8689-169213395743', 'dea0df0d-4346-44ba-9787-b370cfec224a', '4517633f-7f20-4dc3-9663-741b2062ac3f', '图片新闻2222', '图片新闻2222', null, '0', '', '', '图片新闻2222图片新闻2222图片新闻2222图片新闻2222图片新闻2222图片新闻2222图片新闻2222图片新闻2222图片新闻2222图片新闻2222', '<p>\r\n	图片新闻2222图片新闻2222图片新闻2222图片新闻2222图片新闻2222图片新闻2222图片新闻2222图片新闻2222图片新闻2222图片新闻2222</p>', '', '/upload/201604/1461390020077.jpg', 'https://www.baidu.com', '', '2016-04-23 13:40:31', '', '0', '0', null, '453', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '10', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 13:40:31', '0', '0', '0', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('bbdbd4fc-94e6-4bfd-88a4-1610bb6373b1', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'b1214fed-1bba-4bac-b4bb-80fc06c28179', '2016年上半年全国教师培训认证会报名倒计时', '2016年上半年全国教师培训认证会报名倒计时', null, '0', '', '', '2016年上半年全国教师培训认证会报名倒计时2016年上半年全国教师培训认证会报名倒计时2016年上半年全国教师培训认证会报名倒计时2016年上半年全国教师培训认证会报名倒计时2016年上半年全国教师培训认证会报名倒计时2016年上半年全国教师培训认证会报名倒计时2016年上半年全国教师培训认证会报名倒计时2016年上半年全国教师培训认证会报名倒计时2016年上半年全国教师培训认证会报名倒计时2016年上半年全国教师培训认证会报名倒计时2016年上半年全国教师培训认证会报名倒计时', '<p>\r\n	<span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2016年上半年全国教师培训认证会报名倒计时</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2016年上半年全国教师培训认证会报名倒计时</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2016年上半年全国教师培训认证会报名倒计时</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2016年上半年全国教师培训认证会报名倒计时</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2016年上半年全国教师培训认证会报名倒计时</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2016年上半年全国教师培训认证会报名倒计时</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2016年上半年全国教师培训认证会报名倒计时</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2016年上半年全国教师培训认证会报名倒计时</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2016年上半年全国教师培训认证会报名倒计时</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2016年上半年全国教师培训认证会报名倒计时</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2016年上半年全国教师培训认证会报名倒计时</span></p>', '', '', '', '', '2016-04-23 15:15:52', '', '0', '0', null, '429', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '25', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 15:15:52', '1', '1', '1', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('bea96196-2e93-48a9-8a9f-4180a40a55f6', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'b1214fed-1bba-4bac-b4bb-80fc06c28179', '2016年红话筒冬令营（魅力海南）活动启动', '2016年红话筒冬令营（魅力海南）活动启动', null, '0', '', '', '2016年红话筒冬令营（魅力海南）活动启动2016年红话筒冬令营（魅力海南）活动启动2016年红话筒冬令营（魅力海南）活动启动2016年红话筒冬令营（魅力海南）活动启动2016年红话筒冬令营（魅力海南）活动启动2016年红话筒冬令营（魅力海南）活动启动', '<p>\r\n	<span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2016年红话筒冬令营（魅力海南）活动启动</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2016年红话筒冬令营（魅力海南）活动启动</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2016年红话筒冬令营（魅力海南）活动启动</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2016年红话筒冬令营（魅力海南）活动启动</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2016年红话筒冬令营（魅力海南）活动启动</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2016年红话筒冬令营（魅力海南）活动启动</span></p>', '', '', '', '', '2016-04-23 15:16:31', '', '0', '0', null, '108', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '27', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 15:16:31', '1', '1', '1', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('beec76de-ebd3-4c69-9198-d27102235d60', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'b8b16868-0301-44f1-8bc0-809e29e99fc3', '贺河北-石家庄市红话筒分校成立', '贺河北-石家庄市红话筒分校成立', null, '0', '', '', '贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立', '<p>\r\n	贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立贺河北-石家庄市红话筒分校成立</p>', '', '', '', '', '2016-04-23 12:34:01', '', '1', '0', null, '444', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '3', '0', '1', '管理员', '', '0', '1', '1', '0', null, null, '0', '管理员', '2016-04-23 12:34:01', '0', '0', '0', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('ced46aa2-c682-4478-9117-66a0ede72ce1', 'dea0df0d-4346-44ba-9787-b370cfec224a', '62097e21-e994-4a9e-b237-210f5725e865', '少儿提高系列盘', '少儿提高系列盘', null, '0', '', '', '少儿提高系列盘少儿提高系列盘少儿提高系列盘少儿提高系列盘', '<p>\r\n	少儿提高系列盘少儿提高系列盘少儿提高系列盘少儿提高系列盘</p>', '', '/upload/201604/1461393531052.jpg', '', '', '2016-04-23 14:38:53', '', '1', '0', null, '173', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '18', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 15:03:15', '1', '1', '1', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('d13c1224-5768-404c-946e-d7dd6bf78dcd', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'b8b16868-0301-44f1-8bc0-809e29e99fc3', '贺英国-曼彻斯特市红话筒分校成立', '贺英国-曼彻斯特市红话筒分校成立', null, '0', '', '', '贺英国-曼彻斯特市红话筒分校成立贺英国-曼彻斯特市红话筒分校成立贺英国-曼彻斯特市红话筒分校成立贺英国-曼彻斯特市红话筒分校成立贺英国-曼彻斯特市红话筒分校成立贺英国-曼彻斯特市红话筒分校成立贺英国-曼彻斯特市红话筒分校成立贺英国-曼彻斯特市红话筒分校成立贺英国-曼彻斯特市红话筒分校成立贺英国-曼彻斯特市红话筒分校成立贺英国-曼彻斯特市红话筒分校成立贺英国-曼彻斯特市红话筒分校成立贺英国-曼彻斯特市红话筒分校成立贺英国-曼彻斯特市红话筒分校成立贺英国-曼彻斯特市红话筒分校成立', '<p>\r\n	贺英国-曼彻斯特市红话筒分校成立贺英国-曼彻斯特市红话筒分校成立贺英国-曼彻斯特市红话筒分校成立贺英国-曼彻斯特市红话筒分校成立贺英国-曼彻斯特市红话筒分校成立贺英国-曼彻斯特市红话筒分校成立贺英国-曼彻斯特市红话筒分校成立贺英国-曼彻斯特市红话筒分校成立贺英国-曼彻斯特市红话筒分校成立贺英国-曼彻斯特市红话筒分校成立贺英国-曼彻斯特市红话筒分校成立贺英国-曼彻斯特市红话筒分校成立贺英国-曼彻斯特市红话筒分校成立贺英国-曼彻斯特市红话筒分校成立贺英国-曼彻斯特市红话筒分校成立</p>', '', '', '', '', '2016-04-23 12:36:39', '', '1', '0', null, '256', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '7', '0', '1', '管理员', '', '0', '1', '1', '0', null, null, '0', '管理员', '2016-04-23 12:36:39', '0', '0', '0', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('d676dc94-7bbb-4cbc-9f47-31c2bcc1212b', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'b8b16868-0301-44f1-8bc0-809e29e99fc3', '贺河南-新乡市红话筒分校成立', '贺河南-新乡市红话筒分校成立', null, '0', '', '', '贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立', '<p>\r\n	贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立贺河南-新乡市红话筒分校成立</p>', '', '', '', '', '2016-04-23 12:30:22', '', '1', '0', null, '165', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '1', '0', '1', '管理员', '红话筒,口才', '0', '1', '1', '0', null, null, '0', '管理员', '2016-04-23 12:30:22', '0', '0', '0', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('d894d1e5-f95e-4e78-a06a-1fc7a7bdeab5', 'dea0df0d-4346-44ba-9787-b370cfec224a', '4517633f-7f20-4dc3-9663-741b2062ac3f', '图片新闻4444', '图片新闻4444', null, '0', '', '', '图片新闻4444图片新闻4444图片新闻4444图片新闻4444图片新闻4444', '<p>\r\n	图片新闻4444图片新闻4444图片新闻4444图片新闻4444图片新闻4444</p>', '', '/upload/201604/1461400983608.jpg', 'https://www.baidu.com', '', '2016-04-23 13:41:39', '', '0', '0', null, '364', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '12', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 16:43:06', '0', '0', '0', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('d9f41248-4287-4156-81df-aebf02e71ba7', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'b1214fed-1bba-4bac-b4bb-80fc06c28179', '2015下半年全国语言朗诵考级启动通知', '2015下半年全国语言朗诵考级启动通知', null, '0', '', '', '2015下半年全国语言朗诵考级启动通知2015下半年全国语言朗诵考级启动通知2015下半年全国语言朗诵考级启动通知2015下半年全国语言朗诵考级启动通知2015下半年全国语言朗诵考级启动通知2015下半年全国语言朗诵考级启动通知2015下半年全国语言朗诵考级启动通知2015下半年全国语言朗诵考级启动通知', '<p>\r\n	<span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015下半年全国语言朗诵考级启动通知</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015下半年全国语言朗诵考级启动通知</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015下半年全国语言朗诵考级启动通知</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015下半年全国语言朗诵考级启动通知</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015下半年全国语言朗诵考级启动通知</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015下半年全国语言朗诵考级启动通知</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015下半年全国语言朗诵考级启动通知</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015下半年全国语言朗诵考级启动通知</span></p>', '', '', '', '', '2016-04-23 15:16:45', '', '0', '0', null, '267', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '28', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 15:16:45', '1', '1', '1', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('db2b81bc-ce5e-4513-a024-6e822da4b84f', 'dea0df0d-4346-44ba-9787-b370cfec224a', '62097e21-e994-4a9e-b237-210f5725e865', '动漫口才课堂', '动漫口才课堂', null, '0', '', '', '动漫口才课堂动漫口才课堂动漫口才课堂动漫口才课堂动漫口才课堂动漫口才课堂动漫口才课堂动漫口才课堂动漫口才课堂动漫口才课堂动漫口才课堂动漫口才课堂动漫口才课堂', '<p>\r\n	动漫口才课堂动漫口才课堂动漫口才课堂动漫口才课堂动漫口才课堂动漫口才课堂动漫口才课堂动漫口才课堂动漫口才课堂动漫口才课堂动漫口才课堂动漫口才课堂动漫口才课堂</p>', '', '/upload/201604/1461393630264.jpg', '', '', '2016-04-23 14:40:31', '', '0', '0', null, '450', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '22', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 14:40:31', '1', '1', '1', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('dd6a1062-fbe2-4048-940f-a22a6667e853', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'b1214fed-1bba-4bac-b4bb-80fc06c28179', '2015央视CCTV小主持人大赛红话筒分校晋级决赛名单及节目单', '2015央视CCTV小主持人大赛红话筒分校晋级决赛名单及节目单', null, '0', '', '', '2015央视CCTV小主持人大赛红话筒分校晋级决赛名单及节目单2015央视CCTV小主持人大赛红话筒分校晋级决赛名单及节目单2015央视CCTV小主持人大赛红话筒分校晋级决赛名单及节目单2015央视CCTV小主持人大赛红话筒分校晋级决赛名单及节目单2015央视CCTV小主持人大赛红话筒分校晋级决赛名单及节目单2015央视CCTV小主持人大赛红话筒分校晋级决赛名单及节目单2015央视CCTV小主持人大赛红话筒分校晋级决赛名单及节目单2015央视CCTV小主持人大赛红话筒分校晋级决赛名单及节目单', '<p>\r\n	<span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015央视CCTV小主持人大赛红话筒分校晋级决赛名单及节目单</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015央视CCTV小主持人大赛红话筒分校晋级决赛名单及节目单</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015央视CCTV小主持人大赛红话筒分校晋级决赛名单及节目单</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015央视CCTV小主持人大赛红话筒分校晋级决赛名单及节目单</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015央视CCTV小主持人大赛红话筒分校晋级决赛名单及节目单</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015央视CCTV小主持人大赛红话筒分校晋级决赛名单及节目单</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015央视CCTV小主持人大赛红话筒分校晋级决赛名单及节目单</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015央视CCTV小主持人大赛红话筒分校晋级决赛名单及节目单</span></p>', '', '', '', '', '2016-04-23 15:18:17', '', '0', '0', null, '175', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '34', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 15:18:17', '1', '1', '1', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('e269f593-91c5-4ece-82aa-293e7592c45c', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'b8b16868-0301-44f1-8bc0-809e29e99fc3', '贺山东-济南市红话筒分校成立', '贺山东-济南市红话筒分校成立', null, '0', '', '', '贺山东-济南市红话筒分校成立贺山东-济南市红话筒分校成立贺山东-济南市红话筒分校成立贺山东-济南市红话筒分校成立贺山东-济南市红话筒分校成立贺山东-济南市红话筒分校成立贺山东-济南市红话筒分校成立贺山东-济南市红话筒分校成立贺山东-济南市红话筒分校成立贺山东-济南市红话筒分校成立贺山东-济南市红话筒分校成立贺山东-济南市红话筒分校成立', '<p>\r\n	贺山东-济南市红话筒分校成立贺山东-济南市红话筒分校成立贺山东-济南市红话筒分校成立贺山东-济南市红话筒分校成立贺山东-济南市红话筒分校成立贺山东-济南市红话筒分校成立贺山东-济南市红话筒分校成立贺山东-济南市红话筒分校成立贺山东-济南市红话筒分校成立贺山东-济南市红话筒分校成立贺山东-济南市红话筒分校成立贺山东-济南市红话筒分校成立</p>', '', '', '', '', '2016-04-23 12:35:20', '', '1', '0', null, '296', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '5', '0', '1', '管理员', '', '0', '1', '1', '0', null, null, '0', '管理员', '2016-04-23 12:35:20', '0', '0', '0', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('ea07fcbc-0794-4282-91c2-c771e34b2131', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'b1214fed-1bba-4bac-b4bb-80fc06c28179', '2015 CCTV红话筒全国青少年儿童电视小主持人才艺大赛', '2015 CCTV红话筒全国青少年儿童电视小主持人才艺大赛', null, '0', '', '', '2015 CCTV红话筒全国青少年儿童电视小主持人才艺大赛2015 CCTV红话筒全国青少年儿童电视小主持人才艺大赛2015 CCTV红话筒全国青少年儿童电视小主持人才艺大赛', '<p>\r\n	<span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015 CCTV红话筒全国青少年儿童电视小主持人才艺大赛</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015 CCTV红话筒全国青少年儿童电视小主持人才艺大赛</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015 CCTV红话筒全国青少年儿童电视小主持人才艺大赛</span></p>', '', '', '', '', '2016-04-23 15:18:47', '', '0', '0', null, '138', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '36', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 15:18:47', '1', '1', '1', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('ecb7ba26-e011-42f7-b91b-90b83adb87df', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'b1214fed-1bba-4bac-b4bb-80fc06c28179', '2015暑期全国语言朗诵考级正式启动', '2015暑期全国语言朗诵考级正式启动', null, '0', '', '', '2015暑期全国语言朗诵考级正式启动2015暑期全国语言朗诵考级正式启动2015暑期全国语言朗诵考级正式启动2015暑期全国语言朗诵考级正式启动2015暑期全国语言朗诵考级正式启动2015暑期全国语言朗诵考级正式启动2015暑期全国语言朗诵考级正式启动2015暑期全国语言朗诵考级正式启动', '<p>\r\n	<span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015暑期全国语言朗诵考级正式启动</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015暑期全国语言朗诵考级正式启动</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015暑期全国语言朗诵考级正式启动</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015暑期全国语言朗诵考级正式启动</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015暑期全国语言朗诵考级正式启动</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015暑期全国语言朗诵考级正式启动</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015暑期全国语言朗诵考级正式启动</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015暑期全国语言朗诵考级正式启动</span></p>', '', '', '', '', '2016-04-23 15:18:32', '', '0', '0', null, '124', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '35', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 15:18:32', '1', '1', '1', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('ef1178cb-f3dd-47f6-bce5-606721690648', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'b1214fed-1bba-4bac-b4bb-80fc06c28179', '2015全国红话筒央视CCTV青少年电视儿童大赛圆满落幕！', '2015全国红话筒央视CCTV青少年电视儿童大赛圆满落幕！', null, '0', '', '', '2015全国红话筒央视CCTV青少年电视儿童大赛圆满落幕！2015全国红话筒央视CCTV青少年电视儿童大赛圆满落幕！2015全国红话筒央视CCTV青少年电视儿童大赛圆满落幕！2015全国红话筒央视CCTV青少年电视儿童大赛圆满落幕！2015全国红话筒央视CCTV青少年电视儿童大赛圆满落幕！2015全国红话筒央视CCTV青少年电视儿童大赛圆满落幕！2015全国红话筒央视CCTV青少年电视儿童大赛圆满落幕！2015全国红话筒央视CCTV青少年电视儿童大赛圆满落幕！', '<p>\r\n	<span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015全国红话筒央视CCTV青少年电视儿童大赛圆满落幕！</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015全国红话筒央视CCTV青少年电视儿童大赛圆满落幕！</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015全国红话筒央视CCTV青少年电视儿童大赛圆满落幕！</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015全国红话筒央视CCTV青少年电视儿童大赛圆满落幕！</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015全国红话筒央视CCTV青少年电视儿童大赛圆满落幕！</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015全国红话筒央视CCTV青少年电视儿童大赛圆满落幕！</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015全国红话筒央视CCTV青少年电视儿童大赛圆满落幕！</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">2015全国红话筒央视CCTV青少年电视儿童大赛圆满落幕！</span></p>', '', '', '', '', '2016-04-23 15:18:03', '', '0', '0', null, '306', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '33', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 15:18:03', '1', '1', '1', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('f36c70e1-59eb-4b8d-b54a-0a4fe134d527', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'b8b16868-0301-44f1-8bc0-809e29e99fc3', '贺河南-郑州市红话筒分校成立', '贺河南-郑州市红话筒分校成立', null, '0', '', '', '贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立', '<p>\r\n	贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立贺河南-郑州市红话筒分校成立</p>', '', '', '', '', '2016-04-23 12:33:27', '', '1', '0', null, '362', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '2', '0', '1', '管理员', '', '0', '1', '1', '0', null, null, '0', '管理员', '2016-04-23 12:33:27', '0', '1', '0', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('f42f6242-1240-4a19-af5a-0c928e8fdd24', 'dea0df0d-4346-44ba-9787-b370cfec224a', 'b1214fed-1bba-4bac-b4bb-80fc06c28179', '《2015全国语言教师教学风采大赛》晋级名单', '《2015全国语言教师教学风采大赛》晋级名单', null, '0', '', '', '《2015全国语言教师教学风采大赛》晋级名单《2015全国语言教师教学风采大赛》晋级名单《2015全国语言教师教学风采大赛》晋级名单《2015全国语言教师教学风采大赛》晋级名单', '<p>\r\n	<span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">《2015全国语言教师教学风采大赛》晋级名单</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">《2015全国语言教师教学风采大赛》晋级名单</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">《2015全国语言教师教学风采大赛》晋级名单</span><span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">《2015全国语言教师教学风采大赛》晋级名单</span></p>', '', '', '', '', '2016-04-23 15:19:22', '', '0', '0', null, '140', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '38', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 15:19:22', '1', '1', '1', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('fd88d186-b494-4c84-a507-9f1c9c595615', 'dea0df0d-4346-44ba-9787-b370cfec224a', '62097e21-e994-4a9e-b237-210f5725e865', '少儿强化系列盘', '少儿强化系列盘', null, '0', '', '', '少儿强化系列盘少儿强化系列盘少儿强化系列盘少儿强化系列盘少儿强化系列盘少儿强化系列盘少儿强化系列盘少儿强化系列盘少儿强化系列盘少儿强化系列盘', '<p>\r\n	少儿强化系列盘少儿强化系列盘少儿强化系列盘少儿强化系列盘少儿强化系列盘少儿强化系列盘少儿强化系列盘少儿强化系列盘少儿强化系列盘少儿强化系列盘</p>', '', '/upload/201604/1461393558548.jpg', '', '', '2016-04-23 14:39:20', '', '1', '0', null, '157', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '19', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-04-23 15:03:03', '1', '1', '1', '0', null, null, null, null);
INSERT INTO `freecms_info` VALUES ('fe8564a5-abff-43af-9350-a612be9974fc', 'dea0df0d-4346-44ba-9787-b370cfec224a', '98ad300f-c627-4c96-9d0e-056a8695e1e9', '雪人', '雪人', null, '0', '明天出版社', '（英）布力格 编绘', '少年早上起来，发现窗外已经是雪花飘飘了。他冲出屋去，堆了一个足足比他高出一倍的雪...', '<p>\r\n	<span style=\"color: rgb(102, 102, 102); font-family: Verdana; line-height: 20px;\">让孩子学会自己阅读</span><br style=\"color: rgb(102, 102, 102); font-family: Verdana; line-height: 20px;\" />\r\n	<span style=\"color: rgb(102, 102, 102); font-family: Verdana; line-height: 20px;\">一直以来孩子都是和我一起读书，都是我讲给她听。不管我在做什么，她要看书我便要终止自己的事情。&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Verdana; line-height: 20px;\" />\r\n	<br style=\"color: rgb(102, 102, 102); font-family: Verdana; line-height: 20px;\" />\r\n	<span style=\"color: rgb(102, 102, 102); font-family: Verdana; line-height: 20px;\">?到雪人后，通篇没有一个字，我便随口说了一句：&ldquo;这本书没有字，小朋友可以自己读！&rdquo;女儿便认真的自己翻了一遍，当然她看完后我还是给她讲了。&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Verdana; line-height: 20px;\" />\r\n	<br style=\"color: rgb(102, 102, 102); font-family: Verdana; line-height: 20px;\" />\r\n	<span style=\"color: rgb(102, 102, 102); font-family: Verdana; line-height: 20px;\">但是第二天吃完晚饭后，我突然发现她不见了，一看她自己跑到房间，旁边放了一堆书，手里正在捧着的就是雪人，正在认&hellip;&hellip;</span></p>', '', '/upload/201605/1464252489009.jpg', '', '', '2016-05-26 16:39:56', '', '0', '0', null, '442', '02debc9f-53cd-4bc9-887b-49ffc4e925f2', null, null, '', '2', null, null, null, null, '41', '0', '1', '管理员', '', '0', '1', '1', '1', null, null, '0', '管理员', '2016-05-26 16:48:10', '1', '1', '1', '0', null, '好看的不得了', ' 2-4岁  4-7岁  7-10岁 ', '好饿的毛毛虫');

-- ----------------------------
-- Table structure for `freecms_info_img`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_info_img`;
CREATE TABLE `freecms_info_img` (
  `id` varchar(50) NOT NULL,
  `infoid` varchar(50) DEFAULT NULL,
  `img` varchar(500) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `ordernum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_info_img` (`infoid`),
  CONSTRAINT `FK_info_img` FOREIGN KEY (`infoid`) REFERENCES `freecms_info` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片集';

-- ----------------------------
-- Records of freecms_info_img
-- ----------------------------

-- ----------------------------
-- Table structure for `freecms_info_sign`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_info_sign`;
CREATE TABLE `freecms_info_sign` (
  `id` varchar(50) NOT NULL,
  `userid` varchar(50) DEFAULT NULL,
  `infoid` varchar(50) DEFAULT NULL,
  `signtime` datetime DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_19` (`infoid`),
  KEY `FK_Reference_20` (`userid`),
  CONSTRAINT `FK_Reference_19` FOREIGN KEY (`infoid`) REFERENCES `freecms_info` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Reference_20` FOREIGN KEY (`userid`) REFERENCES `freecms_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户签收表';

-- ----------------------------
-- Records of freecms_info_sign
-- ----------------------------

-- ----------------------------
-- Table structure for `freecms_innerlink`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_innerlink`;
CREATE TABLE `freecms_innerlink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `url` varchar(255) DEFAULT NULL COMMENT '链接',
  `addtime` datetime DEFAULT NULL COMMENT '创建日期',
  `createperson` varchar(255) DEFAULT NULL COMMENT ' 创建人',
  `color` varchar(255) DEFAULT NULL COMMENT '颜色',
  `isbold` varchar(1) DEFAULT NULL COMMENT '是否加粗,1为加粗，0为不加粗',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of freecms_innerlink
-- ----------------------------

-- ----------------------------
-- Table structure for `freecms_job`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_job`;
CREATE TABLE `freecms_job` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `unitname` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `duty` varchar(1000) DEFAULT NULL,
  `jobrequire` varchar(1000) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `siteid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_site_job` (`siteid`),
  CONSTRAINT `FK_site_job` FOREIGN KEY (`siteid`) REFERENCES `freecms_site` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='职位';

-- ----------------------------
-- Records of freecms_job
-- ----------------------------

-- ----------------------------
-- Table structure for `freecms_link`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_link`;
CREATE TABLE `freecms_link` (
  `id` varchar(50) NOT NULL,
  `parid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `isok` varchar(1) DEFAULT NULL,
  `ordernum` int(11) DEFAULT NULL,
  `site` varchar(50) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  `img` varchar(500) DEFAULT NULL,
  `pagemark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_12` (`site`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`site`) REFERENCES `freecms_site` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='链接';

-- ----------------------------
-- Records of freecms_link
-- ----------------------------

-- ----------------------------
-- Table structure for `freecms_mail`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_mail`;
CREATE TABLE `freecms_mail` (
  `id` varchar(50) NOT NULL,
  `unitid` varchar(50) DEFAULT NULL,
  `userid` varchar(50) DEFAULT NULL,
  `mailtype` varchar(50) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `writer` varchar(20) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `isopen` char(1) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `querycode` varchar(20) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `state` char(1) DEFAULT NULL,
  `recontent` varchar(2000) DEFAULT NULL,
  `retime` datetime DEFAULT NULL,
  `proflow` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='互动信件';

-- ----------------------------
-- Records of freecms_mail
-- ----------------------------

-- ----------------------------
-- Table structure for `freecms_member`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_member`;
CREATE TABLE `freecms_member` (
  `id` varchar(50) NOT NULL,
  `grouptype` int(11) DEFAULT NULL,
  `groupid` varchar(50) DEFAULT NULL,
  `loginname` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `mobilephone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `isOk` char(1) DEFAULT NULL,
  `lastLoginTime` datetime DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `intro` varchar(500) DEFAULT NULL,
  `credit` int(11) DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `img` varchar(500) DEFAULT NULL,
  `temp` varchar(255) DEFAULT NULL COMMENT '注册、修改密码时验证邮箱用',
  `memberid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `memberid` (`memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员';

-- ----------------------------
-- Records of freecms_member
-- ----------------------------

-- ----------------------------
-- Table structure for `freecms_memberauth`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_memberauth`;
CREATE TABLE `freecms_memberauth` (
  `id` varchar(50) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `ordernum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员权限';

-- ----------------------------
-- Records of freecms_memberauth
-- ----------------------------

-- ----------------------------
-- Table structure for `freecms_membergroup`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_membergroup`;
CREATE TABLE `freecms_membergroup` (
  `id` varchar(50) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `orderNum` int(11) DEFAULT NULL,
  `beginExperience` int(11) DEFAULT NULL,
  `img` varchar(500) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `maxAttchSize` int(11) DEFAULT NULL,
  `maxFriendNum` int(11) DEFAULT NULL,
  `commentNeedCheck` int(11) DEFAULT NULL,
  `commentNeedCaptcha` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员组';

-- ----------------------------
-- Records of freecms_membergroup
-- ----------------------------

-- ----------------------------
-- Table structure for `freecms_membergroup_auth`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_membergroup_auth`;
CREATE TABLE `freecms_membergroup_auth` (
  `id` varchar(50) NOT NULL,
  `groupid` varchar(50) DEFAULT NULL,
  `authid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_23` (`authid`),
  KEY `FK_Reference_24` (`groupid`),
  CONSTRAINT `FK_Reference_23` FOREIGN KEY (`authid`) REFERENCES `freecms_memberauth` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Reference_24` FOREIGN KEY (`groupid`) REFERENCES `freecms_membergroup` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员组权限';

-- ----------------------------
-- Records of freecms_membergroup_auth
-- ----------------------------

-- ----------------------------
-- Table structure for `freecms_msg`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_msg`;
CREATE TABLE `freecms_msg` (
  `id` varchar(50) NOT NULL,
  `memberid` varchar(50) DEFAULT NULL,
  `membername` varchar(50) DEFAULT NULL,
  `tomemberid` varchar(50) DEFAULT NULL,
  `tomembername` varchar(50) DEFAULT NULL,
  `userid` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `touserid` varchar(50) DEFAULT NULL,
  `tousername` varchar(50) DEFAULT NULL,
  `issys` varchar(1) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `isread` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站内信';

-- ----------------------------
-- Records of freecms_msg
-- ----------------------------

-- ----------------------------
-- Table structure for `freecms_operbutton`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_operbutton`;
CREATE TABLE `freecms_operbutton` (
  `id` varchar(36) NOT NULL DEFAULT 'newid()',
  `func` varchar(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(1000) NOT NULL,
  `isOk` char(1) NOT NULL,
  `orderNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_操作按钮_功能` (`func`),
  CONSTRAINT `FK_操作按钮_功能` FOREIGN KEY (`func`) REFERENCES `freecms_func` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作按钮';

-- ----------------------------
-- Records of freecms_operbutton
-- ----------------------------
INSERT INTO `freecms_operbutton` VALUES ('01587af4-0fd3-41e3-9dcb-8deab4ee35cf', '95088cf5-299d-495a-896e-b3eae1a404c0', '编 辑', 'edit()', '1', '2');
INSERT INTO `freecms_operbutton` VALUES ('02b90aa0-c2e0-4a63-bbe5-04838bd2d847', '5257f8fd-9da2-4e83-8538-b6ffca22e45a', '编 辑', 'edit()', '1', '1');
INSERT INTO `freecms_operbutton` VALUES ('031926ef-2738-40d6-9ef9-880199099955', 'df4647eb-8758-451c-bdcd-54c2d180c474', '启 用', 'isok(\'1\')', '1', '3');
INSERT INTO `freecms_operbutton` VALUES ('05393847-a0d1-407d-97f5-8f8a4225e863', 'e01bb9aa-b122-41ac-b28c-e97993c2d250', '转 交', 'forward()', '1', '1');
INSERT INTO `freecms_operbutton` VALUES ('0b547a0a-c5b9-4186-920e-507d0e4268d4', '425d0211-0196-4456-a24b-3e8d614dec8b', '编 辑', 'edit()', '1', '1');
INSERT INTO `freecms_operbutton` VALUES ('0d262669-48eb-4951-84cc-356765b771d4', 'df4647eb-8758-451c-bdcd-54c2d180c474', '禁 用', 'isok(\'0\')', '1', '4');
INSERT INTO `freecms_operbutton` VALUES ('0db25404-44ac-429b-8ab7-66bd1bbc176a', '5f3a8e01-4216-4982-b07b-ad367fe9ef96', '生成所选栏目页', 'createChannel()', '1', '1');
INSERT INTO `freecms_operbutton` VALUES ('0e54a469-aa95-479b-9e82-20313dd4d1e6', '6ad6b178-d6af-4fc6-9962-2b1ea49e0f2f', '转 交', 'forward()', '1', '1');
INSERT INTO `freecms_operbutton` VALUES ('10aa08c7-6754-487b-9c4e-6d9b9776b0eb', 'd301815a-1583-4eb9-b1a2-44f1b819cc9d', '添 加', 'add()', '1', '1');
INSERT INTO `freecms_operbutton` VALUES ('10e8612b-af7b-437d-b8da-1c1a550bdce5', '58fe298f-b448-40bb-a1c0-d81134efa4af', '生成信息页面', 'createHtml()', '1', null);
INSERT INTO `freecms_operbutton` VALUES ('137705c8-8e68-410c-a61d-d13e0c01af6b', '4331df96-2b8d-4dcf-9bdb-1015dfd0a759', '添 加', 'add()', '1', '1');
INSERT INTO `freecms_operbutton` VALUES ('15a50d4c-4866-4533-93a8-a19887d230d1', '6c561fe7-2013-4ce5-bf9a-42874b07a99e', '保 存', 'save()', '1', null);
INSERT INTO `freecms_operbutton` VALUES ('161b2215-d862-433c-aff2-3d99bc9236e0', '19eebfb0-16b5-40eb-a909-1bd37ef7d745', '编辑', 'edit()', '1', null);
INSERT INTO `freecms_operbutton` VALUES ('17a4ab4a-3c1c-4a8e-b7f7-d41c3e49a00b', 'f0709c68-3af5-413b-8503-0f0bc2a3eb74', '转 交', 'forward()', '1', '1');
INSERT INTO `freecms_operbutton` VALUES ('1a5ec49d-571b-4e42-a9da-2863c4704e94', '66ecf6f7-1911-4e7e-8089-3a01f44a6d12', '保存', 'save()', '1', null);
INSERT INTO `freecms_operbutton` VALUES ('200d95de-bebc-4b99-bf42-19af32a4038f', '6bf700a4-2526-4603-9187-addc3f066750', '添 加', 'add()', '1', '1');
INSERT INTO `freecms_operbutton` VALUES ('21ca6c9c-c5dc-47ab-9d74-dfd6fca9e2c3', '67025758-eb65-40b1-a59c-edee1b3ae938', '删 除', 'del()', '1', '3');
INSERT INTO `freecms_operbutton` VALUES ('22c02db3-24e3-46bc-8dcc-f7248207c3ad', '0af2a5d9-26e6-4b82-a07c-062a35b3a7e5', '编 辑', 'edit()', '1', '2');
INSERT INTO `freecms_operbutton` VALUES ('22c09714-f443-456b-8ad3-992d1f02d9dc', '19eebfb0-16b5-40eb-a909-1bd37ef7d745', '改变所属站点', 'parButton()', '1', null);
INSERT INTO `freecms_operbutton` VALUES ('22f81995-0028-4b6b-8c9f-82a97fe447d8', '11061807-38b9-4d3a-bf30-71903949adde', '删 除', 'del()', '1', '2');
INSERT INTO `freecms_operbutton` VALUES ('23848355-b8ac-4566-9290-d307972cb17d', 'ca420ae9-b139-480a-a53a-8021d4b0031b', '删 除', 'del()', '1', '2');
INSERT INTO `freecms_operbutton` VALUES ('238aa44d-d862-44f3-969d-d2abba6225ff', 'df4647eb-8758-451c-bdcd-54c2d180c474', '编 辑', 'edit()', '1', '2');
INSERT INTO `freecms_operbutton` VALUES ('23f5c41a-1a84-4703-ae4b-868768370db7', 'e5bf691a-ea9f-4970-bf35-cb4017665073', '添 加', 'add()', '1', '1');
INSERT INTO `freecms_operbutton` VALUES ('275224d4-00d0-43e8-a9e8-379fd24429c9', '2403873a-48fb-48ac-acd0-af4098df1a0a', '保存', 'WebForm_OnSubmit()', '1', null);
INSERT INTO `freecms_operbutton` VALUES ('2aca3b79-6f94-473a-bfa8-420d92f9586b', '66ecf6f7-1911-4e7e-8089-3a01f44a6d12', '删除', 'del()', '1', null);
INSERT INTO `freecms_operbutton` VALUES ('2b9262d4-5b64-42c5-b951-78190143c8e2', 'df4647eb-8758-451c-bdcd-54c2d180c474', '删 除', 'del()', '1', '5');
INSERT INTO `freecms_operbutton` VALUES ('2db278fd-422f-44df-9072-2dca297c1b47', '4331df96-2b8d-4dcf-9bdb-1015dfd0a759', '编 辑', 'edit()', '1', '2');
INSERT INTO `freecms_operbutton` VALUES ('307bca7a-ec7f-4bb3-8c8c-b8a072390494', '67025758-eb65-40b1-a59c-edee1b3ae938', '编 辑', 'edit()', '1', '2');
INSERT INTO `freecms_operbutton` VALUES ('310108b1-a5dc-434d-b5de-d5f0064c004a', 'ea3034c4-5a98-4a8a-a175-7c43e42aa939', '保 存', 'save()', '1', null);
INSERT INTO `freecms_operbutton` VALUES ('3221edae-8f1e-4101-8ebe-5742dcc0edc1', '18974989-cd85-48b2-8169-348bc3481ef8', '添 加', 'add()', '1', '1');
INSERT INTO `freecms_operbutton` VALUES ('343fcda6-05e1-43c0-9f7c-613ce8b0ba8c', 'e5bf691a-ea9f-4970-bf35-cb4017665073', '编 辑', 'edit()', '1', '2');
INSERT INTO `freecms_operbutton` VALUES ('3561a44f-a0c9-491e-9300-9ffe59c3fca7', '5257f8fd-9da2-4e83-8538-b6ffca22e45a', '文件管理', 'fileManage()', '1', '3');
INSERT INTO `freecms_operbutton` VALUES ('3af3a17a-4267-43d0-ad08-8391a82a698e', '2b89c1fd-9e85-40d0-9ad8-9d401526d8fe', '设置选项', 'answer()', '1', '3');
INSERT INTO `freecms_operbutton` VALUES ('3c06e1ec-717d-4c2a-8340-47bbd2b3ff4f', '3dc03dc5-56ba-46d9-b8ab-78d19c04cd86', '授 权', 'auth()', '1', '0');
INSERT INTO `freecms_operbutton` VALUES ('3f167129-3d4d-4c92-8a91-5d1d5ed799d1', '14a4e894-1a48-4145-b467-0fe0499e8758', '删 除', 'del()', '1', '4');
INSERT INTO `freecms_operbutton` VALUES ('4090990b-9e87-4a0b-b2fa-9354d9c3a46a', '12187d67-5ab9-4ae4-bbee-9a772cebd0de', '编 辑', 'edit()', '1', '0');
INSERT INTO `freecms_operbutton` VALUES ('427b987d-b3c2-4e17-bb09-f4a6faf248bb', '5a47681c-63c3-47b1-8e1f-34d4dbba7d85', '添 加', 'add()', '1', '1');
INSERT INTO `freecms_operbutton` VALUES ('44e33169-b7b9-4995-a8f1-291b69286bcf', '5a47681c-63c3-47b1-8e1f-34d4dbba7d85', '删 除', 'del()', '1', '3');
INSERT INTO `freecms_operbutton` VALUES ('464b41df-f81e-4e54-b28d-436e9092eda2', '4331df96-2b8d-4dcf-9bdb-1015dfd0a759', '删 除', 'del()', '1', '3');
INSERT INTO `freecms_operbutton` VALUES ('4b40d194-3604-4656-b0f6-6e4e546cada4', '55480f1c-d96f-4b53-b596-fc930f488692', '办 理', 'pro()', '1', '2');
INSERT INTO `freecms_operbutton` VALUES ('4de14364-517b-4c41-a60f-318ec98296a0', '6f32a2b6-a552-4a91-a10c-2962af63eca7', '保存', 'WebForm_OnSubmit()', '1', '0');
INSERT INTO `freecms_operbutton` VALUES ('4de80a44-dc1a-4ead-a25c-9c2ff07902a3', '425d0211-0196-4456-a24b-3e8d614dec8b', '复 制', 'copy()', '1', '2');
INSERT INTO `freecms_operbutton` VALUES ('4e86fdcb-4240-4bd7-96f7-1921671bf650', '19eebfb0-16b5-40eb-a909-1bd37ef7d745', '添加下级站点', 'addSon()', '1', null);
INSERT INTO `freecms_operbutton` VALUES ('4ec7e50a-a272-4a12-8f69-a36366595397', '0bec6b84-19be-4d99-bc44-ca1d8472148f', '编 辑', 'edit()', '1', '2');
INSERT INTO `freecms_operbutton` VALUES ('52fb7676-6ff5-41e7-bb7a-bff8c177f30f', '969d27f9-71f8-4cb8-a1bd-6343fe32bbb1', '审 核', 'state()', '1', '1');
INSERT INTO `freecms_operbutton` VALUES ('56227812-981f-488f-90b1-92eded41aa54', '5f3a8e01-4216-4982-b07b-ad367fe9ef96', '生成此站点所有栏目页', 'createAll()', '1', '2');
INSERT INTO `freecms_operbutton` VALUES ('562dd385-6990-4d80-a4ee-6937ab5580c6', '95088cf5-299d-495a-896e-b3eae1a404c0', '添 加', 'add()', '1', '1');
INSERT INTO `freecms_operbutton` VALUES ('597ad917-2681-444e-b92b-b5971c94aca2', '12187d67-5ab9-4ae4-bbee-9a772cebd0de', '删 除', 'del()', '1', '5');
INSERT INTO `freecms_operbutton` VALUES ('59a6b3e9-eafc-47cc-825c-eda5ef46a816', '12187d67-5ab9-4ae4-bbee-9a772cebd0de', '重置密码', 'resetPwd()', '1', '4');
INSERT INTO `freecms_operbutton` VALUES ('5a0b8732-af98-4270-acee-b5456898ff46', '66ecf6f7-1911-4e7e-8089-3a01f44a6d12', '添加下级单位', 'addSon()', '1', null);
INSERT INTO `freecms_operbutton` VALUES ('5de475b4-6585-498b-93d7-9cd5f8d14f98', '14a4e894-1a48-4145-b467-0fe0499e8758', '编 辑', 'edit()', '1', '2');
INSERT INTO `freecms_operbutton` VALUES ('5e180d27-33ff-4dde-92ec-ee732447e114', 'e01bb9aa-b122-41ac-b28c-e97993c2d250', '办 理', 'pro()', '1', '2');
INSERT INTO `freecms_operbutton` VALUES ('631db6b8-9fa7-4ce3-8198-55831d31d5db', '6bf700a4-2526-4603-9187-addc3f066750', '删 除', 'del()', '1', '3');
INSERT INTO `freecms_operbutton` VALUES ('67982f56-1b92-4e04-ae78-128a8853edb8', '425d0211-0196-4456-a24b-3e8d614dec8b', '添 加', 'add()', '1', '0');
INSERT INTO `freecms_operbutton` VALUES ('68658618-7538-4175-bb05-880a8af9f6ae', '74007605-cdce-4313-b874-8a26a2e8df7a', '删 除', 'del()', '1', '3');
INSERT INTO `freecms_operbutton` VALUES ('6866fac3-70dd-4895-b4bb-ea9a50c465dd', '66ecf6f7-1911-4e7e-8089-3a01f44a6d12', '改变所属单位', 'parButton()', '1', null);
INSERT INTO `freecms_operbutton` VALUES ('6af7c942-1f89-4517-a648-1dd8fa0f5656', 'ca420ae9-b139-480a-a53a-8021d4b0031b', '回 复', 'pro()', '1', '1');
INSERT INTO `freecms_operbutton` VALUES ('6d5da20f-6885-41a2-a2c4-b46e907af07c', 'dee27e76-ad55-45ff-b007-4f8a31db8621', '提取到栏目', 'extract()', '1', null);
INSERT INTO `freecms_operbutton` VALUES ('6e1fa81d-8a23-4a29-8ced-095d79e914b2', '2b89c1fd-9e85-40d0-9ad8-9d401526d8fe', '删 除', 'del()', '1', '4');
INSERT INTO `freecms_operbutton` VALUES ('6f6ebd83-cace-4cb9-9b64-4fdbe60741ee', '8afb6f01-ae46-447c-acfa-1a6e0964bbba', '编 辑', 'edit()', '1', '0');
INSERT INTO `freecms_operbutton` VALUES ('70206d34-e4da-47ae-afd9-eb9985dba306', '2b89c1fd-9e85-40d0-9ad8-9d401526d8fe', '编 辑', 'edit()', '1', '2');
INSERT INTO `freecms_operbutton` VALUES ('754fd2a6-6094-4334-b457-e0107a0506bf', '5257f8fd-9da2-4e83-8538-b6ffca22e45a', '删 除', 'del()', '1', '2');
INSERT INTO `freecms_operbutton` VALUES ('7559ecc5-427a-4e05-84b6-4b234aba2f2b', '11061807-38b9-4d3a-bf30-71903949adde', '发 送', 'send()', '1', '1');
INSERT INTO `freecms_operbutton` VALUES ('768963aa-aa71-444a-a013-a06a31fcad2c', '88749e6a-a8ec-47ef-aa4a-f7912d0ed12c', '添 加', 'add()', '1', '1');
INSERT INTO `freecms_operbutton` VALUES ('77b23596-654b-4a54-993e-8e678e51cf74', '66ecf6f7-1911-4e7e-8089-3a01f44a6d12', '添加一级单位', 'addOne()', '1', null);
INSERT INTO `freecms_operbutton` VALUES ('77e74e50-ed23-43a4-8afa-029aef42f065', '0bec6b84-19be-4d99-bc44-ca1d8472148f', '添 加', 'add()', '1', '1');
INSERT INTO `freecms_operbutton` VALUES ('7882b7f4-cb5b-4a18-b1f6-037cbf815661', '5257f8fd-9da2-4e83-8538-b6ffca22e45a', '添 加', 'add()', '1', '0');
INSERT INTO `freecms_operbutton` VALUES ('791f635b-6f69-43d7-9e2f-4a710daf3210', 'f0709c68-3af5-413b-8503-0f0bc2a3eb74', '办 理', 'pro()', '1', '2');
INSERT INTO `freecms_operbutton` VALUES ('7d203eda-94be-4d56-8171-97d0b2ec28d0', 'df4647eb-8758-451c-bdcd-54c2d180c474', '添 加', 'add()', '1', '1');
INSERT INTO `freecms_operbutton` VALUES ('7efb9cec-f40b-4978-ad33-8f2ca3d34f12', '55480f1c-d96f-4b53-b596-fc930f488692', '删 除', 'del()', '1', '3');
INSERT INTO `freecms_operbutton` VALUES ('80f3c1df-4df6-4c4c-8fd8-20a415536a2a', '6c561fe7-2013-4ce5-bf9a-42874b07a99e', '预览站点', 'preview()', '1', null);
INSERT INTO `freecms_operbutton` VALUES ('8300b3ed-59f9-424f-94b6-ef4cf142d2a0', '5257f8fd-9da2-4e83-8538-b6ffca22e45a', '导 出', 'exportZip()', '1', '5');
INSERT INTO `freecms_operbutton` VALUES ('856c6095-52d8-470e-b425-5c9d98472aa5', '425d0211-0196-4456-a24b-3e8d614dec8b', '静态化', 'html()', '1', '5');
INSERT INTO `freecms_operbutton` VALUES ('85ca4973-0e3c-4a14-be16-290850aa760c', '0bec6b84-19be-4d99-bc44-ca1d8472148f', '删 除', 'del()', '1', '3');
INSERT INTO `freecms_operbutton` VALUES ('8ce8c4c5-da00-49c6-9575-54851695f3ad', '14a4e894-1a48-4145-b467-0fe0499e8758', '添 加', 'add()', '1', '1');
INSERT INTO `freecms_operbutton` VALUES ('95872bc9-b7a3-43d7-b72c-8e20e5d43874', '19eebfb0-16b5-40eb-a909-1bd37ef7d745', '添加一级站点', 'addOne()', '1', null);
INSERT INTO `freecms_operbutton` VALUES ('95c7f91f-eaff-4ceb-b88c-baf1bcb5ea39', '003c47c5-7041-4cfa-8631-82c00ab3fb35', '保存', 'save()', '1', '0');
INSERT INTO `freecms_operbutton` VALUES ('9a533db1-728f-45ce-882f-a75b5a5d9332', '8afb6f01-ae46-447c-acfa-1a6e0964bbba', '站点授权', 'siteAuth()', '1', '2');
INSERT INTO `freecms_operbutton` VALUES ('9b06c3d6-0198-4b6e-a2bb-44397fbdd9dd', '742470cc-eaf1-48c4-805c-44c9936a7622', '删 除', 'del()', '1', '3');
INSERT INTO `freecms_operbutton` VALUES ('9d156512-b615-4a26-a544-494db17d7edd', '74007605-cdce-4313-b874-8a26a2e8df7a', '编 辑', 'edit()', '1', '2');
INSERT INTO `freecms_operbutton` VALUES ('9d780208-d3d6-4dd9-99d5-4dfbc5870128', '88749e6a-a8ec-47ef-aa4a-f7912d0ed12c', '编 辑', 'edit()', '1', '2');
INSERT INTO `freecms_operbutton` VALUES ('9efc12ca-5991-43fd-ab74-435eb38fcfe6', '95088cf5-299d-495a-896e-b3eae1a404c0', '删 除', 'del()', '1', '3');
INSERT INTO `freecms_operbutton` VALUES ('a1503362-5cc4-46a0-bfe2-a57e9c1479e4', '3dc03dc5-56ba-46d9-b8ab-78d19c04cd86', '编 辑', 'edit()', '1', '0');
INSERT INTO `freecms_operbutton` VALUES ('adef49b9-1e4f-410b-bc35-e9611a255356', '12187d67-5ab9-4ae4-bbee-9a772cebd0de', '授 权', 'auth()', '1', '1');
INSERT INTO `freecms_operbutton` VALUES ('af01be01-45a6-4bf0-aafb-3415a86e5379', '742470cc-eaf1-48c4-805c-44c9936a7622', '转 交', 'forward()', '1', '1');
INSERT INTO `freecms_operbutton` VALUES ('b3627085-294d-4e71-ba74-6a98e6525530', '003c47c5-7041-4cfa-8631-82c00ab3fb35', '管理操作按钮', 'operButton()', '1', '0');
INSERT INTO `freecms_operbutton` VALUES ('b63b98f9-b572-41e0-a91e-c2bd0157e1da', 'd301815a-1583-4eb9-b1a2-44f1b819cc9d', '删 除', 'del()', '1', '3');
INSERT INTO `freecms_operbutton` VALUES ('bae98298-d8c8-412f-bd0a-ce69225c2f96', 'e01bb9aa-b122-41ac-b28c-e97993c2d250', '删 除', 'del()', '1', '3');
INSERT INTO `freecms_operbutton` VALUES ('beb25f53-7325-49b9-ab95-8abeff63448c', '19eebfb0-16b5-40eb-a909-1bd37ef7d745', '删除', 'del()', '1', null);
INSERT INTO `freecms_operbutton` VALUES ('c1284d0d-5a79-4994-a1fa-13a7b50058ed', '74007605-cdce-4313-b874-8a26a2e8df7a', '添 加', 'add()', '1', '1');
INSERT INTO `freecms_operbutton` VALUES ('c3ce9418-9dcc-4578-90b2-3f6ab08f61a7', '18974989-cd85-48b2-8169-348bc3481ef8', '删 除', 'del()', '1', '3');
INSERT INTO `freecms_operbutton` VALUES ('c3f6186b-ef24-4a51-ab83-b7162d468125', '2b89c1fd-9e85-40d0-9ad8-9d401526d8fe', '添 加', 'add()', '1', '1');
INSERT INTO `freecms_operbutton` VALUES ('c6317410-cd09-4fee-abf1-e92146e6f665', '6ad6b178-d6af-4fc6-9962-2b1ea49e0f2f', '删 除', 'del()', '1', '3');
INSERT INTO `freecms_operbutton` VALUES ('c870fb65-cb88-49c6-b555-d2245eca76ea', '425d0211-0196-4456-a24b-3e8d614dec8b', '移 动', 'move()', '1', '3');
INSERT INTO `freecms_operbutton` VALUES ('ca0d70ff-0509-4d9b-b224-f0428934825b', '003c47c5-7041-4cfa-8631-82c00ab3fb35', '删除', 'del()', '1', '0');
INSERT INTO `freecms_operbutton` VALUES ('ca2e6805-c891-4876-abfe-5addf4e8a504', '6bf700a4-2526-4603-9187-addc3f066750', '编 辑', 'edit()', '1', '2');
INSERT INTO `freecms_operbutton` VALUES ('ca743b1d-c7d8-4c4a-849d-1da8a5f63d66', '5257f8fd-9da2-4e83-8538-b6ffca22e45a', '初始化数据', 'data()', '1', '4');
INSERT INTO `freecms_operbutton` VALUES ('cb52abdd-9a80-46d0-9115-f4c7cdf0c8f4', '88749e6a-a8ec-47ef-aa4a-f7912d0ed12c', '删 除', 'del()', '1', '3');
INSERT INTO `freecms_operbutton` VALUES ('cdcd83fe-3cc2-4bbb-bb7e-e279c1780a77', '14a4e894-1a48-4145-b467-0fe0499e8758', '授 权', 'auth()', '1', '3');
INSERT INTO `freecms_operbutton` VALUES ('cec4e057-a4e3-4126-9a3c-8bc2e4c5b0b4', '55480f1c-d96f-4b53-b596-fc930f488692', '转 交', 'forward()', '1', '1');
INSERT INTO `freecms_operbutton` VALUES ('cef54353-09d1-4ff6-bedd-370ab799913c', '18974989-cd85-48b2-8169-348bc3481ef8', '编 辑', 'edit()', '1', '2');
INSERT INTO `freecms_operbutton` VALUES ('d46540d4-03fb-4de8-a502-3cbe9e72e9bd', '67025758-eb65-40b1-a59c-edee1b3ae938', '添 加', 'add()', '1', '1');
INSERT INTO `freecms_operbutton` VALUES ('d6001817-3246-4d7b-a86e-49d771fdb082', '12187d67-5ab9-4ae4-bbee-9a772cebd0de', '禁 用', 'state(\'0\')', '1', '3');
INSERT INTO `freecms_operbutton` VALUES ('d6d1f29e-99a2-4621-b89c-b6f8ad2a4d52', '425d0211-0196-4456-a24b-3e8d614dec8b', '删 除', 'del()', '1', '4');
INSERT INTO `freecms_operbutton` VALUES ('db1df28e-ddf2-45b6-9a8c-c0f76d50a4ac', '003c47c5-7041-4cfa-8631-82c00ab3fb35', '添加一级菜单', 'addOne()', '1', '0');
INSERT INTO `freecms_operbutton` VALUES ('db28584c-7dfa-4ce2-9c37-fb6f69259938', '6ad6b178-d6af-4fc6-9962-2b1ea49e0f2f', '办 理', 'pro()', '1', '2');
INSERT INTO `freecms_operbutton` VALUES ('dd6018a7-1757-44e6-823d-b782c6cf94e3', '969d27f9-71f8-4cb8-a1bd-6343fe32bbb1', '删 除', 'del()', '1', '2');
INSERT INTO `freecms_operbutton` VALUES ('dfc3a95f-db39-42b8-91b9-2682aa32c0ea', '742470cc-eaf1-48c4-805c-44c9936a7622', '办 理', 'pro()', '1', '2');
INSERT INTO `freecms_operbutton` VALUES ('e234bf55-ecff-4689-b90e-f8f9f58f1c9f', '0af2a5d9-26e6-4b82-a07c-062a35b3a7e5', '删 除', 'del()', '1', '3');
INSERT INTO `freecms_operbutton` VALUES ('e6636e5a-f71f-433e-9e42-7dd3d8babb31', 'f0709c68-3af5-413b-8503-0f0bc2a3eb74', '删 除', 'del()', '1', '3');
INSERT INTO `freecms_operbutton` VALUES ('e919a9bf-2a08-4c66-9924-c7207fe04bae', '12187d67-5ab9-4ae4-bbee-9a772cebd0de', '启 用', 'state(\'1\')', '1', '2');
INSERT INTO `freecms_operbutton` VALUES ('eacaebb2-b019-4d18-9bc4-611e8f7587d2', 'e5bf691a-ea9f-4970-bf35-cb4017665073', '删 除', 'del()', '1', '3');
INSERT INTO `freecms_operbutton` VALUES ('eda69cc3-77c0-4ba4-8dfd-57da1bc5ce97', '8afb6f01-ae46-447c-acfa-1a6e0964bbba', '授 权', 'auth()', '1', '1');
INSERT INTO `freecms_operbutton` VALUES ('ef5efceb-6486-4b7b-a726-0532574dff0c', '26174cf0-2e8a-4526-8382-16e28d28a73c', '删 除', 'del()', '1', '2');
INSERT INTO `freecms_operbutton` VALUES ('f0966fd2-e63f-44a4-ae75-7e006592e33a', '5a47681c-63c3-47b1-8e1f-34d4dbba7d85', '编 辑', 'edit()', '1', '2');
INSERT INTO `freecms_operbutton` VALUES ('f802308a-b962-4835-937e-3f46caa88c18', '003c47c5-7041-4cfa-8631-82c00ab3fb35', '改变所属菜单', 'parButton()', '1', '0');
INSERT INTO `freecms_operbutton` VALUES ('f93e7a6a-3365-4166-aaf1-65e4d9c5f9e5', '8afb6f01-ae46-447c-acfa-1a6e0964bbba', '删 除', 'del()', '1', '6');
INSERT INTO `freecms_operbutton` VALUES ('f9df095f-5d08-426a-adde-442db13672eb', '3dc03dc5-56ba-46d9-b8ab-78d19c04cd86', '删 除', 'del()', '1', '0');
INSERT INTO `freecms_operbutton` VALUES ('fce4ef98-4066-44dc-bc7b-4bda0d2d81a7', '26174cf0-2e8a-4526-8382-16e28d28a73c', '回 复', 'pro()', '1', '1');
INSERT INTO `freecms_operbutton` VALUES ('fcff283e-2dcc-4735-afb7-ee0375d32a9d', '0af2a5d9-26e6-4b82-a07c-062a35b3a7e5', '添 加', 'add()', '1', '1');
INSERT INTO `freecms_operbutton` VALUES ('fe7040da-d2c6-4069-af3d-c9cbbcdf18db', 'd301815a-1583-4eb9-b1a2-44f1b819cc9d', '编 辑', 'edit()', '1', '2');
INSERT INTO `freecms_operbutton` VALUES ('fe923f0e-62ac-4a00-ba51-6a27f37ddc60', '003c47c5-7041-4cfa-8631-82c00ab3fb35', '添加下级菜单', 'addSon()', '1', '0');

-- ----------------------------
-- Table structure for `freecms_operlogs`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_operlogs`;
CREATE TABLE `freecms_operlogs` (
  `id` varchar(36) NOT NULL DEFAULT 'newid()',
  `loginName` varchar(100) NOT NULL,
  `operTime` datetime NOT NULL,
  `content` varchar(5000) NOT NULL,
  `ip` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志';

-- ----------------------------
-- Records of freecms_operlogs
-- ----------------------------
INSERT INTO `freecms_operlogs` VALUES ('006bfdea-b82b-46e3-ba50-70927d59fd9a', 'admin', '2016-04-23 15:17:16', '添加信息(欢动五洲•梦想起航 暨《2016猴年红话筒少儿春晚大型新春盛典》)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('0084cee6-cd2f-4a8b-807d-99032d58945e', 'admin', '2016-04-23 14:43:57', '信息页静态化:少儿口才与主持精华版', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('0190ba0e-5610-4cbf-ac5f-8bb227ffeeb6', 'admin', '2016-04-23 10:20:52', '添加栏目 央视大赛', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('03501ad5-035b-4ccc-bbcc-2043aa3bb0f4', 'admin', '2016-04-23 14:21:16', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('042eebe5-dbdd-480b-bb06-f0bdc5bbfacb', 'admin', '2016-04-23 12:36:39', '添加信息(贺英国-曼彻斯特市红话筒分校成立)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('0477ef37-0226-4991-8691-ca1ac6bce415', 'admin', '2016-04-23 17:36:44', '栏目静态化:新闻中心 第7页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('04e64a7f-03e0-4d1c-83a4-1e0c3adf155e', 'admin', '2016-05-26 16:40:12', '栏目静态化:罗宾逊绘本 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('05bda04a-033d-4a51-a997-4bd4152042e5', 'admin', '2016-03-26 15:38:02', '密码更新成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('0757b958-748b-430c-8103-f45f71cd37f3', 'admin', '2016-04-23 12:43:52', '信息页静态化:贺山东-济南市红话筒分校成立', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('0782e166-792a-4c6b-b840-ee94bab12d84', 'admin', '2016-04-23 10:23:13', '更新栏目 罗宾逊绘本', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('0856174f-8f95-405f-9f1d-ac8664b636ce', 'admin', '2016-05-26 16:40:12', '栏目静态化:优秀盟校 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('0917eb0e-9323-40a0-ab40-b23c612a9f78', 'admin', '2016-04-23 17:36:43', '栏目静态化:新闻中心 第3页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('093429eb-0338-47ae-922c-0db0b0357237', 'admin', '2016-04-23 17:36:44', '栏目静态化:新闻中心 第5页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('0a5515e7-c3d7-4d0f-9a5c-1ed61fc7544e', 'admin', '2016-04-23 12:33:27', '信息页静态化:贺河南-郑州市红话筒分校成立', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('0ac5aeb8-e79d-428f-beab-c6f24037c265', 'admin', '2016-05-02 17:44:34', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('0b1fe398-e616-4f78-bcb9-b5c8b0bfb2a2', 'admin', '2016-04-23 14:45:52', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('0b33b769-b79f-4ec9-ab80-033179eb089e', 'admin', '2016-05-26 16:08:14', '登录系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('0bc672ab-09ea-497b-963c-764da3d072dd', 'admin', '2016-05-26 16:41:35', '信息页静态化:雪人', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('0c61c45a-bad3-49e3-a7bd-9795d19c4e56', 'admin', '2016-04-23 14:34:39', '添加信息(幼儿口才与主持基础版)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('0cef8594-1022-4451-bd6e-8db168be9892', 'admin', '2016-04-23 13:30:03', '添加信息(图片新闻1111)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('0cff8a4e-c5e6-4334-b619-4fe54fac71df', 'admin', '2016-04-23 14:43:57', '信息页静态化:少儿提高系列盘', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('0e5f8494-403b-4f28-872c-ce1962a975e9', 'admin', '2016-05-26 16:39:57', '信息页静态化:雪人', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('0f3becf9-bf34-4e36-b853-0d93bf00c504', 'admin', '2016-04-23 12:38:13', '信息页静态化:贺日本-东京市红话筒分校成立', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('0fb9ad83-eb36-4b1b-9f3c-6748dc361c11', 'admin', '2016-05-26 16:51:40', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('0fbeaabd-4004-4bf5-9eb7-79c511aa6fee', 'admin', '2016-04-23 15:20:37', '信息页静态化:2015暑期全国语言朗诵考级正式启动', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('10a7d073-8068-48fb-905b-6c730babc80b', 'admin', '2016-04-23 10:20:12', '添加栏目 舞蹈', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('10ce577e-cf86-44fc-b1f7-1f190089ed3c', 'admin', '2016-04-23 15:18:47', '添加信息(2015 CCTV红话筒全国青少年儿童电视小主持人才艺大赛)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('11c1720d-a7f9-4509-a06e-68186dc5d0b7', 'admin', '2016-05-02 17:32:15', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('12062af7-b74e-40e4-81a8-014ed42b7229', 'admin', '2016-04-23 17:36:43', '栏目静态化:新闻中心 第4页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('12fb148b-6e0a-4df8-bb0d-7309aa89c979', 'admin', '2016-05-26 15:54:24', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('1309e8ef-53b1-4356-8f36-4528234b65fb', 'admin', '2016-04-23 16:08:41', '更新栏目 新闻中心', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('134d0181-4e1d-438d-a097-b4a4c732465a', 'admin', '2016-04-23 12:43:42', '更新信息(贺美国-达拉斯市红话筒分校成立)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('14574e8e-8503-4d92-bcb6-30b955efa975', 'admin', '2016-04-23 15:43:50', '修改模板文件(templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/index.shtml)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('152f41e9-f81b-4bb9-a390-b8d10cac3718', 'admin', '2016-04-23 14:35:28', '添加信息(少儿口才与主持提高版)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('15fb970e-7101-454b-9bac-371cb24a4793', 'admin', '2016-04-23 15:44:03', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('16a355be-6345-4a45-aa01-f4c7636bc82c', 'admin', '2016-04-23 14:34:39', '添加信息(幼儿口才与主持基础版)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('17f77a16-4312-40a4-9f93-cbbdce90a7b6', 'admin', '2016-05-26 14:48:10', '登录系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('17ff36f0-e92c-4ff6-9c7d-5f482ab033d5', 'admin', '2016-05-26 16:41:46', '信息页静态化:雪人', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('189342a0-e578-4733-8bed-620597a46608', 'admin', '2016-04-23 15:16:59', '添加信息(中国红话筒教育千家分校共贺新春)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('1932fb9c-d66b-4777-8c39-d2e0f85fcd8d', 'admin', '2016-04-23 10:25:17', '添加模板(少年儿童教育)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('19e41416-cfa2-4822-a6b6-a34099f3948f', 'admin', '2016-05-26 16:47:25', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('19ff72df-e65e-4845-9636-99e26c920627', 'admin', '2016-04-23 16:41:23', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('1a319cfc-a9b7-4ca5-8877-0bb4ac121474', 'admin', '2016-04-23 12:22:38', '添加模板(edu)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('1acd3315-5526-4719-ae44-0a8efcaad816', 'admin', '2016-04-23 17:38:58', '栏目静态化:新闻中心 第6页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('1b6e9522-2676-4549-ba9d-03bf5a6ec72f', 'admin', '2016-05-26 14:54:56', '更新信息(圣诞节的礼物)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('1ba4ddd6-84ee-48fd-beaa-e1c13ce9e89f', 'admin', '2016-04-23 17:33:52', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('1bcb3885-5a4f-4328-b836-de5a79da4384', 'admin', '2016-04-23 16:08:46', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('1c23312a-75cd-4784-a0c6-04edc7b26b0a', 'admin', '2016-04-23 15:20:36', '信息页静态化:2015 CCTV红话筒全国青少年儿童电视小主持人才艺大赛', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('1c3d239f-3c4c-48df-880a-f776574214b7', 'admin', '2016-04-23 13:00:38', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('1cc09c23-7c97-4904-b67c-2d0588af100e', 'admin', '2016-04-23 14:43:57', '信息页静态化:少儿强化系列盘', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('1d0736fa-3570-4b95-923f-d1f2a7ba67d9', 'admin', '2016-05-26 16:40:12', '栏目静态化:口才教育 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('1d2b8dc9-f62e-45fe-b437-1b4dd8ed2200', 'admin', '2016-04-23 13:37:27', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('1e382a9d-6f02-47c9-89d5-2e64a913504f', 'admin', '2016-04-23 12:51:22', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('1e74593e-b317-4693-82ed-d503a79c7dc7', 'admin', '2016-05-02 13:10:44', '登录系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('215070c3-b4c0-4df6-abe1-b2ff46e63de4', 'admin', '2016-04-23 12:43:51', '信息页静态化:贺日本-东京市红话筒分校成立', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('232aaec9-1f05-4a23-9f47-a7a09916ae1f', 'admin', '2016-04-23 12:38:17', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('23622b0a-fc94-43ce-83bc-e59366673403', 'admin', '2016-05-02 17:30:18', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('23aecc06-ca1f-420a-ada4-72ea2cd1f334', 'admin', '2016-04-23 13:38:33', '更新信息(图片新闻1111)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('23fb4f3f-0122-430f-8a35-48d62cf73bb8', 'admin', '2016-04-23 15:05:34', '信息页静态化:幼儿口才与主持基础版', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('24602a7b-3807-4024-8a2e-e9667f225270', 'admin', '2016-04-23 13:40:56', '添加信息(图片新闻3333)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('24bb8ea7-c2df-4f3c-a373-13b9b33f7514', 'admin', '2016-04-23 12:33:27', '添加信息(贺河南-郑州市红话筒分校成立)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('25461da0-295a-4085-95ee-5cee937f2c8e', 'admin', '2016-04-23 14:21:10', '修改模板文件(templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/resources/js/index.js)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('257165c4-6d1a-4cec-a1c5-7cefabb17ad7', 'admin', '2016-04-23 14:57:39', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('2683eb00-e704-4a3d-9a4b-39e754c408c2', 'admin', '2016-04-23 14:57:16', '修改模板文件(templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/index.shtml)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('27266818-4aa0-48ab-ac0e-0aba4a083bdf', 'admin', '2016-04-23 10:26:00', '修改模板(少年儿童教育)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('272a6545-6c48-46de-ad85-712eff33266f', 'admin', '2016-05-26 16:16:47', '更新栏目 优秀盟校', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('276b179d-e854-4604-93e9-a32d419339cc', 'admin', '2016-05-26 16:17:52', '栏目静态化:口才教育 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('283b26a4-9657-4c0a-919b-2da4aad0995c', 'admin', '2016-05-26 16:40:13', '栏目静态化:优秀盟校 第3页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('2875fa19-4d29-4a82-9a97-072a9eb481cb', 'admin', '2016-05-26 14:35:14', '登录系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('28d70921-7457-40cf-9051-ef25b5c1aa06', 'admin', '2016-04-23 13:41:39', '添加信息(图片新闻4444)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('2af3b52d-85b4-4f9e-a4d7-baedf5da2077', 'admin', '2016-05-26 16:39:57', '添加信息(雪人)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('2af42ca3-ecde-46ce-813d-050c9ab13dc4', 'admin', '2016-04-23 14:38:28', '添加信息(幼儿口才系列盘)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('2b43b245-56da-49ea-8bc3-a22f475a457f', 'admin', '2016-04-23 15:19:22', '添加信息(《2015全国语言教师教学风采大赛》晋级名单)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('2b66c0ce-e4d4-4a3b-b08f-5a44695c628a', 'admin', '2016-04-23 14:43:57', '信息页静态化:少儿口才与主持提高版', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('2c277b00-5cd8-4941-8a83-cf27c5435ef1', 'admin', '2016-04-23 14:58:50', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('2c6b0a92-00fd-4f3c-bc32-b6baa6932aa2', 'admin', '2016-05-02 17:42:42', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('2c6e0df5-b638-4f3f-a00c-1f22dd644129', 'admin', '2016-05-26 16:47:20', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('2c6f281f-b191-48ed-adc1-315de622322c', 'admin', '2016-04-23 14:21:00', '修改模板文件(templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/resources/css/nivo-slider.css)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('2dc10d84-68f0-405c-b536-6d127bb5a9b9', 'admin', '2016-04-23 13:37:19', '修改模板文件(templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/index.shtml)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('2dd4f474-1140-400e-b21e-0e058fa686d6', 'admin', '2016-05-02 13:11:39', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('2ddcedcc-b0d6-44d4-922c-392a3807af38', 'admin', '2016-05-26 15:45:42', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('2e3a1cd0-2dce-4dad-86d0-18e227092ad1', 'admin', '2016-04-23 14:43:56', '信息页静态化:童话剧课堂', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('2e48b8a0-019e-4244-83e6-22b8a096d104', 'admin', '2016-04-23 10:22:11', '添加栏目 优秀盟校', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('2e753f7d-b6fd-427d-b3de-01fdbaa1d149', 'admin', '2016-03-26 16:29:18', '更新栏目 高中教育', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('2efc5867-980c-4435-8e47-b3f304b1c7ed', 'admin', '2016-04-23 17:09:20', '修改模板文件(templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/inc/channel_header.shtml)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('2f3ef566-2568-41d0-bc3e-c9ce741f8972', 'admin', '2016-04-23 10:25:43', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('2f5774bd-fefe-4da5-83c9-9602504c3467', 'admin', '2016-03-26 16:29:48', '添加栏目 口才教育', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('2fbe09a8-b603-46f7-9c12-3a8aa678d91b', 'admin', '2016-05-02 17:22:13', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('3026d86e-7dbf-419b-8cc3-7a6c48b61c41', 'admin', '2016-04-23 13:30:03', '添加信息(图片新闻1111)失败:java.io.FileNotFoundException: Template templet/dfa2ebb6-42ef-4b79-9449-e39f6bdbf11d/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('307dc1b9-c917-4d97-beb2-afbd07232eaa', 'admin', '2016-04-23 14:36:49', '添加信息(少儿口才与主持强化版)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('30bce2e1-94d4-413c-97cc-cc1d1d4ea533', 'admin', '2016-04-23 14:39:20', '添加信息(少儿强化系列盘)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('3169cdf5-87b5-407b-ad2b-4e1deecd14a9', 'admin', '2016-04-23 12:35:49', '添加信息(贺日本-东京市红话筒分校成立)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('3284025e-2974-406b-a419-06e989d5e150', 'admin', '2016-04-23 14:40:32', '添加信息(动漫口才课堂)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('3304db85-84db-4424-b556-49aa1c40bd12', 'admin', '2016-04-23 17:08:36', '修改模板文件(templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/youxiumengxiao_list.shtml)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('3347d861-e96d-450c-b7bb-557c29b5d827', 'admin', '2016-04-23 17:28:56', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('33b275f9-c9f6-448c-8fd6-f86442f5b0d9', 'admin', '2016-04-23 10:23:50', '更新栏目 小升初', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('341cb569-f0dc-48c7-8638-82e8339284ac', 'admin', '2016-04-23 15:04:00', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('3547239c-24b2-41d2-b67c-bab467c7516c', 'admin', '2016-04-23 12:12:09', '修改模板(少年儿童教育)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('35eb5b3c-c157-48f4-835f-96e7e629eb59', 'admin', '2016-04-23 15:19:09', '添加信息(中国红，红话筒，话筒赢天下！我们的话筒，我们的声音，我们的舞台！2015暑假全国语言朗诵考级正式启动！)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('369ae76c-9a21-4baf-8d37-669b3e24f564', 'admin', '2016-04-23 15:19:09', '添加信息(中国红，红话筒，话筒赢天下！我们的话筒，我们的声音，我们的舞台！2015暑假全国语言朗诵考级正式启动！)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('36aac3ed-e880-421d-af0d-624ba061038e', 'admin', '2016-04-23 15:15:52', '添加信息(2016年上半年全国教师培训认证会报名倒计时)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('373d29ff-f88d-46de-9ee9-a3431e45814a', 'admin', '2016-04-23 16:37:37', '登录系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('379e9ccc-b969-4994-b7dd-640262e8a9d7', 'admin', '2016-05-26 16:42:20', '信息页静态化:圣诞节的礼物', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('3806dcfd-5d97-447a-8e40-09ae4057bbbb', 'admin', '2016-05-02 17:18:16', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('38106cd8-402b-4cd5-af85-46d1c77a7b8c', 'admin', '2016-04-23 14:40:08', '添加信息(童话剧课堂)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('38163a9a-e783-4ebe-a208-a07a62c45bd4', 'admin', '2016-04-23 15:19:37', '添加信息(2015全国语言朗诵校长/教师培训认证会入册名单确认)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('382c7491-5c56-404a-8034-90df66271469', 'admin', '2016-04-23 12:36:57', '更新信息(贺日本-东京市红话筒分校成立)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('38656ce4-c11a-475b-a4d8-c4ebc546a004', 'admin', '2016-04-23 10:18:52', '更新栏目 作文天地', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('3910e0f4-37b1-4be0-ad92-378d5086188f', 'admin', '2016-04-23 16:20:41', '栏目静态化:优秀盟校 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('39922665-bf26-4a80-ac2e-c9a29cfde1b6', 'admin', '2016-04-23 14:39:44', '添加信息(少儿精华系列盘)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('39eb85b1-03d0-4c66-9b7c-a3c42582f6b6', 'admin', '2016-05-26 16:48:25', '更新信息(圣诞节的礼物)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('3a1c9a28-3fa8-4a59-939d-e94963ed2719', 'admin', '2016-05-26 16:47:30', '栏目静态化:罗宾逊绘本 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('3a38264a-0014-4b9c-953f-a7ed9dc5d4a1', 'admin', '2016-04-23 12:47:06', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('3a7ff3d4-8f8a-4ba7-ae29-c66d8107c964', 'admin', '2016-04-23 10:42:04', '添加栏目 新闻中心', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('3adc3ec5-4ec3-4f24-8465-bdb52a849254', 'admin', '2016-04-23 17:09:43', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('3b8adc6a-5678-487d-a91e-9be6612cbb90', 'admin', '2016-04-23 14:22:39', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('3c0cf1fa-2dc7-484d-910b-ffc8afbc8207', 'admin', '2016-05-26 16:07:26', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('3ce5fc84-5138-4e15-b38c-ae41822ef4b5', 'admin', '2016-04-23 12:37:39', '信息页静态化:贺美国-达拉斯市红话筒分校成立', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('3da07767-6ed9-40b0-b63c-6c69de136459', 'admin', '2016-05-26 16:51:55', '信息页静态化:圣诞节的礼物', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('3f9436b9-c239-4d3e-b2d6-8610df9cda0c', 'admin', '2016-04-23 15:02:39', '信息页静态化:幼儿口才系列盘', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('3fb9a350-c311-4a99-a4c8-ecd97c86e31d', 'admin', '2016-04-23 15:03:15', '更新信息(少儿提高系列盘)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('40b30d6b-209b-49d1-9324-300423b1cf64', 'admin', '2016-05-02 17:37:35', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('40cc1fd2-dd89-41e1-9a3c-af463749f5a9', 'admin', '2016-04-23 10:19:36', '更新栏目 诗词成语', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('40d4d2c3-b987-4bfe-82b0-f1f5065e67b0', 'admin', '2016-04-23 15:16:58', '添加信息(中国红话筒教育千家分校共贺新春)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('413e97d9-854a-43b2-8abe-11013793a1b4', 'admin', '2016-04-23 15:02:51', '更新信息(少儿口才与主持强化版)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('420c2631-29c2-4d16-a0d1-3c0c39119e5e', 'admin', '2016-04-23 17:35:24', '栏目静态化:新闻中心 第3页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('42334540-1765-40db-be0a-ca7c022c289c', 'admin', '2016-04-23 12:24:15', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('43081f1b-2993-44a5-87b2-2abf796a0532', 'admin', '2016-04-23 12:43:43', '信息页静态化:贺美国-达拉斯市红话筒分校成立', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('430f9338-3cb6-4c24-8a60-e51a602e25f5', 'admin', '2016-04-23 17:38:57', '栏目静态化:新闻中心 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('43183da9-d617-4553-9589-a2b47e058006', 'admin', '2016-04-23 15:20:36', '信息页静态化:2015下半年全国语言朗诵考级启动通知', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('439c3752-0428-409d-981a-8d8aec2a8600', 'admin', '2016-03-26 15:58:17', '添加站点 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('43ca3c37-5c3b-4b6a-8c77-baf3c7c7142c', 'admin', '2016-05-26 15:48:42', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('4424695b-c122-4d40-b35c-e2fa11eff0e0', 'admin', '2016-04-23 13:00:33', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('442c0ecf-e584-482d-9e5d-456af5497ace', 'admin', '2016-04-23 17:33:57', '栏目静态化:新闻中心 第2页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('444219a0-7b25-4b32-870e-fcd41ef2aec4', 'admin', '2016-04-23 16:37:45', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('44e05689-1deb-459e-9116-b40f4cd8098d', 'admin', '2016-05-26 16:05:03', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('46343e5e-5f9b-4f81-9c67-586b0ea187e7', 'admin', '2016-04-23 10:23:24', '更新栏目 微电影', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('46e35a35-f0c8-4b3c-aaff-62465d3bd706', 'admin', '2016-05-26 16:47:30', '栏目静态化:优秀盟校 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('47ad208b-4d02-4024-ab5c-3feb6bae1f14', 'admin', '2016-04-23 15:18:03', '添加信息(2015全国红话筒央视CCTV青少年电视儿童大赛圆满落幕！)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('48c34202-030f-48b2-a250-41165da7a2a1', 'admin', '2016-04-23 15:17:16', '添加信息(欢动五洲•梦想起航 暨《2016猴年红话筒少儿春晚大型新春盛典》)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('49319329-9d31-45ed-a673-9bb613f467ec', 'admin', '2016-04-23 15:20:35', '信息页静态化:红动中国•精湛风采暨《2016全国语言教师教学风采大赛》报名启动', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('499bb0c3-0a35-4c80-a1f0-67ccc94119da', 'admin', '2016-04-23 12:35:20', '信息页静态化:贺山东-济南市红话筒分校成立', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('49a124ff-191b-44d6-a47b-89a855e75a0e', 'admin', '2016-03-26 16:30:18', '添加栏目 诗词成语', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('4a8196aa-e1ab-4926-97ab-1ab5150281bb', 'admin', '2016-04-23 17:28:35', '修改模板文件(templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/resources/css/channel.css)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('4aecaeec-ee8e-4a21-9ef3-b44e427064db', 'admin', '2016-05-02 17:46:26', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('4b6b45e3-9068-425d-932c-86bea904a241', 'admin', '2016-04-23 15:03:03', '信息页静态化:少儿强化系列盘', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('4b9ebf46-fac4-46d4-93fe-449776572958', 'admin', '2016-04-23 15:05:35', '信息页静态化:少儿强化系列盘', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('4d2f95a9-146f-4c58-9b86-3a8e15b2f9a5', 'admin', '2016-04-23 11:59:24', '添加栏目 百度', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('4e74e474-304a-45a6-9399-9ea61d849c9b', 'admin', '2016-04-23 10:42:29', '添加栏目 图片新闻', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('4f995055-a22c-47c9-b76a-cbb9651a6090', 'admin', '2016-04-23 16:10:23', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('4f9cba3a-1069-42ff-b74b-50f6dfe8a24e', 'admin', '2016-04-23 13:01:59', '更新栏目 优秀盟校', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('503b120f-de3d-4851-85de-656a7b3d2f17', 'admin', '2016-04-23 17:36:44', '栏目静态化:新闻中心 第6页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('51715425-2d07-4bee-b0fb-df86d5190661', 'admin', '2016-04-23 13:30:22', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('51d91ee5-cc16-4ad1-8080-f571efdbebdd', 'admin', '2016-04-23 14:35:28', '添加信息(少儿口才与主持提高版)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('51eed935-b82b-4749-8287-a4eca587b882', 'admin', '2016-04-23 14:39:20', '添加信息(少儿强化系列盘)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('5245ce8a-8251-40a2-a8c5-13b6f264dd7b', 'admin', '2016-04-23 16:38:01', '栏目静态化:新闻中心 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('52ca128f-50f9-4269-b427-28cf175bd369', 'admin', '2016-04-23 12:13:56', '删除模板(edu)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('53070f1f-665c-4f52-8b12-34840f749e06', 'admin', '2016-05-26 16:08:23', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('53abf264-f4a6-431b-a550-a244007fe594', 'admin', '2016-04-23 13:01:45', '更新栏目 首页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('53da3ee3-ff80-4d74-9316-bd050a1fcfc0', 'admin', '2016-04-23 15:20:36', '信息页静态化:2016年红话筒冬令营（魅力海南）活动启动', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('54128003-1cef-4714-ab59-85d4975c0e7b', 'admin', '2016-04-23 14:43:44', '更新栏目 口才教育', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('5488d975-e1de-4e51-bfe6-d15accb359ac', 'admin', '2016-05-26 15:45:15', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('54bbd714-d02b-4778-9bd2-61af250362e2', 'admin', '2016-04-23 16:40:46', '栏目静态化:新闻中心 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('54d56f66-a21c-4f1c-870d-a5eb75b5d173', 'admin', '2016-04-23 10:23:43', '更新栏目 央视大赛', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('54f6d91b-60e4-429f-b8d4-f6713224b4db', 'admin', '2016-04-23 14:39:44', '添加信息(少儿精华系列盘)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('55401f74-568f-4710-b928-d4bcb0589ac4', 'admin', '2016-04-23 13:38:50', '更新信息(图片新闻1111)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('55d59395-01e6-4956-9cb4-2a001ecd8179', 'admin', '2016-04-23 15:07:59', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('55e637e9-9f3e-478c-86bd-50fd53110235', 'admin', '2016-04-23 16:35:59', '登录系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('562e2dfd-b3c7-458e-bb59-caa91644b8f2', 'admin', '2016-05-02 17:22:55', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('569cb70e-31bf-4961-b097-9e8384880e6e', 'admin', '2016-03-26 16:29:07', '添加栏目 高中教育', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('57e11bf5-a9f9-4502-84bf-8ea961398a15', 'admin', '2016-04-23 16:18:44', '栏目静态化:新闻中心 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('58152f74-e4c6-4905-b1b0-7797ddca4b9a', 'admin', '2016-03-26 16:32:44', '更新栏目 绘本库', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('5a0d77d4-56ed-4e00-b5e2-ca46630e8845', 'admin', '2016-04-23 15:05:22', '更新信息(幼儿口才系列盘)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('5a4d1927-2213-4d2d-b1a9-7e38f053e510', 'admin', '2016-05-26 16:16:54', '栏目静态化:优秀盟校 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('5ae572fd-b639-4a9c-a655-4177a1b1afeb', 'admin', '2016-04-23 16:07:26', '修改模板文件(templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/index.shtml)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('5c20f111-e241-486f-a721-3735ca7aacd4', 'admin', '2016-04-23 12:59:26', '修改模板文件(templet/dfa2ebb6-42ef-4b79-9449-e39f6bdbf11d/inc/index_header.shtml)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('5cf536ed-6057-4a0b-8dae-e16e71572e80', 'admin', '2016-05-26 14:53:15', '登录系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('5d926e91-d63c-454b-b279-86d3d31989c9', 'admin', '2016-04-23 12:38:13', '信息页静态化:贺北京-北京市红话筒分校成立', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('5f0b7f05-618e-4aaf-87d1-aaac1bf04e69', 'admin', '2016-04-23 15:18:32', '添加信息(2015暑期全国语言朗诵考级正式启动)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('5f1bf88e-92e1-47d6-893a-1ebac41d306d', 'admin', '2016-05-02 13:49:15', '登录系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('5f37e910-93e6-46c8-97e3-9f3d3bf4044e', 'admin', '2016-04-23 17:35:19', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('5fc889d8-46a8-4774-b02b-dd6d47b78763', 'admin', '2016-04-23 12:34:39', '信息页静态化:贺北京-北京市红话筒分校成立', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('6010d7b8-671d-47f9-9f82-1ce160ef8810', 'admin', '2016-05-26 16:05:36', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('6039d848-f537-451f-8ce5-5ac27c027460', 'admin', '2016-05-02 16:52:09', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('61afbcc3-1775-4cb6-b68b-9ba4e6ab3d13', 'admin', '2016-05-26 16:07:22', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('625abdc5-5d79-428b-b27a-33e5cfaa2915', 'admin', '2016-04-23 17:34:59', '修改模板文件(templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/youxiumengxiao_list.shtml)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('6283e42a-3dd5-47fa-9e0f-59efb777209c', 'admin', '2016-04-23 12:34:39', '添加信息(贺北京-北京市红话筒分校成立)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('63db3f0e-95d3-4420-9fa0-e34a97dc7bf9', 'admin', '2016-04-23 16:08:46', '栏目静态化:新闻中心 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('642a5903-3bc9-456f-9d7d-808da6f75cf2', 'admin', '2016-05-02 17:18:12', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('64abcd0f-8827-4b0b-ba02-1a84a8a1fa41', 'admin', '2016-04-23 14:36:49', '添加信息(少儿口才与主持强化版)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('65128753-f9ae-4d22-af49-61c18895a5d0', 'admin', '2016-04-23 17:38:58', '栏目静态化:新闻中心 第7页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('652a010b-bdfe-4aa8-9a42-fef5533c5be6', 'admin', '2016-04-23 12:51:12', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('6582e6d5-9c91-4ee9-8bf2-032fc1474444', 'admin', '2016-05-26 16:34:20', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('65ed2ab9-643a-4087-880c-48e64075dafd', 'admin', '2016-04-23 15:03:15', '信息页静态化:少儿提高系列盘', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('6720def3-6736-4ea9-ba25-cbe9a5ea4618', 'admin', '2016-04-23 10:19:46', '更新栏目 诗词成语', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('6768698f-edb4-4b92-9e38-67927e21b97e', 'admin', '2016-04-23 16:07:48', '修改模板文件(templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/youxiumengxiao_list.shtml)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('678a31a0-3cd0-47a0-b7c7-07d39df2573e', 'admin', '2016-04-23 17:28:52', '栏目静态化:新闻中心 第2页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('6852a35e-692b-4e92-bebf-aefb9aee2a33', 'admin', '2016-04-23 14:37:25', '添加信息(少儿口才与主持精华版)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('6871ecf4-7e90-430e-94b7-3e6ca0bcaacc', 'admin', '2016-05-26 16:34:31', '栏目静态化:优秀盟校 第3页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('68f9c639-4b48-4d30-969d-038bd2171961', 'admin', '2016-04-23 17:38:57', '栏目静态化:新闻中心 第3页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('690cf0fa-e07e-47cb-a3b2-d915cb796d75', 'admin', '2016-04-23 12:10:44', '更新栏目 儿歌故事', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('697aeec5-a050-4615-933d-7d40aee67fc6', 'admin', '2016-05-26 16:13:02', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('69da9da0-1441-4d62-8f63-782e117f7aee', 'admin', '2016-04-23 15:43:17', '修改模板文件(templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/youxiumengxiao_list.shtml)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('6a1ad28a-a092-43e4-8e16-c39b43332d50', 'admin', '2016-04-23 17:09:38', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('6a75f425-c9c3-47bf-a4a1-b7cca4ee6dd8', 'admin', '2016-05-26 16:42:20', '更新信息(圣诞节的礼物)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('6ae708f9-1277-4d08-8707-3c1094f8f32a', 'admin', '2016-05-26 16:16:55', '栏目静态化:优秀盟校 第3页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('6c707ac3-34e4-41a6-b4a1-4e5bdc18c427', 'admin', '2016-04-23 14:38:53', '添加信息(少儿提高系列盘)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('6d08d332-65c1-4a61-8d04-2fc7ef1d642d', 'admin', '2016-05-02 17:30:22', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('6e3bac68-f26c-46c9-a5d0-9f9060a78344', 'admin', '2016-05-26 16:13:10', '信息页静态化:圣诞节的礼物', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('6f08a2e2-dd1a-4d28-bb1d-42e2f778ab5d', 'admin', '2016-04-23 16:19:10', '栏目静态化:新闻中心 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('6f182c1e-f08d-40ab-bf74-29e1a79dfc2f', 'admin', '2016-05-08 14:23:18', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('6f93dc9e-f4bf-4d2b-93da-a8aa33dc42d7', 'admin', '2016-04-23 15:19:37', '添加信息(2015全国语言朗诵校长/教师培训认证会入册名单确认)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('70b21ecb-b971-4a54-9b03-6553af696bbd', 'admin', '2016-04-23 15:05:35', '信息页静态化:少儿口才与主持提高版', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('712af9dd-e2dd-4bba-8eaf-192d2b5b73a2', 'admin', '2016-05-26 15:48:34', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('7130fedf-9dc7-4af7-adb4-08894ba4b365', 'admin', '2016-04-23 14:43:56', '信息页静态化:礼仪课堂', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('71690d9d-8606-4350-9e77-7e940b134b9c', 'admin', '2016-05-26 16:47:30', '栏目静态化:口才教育 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('72475314-4f0e-4dad-be5b-443e2dd5d6e0', 'admin', '2016-04-23 13:40:31', '添加信息(图片新闻2222)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('72663f30-e2ae-497b-8560-2af11d8bce8d', 'admin', '2016-04-23 12:38:13', '信息页静态化:贺美国-达拉斯市红话筒分校成立', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('72c50f5b-6d04-46bd-9156-f0ac2263cbf3', 'admin', '2016-04-23 12:15:30', '添加模板(edu)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('72e97809-e5e7-4e9d-875d-c0450748db2a', 'admin', '2016-04-23 12:51:02', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('72ee296f-bf3d-4c40-96ac-7163019a9b0f', 'admin', '2016-04-23 15:20:37', '信息页静态化:《2015全国语言教师教学风采大赛》晋级名单', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('737d5d28-aef8-4c3e-a006-ba05857bbcf6', 'admin', '2016-04-23 15:05:35', '信息页静态化:少儿提高系列盘', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('73c583a0-1dba-40ac-99f0-f9b081d4e47f', 'admin', '2016-04-23 14:37:25', '添加信息(少儿口才与主持精华版)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('74770fb0-c4ef-4044-a76a-6ef15220929a', 'admin', '2016-04-23 13:02:11', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('75047052-0c42-476d-9162-caa2ba0a1f5d', 'admin', '2016-04-23 13:26:58', '登录系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('758ed373-c567-49c7-a7ea-4d116efa2edc', 'admin', '2016-05-26 15:54:33', '信息页静态化:圣诞节的礼物', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('768ccfce-07ad-4a87-907d-5b56787eae8b', 'admin', '2016-05-26 16:47:31', '栏目静态化:优秀盟校 第4页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('76d4dffe-5e55-4607-95a7-696d2e029ba5', 'admin', '2016-05-26 14:39:25', '添加信息(圣诞节的礼物)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('78012ba6-480b-4263-920e-6fc6ddd6af3b', 'admin', '2016-04-23 17:35:10', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('78834d85-949e-4f3f-bc75-6c574d504a22', 'admin', '2016-04-23 14:42:29', '添加信息(口语交际经典课例)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('789a3902-a461-4526-9138-4aca7fc12271', 'admin', '2016-04-23 17:11:07', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('78bb87cc-e948-44d9-9abc-567ecc21aae3', 'admin', '2016-04-23 15:20:27', '更新栏目 新闻中心', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('78e13026-98f3-439a-bc0a-6b22369bda0e', 'admin', '2016-04-23 12:38:13', '信息页静态化:贺河南-郑州市红话筒分校成立', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('7957157e-b39e-495b-a177-315e57b26655', 'admin', '2016-05-02 16:48:30', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('795cc5c8-7bdf-445c-921d-737387d55c0d', 'admin', '2016-03-26 15:38:08', '退出系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('79b9a594-9735-43a8-81f4-aea606911c58', 'admin', '2016-05-26 15:45:36', '更新栏目 罗宾逊绘本', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('79e533c6-351c-446c-8599-86362aeda65c', 'admin', '2016-05-26 16:47:10', '登录系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('7b5fa0e5-8777-4933-a0a9-395c2fa831ff', 'admin', '2016-04-23 17:11:00', '修改模板文件(templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/youxiumengxiao_list.shtml)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('7cbb59a1-57fd-4cc0-9bc3-cea38f4e1c68', 'admin', '2016-03-26 16:32:17', '添加栏目 作文天地', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('7d0308ae-daa6-443f-8c59-9fc295a09459', 'admin', '2016-05-26 16:04:39', '栏目静态化:罗宾逊绘本 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('7db27e85-7c37-4044-bc01-6647789b371e', 'admin', '2016-04-23 12:43:52', '信息页静态化:贺河南-新乡市红话筒分校成立', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('7dfee8f4-03ca-4ead-a47b-95ba456ac25e', 'admin', '2016-04-23 13:35:54', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('7e31311e-13d6-4a81-9e75-ed031824ab4c', 'admin', '2016-05-26 16:42:25', '栏目静态化:罗宾逊绘本 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('7e5b62e0-06b0-48f3-94ad-1f5a94786ece', 'admin', '2016-05-02 13:11:28', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('7e7b0e00-69df-4ccf-a7be-3b060b5e74c0', 'admin', '2016-04-23 15:20:36', '信息页静态化:关于2015下半年全国语言朗诵考级启动通知', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('7e8321d5-52f7-4b76-984b-2a4b665cd54f', 'admin', '2016-04-23 15:18:03', '添加信息(2015全国红话筒央视CCTV青少年电视儿童大赛圆满落幕！)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('7e8a2822-8fa8-48f6-aa00-5b685fa44b37', 'admin', '2016-05-26 14:54:56', '更新信息(圣诞节的礼物)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('7ebd5dff-0785-4df1-9905-8500f38dd9db', 'admin', '2016-04-23 12:01:50', '添加栏目 红话筒', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('7f37ad14-3792-4674-b745-8abf2f7d8bf1', 'admin', '2016-03-26 16:16:39', '添加栏目 首页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('7f9b0628-715c-489f-9995-cc9b7e7eaea0', 'admin', '2016-04-23 12:12:29', '删除模板(少年儿童教育)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('801c0e95-6712-44f2-b03f-cb668c83a6ac', 'admin', '2016-04-23 12:37:39', '添加信息(贺美国-达拉斯市红话筒分校成立)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('8069d1fd-78f8-49df-a890-7c16c754964f', 'admin', '2016-04-23 13:00:30', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('808617bd-5958-46f0-b1e8-e7de939086f4', 'admin', '2016-04-23 13:38:33', '更新信息(图片新闻1111)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('80afb584-56e2-4d6f-850a-ab4cd8d7fa0a', 'admin', '2016-04-23 17:33:41', '修改模板文件(templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/resources/css/channel.css)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('820fd7f9-5281-4c93-aae3-bafa6c5acf05', 'admin', '2016-04-23 15:18:17', '添加信息(2015央视CCTV小主持人大赛红话筒分校晋级决赛名单及节目单)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('824ebb53-52e0-4f27-a5d8-1a835ed5b262', 'admin', '2016-05-26 16:48:25', '信息页静态化:圣诞节的礼物', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('82a7b38e-d96c-4f26-8028-3e1147169b91', 'admin', '2016-03-26 15:54:38', '登录系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('82c23a86-3692-4c9b-be71-d44592f98275', 'admin', '2016-04-23 15:03:21', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('82c38ec4-59ba-4ed3-b2e5-8b714b73ac41', 'admin', '2016-04-23 15:20:35', '信息页静态化:2015全国语言朗诵校长/教师培训认证会入册名单确认', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('82d88d4a-c9e6-41e9-8807-59ba77b4f14a', 'admin', '2016-04-23 15:16:11', '添加信息(红动中国•精湛风采暨《2016全国语言教师教学风采大赛》报名启动)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('832dc625-8ff8-4bee-a2f3-793884cfe713', 'admin', '2016-04-23 17:17:36', '栏目静态化:新闻中心 第2页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('83d2a67d-7c5c-4da6-83ad-469f5ff7cea9', 'admin', '2016-05-26 16:34:03', '登录系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('83f980eb-5c5f-4302-854e-6372658ec957', 'admin', '2016-05-26 16:48:26', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('844bd209-0d19-4519-a598-0eeee0dacc7c', 'admin', '2016-04-23 14:40:31', '添加信息(动漫口才课堂)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('8463f650-b34f-41af-ab66-d05952b1d2ec', 'admin', '2016-04-23 10:22:28', '更新栏目 儿歌故事', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('84f0fc71-e800-4659-b30a-d7060faa608d', 'admin', '2016-04-23 15:17:47', '添加信息(关于2015下半年全国语言朗诵考级启动通知)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('85cf0783-da8e-451e-9ee0-9de1b9e07cce', 'admin', '2016-04-23 14:43:57', '信息页静态化:少儿精华系列盘', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('85e68a8e-9cd8-431f-8cf4-0c9739b98ce2', 'admin', '2016-04-23 13:37:31', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('864697f6-d43a-401a-a809-ed1318752ce8', 'admin', '2016-04-23 12:55:15', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('86c8791b-7a05-4a86-a4f7-2a7a6974be69', 'admin', '2016-03-26 16:31:03', '添加栏目 儿歌故事', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('8845168b-a8fd-42aa-9aab-ef5876b1a33a', 'admin', '2016-05-26 11:44:40', '登录系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('885394e4-99b8-4fca-9833-9df43f469ff0', 'admin', '2016-05-26 16:47:36', '信息页静态化:雪人', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('88b23e3a-92b8-415f-a288-04ba93adce7f', 'admin', '2016-04-23 17:35:23', '栏目静态化:新闻中心 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('896e72ae-ccc9-4eb3-ba30-db4852b3d7ab', 'admin', '2016-04-23 13:40:56', '添加信息(图片新闻3333)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('8991982f-8a70-426c-b010-882111931ef1', 'admin', '2016-04-23 15:20:36', '信息页静态化:2015央视CCTV小主持人大赛红话筒分校晋级决赛名单及节目单', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('8a0ef108-c7b4-43d7-b879-582ea0426a64', 'admin', '2016-04-23 12:47:02', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('8a72729b-543a-4d52-8d14-5a93b70a8654', 'admin', '2016-04-23 10:23:37', '更新栏目 绘本库', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('8aca7978-137c-497c-9a3e-1048a6b0551e', 'admin', '2016-04-23 17:08:56', '修改模板文件(templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/index.shtml)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('8b105027-1eb2-4eec-b655-d4732232f293', 'admin', '2016-05-26 16:12:47', '登录系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('8b282b1f-c6c6-4813-bbc4-c7a20a310d55', 'admin', '2016-05-26 16:51:55', '信息页静态化:雪人', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('8b327cf6-b7ac-4f27-9561-8e37f57e2301', 'admin', '2016-04-23 12:38:13', '信息页静态化:贺河南-新乡市红话筒分校成立', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('8bc084b2-d315-422a-97e9-7f3a0d37e27e', 'admin', '2016-03-26 15:38:18', '登录系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('8bfb5b6e-d70f-4aa7-97f9-56d6b352181e', 'admin', '2016-04-23 15:17:47', '添加信息(关于2015下半年全国语言朗诵考级启动通知)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('8c93188f-5041-4ee6-a654-dc78db61c46e', 'admin', '2016-04-23 12:46:49', '修改模板文件(templet/dfa2ebb6-42ef-4b79-9449-e39f6bdbf11d/index.shtml)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('8ca95780-c2d3-46ca-b20b-b23b60bc566a', 'admin', '2016-05-02 17:22:09', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('8d087c55-88cd-4262-b2d0-815a12a30d62', 'admin', '2016-04-23 14:22:42', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('8d4128dc-960d-45a4-b0c7-118cdf283a05', 'admin', '2016-04-23 14:57:43', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('8f47ff75-8a95-45cf-8d81-037d449762f4', 'admin', '2016-04-23 14:43:56', '信息页静态化:幼儿口才系列盘', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('90875f10-1d93-4b62-b34a-a355299bce2c', 'admin', '2016-04-23 15:17:30', '添加信息(关于2015《全国语言教师培训交流认证会》的通知)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('9134ed1f-0635-4976-bd3c-c72b4e04aa99', 'admin', '2016-05-02 13:14:03', '退出系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('92127eda-bc68-468e-b420-872d01fd90c6', 'admin', '2016-04-23 15:16:11', '添加信息(红动中国•精湛风采暨《2016全国语言教师教学风采大赛》报名启动)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('925ae934-6d7b-4716-a35e-55f6670f7855', 'admin', '2016-04-23 15:08:04', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('92920d99-c9fd-4f8e-a1df-068fe00f2bd0', 'admin', '2016-04-23 11:58:23', '添加栏目 友情链接', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('93bcb6e4-4e9a-4ca5-b148-efbf884bc7af', 'admin', '2016-04-23 14:38:53', '添加信息(少儿提高系列盘)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('93c10ab8-582c-490c-9083-4b9143ff66e3', 'admin', '2016-04-23 15:20:36', '信息页静态化:欢动五洲•梦想起航 暨《2016猴年红话筒少儿春晚大型新春盛典》', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('951bbc47-54ea-4267-9863-46bc1f8233c8', 'admin', '2016-05-26 15:51:23', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('95baff55-0652-4505-9048-d0353fe25a7a', 'admin', '2016-05-26 16:40:13', '栏目静态化:优秀盟校 第4页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('95fe88a5-faf1-49e3-818f-e5ee9831241a', 'admin', '2016-04-23 12:34:01', '信息页静态化:贺河北-石家庄市红话筒分校成立', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('96ad16ba-50f8-467b-b07a-c2df0b9e114e', 'admin', '2016-04-23 16:43:06', '更新信息(图片新闻4444)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('97266713-0ae9-4c17-a6bb-c41b25796b61', 'admin', '2016-04-23 17:28:52', '栏目静态化:新闻中心 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('9768b854-0b7f-49fb-ac42-b02635e6b0a8', 'admin', '2016-04-23 17:34:01', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('979d4874-c889-431e-9a00-034b406dee0a', 'admin', '2016-04-23 14:20:37', '修改模板文件(templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/index.shtml)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('9832de69-1180-4842-a0b7-8ea87893818c', 'admin', '2016-05-26 15:46:55', '栏目静态化:罗宾逊绘本 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('9886de3a-df1e-41d8-8ec7-b8f9b0a104b1', 'admin', '2016-04-23 12:18:28', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('998336ec-a46c-4902-baa8-34b25de92775', 'admin', '2016-04-23 14:42:50', '添加信息(礼仪课堂)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('9983d057-66e3-44aa-90d9-55660d5aa532', 'admin', '2016-04-23 16:33:10', '登录系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('9a515526-75cc-46a2-b17c-e7b4fc937f1d', 'admin', '2016-04-23 13:42:04', '更新信息(图片新闻3333)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('9a912a4b-5f04-4966-97d2-3e38b0c2ba83', 'admin', '2016-05-02 17:44:31', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('9ac48d4c-0a80-48bf-98d5-814139ba4ad1', 'admin', '2016-04-23 15:05:34', '信息页静态化:礼仪课堂', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('9b691925-2127-45f4-8fbe-643a75f350e7', 'admin', '2016-04-23 13:12:58', '登录系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('9b88b2de-071e-438e-929e-fd3218261786', 'admin', '2016-04-23 17:33:57', '栏目静态化:新闻中心 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('9cbd9650-b1c5-4ea4-a071-b596aafc628b', 'admin', '2016-05-26 16:47:36', '信息页静态化:圣诞节的礼物', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('9d784201-1010-4a8c-a32f-b4875de56f80', 'admin', '2016-04-23 12:43:52', '信息页静态化:贺河南-郑州市红话筒分校成立', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('9e6adf4f-106d-4e62-810e-2a335c9a6739', 'admin', '2016-04-23 15:02:51', '信息页静态化:少儿口才与主持强化版', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('9f7bf96c-5554-486c-9e16-c6b20ec267b6', 'admin', '2016-04-23 17:17:29', '栏目静态化:新闻中心 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('9f8c92ff-222f-46b7-97a2-c9459f910268', 'admin', '2016-04-23 15:17:30', '添加信息(关于2015《全国语言教师培训交流认证会》的通知)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('a0376d4e-792d-4e2d-94ef-39ef204ee861', 'admin', '2016-04-23 12:51:25', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('a09a0816-7789-4f07-a7f5-1df2d4d32dd9', 'admin', '2016-04-23 10:18:43', '添加栏目 微电影', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('a1c5e2a9-9c22-41d4-b7bc-b313e080b1a6', 'admin', '2016-04-23 15:05:35', '信息页静态化:少儿口才与主持精华版', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('a2a0524f-39f8-437a-8377-30c229804cfa', 'admin', '2016-04-23 16:41:33', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('a3ce5f54-0b07-4b5c-adb4-9524602928d9', 'admin', '2016-04-23 14:43:57', '信息页静态化:动漫口才课堂', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('a4b38e61-97a9-42a2-b7e3-81036708f9ea', 'admin', '2016-04-23 12:20:25', '删除模板(edu)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('a4c2a680-b1d5-4f4a-98ce-7930bf5b2fff', 'admin', '2016-04-23 12:24:06', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('a60c3cb9-6366-4f9e-919b-39e8a0e6b9d1', 'admin', '2016-05-26 16:34:31', '栏目静态化:优秀盟校 第4页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('a678ca94-5fdc-4169-b67c-c99b0b24ffe4', 'admin', '2016-04-23 15:16:45', '添加信息(2015下半年全国语言朗诵考级启动通知)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('a69f3b55-c8b8-4103-a2ad-520cc0c5100a', 'admin', '2016-05-26 16:08:42', '栏目静态化:罗宾逊绘本 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('a87c3a50-cf1b-4ca1-96b3-64f00fc9cfb7', 'admin', '2016-04-23 17:17:42', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('a8de6aa5-295f-49f5-83b7-fc2ec2ab4e6d', 'admin', '2016-04-23 13:41:39', '添加信息(图片新闻4444)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('aaeb7b2c-deb6-4caf-908f-26d24a322f87', 'admin', '2016-04-23 16:40:20', '登录系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('ac118551-3248-430e-902f-391538084e13', 'admin', '2016-04-23 12:43:51', '信息页静态化:贺北京-北京市红话筒分校成立', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('aca06cd8-616c-4f25-8f10-d52c89f06da8', 'admin', '2016-04-23 15:18:32', '添加信息(2015暑期全国语言朗诵考级正式启动)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('acfcd0f5-6147-4ffe-96c1-6fcb7730dc52', 'admin', '2016-05-02 17:26:32', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('ad650329-d439-4ad3-878d-2ce639627ee4', 'admin', '2016-05-26 16:36:48', '添加信息(喂故事书长大的孩子)失败:org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'recommendreason,suitage,depth\n      )\n    values (\'980acd5d-3db5-4f0a-a922-76ab9\' at line 9\r\n### The error may involve cn.freeteam.cms.dao.InfoMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'recommendreason,suitage,depth\n      )\n    values (\'980acd5d-3db5-4f0a-a922-76ab9\' at line 9', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('adfa0d23-7188-437c-913b-4b55886db0f5', 'admin', '2016-05-02 17:26:44', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('b079cf01-a585-4131-8262-9617d920977a', 'admin', '2016-05-26 16:34:37', '信息页静态化:圣诞节的礼物', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('b103ec0a-119f-41e0-baed-d50c038d3afa', 'admin', '2016-04-23 15:16:31', '添加信息(2016年红话筒冬令营（魅力海南）活动启动)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('b122852c-47b3-4e15-94b6-a3ed1218c22b', 'admin', '2016-04-23 13:42:04', '更新信息(图片新闻3333)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('b1a20d44-ea59-4d79-9421-c4aec2ab13e7', 'admin', '2016-04-23 14:21:22', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('b1c03b5e-964d-40d7-a3ba-2dc20a1145d0', 'admin', '2016-05-02 16:52:03', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('b1f4fda4-3d62-46bc-8514-bc3e8cd2b4e0', 'admin', '2016-04-23 15:44:19', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('b20d92f3-e10a-4417-82c4-8a11e62b9d8f', 'admin', '2016-05-26 16:51:52', '栏目静态化:罗宾逊绘本 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('b21c5b21-ffbc-41e1-b5b2-1d803f4c872e', 'admin', '2016-05-26 16:16:55', '栏目静态化:优秀盟校 第2页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('b334b436-b830-439b-a34e-b78f7b9e7b0e', 'admin', '2016-04-23 13:36:31', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('b487e7e7-cdf4-4e0a-8ddc-572fc91d13af', 'admin', '2016-05-26 16:12:57', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('b4eb8f1a-ab6b-4421-a406-cfa91e7968c9', 'admin', '2016-05-26 16:41:50', '栏目静态化:罗宾逊绘本 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('b52b47a7-32fb-48f2-b1b1-720975588039', 'admin', '2016-03-26 16:44:15', '登录系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('b54d7d0a-9e34-439a-89ff-0931d368f04f', 'admin', '2016-05-26 16:40:18', '信息页静态化:圣诞节的礼物', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('b57e08b9-a239-4e8f-90f6-8460b2035fc8', 'admin', '2016-04-23 15:19:23', '添加信息(《2015全国语言教师教学风采大赛》晋级名单)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('b5846cc7-b5ca-4318-94fa-327aef83e593', 'admin', '2016-05-26 15:54:28', '栏目静态化:罗宾逊绘本 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('b64cf3c9-c057-47b0-b180-78cfa125bfe9', 'admin', '2016-03-26 16:27:59', '添加栏目 幼儿园教育', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('b6ab6645-4132-4325-a017-40b4bd3d5d6f', 'admin', '2016-04-23 10:23:19', '更新栏目 作文天地', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('b81d8de7-b2af-4956-b111-ce412bb8d531', 'admin', '2016-04-23 14:38:28', '添加信息(幼儿口才系列盘)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('b838952c-1b3a-4029-af06-211e7133f5e8', 'admin', '2016-04-23 15:05:22', '信息页静态化:幼儿口才系列盘', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('b89a6ee6-2b83-4489-a9a4-8ddd9ec1f311', 'admin', '2016-05-26 14:39:24', '添加信息(圣诞节的礼物)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('b8f84e8c-3a64-44bc-bb2d-4f374d011edd', 'admin', '2016-04-23 14:42:50', '添加信息(礼仪课堂)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('b8ff1a4e-155a-4c98-8cdf-306d2a4f40d4', 'admin', '2016-05-02 17:42:26', '登录系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('b9a6215d-c6cb-4f46-aa3b-1d92efb08f0c', 'admin', '2016-05-26 16:04:44', '信息页静态化:圣诞节的礼物', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('b9c4e21d-c8c4-4fef-a032-82a4dbb36435', 'admin', '2016-04-23 14:40:08', '添加信息(童话剧课堂)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('b9e14399-a423-420c-a13b-9b8cbc78bd4e', 'admin', '2016-04-23 17:35:24', '栏目静态化:新闻中心 第2页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('ba65fa9e-ab37-402b-99fa-1cf7b8b933e6', 'admin', '2016-04-23 15:18:47', '添加信息(2015 CCTV红话筒全国青少年儿童电视小主持人才艺大赛)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('bae60c1b-9aed-49d9-9eaf-38559eab9e4b', 'admin', '2016-04-23 13:34:52', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('bd4592f4-6f64-4f35-bb2f-8af8cb2d6825', 'admin', '2016-05-02 17:46:23', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('be2b1b3c-b31e-4aa6-a584-17a335e9e42e', 'admin', '2016-04-23 12:38:13', '信息页静态化:贺河北-石家庄市红话筒分校成立', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('bea6da4c-5753-4b6d-9165-8c55e293f773', 'admin', '2016-04-23 10:17:57', '添加栏目 罗宾逊绘本', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('bef32223-bba5-4054-95c8-61bcf586a5c3', 'admin', '2016-04-23 15:08:08', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('bf03c69d-97e6-4087-a68b-23d5a445c449', 'admin', '2016-04-23 14:43:56', '信息页静态化:少儿口才与主持强化版', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('bf6f860f-c006-4043-b77b-af83341ed45c', 'admin', '2016-04-23 13:40:31', '添加信息(图片新闻2222)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('bf7c4f59-6dca-4e3b-93f7-19dc7acf98e1', 'admin', '2016-05-26 16:41:46', '信息页静态化:圣诞节的礼物', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('c11154e5-639b-47e6-b19f-6e18851f2534', 'admin', '2016-04-23 15:02:39', '更新信息(幼儿口才系列盘)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('c17cd018-3ee4-405b-964b-e588c3559c7c', 'admin', '2016-03-26 16:32:39', '更新栏目 作文天地', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('c199af1a-7397-4c94-80f5-7ac606a38f3e', 'admin', '2016-04-23 12:00:59', '添加栏目 谷歌', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('c1a8503b-b1bd-4b15-8ca7-76f8df0cca63', 'admin', '2016-04-23 15:44:07', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('c1c0ef1c-7c37-4972-a4b7-6ef98069be73', 'admin', '2016-05-26 16:07:12', '登录系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('c1cde697-b94b-4425-b94d-a35c33974845', 'admin', '2016-04-23 15:20:36', '信息页静态化:中国红，红话筒，话筒赢天下！我们的话筒，我们的声音，我们的舞台！2015暑假全国语言朗诵考级正式启动！', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('c241fb05-866b-4a6a-92d7-06ec37548b95', 'admin', '2016-05-26 15:48:24', '登录系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('c299e99d-4dd3-49de-8bec-d10fb9fde837', 'admin', '2016-04-23 12:38:13', '信息页静态化:贺山东-济南市红话筒分校成立', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('c2b47075-c4f9-4238-bcba-bd4776f0125b', 'admin', '2016-05-26 16:05:41', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('c2c6a70c-6b18-41a2-a93d-602c43d9258e', 'admin', '2016-05-02 13:11:03', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('c313bd1e-62c7-45d9-91b0-28b78233c0bb', 'admin', '2016-03-26 16:31:46', '添加栏目 绘本库', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('c35b14c7-8c39-48af-81cf-a1f0bf90b675', 'admin', '2016-04-23 12:59:43', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('c40bd65d-0ddb-4d68-823f-14a5f5d70e9b', 'admin', '2016-04-23 14:57:23', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('c433a7d2-5314-44d8-82c4-924d600a2de2', 'admin', '2016-04-23 12:32:29', '更新栏目 优秀盟校', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('c47d9247-9c46-4581-bd8e-b3e62f1d511e', 'admin', '2016-04-23 14:43:56', '信息页静态化:幼儿口才与主持基础版', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('c4f4f599-9e71-4aba-b317-4a8a04420e5a', 'admin', '2016-05-26 16:04:20', '登录系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('c5a7f381-fb32-4cae-b1d0-582b20a6f50c', 'admin', '2016-05-26 15:51:32', '栏目静态化:罗宾逊绘本 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('c622ef41-bce6-41d9-9ab6-54f0104ab630', 'admin', '2016-04-23 12:38:13', '信息页静态化:贺英国-曼彻斯特市红话筒分校成立', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('c6492cca-0219-4396-b997-6d92dd13a637', 'admin', '2016-04-23 12:12:51', '添加模板(edu)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('c693fd38-df88-4107-b6cc-c36eafab4435', 'admin', '2016-04-23 17:36:43', '栏目静态化:新闻中心 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('c6a6f221-5d71-44a5-8fee-d66d94b8aa08', 'admin', '2016-04-23 15:20:36', '信息页静态化:中国红话筒教育千家分校共贺新春', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('c6fcb97e-bf1d-4ff1-ab67-d9ca890b52f9', 'admin', '2016-04-23 13:42:10', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('c72e660c-02e6-4083-83b7-dd227cf22ceb', 'admin', '2016-04-23 10:16:14', '登录系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('c737a71f-8dcc-4177-96d9-b42d59f8af90', 'admin', '2016-05-26 16:34:30', '栏目静态化:优秀盟校 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('c7a62fa0-983a-4e5f-a88a-10690d120d6f', 'admin', '2016-05-26 16:40:19', '信息页静态化:雪人', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('c870ca62-b7c2-42ce-a3f3-0190998e8c1d', 'admin', '2016-04-23 12:35:20', '添加信息(贺山东-济南市红话筒分校成立)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('c8d33563-ce71-4459-b9a5-7f3e107ef1b5', 'admin', '2016-04-23 16:07:57', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('c91683fe-4915-4331-b0c6-23f26cb29620', 'admin', '2016-04-23 15:05:34', '信息页静态化:童话剧课堂', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('c9991a68-d8b6-48e5-942a-e2b4aa6eae97', 'admin', '2016-05-02 17:26:41', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('ca566645-7d39-44fa-8107-ba4c73c4a61d', 'admin', '2016-05-26 16:34:13', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('cb3d8983-f911-4044-a79f-4e4157b64614', 'admin', '2016-04-23 16:08:04', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('cd10033d-461c-4623-9cb2-b023050bac69', 'admin', '2016-05-02 17:32:18', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('cd27d715-825b-4129-ad8f-51caed87059c', 'admin', '2016-04-23 16:10:17', '更新栏目 新闻中心', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('ce20923e-4de7-4c83-9f2c-fd50104867bf', 'admin', '2016-04-23 15:05:35', '信息页静态化:动漫口才课堂', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('ce60bd40-f11a-4b58-933b-e1ab0f79e1e5', 'admin', '2016-03-26 16:28:25', '添加栏目 小学教育', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('ce78ab7d-b6fe-490e-a82a-d7e11d371001', 'admin', '2016-04-23 14:22:26', '修改模板文件(templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/index.shtml)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('cef3a583-908c-42d1-9b5c-eb320022f3ce', 'admin', '2016-04-23 15:20:41', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('cfcc1927-26e9-44de-8e8b-3b1abd36cf38', 'admin', '2016-04-23 12:37:52', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('cffac3fd-dda1-4041-96c4-e331f3b37ad7', 'admin', '2016-04-23 15:16:45', '添加信息(2015下半年全国语言朗诵考级启动通知)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('d27d3252-f901-45fd-a74d-8ab18e003e91', 'admin', '2016-05-26 16:53:59', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('d2c0cfc1-a1e0-4b66-9143-31eb95a6b674', 'admin', '2016-04-23 16:08:08', '栏目静态化:新闻中心 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('d3619159-56a0-489b-8752-df16db0a2d28', 'admin', '2016-04-23 14:44:04', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('d38e4919-e782-4511-b75d-49f42cc37cb2', 'admin', '2016-04-23 16:43:06', '更新信息(图片新闻4444)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('d47d7d66-8bf1-464c-a032-81858214c640', 'admin', '2016-04-23 17:38:57', '栏目静态化:新闻中心 第4页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('d51c4970-0154-45da-ac29-8cae5fb54eb4', 'admin', '2016-04-23 16:09:50', '更新栏目 新闻中心', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('d525a5dc-631b-4fe3-84d6-bad1ec260419', 'admin', '2016-04-23 13:34:45', '添加模板(edu)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('d590dc1c-61ea-4981-8f6c-272cc26c1eb2', 'admin', '2016-04-23 17:38:57', '栏目静态化:新闻中心 第2页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('d5bac90e-617c-43b5-aeb9-1f91b69941da', 'admin', '2016-04-23 15:03:03', '更新信息(少儿强化系列盘)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('d6094db1-f362-496e-8191-4258b2e4bbec', 'admin', '2016-03-26 16:28:49', '添加栏目 初中教育', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('d67fc748-5fd0-4edd-86da-8cf148ccc867', 'admin', '2016-04-23 15:16:31', '添加信息(2016年红话筒冬令营（魅力海南）活动启动)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('d7dcf072-af4a-4686-9ead-7f34255db682', 'admin', '2016-04-23 15:43:58', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('d879d7da-9eaf-4f46-8514-a705fe5ca9ef', 'admin', '2016-05-26 16:49:20', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('d8b054e6-6985-4c9a-af41-abfcaf9db1be', 'admin', '2016-04-23 17:36:43', '栏目静态化:新闻中心 第2页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('da038d52-7c58-4f87-acf2-c084e931846c', 'admin', '2016-04-23 12:43:52', '信息页静态化:贺英国-曼彻斯特市红话筒分校成立', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('daa6fee6-2dfb-45e4-8501-15bc2608f3de', 'admin', '2016-04-23 12:50:53', '修改模板文件(templet/dfa2ebb6-42ef-4b79-9449-e39f6bdbf11d/inc/index_header.shtml)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('dba916fc-420a-444f-9e44-9655bdb4aa65', 'admin', '2016-04-23 12:30:23', '添加信息(贺河南-新乡市红话筒分校成立)失败:java.io.FileNotFoundException: Template templet/dfa2ebb6-42ef-4b79-9449-e39f6bdbf11d/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('dcc199b2-50be-4567-8574-ece7417ffa8e', 'admin', '2016-05-26 16:40:12', '栏目静态化:优秀盟校 第2页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('dcc3d222-67c4-4f7d-a847-1d44d92c5a8a', 'admin', '2016-05-26 14:35:59', '删除栏目 null', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('de093f91-4156-416b-aaaa-c7f511141ca9', 'admin', '2016-05-26 15:45:49', '栏目静态化:罗宾逊绘本 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('ded3d78b-677d-49a9-9a10-4b368839e335', 'admin', '2016-05-26 14:53:42', '更新信息(圣诞节的礼物)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('df08149d-0ae6-40cf-911b-33461e91d969', 'admin', '2016-05-08 14:22:46', '登录系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('df88d599-7e4e-4f79-85b2-97af6f600439', 'admin', '2016-04-23 12:43:52', '信息页静态化:贺河北-石家庄市红话筒分校成立', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('e0395a76-ddf3-4dbd-abc9-9bc03cc99fec', 'admin', '2016-05-26 16:34:30', '栏目静态化:口才教育 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('e0a444e5-cbde-46e4-811e-3ce623735b80', 'admin', '2016-04-23 12:59:35', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('e14b20f5-9334-452d-aac8-d516351d0f7d', 'admin', '2016-05-26 16:41:35', '更新信息(雪人)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('e151cb34-7765-4026-8b82-4e89e6c30b34', 'admin', '2016-04-23 13:31:19', '删除模板(edu)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('e1853be9-0c86-4caa-b09b-6662fcfc6dea', 'admin', '2016-05-26 16:47:31', '栏目静态化:优秀盟校 第2页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('e24148a7-a86e-4d09-80d5-38dabf89c2bb', 'admin', '2016-05-26 16:34:31', '栏目静态化:优秀盟校 第2页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('e253b446-cf04-40f6-bc47-e07da6454df2', 'admin', '2016-04-23 15:07:52', '修改模板文件(templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/index.shtml)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('e351c71e-b25a-4655-9fcb-78842fe6a0ab', 'admin', '2016-05-26 16:08:45', '信息页静态化:圣诞节的礼物', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('e365de68-eb88-41a9-92f5-1b0e4a3bd7c7', 'admin', '2016-05-26 15:51:14', '登录系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('e3c2be7c-5893-4d4a-96e4-13ead6e7dc9e', 'admin', '2016-04-23 15:15:52', '添加信息(2016年上半年全国教师培训认证会报名倒计时)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('e40f25dc-0674-4cfe-9e16-cc91f22ea3a3', 'admin', '2016-03-26 15:36:59', '登录系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('e4624a5b-97ca-4bc4-8984-9f8d49b421a1', 'admin', '2016-04-23 17:38:57', '栏目静态化:新闻中心 第5页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('e542d727-0def-4ea2-b44d-6202f244f0b8', 'admin', '2016-04-23 17:38:51', '更新栏目 新闻中心', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('e542f544-c176-434b-9875-52eef130e8db', 'admin', '2016-05-26 15:48:52', '更新栏目 罗宾逊绘本', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('e5538b2a-57de-46ce-890e-f4ac47449e91', 'admin', '2016-05-26 16:48:11', '信息页静态化:雪人', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('e5f08254-2625-40d6-9ff4-a0c8dc211ed1', 'admin', '2016-03-26 16:44:11', '退出系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('e6893d59-7042-47d9-97b3-e2303f206e32', 'admin', '2016-05-26 16:08:28', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('e6a2e32f-20f4-431c-8925-38c8031e6cdc', 'admin', '2016-05-26 16:04:34', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('e6fc7bc5-73da-453d-82b4-34908847409b', 'admin', '2016-04-23 15:20:37', '信息页静态化:2015全国红话筒央视CCTV青少年电视儿童大赛圆满落幕！', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('e712a90e-e3b7-454d-bf0e-17e1735e37a7', 'admin', '2016-05-26 16:49:40', '栏目静态化:罗宾逊绘本 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('e79493c0-96fc-4507-b583-3a131b11ad89', 'admin', '2016-04-23 14:42:29', '添加信息(口语交际经典课例)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('e797f20d-bb31-4bc0-be8c-2c744303f37e', 'admin', '2016-05-26 16:38:28', '登录系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('e7ea72b4-cb2e-4636-ace2-65a425947a65', 'admin', '2016-04-23 12:34:01', '添加信息(贺河北-石家庄市红话筒分校成立)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('e81748e2-712f-4973-9189-cdd323a4c117', 'admin', '2016-05-26 16:13:06', '栏目静态化:罗宾逊绘本 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('e8327b0e-6f24-40cb-ad90-8251ca768878', 'admin', '2016-04-23 10:21:49', '添加栏目 初升高', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('e8d872cc-fd35-437b-bbe8-c7af5dcf14e0', 'admin', '2016-05-26 16:48:26', '栏目静态化:罗宾逊绘本 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('e94fa5d4-7e20-4c77-bddd-c376bbeaf2ba', 'admin', '2016-04-23 15:05:34', '信息页静态化:少儿口才与主持强化版', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('e9fb1355-5f71-48eb-87d7-fc53eb6d60c2', 'admin', '2016-04-23 14:43:56', '信息页静态化:口语交际经典课例', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('ea6c30bc-6fea-4735-875d-ca326b010042', 'admin', '2016-04-23 14:57:02', '修改模板文件(templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/resources/css/index.css)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('eb2a6f1f-60f4-4b31-8f55-bc16ff7c993f', 'admin', '2016-04-23 12:43:55', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('ecfd9f4f-7b92-47a1-93d5-7bfbca14d706', 'admin', '2016-05-26 15:48:59', '栏目静态化:罗宾逊绘本 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('ed4a2bcb-b514-4cba-8d26-cc715ed37397', 'admin', '2016-04-23 15:05:34', '信息页静态化:少儿精华系列盘', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('edcd953a-887c-4f8f-ba63-92b9277329e8', 'admin', '2016-05-26 14:53:42', '更新信息(圣诞节的礼物)失败:java.io.FileNotFoundException: Template templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/info.shtml not found.', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('ee33a5f6-7a4e-462f-85f9-9ca3c417616c', 'admin', '2016-04-23 15:44:15', '栏目静态化:新闻中心 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('ee7a3727-179a-43fa-9dde-3020fc0a48d8', 'admin', '2016-04-23 12:36:40', '信息页静态化:贺英国-曼彻斯特市红话筒分校成立', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('efdedf62-ce99-44d7-95ac-44ddc21f8930', 'admin', '2016-04-23 17:36:44', '栏目静态化:新闻中心 第8页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('f0a66fbb-c109-4129-a684-3bdadd6e6375', 'admin', '2016-04-23 15:18:17', '添加信息(2015央视CCTV小主持人大赛红话筒分校晋级决赛名单及节目单)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('f1dce760-a9d8-49da-81e9-b5733dadbd5b', 'admin', '2016-04-23 10:23:59', '更新栏目 优秀盟校', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('f205acf5-d4cc-43c6-9954-2af4f55628f8', 'admin', '2016-04-23 15:05:38', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('f242c35a-3708-473d-9f08-48c5afff3e5d', 'admin', '2016-05-26 16:47:31', '栏目静态化:优秀盟校 第3页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('f298973d-7a3e-48c6-b8bc-fbe97feba48c', 'admin', '2016-05-26 16:48:10', '更新信息(雪人)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('f29a21e9-4d3b-4f55-ba86-9f5d6fa48ea7', 'admin', '2016-04-23 17:28:45', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('f305ae7d-65da-4e07-9321-962b2757d677', 'admin', '2016-04-23 12:30:23', '添加信息(贺河南-新乡市红话筒分校成立)成功', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('f33164b3-e179-4c8d-b20b-a203d27aafbc', 'admin', '2016-04-23 14:58:43', '修改模板文件(templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/index.shtml)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('f3982518-8972-411c-9e5a-8e8a6f0294f5', 'admin', '2016-04-23 15:20:36', '信息页静态化:关于2015《全国语言教师培训交流认证会》的通知', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('f4284efe-083f-4521-a644-08fc494b8574', 'admin', '2016-04-23 16:40:56', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('f45e8a49-c35c-4f04-91ee-2740257ad141', 'admin', '2016-04-23 17:38:58', '栏目静态化:新闻中心 第8页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('f4dff203-8996-4092-a8b4-4750ac6e3396', 'admin', '2016-04-23 14:45:31', '修改模板文件(templet/038d670b-a7e2-476c-966d-d8a12b7ab9ea/index.shtml)成功!', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('f503be2f-6fb1-49b3-b0df-929dc05e3782', 'admin', '2016-05-02 17:37:32', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('f55ecaf6-3f83-4595-87ce-2841ee6bc96f', 'admin', '2016-04-23 15:20:36', '信息页静态化:2016年上半年全国教师培训认证会报名倒计时', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('f5a49484-ba33-4582-ba65-cd95d1700df0', 'admin', '2016-04-23 16:20:31', '更新栏目 新闻中心', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('f5d16b5b-aa75-42b3-852e-7fce22caaf92', 'admin', '2016-04-23 12:43:51', '信息页静态化:贺美国-达拉斯市红话筒分校成立', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('f5f04633-9312-4b88-8423-530146de937c', 'admin', '2016-04-23 10:23:55', '更新栏目 初升高', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('f6afc4ba-06b6-4d7f-8a2b-09db98de99a0', 'admin', '2016-04-23 12:35:49', '信息页静态化:贺日本-东京市红话筒分校成立', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('f7342f48-7b63-49c1-825d-4866beaec72c', 'admin', '2016-05-26 16:34:30', '栏目静态化:罗宾逊绘本 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('f7b638c8-bbce-45ab-8e84-858c82783e04', 'admin', '2016-04-23 10:23:31', '更新栏目 舞蹈', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('f8997f54-f5ba-436d-a426-6133d82f15c2', 'admin', '2016-05-26 15:51:28', '首页静态化:中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('f8ba9ea2-c9db-427a-9f74-2545db7109f2', 'admin', '2016-04-23 15:05:34', '信息页静态化:口语交际经典课例', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('f94ca5ae-7d0f-4513-96c6-508b200f8723', 'admin', '2016-04-23 16:41:29', '栏目静态化:新闻中心 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('fc291aca-0893-4120-9cca-f95a73dc7901', 'admin', '2016-04-23 10:21:29', '添加栏目 小升初', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('fc7a75cc-b4c1-4d33-b59c-80202a0ad83c', 'admin', '2016-05-26 16:16:55', '栏目静态化:优秀盟校 第4页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('fd032ccd-4dae-4750-9c5f-812ab1125a40', 'admin', '2016-04-23 12:36:57', '信息页静态化:贺日本-东京市红话筒分校成立', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('fe3f8aaf-e2c4-4edd-ac0a-71a403e2211c', 'admin', '2016-05-26 16:18:20', '栏目静态化:口才教育 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('fe8b0a6c-ec54-4041-b625-f62d566833b2', 'admin', '2016-04-23 15:05:34', '信息页静态化:幼儿口才系列盘', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('fefb6276-027c-41e0-8b3f-c4940d084b2a', 'admin', '2016-05-26 15:54:06', '登录系统', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('feffcef2-b1ea-4b1f-9aae-417b26f71126', 'admin', '2016-05-08 14:23:10', '站点设置 中国儿童教育网', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('ff981a22-eaea-4485-9061-8a01a440e364', 'admin', '2016-04-23 16:18:23', '栏目静态化:优秀盟校 第1页', '127.0.0.1');
INSERT INTO `freecms_operlogs` VALUES ('ffce4a04-c2cb-4fbe-8a74-d09d1cc64bf6', 'admin', '2016-04-23 13:38:50', '更新信息(图片新闻1111)成功', '127.0.0.1');

-- ----------------------------
-- Table structure for `freecms_question`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_question`;
CREATE TABLE `freecms_question` (
  `id` varchar(50) NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `detail` varchar(1000) DEFAULT NULL,
  `selecttype` char(1) DEFAULT NULL,
  `isok` char(1) DEFAULT NULL,
  `siteid` varchar(50) DEFAULT NULL,
  `adduser` varchar(50) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_site_question` (`siteid`),
  CONSTRAINT `FK_site_question` FOREIGN KEY (`siteid`) REFERENCES `freecms_site` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网上调查';

-- ----------------------------
-- Records of freecms_question
-- ----------------------------

-- ----------------------------
-- Table structure for `freecms_report`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_report`;
CREATE TABLE `freecms_report` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `unit` varchar(100) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `filenum` varchar(100) DEFAULT NULL,
  `linkman` varchar(100) DEFAULT NULL,
  `issuer` varchar(100) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `attch` varchar(1000) DEFAULT NULL,
  `querycode` varchar(20) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `state` char(1) DEFAULT NULL,
  `recontent` varchar(1000) DEFAULT NULL,
  `retime` datetime DEFAULT NULL,
  `proflow` varchar(200) DEFAULT NULL,
  `userid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线申报';

-- ----------------------------
-- Records of freecms_report
-- ----------------------------

-- ----------------------------
-- Table structure for `freecms_resume`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_resume`;
CREATE TABLE `freecms_resume` (
  `id` varchar(50) NOT NULL,
  `siteid` varchar(50) DEFAULT NULL,
  `memberid` varchar(50) DEFAULT NULL,
  `membername` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `qq` varchar(50) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `attch` varchar(100) DEFAULT NULL,
  `job` varchar(100) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `recontent` varchar(1000) DEFAULT NULL,
  `retime` datetime DEFAULT NULL,
  `reuserid` varchar(50) DEFAULT NULL,
  `reusername` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简历';

-- ----------------------------
-- Records of freecms_resume
-- ----------------------------

-- ----------------------------
-- Table structure for `freecms_roles`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_roles`;
CREATE TABLE `freecms_roles` (
  `id` varchar(36) NOT NULL DEFAULT 'newid()',
  `name` varchar(100) NOT NULL,
  `isOk` char(1) NOT NULL,
  `adduser` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of freecms_roles
-- ----------------------------
INSERT INTO `freecms_roles` VALUES ('d5a82b5b-f0ba-4c7e-8554-26d88ee70a22', '站点管理员', '1', 'admin');
INSERT INTO `freecms_roles` VALUES ('db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '管理员', '1', null);

-- ----------------------------
-- Table structure for `freecms_role_channel`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_role_channel`;
CREATE TABLE `freecms_role_channel` (
  `id` varchar(50) NOT NULL,
  `roleid` varchar(50) DEFAULT NULL,
  `channelid` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_17` (`roleid`),
  KEY `FK_Reference_18` (`channelid`),
  CONSTRAINT `FK_Reference_17` FOREIGN KEY (`roleid`) REFERENCES `freecms_roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Reference_18` FOREIGN KEY (`channelid`) REFERENCES `freecms_channel` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色_栏目';

-- ----------------------------
-- Records of freecms_role_channel
-- ----------------------------

-- ----------------------------
-- Table structure for `freecms_role_func`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_role_func`;
CREATE TABLE `freecms_role_func` (
  `id` varchar(36) NOT NULL DEFAULT 'newid()',
  `roleId` varchar(36) NOT NULL,
  `funcId` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_角色_功能__功能` (`funcId`),
  KEY `FK_角色_功能__角色` (`roleId`),
  CONSTRAINT `FK_角色_功能__角色` FOREIGN KEY (`roleId`) REFERENCES `freecms_roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_角色_功能__功能` FOREIGN KEY (`funcId`) REFERENCES `freecms_func` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色_功能';

-- ----------------------------
-- Records of freecms_role_func
-- ----------------------------
INSERT INTO `freecms_role_func` VALUES ('011d8fd6-fd0c-4207-a6e0-648f06cf48d9', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '2b89c1fd-9e85-40d0-9ad8-9d401526d8fe');
INSERT INTO `freecms_role_func` VALUES ('058bce5a-cd3b-4b73-bb5f-6eeef36fb326', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '95088cf5-299d-495a-896e-b3eae1a404c0');
INSERT INTO `freecms_role_func` VALUES ('0ca42f48-c62b-4d3b-8dab-1343519051b8', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '47b80631-bb6e-4abd-8e47-5b99bce8b3bd');
INSERT INTO `freecms_role_func` VALUES ('11351937-f2e3-4f10-9b9b-2cdc1babbbd7', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '5f3a8e01-4216-4982-b07b-ad367fe9ef96');
INSERT INTO `freecms_role_func` VALUES ('150d09ee-c23a-46d2-8aaf-0b9c1bee4e2f', 'd5a82b5b-f0ba-4c7e-8554-26d88ee70a22', '64f2084d-3fe7-4345-85c6-4dc835c1b939');
INSERT INTO `freecms_role_func` VALUES ('1b7434e5-2f7e-4b77-bb0e-016c211d47e7', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', 'df4647eb-8758-451c-bdcd-54c2d180c474');
INSERT INTO `freecms_role_func` VALUES ('1e9c224b-a4fe-465e-972f-724c5651807f', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '425d0211-0196-4456-a24b-3e8d614dec8b');
INSERT INTO `freecms_role_func` VALUES ('210ba1a3-7a2e-4f86-b419-ec20c97d0a54', 'd5a82b5b-f0ba-4c7e-8554-26d88ee70a22', '0bec6b84-19be-4d99-bc44-ca1d8472148f');
INSERT INTO `freecms_role_func` VALUES ('213b1ac5-116d-4166-9c32-9facd4b1a98b', 'd5a82b5b-f0ba-4c7e-8554-26d88ee70a22', 'cb42d736-3386-42b8-a9f7-62840c4ecefa');
INSERT INTO `freecms_role_func` VALUES ('2297cae4-a395-4cab-9af1-1f78d459a523', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '742470cc-eaf1-48c4-805c-44c9936a7622');
INSERT INTO `freecms_role_func` VALUES ('263bc6bd-f274-4f1b-9191-b3b8d0c95152', 'd5a82b5b-f0ba-4c7e-8554-26d88ee70a22', '67705234-603a-47c7-8f0d-8cdd349fd7c6');
INSERT INTO `freecms_role_func` VALUES ('2b334331-7a66-4b5c-bd12-ac98109eb8e1', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '67025758-eb65-40b1-a59c-edee1b3ae938');
INSERT INTO `freecms_role_func` VALUES ('2ff19fe8-b5c7-42a3-ad35-02f5caf187e2', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '5257f8fd-9da2-4e83-8538-b6ffca22e45a');
INSERT INTO `freecms_role_func` VALUES ('3445c49f-d17a-43c4-a8f2-e56c35794aca', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', 'a5452f4f-1a1b-4980-90a3-4a60a38ba373');
INSERT INTO `freecms_role_func` VALUES ('37f10813-6e90-42a4-b2bc-32727fc8302b', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '969d27f9-71f8-4cb8-a1bd-6343fe32bbb1');
INSERT INTO `freecms_role_func` VALUES ('393cbffc-2d21-4203-8f27-ac8a40411932', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '66ecf6f7-1911-4e7e-8089-3a01f44a6d12');
INSERT INTO `freecms_role_func` VALUES ('438df26e-94ee-454d-acc0-fd56cddb0bf9', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', 'cb42d736-3386-42b8-a9f7-62840c4ecefa');
INSERT INTO `freecms_role_func` VALUES ('4676138f-1a2e-43b1-a8d4-d8fdb6afa878', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '19eebfb0-16b5-40eb-a909-1bd37ef7d745');
INSERT INTO `freecms_role_func` VALUES ('4cd0268a-2afd-4138-8415-78e36463b92b', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '88749e6a-a8ec-47ef-aa4a-f7912d0ed12c');
INSERT INTO `freecms_role_func` VALUES ('4d8f5c3f-2171-4ba8-8183-478edd4749c0', 'd5a82b5b-f0ba-4c7e-8554-26d88ee70a22', '88749e6a-a8ec-47ef-aa4a-f7912d0ed12c');
INSERT INTO `freecms_role_func` VALUES ('4dd72e33-2afd-40c5-8c5c-2b6cebb8d067', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '003c47c5-7041-4cfa-8631-82c00ab3fb35');
INSERT INTO `freecms_role_func` VALUES ('56be2722-f688-4f39-9b08-41b943183b3b', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '0af2a5d9-26e6-4b82-a07c-062a35b3a7e5');
INSERT INTO `freecms_role_func` VALUES ('5b4fa9b1-3dac-4547-8169-76f450e9e85a', 'd5a82b5b-f0ba-4c7e-8554-26d88ee70a22', '5a47681c-63c3-47b1-8e1f-34d4dbba7d85');
INSERT INTO `freecms_role_func` VALUES ('5b580be5-4552-495c-b503-49f326e55b68', 'd5a82b5b-f0ba-4c7e-8554-26d88ee70a22', '08cfd343-2803-403e-b952-f7d41199d8e1');
INSERT INTO `freecms_role_func` VALUES ('5ef90f9d-8cf3-42a8-a6eb-0091f3b52d54', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', 'ea3034c4-5a98-4a8a-a175-7c43e42aa939');
INSERT INTO `freecms_role_func` VALUES ('60300c12-a38e-4968-8848-35e4a8c758b4', 'd5a82b5b-f0ba-4c7e-8554-26d88ee70a22', '47b80631-bb6e-4abd-8e47-5b99bce8b3bd');
INSERT INTO `freecms_role_func` VALUES ('60a5e528-31bb-4b2d-9047-efcf4b5c9b0e', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '26622672-9a10-4e4e-93a7-7fe50a9208b3');
INSERT INTO `freecms_role_func` VALUES ('6100e3ba-4e2e-47e7-8f64-d2b2db0335a9', 'd5a82b5b-f0ba-4c7e-8554-26d88ee70a22', '18974989-cd85-48b2-8169-348bc3481ef8');
INSERT INTO `freecms_role_func` VALUES ('63d716ed-a17f-4144-ba14-1475972dcf8c', 'd5a82b5b-f0ba-4c7e-8554-26d88ee70a22', '742470cc-eaf1-48c4-805c-44c9936a7622');
INSERT INTO `freecms_role_func` VALUES ('64241dc0-fda4-4f58-8c17-75b0ab48f2db', 'd5a82b5b-f0ba-4c7e-8554-26d88ee70a22', 'e01bb9aa-b122-41ac-b28c-e97993c2d250');
INSERT INTO `freecms_role_func` VALUES ('7328120e-7241-44c6-a852-54267155e187', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '18974989-cd85-48b2-8169-348bc3481ef8');
INSERT INTO `freecms_role_func` VALUES ('738d4447-b9c7-43bc-a2e6-6ffcdf4d1ff1', 'd5a82b5b-f0ba-4c7e-8554-26d88ee70a22', 'c0ac116b-2b2a-4a09-ba25-0c2fffc12b4d');
INSERT INTO `freecms_role_func` VALUES ('813b6de1-8d96-4a0e-be6b-89348a36f05c', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '08cfd343-2803-403e-b952-f7d41199d8e1');
INSERT INTO `freecms_role_func` VALUES ('8aa8f12b-de3b-412d-89c4-c8dd94118b77', 'd5a82b5b-f0ba-4c7e-8554-26d88ee70a22', '26622672-9a10-4e4e-93a7-7fe50a9208b3');
INSERT INTO `freecms_role_func` VALUES ('8ffc46e4-14fb-4ba9-887e-fb372e4caaec', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '0bec6b84-19be-4d99-bc44-ca1d8472148f');
INSERT INTO `freecms_role_func` VALUES ('92ad4f3a-ef23-4521-aad4-39dab6f4efd4', 'd5a82b5b-f0ba-4c7e-8554-26d88ee70a22', '6c561fe7-2013-4ce5-bf9a-42874b07a99e');
INSERT INTO `freecms_role_func` VALUES ('a2b3a078-d673-4752-ad0f-4c3bc9d18f37', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '58fe298f-b448-40bb-a1c0-d81134efa4af');
INSERT INTO `freecms_role_func` VALUES ('a73eb267-54d8-4b61-b35f-0f2d97947971', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '14a4e894-1a48-4145-b467-0fe0499e8758');
INSERT INTO `freecms_role_func` VALUES ('ac8e469d-07c1-42b2-8a88-f5a256f9f98e', 'd5a82b5b-f0ba-4c7e-8554-26d88ee70a22', 'e3066945-edb5-43ca-b29a-a0f96f98a50e');
INSERT INTO `freecms_role_func` VALUES ('b2044d86-d02c-4342-945b-7ff6ee574b54', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', 'e63b222f-3ccb-4e22-b8ab-7cd0dece9f06');
INSERT INTO `freecms_role_func` VALUES ('b25fc673-7ff0-4c34-af9b-efcdd683a2d4', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '12187d67-5ab9-4ae4-bbee-9a772cebd0de');
INSERT INTO `freecms_role_func` VALUES ('b32ef6ec-c490-4388-8da0-391145a8e55a', 'd5a82b5b-f0ba-4c7e-8554-26d88ee70a22', '425d0211-0196-4456-a24b-3e8d614dec8b');
INSERT INTO `freecms_role_func` VALUES ('b39566ed-77e9-4cbf-89b5-4762d7122be3', 'd5a82b5b-f0ba-4c7e-8554-26d88ee70a22', 'f0709c68-3af5-413b-8503-0f0bc2a3eb74');
INSERT INTO `freecms_role_func` VALUES ('bc7dfd13-29db-4dfc-9abc-0dc82f3ad7db', 'd5a82b5b-f0ba-4c7e-8554-26d88ee70a22', '5257f8fd-9da2-4e83-8538-b6ffca22e45a');
INSERT INTO `freecms_role_func` VALUES ('bed880b3-ab93-4d3a-9fed-0ce9214ff2d6', 'd5a82b5b-f0ba-4c7e-8554-26d88ee70a22', '4331df96-2b8d-4dcf-9bdb-1015dfd0a759');
INSERT INTO `freecms_role_func` VALUES ('bf9182d6-16ec-4d79-952d-8867a23a887a', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '3dc03dc5-56ba-46d9-b8ab-78d19c04cd86');
INSERT INTO `freecms_role_func` VALUES ('c3e86733-7020-41bc-b888-58b1b6dba341', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '2403873a-48fb-48ac-acd0-af4098df1a0a');
INSERT INTO `freecms_role_func` VALUES ('c940bb28-6519-4678-aad0-ac3b38be9df3', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', 'f0709c68-3af5-413b-8503-0f0bc2a3eb74');
INSERT INTO `freecms_role_func` VALUES ('cd57e2f1-c307-414f-a13c-1a550e3a8cc8', 'd5a82b5b-f0ba-4c7e-8554-26d88ee70a22', 'a5452f4f-1a1b-4980-90a3-4a60a38ba373');
INSERT INTO `freecms_role_func` VALUES ('cdfa9c7a-46da-45c3-bbaf-50315b9a59fd', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '5a47681c-63c3-47b1-8e1f-34d4dbba7d85');
INSERT INTO `freecms_role_func` VALUES ('cedd82fc-9a02-460a-904d-03683c53fed5', 'd5a82b5b-f0ba-4c7e-8554-26d88ee70a22', 'e63b222f-3ccb-4e22-b8ab-7cd0dece9f06');
INSERT INTO `freecms_role_func` VALUES ('cf58732e-cb40-4b9a-a78a-afacacf9ebfe', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '3e344b36-736e-4afd-8216-beb4fa54d467');
INSERT INTO `freecms_role_func` VALUES ('d012680a-88b1-40b0-99a4-aa51dc11d7c8', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '4331df96-2b8d-4dcf-9bdb-1015dfd0a759');
INSERT INTO `freecms_role_func` VALUES ('d16e529d-1691-4ed6-a8c7-d24a513cef70', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '15dfc8ac-bfda-40cc-abb1-f563c1a1d1d2');
INSERT INTO `freecms_role_func` VALUES ('d3bde903-f60a-43f4-96dc-b2be8d37d0f4', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', 'e3066945-edb5-43ca-b29a-a0f96f98a50e');
INSERT INTO `freecms_role_func` VALUES ('d9e664a8-03d8-40c3-8154-a97fb3a67615', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '64f2084d-3fe7-4345-85c6-4dc835c1b939');
INSERT INTO `freecms_role_func` VALUES ('dd298cc2-70ef-4b4b-9306-44dd16595050', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '8afb6f01-ae46-447c-acfa-1a6e0964bbba');
INSERT INTO `freecms_role_func` VALUES ('df926af7-bc89-4424-bf20-0f5a8d55846a', 'd5a82b5b-f0ba-4c7e-8554-26d88ee70a22', '5f3a8e01-4216-4982-b07b-ad367fe9ef96');
INSERT INTO `freecms_role_func` VALUES ('e0907746-36d5-4577-8453-8282d05cd516', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '8acc3be4-a2f6-4fe8-903f-9fd5867f985a');
INSERT INTO `freecms_role_func` VALUES ('e21dbb10-38b6-4f1b-87f9-c7e4605ceb44', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', 'e01bb9aa-b122-41ac-b28c-e97993c2d250');
INSERT INTO `freecms_role_func` VALUES ('e28496d1-77ca-4f87-8573-b94c7e8c2284', 'd5a82b5b-f0ba-4c7e-8554-26d88ee70a22', '67025758-eb65-40b1-a59c-edee1b3ae938');
INSERT INTO `freecms_role_func` VALUES ('e3c1df82-85f2-4f5a-8469-bd994a3ab1bf', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', 'c0ac116b-2b2a-4a09-ba25-0c2fffc12b4d');
INSERT INTO `freecms_role_func` VALUES ('e49be6ae-7121-4a6e-9eb0-d639feb87bc5', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '6c561fe7-2013-4ce5-bf9a-42874b07a99e');
INSERT INTO `freecms_role_func` VALUES ('ecad88b4-6c2e-4343-b53b-0f7f253b6406', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '6f32a2b6-a552-4a91-a10c-2962af63eca7');
INSERT INTO `freecms_role_func` VALUES ('f5f92caf-cb4b-49a4-a605-d25b264776f6', 'd5a82b5b-f0ba-4c7e-8554-26d88ee70a22', '2b89c1fd-9e85-40d0-9ad8-9d401526d8fe');
INSERT INTO `freecms_role_func` VALUES ('f8bb0022-fc60-4a50-a061-cbe71aa8b794', 'db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3', '67705234-603a-47c7-8f0d-8cdd349fd7c6');
INSERT INTO `freecms_role_func` VALUES ('f8f98529-8f63-4fb6-b211-f93cfe134029', 'd5a82b5b-f0ba-4c7e-8554-26d88ee70a22', '58fe298f-b448-40bb-a1c0-d81134efa4af');

-- ----------------------------
-- Table structure for `freecms_role_site`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_role_site`;
CREATE TABLE `freecms_role_site` (
  `id` varchar(50) NOT NULL,
  `roleid` varchar(50) DEFAULT NULL,
  `siteid` varchar(50) DEFAULT NULL,
  `siteadmin` varchar(1) DEFAULT NULL COMMENT '是否是站点管理员',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_15` (`roleid`),
  KEY `FK_Reference_16` (`siteid`),
  CONSTRAINT `FK_Reference_15` FOREIGN KEY (`roleid`) REFERENCES `freecms_roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`siteid`) REFERENCES `freecms_site` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色_站点';

-- ----------------------------
-- Records of freecms_role_site
-- ----------------------------

-- ----------------------------
-- Table structure for `freecms_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_role_user`;
CREATE TABLE `freecms_role_user` (
  `id` varchar(36) NOT NULL DEFAULT 'newid()',
  `roles` varchar(36) NOT NULL,
  `users` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_角色_用户__用户` (`users`),
  KEY `FK_角色_用户__角色` (`roles`),
  CONSTRAINT `FK_角色_用户__用户` FOREIGN KEY (`users`) REFERENCES `freecms_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_角色_用户__角色` FOREIGN KEY (`roles`) REFERENCES `freecms_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色_用户';

-- ----------------------------
-- Records of freecms_role_user
-- ----------------------------
INSERT INTO `freecms_role_user` VALUES ('b7b9ea15-47dc-458d-b99d-82d3567addfe', 'd5a82b5b-f0ba-4c7e-8554-26d88ee70a22', 'fdc995ef-e96f-4c00-9746-4b5a9b365caa');

-- ----------------------------
-- Table structure for `freecms_sensitive`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_sensitive`;
CREATE TABLE `freecms_sensitive` (
  `id` varchar(50) NOT NULL,
  `sensitiveword` varchar(50) DEFAULT NULL,
  `replaceto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='敏感词';

-- ----------------------------
-- Records of freecms_sensitive
-- ----------------------------

-- ----------------------------
-- Table structure for `freecms_site`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_site`;
CREATE TABLE `freecms_site` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `siteDomain` varchar(100) DEFAULT NULL,
  `sourcePath` varchar(500) DEFAULT NULL,
  `copyright` varchar(500) DEFAULT NULL,
  `recordCode` varchar(50) DEFAULT NULL,
  `parId` varchar(50) DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `indexTemplet` varchar(50) DEFAULT NULL,
  `logo` varchar(500) DEFAULT NULL,
  `orderNum` int(11) DEFAULT NULL,
  `clickNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站点';

-- ----------------------------
-- Records of freecms_site
-- ----------------------------
INSERT INTO `freecms_site` VALUES ('dea0df0d-4346-44ba-9787-b370cfec224a', '中国儿童教育网', 'www.china-children-education.com', 'edu', '', '', '', '1', '', '038d670b-a7e2-476c-966d-d8a12b7ab9ea', '/upload//0c6bb6c0-7443-4e8e-a534-69b48edd388e.jpg', '1', null);

-- ----------------------------
-- Table structure for `freecms_source`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_source`;
CREATE TABLE `freecms_source` (
  `id` varchar(50) NOT NULL,
  `name` varchar(255) DEFAULT '' COMMENT '名称',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `addperson` varchar(255) DEFAULT NULL COMMENT '添加人',
  `sort` int(11) NOT NULL AUTO_INCREMENT,
  `reference` int(11) DEFAULT NULL COMMENT '引用次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of freecms_source
-- ----------------------------
INSERT INTO `freecms_source` VALUES ('468472c4-d4b2-4a96-9072-ccb34ab304f2', '明天出版社', '2016-05-26 16:39:56', '管理员', '3', '0');
INSERT INTO `freecms_source` VALUES ('97163c70-e759-445e-a141-4add9067528c', '', '2016-04-23 12:30:23', '管理员', '1', '0');
INSERT INTO `freecms_source` VALUES ('d7b35bc0-ba8f-4da6-9886-fe35f50293eb', 'http://www.hui-ben.com/shijie.asp', '2016-05-26 14:39:24', '管理员', '2', '0');

-- ----------------------------
-- Table structure for `freecms_store`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_store`;
CREATE TABLE `freecms_store` (
  `id` varchar(50) NOT NULL,
  `memberid` varchar(50) DEFAULT NULL,
  `siteid` varchar(50) DEFAULT NULL,
  `sitename` varchar(50) DEFAULT NULL,
  `channelid` varchar(50) DEFAULT NULL,
  `channelname` varchar(50) DEFAULT NULL,
  `objtype` varchar(50) DEFAULT NULL,
  `objid` varchar(50) DEFAULT NULL,
  `objtitle` varchar(500) DEFAULT NULL,
  `storetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_member_store` (`memberid`),
  CONSTRAINT `FK_member_store` FOREIGN KEY (`memberid`) REFERENCES `freecms_member` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏';

-- ----------------------------
-- Records of freecms_store
-- ----------------------------

-- ----------------------------
-- Table structure for `freecms_templet`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_templet`;
CREATE TABLE `freecms_templet` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  `orderNum` int(11) DEFAULT NULL,
  `useSites` varchar(1000) DEFAULT NULL,
  `useSiteNames` varchar(1000) DEFAULT NULL,
  `adduser` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模板';

-- ----------------------------
-- Records of freecms_templet
-- ----------------------------
INSERT INTO `freecms_templet` VALUES ('038d670b-a7e2-476c-966d-d8a12b7ab9ea', 'edu', '1', '1', 'dea0df0d-4346-44ba-9787-b370cfec224a;', 'undefined;', '02debc9f-53cd-4bc9-887b-49ffc4e925f2');
INSERT INTO `freecms_templet` VALUES ('63beca86-df77-40e8-814f-601bdbcb32c3', '少年儿童教育', '3', null, 'dea0df0d-4346-44ba-9787-b370cfec224a;', 'undefined;', '02debc9f-53cd-4bc9-887b-49ffc4e925f2');
INSERT INTO `freecms_templet` VALUES ('c6a36f27-a674-4bda-ac13-e3932f9e74f6', 'edu', '3', '1', 'dea0df0d-4346-44ba-9787-b370cfec224a;', 'undefined;', '02debc9f-53cd-4bc9-887b-49ffc4e925f2');
INSERT INTO `freecms_templet` VALUES ('dfa2ebb6-42ef-4b79-9449-e39f6bdbf11d', 'edu', '3', '1', 'dea0df0d-4346-44ba-9787-b370cfec224a;', 'undefined;', '02debc9f-53cd-4bc9-887b-49ffc4e925f2');
INSERT INTO `freecms_templet` VALUES ('f5e8c9c1-8b86-4483-9448-6e1e1a1d8798', 'edu', '3', '1', 'dea0df0d-4346-44ba-9787-b370cfec224a;', 'undefined;', '02debc9f-53cd-4bc9-887b-49ffc4e925f2');

-- ----------------------------
-- Table structure for `freecms_templet_channel`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_templet_channel`;
CREATE TABLE `freecms_templet_channel` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `templet` varchar(50) DEFAULT NULL,
  `contentTemplet` varchar(50) DEFAULT NULL,
  `img` varchar(500) DEFAULT NULL,
  `description` text,
  `parId` varchar(50) DEFAULT NULL,
  `site` varchar(50) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  `orderNum` int(11) DEFAULT NULL,
  `clickNum` int(11) DEFAULT NULL,
  `navigation` varchar(1) DEFAULT NULL,
  `pagemark` varchar(50) DEFAULT NULL,
  `htmlChannel` varchar(1) DEFAULT NULL,
  `htmlChannelOld` varchar(1) DEFAULT NULL,
  `htmlParchannel` varchar(1) DEFAULT NULL,
  `htmlSite` varchar(1) DEFAULT NULL,
  `templetid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_27` (`templetid`),
  CONSTRAINT `FK_Reference_27` FOREIGN KEY (`templetid`) REFERENCES `freecms_templet` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模板栏目';

-- ----------------------------
-- Records of freecms_templet_channel
-- ----------------------------

-- ----------------------------
-- Table structure for `freecms_templet_link`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_templet_link`;
CREATE TABLE `freecms_templet_link` (
  `id` varchar(50) NOT NULL,
  `parid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `isok` varchar(1) DEFAULT NULL,
  `ordernum` int(11) DEFAULT NULL,
  `site` varchar(50) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  `img` varchar(500) DEFAULT NULL,
  `pagemark` varchar(50) DEFAULT NULL,
  `templet` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_28` (`templet`),
  CONSTRAINT `FK_Reference_28` FOREIGN KEY (`templet`) REFERENCES `freecms_templet` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模板链接';

-- ----------------------------
-- Records of freecms_templet_link
-- ----------------------------

-- ----------------------------
-- Table structure for `freecms_unit`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_unit`;
CREATE TABLE `freecms_unit` (
  `id` varchar(36) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `parid` varchar(36) DEFAULT NULL,
  `isOk` char(1) DEFAULT NULL,
  `ordernum` int(11) DEFAULT NULL,
  `ismail` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='单位';

-- ----------------------------
-- Records of freecms_unit
-- ----------------------------

-- ----------------------------
-- Table structure for `freecms_unit_user`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_unit_user`;
CREATE TABLE `freecms_unit_user` (
  `id` varchar(36) NOT NULL,
  `unit` varchar(36) DEFAULT NULL,
  `users` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_13` (`users`),
  KEY `FK_Reference_14` (`unit`),
  CONSTRAINT `FK_Reference_13` FOREIGN KEY (`users`) REFERENCES `freecms_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`unit`) REFERENCES `freecms_unit` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='单位_用户';

-- ----------------------------
-- Records of freecms_unit_user
-- ----------------------------

-- ----------------------------
-- Table structure for `freecms_users`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_users`;
CREATE TABLE `freecms_users` (
  `id` varchar(36) NOT NULL,
  `loginName` varchar(100) NOT NULL,
  `roleNames` varchar(500) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `tel` varchar(100) DEFAULT NULL,
  `mobilephone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `isOk` char(1) DEFAULT NULL,
  `lastLoginTime` datetime DEFAULT NULL,
  `lastestLoginTime` datetime DEFAULT NULL,
  `loginFailNum` int(11) DEFAULT NULL,
  `loginNum` int(11) DEFAULT NULL,
  `addTime` datetime DEFAULT NULL,
  `unitNames` varchar(500) DEFAULT NULL,
  `unitIds` varchar(500) DEFAULT NULL,
  `ismail` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of freecms_users
-- ----------------------------
INSERT INTO `freecms_users` VALUES ('02debc9f-53cd-4bc9-887b-49ffc4e925f2', 'admin', '管理员;', '管理员', '4fb5f279d0abe2c311cf3015dbcce4fb', '1', null, '', '', 'freeteam@foxmail.com', '1', '2016-05-26 16:38:28', '2016-05-26 16:47:10', '0', '0', null, '', '', '1');
INSERT INTO `freecms_users` VALUES ('fdc995ef-e96f-4c00-9746-4b5a9b365caa', 'freecms', '站点管理员;', 'freecms', '523af537946b79c4f8369ed39ba78605', '1', '2012-11-06 00:00:00', '', '', '', '1', '2013-06-28 16:56:05', '2013-06-28 16:56:45', '0', '0', '2012-11-28 20:25:41', 'freeteam', 'freeteam;', null);

-- ----------------------------
-- Table structure for `freecms_visit`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_visit`;
CREATE TABLE `freecms_visit` (
  `id` varchar(50) NOT NULL,
  `siteid` varchar(50) DEFAULT NULL,
  `channelid` varchar(50) DEFAULT NULL,
  `infoid` varchar(50) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='访问记录';

-- ----------------------------
-- Records of freecms_visit
-- ----------------------------
INSERT INTO `freecms_visit` VALUES ('0062c996-72c5-4443-9277-bd535afcac7a', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:22:14', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('016519ff-18b2-40e2-b752-23b56e1a8ef6', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 16:52:59', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('024a806b-e907-4a0f-8d26-d36601b1bf1b', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:26:25', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('0286e39f-5027-411f-8319-b07fd487839e', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:25:18', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('09ba2cfa-1660-4af2-a09e-b3ddf84b6605', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:08:02', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('09f2987f-bf05-4727-ba55-3f495b2b5733', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:32:43', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('0fc198de-d8d6-4b92-9fed-03f63bc10c7c', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 16:53:17', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('10fdd076-dd31-4fe5-bbec-7fa6de918945', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:10:33', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('16b7c08e-16b1-4e9c-aca0-5949ef7a6af5', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:30:23', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('1713f5c7-14ac-4bd3-8423-24e63ada5a0e', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=%E5%85%A8%E5%9B%BD', '2016-05-02 17:42:46', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('1861b21e-bb09-4126-9d13-591ece925cab', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=12121', '2016-05-02 16:52:14', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('1b62c1a0-5fd1-4cc9-881a-6fd33ca558c4', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=2131', '2016-05-02 16:48:36', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('1d387680-239a-4486-b54e-b792fa2ace9b', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:07:59', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('236bd13f-4caa-46ab-a2c5-689d4ced2220', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:07:23', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('23ac6b5e-3aea-477a-a3d4-f18d9f8cbb11', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:08:00', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('24c9c24b-2846-445a-8dad-cb1e66e7a518', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:19:17', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('29881585-2a88-4148-8508-39731f220693', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:10:32', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('2a1d870a-f71b-43d0-93f4-ef39ca749967', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=6%E7%94%A8665', '2016-05-02 17:37:37', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('2f4af0fa-4da7-4755-9974-24a0210fb58c', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:22:48', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('35e9841f-b429-433f-91bd-a296cc087754', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=32131', '2016-05-02 17:37:41', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('39d0e3a5-881f-4e97-b162-929f3f29eeb6', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:20:02', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('3e5d4b97-1673-4828-ab50-af8f61e3e3dd', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:10:33', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('48db0565-5048-4efd-bf43-370d2505ce5a', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=%C3%83%C2%A4%C3%82%C2%BD%C3%82%C2%A0%C3%83%C2%A5%C3%82%C2%A5%C3%82%C2%BD', '2016-05-02 17:33:22', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('4bb2a68b-3468-4211-ae55-66bf1a8dc516', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=%E6%95%99%E5%B8%88', '2016-05-02 16:52:49', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('4c2c517b-aa58-476f-b5ca-659716c497ba', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=%C3%83%C2%A4%C3%82%C2%BD%C3%82%C2%A0%C3%83%C2%A5%C3%82%C2%A5%C3%82%C2%BD', '2016-05-02 17:34:55', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('4ccca0c9-955a-4afe-9687-ace15dc67365', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=%C3%A4%C2%BD%C2%A0%C3%A5%C2%A5%C2%BD', '2016-05-02 17:33:17', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('4cd8dc2d-0934-419e-adc3-ea0f0e3f560d', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:05:22', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('4eaed39e-1ba5-4b5a-bb37-4d26c95687f5', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTVd', '2016-05-02 17:32:47', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('534d0f15-834e-45ce-9f7f-ec70bcb3abe0', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:24:25', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('572ac939-2af2-4045-80e7-8bbaa09a9c8c', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do', '2016-05-02 17:43:32', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('577f8304-a17b-4d14-8d80-b09a18d23508', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:11:28', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('57aa8de8-3572-436d-8e6c-a403ff94f209', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:10:33', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('57b6cecf-99cb-49d9-b19d-515629a28a8e', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:10:30', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('5b860c09-3756-4593-82a9-e46720f4298e', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:20:14', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('5f66f397-dec1-419b-b609-725c6ab0ff57', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:19:57', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('60fee084-26be-4c7c-a6c9-fbf3e4ba3ee9', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:08:20', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('63182c0b-2472-4bee-bae1-7d5fef7dc044', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:05:31', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('6570375c-cccd-48ff-8e36-dd22549888c4', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:19:16', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('66dbd0b8-5e4e-40be-a4bf-0d2ab3cd9edd', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:19:56', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('6db14acd-c28d-4d73-9172-027478568ef1', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:32:02', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('6ec3be77-cb51-443f-9f09-e667fbbb522e', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:17:15', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('6f93aefe-f58a-4bc4-8be3-6b8618ee006b', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:26:09', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('737cbac7-7f39-41e3-8c6a-3d0362a9514a', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:21:50', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('743efd75-7ca2-4f07-aeec-bdd82d010835', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:16:36', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('75dfe5b9-b925-47f4-a86d-8fc16fc45865', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=6%E7%94%A8665', '2016-05-02 17:37:21', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('7a9b2974-086f-4a38-b0f8-26b63f7a8ffa', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:18:25', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('7ee580b9-ed97-4cd6-a288-f71812eb7d7c', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=%C3%83%C2%A4%C3%82%C2%BD%C3%82%C2%A0%C3%83%C2%A5%C3%82%C2%A5%C3%82%C2%BD', '2016-05-02 17:35:02', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('80a59f73-066e-43fe-ba82-caf60491e06e', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do', '2016-05-02 17:43:29', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('885df58d-610f-4faa-98d6-77e5f1acc67a', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:22:57', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('89f3f039-9377-4f52-a235-e41858b0e780', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do', '2016-05-02 17:43:35', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('8f5a97da-5b2a-4e13-a5be-035d0c9215f8', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=%E5%85%A8%E5%9B%BD', '2016-05-02 17:43:02', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('90a8d5be-01cc-4b18-8d7d-76a0661eb98f', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:11:44', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('914a4545-ba73-44fb-aa14-7f1228c6ad07', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:30:06', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('93c8dae8-0536-4e10-8d06-2179d9f98049', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=%C3%83%C2%A4%C3%82%C2%BD%C3%82%C2%A0%C3%83%C2%A5%C3%82%C2%A5%C3%82%C2%BD', '2016-05-02 17:33:20', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('9519525e-97ec-4dde-ac69-b2969f33e1b9', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=6%E7%94%A8665', '2016-05-02 17:35:04', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('965de0db-54b3-446f-a06a-eb3db9dcb6c4', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=6%E7%94%A8665', '2016-05-02 17:37:38', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('9c0f7a20-8a77-4fd4-a63b-e4fa2ccc8b7b', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:10:33', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('9c352e44-c8fe-4f1f-899a-d2c4d96aa535', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:32:19', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('a1ced276-4d99-455f-8078-99caf30887de', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do', '2016-05-02 17:43:38', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('a26636de-7d15-448f-8dc6-c4a7d46187a2', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:14:10', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('a6a16700-c90c-43d7-a400-f2b267bc6a87', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=12121', '2016-05-02 16:52:36', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('a703c6b6-44e7-4f3b-a57f-65935e9b3d78', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:25:19', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('a80387d8-0319-4fd3-ae20-8842565d04d9', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=2131', '2016-05-02 17:41:56', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('ab70fb03-8e2e-43be-a139-ea6b095a447a', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=%E6%95%99%E5%B8%88', '2016-05-02 16:52:44', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('ac7122e7-e6b9-4087-8d10-6f53c5f52594', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:21:55', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('adc738f1-69ff-4ae5-adb8-e47ed401b5ef', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=', '2016-05-26 16:18:56', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('aff6ff0d-c558-4a9b-804e-7c6c094f37c6', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:18:18', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('b0fa198b-6130-4a07-8714-bf8e2be4b311', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:15:21', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('b32cde57-e900-4752-a5f5-019f7b0597e5', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:07:27', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('b3d51bd8-c689-40ba-a7db-fbef783ed501', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:10:33', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('b864e563-18f3-4da3-9a8d-646f746ce759', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:10:33', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('b8b669bd-cb2c-4737-82de-e4193ef520a1', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=%E5%AE%BF%E8%88%8D', '2016-05-02 17:42:00', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('b917dcc8-7881-4839-b8fc-1161b956707f', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:24:18', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('bacc3726-e831-4107-835a-7d9e95e3b2f6', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=6%E7%94%A8665', '2016-05-02 17:37:39', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('c5a0a9e8-95a2-475a-9c32-cb9768602eb9', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:22:01', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('ccc0c208-17c9-4d15-8709-5bd29b4c72f9', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:08:23', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('d4e7c7b9-064b-418e-9c37-3bd43387ea6e', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:32:26', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('d6fbab61-4691-416c-8b51-162cf2c20d21', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 16:58:53', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('dc7495f1-b323-4dc6-812f-c4387f050f88', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:16:35', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('df2f3c7d-4a6e-4783-9b5e-244a58f5a338', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:26:33', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('df7dbab8-2593-4b48-9f68-9c8b0cdc181e', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:17:10', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('e21c2d2a-e2a0-4e1a-b2b0-1493a9647612', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=%E4%BD%A0%E5%A5%BD', '2016-05-02 17:32:54', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('e43a44ef-8b70-49fd-abc5-fbe5805b3a05', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:27:40', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('e5436df3-e018-460d-99b9-06e58e93814b', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=%E5%85%A8%E5%9B%BD', '2016-05-02 17:38:05', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('e5664585-69d4-4f16-b885-9536983d3fb3', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:37:54', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('e9e4038a-6dce-4c9f-9ebb-ccd3c4b76c8c', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=', '2016-05-02 17:43:24', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('f0e5bad4-b645-41d8-a642-92888b46e41a', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:26:45', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('f21022de-5801-4aa4-8b61-8aa722f166a3', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:10:31', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('fd8299bd-ccf6-4b14-bbb2-d8f03ba098ea', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=cctv', '2016-05-02 17:37:45', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('fdbbeb06-2702-4206-9dd4-73f613263403', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:07:45', '127.0.0.1');
INSERT INTO `freecms_visit` VALUES ('feb63207-64da-4b2c-aedb-b93eff07511a', 'dea0df0d-4346-44ba-9787-b370cfec224a', null, null, '/templet_pro.do?siteid=dea0df0d-4346-44ba-9787-b370cfec224a&templetPath=search%2Fqwjs_search.shtml&key=CCTV', '2016-05-02 17:10:33', '127.0.0.1');
