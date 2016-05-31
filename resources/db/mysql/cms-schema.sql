/*
Navicat MySQL Data Transfer

Source Server         : 218.245.5.10
Source Server Version : 50614
Source Host           : 218.245.5.10:4309
Source Database       : dty_cms

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2014-03-24 12:26:05
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
) ENGINE=InnoDB AUTO_INCREMENT=593 DEFAULT CHARSET=utf8 COMMENT='栏目';

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
-- Table structure for `freecms_htmlQuartz`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_htmlQuartz`;
CREATE TABLE `freecms_htmlQuartz` (
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `htmlIndexnum` (`htmlIndexnum`),
  KEY `FK_信息_栏目` (`channel`),
  CONSTRAINT `FK_信息_栏目` FOREIGN KEY (`channel`) REFERENCES `freecms_channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23964 DEFAULT CHARSET=utf8 COMMENT='信息';

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
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=562124063 DEFAULT CHARSET=utf8 COMMENT='会员';

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
-- Table structure for `freecms_memberAuth`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_memberAuth`;
CREATE TABLE `freecms_memberAuth` (
  `id` varchar(50) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `ordernum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员权限';

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
-- Table structure for `freecms_memberGroup`
-- ----------------------------
DROP TABLE IF EXISTS `freecms_memberGroup`;
CREATE TABLE `freecms_memberGroup` (
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
) ENGINE=InnoDB AUTO_INCREMENT=1007 DEFAULT CHARSET=utf8;

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