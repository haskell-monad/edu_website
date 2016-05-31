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
-- Records of freecms_config
-- ----------------------------
insert  into `freecms_config`(`code`,`name`,`configValue`,`orderNum`) values ('attchType','前台上传附件类型(多个用,号分隔)','jpg,jpeg,gif,png,doc,docx,ppt,xls,pdf,flv,wmv,rm,rmvb,avi,rar,zip',10);
insert  into `freecms_config`(`code`,`name`,`configValue`,`orderNum`) values ('iscomment','是否允许评论(是 或 否)','是',0);
insert  into `freecms_config`(`code`,`name`,`configValue`,`orderNum`) values ('mailAuth','邮件 要求身份验证(是/否)','是',5);
insert  into `freecms_config`(`code`,`name`,`configValue`,`orderNum`) values ('mailCharset','邮件 字符编码','UTF-8',9);
insert  into `freecms_config`(`code`,`name`,`configValue`,`orderNum`) values ('mailFrom','邮件 发信人邮件地址','test@qq.com',6);
insert  into `freecms_config`(`code`,`name`,`configValue`,`orderNum`) values ('mailPort','邮件 SMTP 端口','25',4);
insert  into `freecms_config`(`code`,`name`,`configValue`,`orderNum`) values ('mailPwd','邮件 密码','test',8);
insert  into `freecms_config`(`code`,`name`,`configValue`,`orderNum`) values ('mailServer','邮件 SMTP 服务器','smtp.qq.com',3);
insert  into `freecms_config`(`code`,`name`,`configValue`,`orderNum`) values ('mailType','互动信件类型(多个用,号分隔)','咨询,建议,投诉,指南,举报,其他',1);
insert  into `freecms_config`(`code`,`name`,`configValue`,`orderNum`) values ('mailUsername','邮件 用户名','test',7);
insert  into `freecms_config`(`code`,`name`,`configValue`,`orderNum`) values ('memberLimitName','会员禁用登录名(多个用,号分隔)','admin,freecms',2);
insert  into `freecms_config`(`code`,`name`,`configValue`,`orderNum`) values ('site','默认站点(源文件目录名)','FreeCMS',0);

-- ----------------------------
-- Records of freecms_func
-- ----------------------------
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('003c47c5-7041-4cfa-8631-82c00ab3fb35','菜单管理','1',101,'func.jsp','a5452f4f-1a1b-4980-90a3-4a60a38ba373');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('03902986-1ddb-40af-b6f8-4443e1ad7efb','访问频率统计','1',6,'cms/stat_visit.do','80453df3-35df-4c63-bbb5-1c333eadc8ab');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('08cfd343-2803-403e-b952-f7d41199d8e1','快速添加','1',0,'cms/info_edit.do','cb42d736-3386-42b8-a9f7-62840c4ecefa');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('0af2a5d9-26e6-4b82-a07c-062a35b3a7e5','会员权限','1',8,'cms/memberauth_list.do','8acc3be4-a2f6-4fe8-903f-9fd5867f985a');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('0bec6b84-19be-4d99-bc44-ca1d8472148f','图片链接管理','1',4,'cms/link_list.do?link.type=2','26622672-9a10-4e4e-93a7-7fe50a9208b3');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('12187d67-5ab9-4ae4-bbee-9a772cebd0de','用户管理','1',1,'user_list.do','15dfc8ac-bfda-40cc-abb1-f563c1a1d1d2');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('14a4e894-1a48-4145-b467-0fe0499e8758','会员组','1',9,'cms/membergroup_list.do','8acc3be4-a2f6-4fe8-903f-9fd5867f985a');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('15dfc8ac-bfda-40cc-abb1-f563c1a1d1d2','用户管理','1',100,'','a5452f4f-1a1b-4980-90a3-4a60a38ba373');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('16f212d4-fc11-4d64-ba3f-fb1db9e2ae8c','信息更新统计','1',3,'cms/stat_sysInfoUpdate.do','8b8880d9-17f9-4f21-b1f9-531a9608afcb');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('18974989-cd85-48b2-8169-348bc3481ef8','文字链接分类','1',5,'cms/link_clazz.do?link.type=3','26622672-9a10-4e4e-93a7-7fe50a9208b3');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('19eebfb0-16b5-40eb-a909-1bd37ef7d745','站点管理','1',0,'cms/site_site.do','a5452f4f-1a1b-4980-90a3-4a60a38ba373');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('2403873a-48fb-48ac-acd0-af4098df1a0a','添加用户','1',0,'userEdit.jsp','15dfc8ac-bfda-40cc-abb1-f563c1a1d1d2');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('26622672-9a10-4e4e-93a7-7fe50a9208b3','链接管理','1',5,'','64f2084d-3fe7-4345-85c6-4dc835c1b939');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('2b89c1fd-9e85-40d0-9ad8-9d401526d8fe','网上调查','1',5,'cms/question_list.do','64f2084d-3fe7-4345-85c6-4dc835c1b939');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('3dc03dc5-56ba-46d9-b8ab-78d19c04cd86','角色管理','1',99,'','a5452f4f-1a1b-4980-90a3-4a60a38ba373');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('3e344b36-736e-4afd-8216-beb4fa54d467','积分记录','1',12,'cms/creditlog_list.do','8acc3be4-a2f6-4fe8-903f-9fd5867f985a');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('425d0211-0196-4456-a24b-3e8d614dec8b','信息管理','1',1,'cms/info_info.do','cb42d736-3386-42b8-a9f7-62840c4ecefa');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('4331df96-2b8d-4dcf-9bdb-1015dfd0a759','图片链接分类','1',3,'cms/link_clazz.do?link.type=2','26622672-9a10-4e4e-93a7-7fe50a9208b3');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('47b80631-bb6e-4abd-8e47-5b99bce8b3bd','操作日志','1',105,'operLog_list.do','a5452f4f-1a1b-4980-90a3-4a60a38ba373');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('5257f8fd-9da2-4e83-8538-b6ffca22e45a','模板管理','1',3,'cms/templet_list.do','64f2084d-3fe7-4345-85c6-4dc835c1b939');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('55480f1c-d96f-4b53-b596-fc930f488692','在线申报','1',7,'cms/report_list.do','64f2084d-3fe7-4345-85c6-4dc835c1b939');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('58fe298f-b448-40bb-a1c0-d81134efa4af','信息页静态化','1',3,'cms/html_info.do','e63b222f-3ccb-4e22-b8ab-7cd0dece9f06');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('5a47681c-63c3-47b1-8e1f-34d4dbba7d85','文字链接管理','1',6,'cms/link_list.do?link.type=3','26622672-9a10-4e4e-93a7-7fe50a9208b3');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('5f3a8e01-4216-4982-b07b-ad367fe9ef96','栏目页静态化','1',2,'cms/html_channel.do','e63b222f-3ccb-4e22-b8ab-7cd0dece9f06');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('64f2084d-3fe7-4345-85c6-4dc835c1b939','站点','1',2,'','');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('66ecf6f7-1911-4e7e-8089-3a01f44a6d12','单位管理','1',98,'unit.jsp','a5452f4f-1a1b-4980-90a3-4a60a38ba373');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('67025758-eb65-40b1-a59c-edee1b3ae938','下拉链接分类','1',1,'cms/link_clazz.do?link.type=1','26622672-9a10-4e4e-93a7-7fe50a9208b3');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('67705234-603a-47c7-8f0d-8cdd349fd7c6','互动信件','1',6,'','64f2084d-3fe7-4345-85c6-4dc835c1b939');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('682b18ef-3308-48f6-8fa8-c224269ecc1f','信息更新统计','1',3,'cms/stat_infoUpdate.do','80453df3-35df-4c63-bbb5-1c333eadc8ab');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('6ad6b178-d6af-4fc6-9962-2b1ea49e0f2f','依申请公开','1',8,'cms/applyopen_list.do','64f2084d-3fe7-4345-85c6-4dc835c1b939');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('6bf700a4-2526-4603-9187-addc3f066750','功能演示','1',1000,'demo_list.do','a5452f4f-1a1b-4980-90a3-4a60a38ba373');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('6c561fe7-2013-4ce5-bf9a-42874b07a99e','站点设置','1',0,'cms/site_config.do','64f2084d-3fe7-4345-85c6-4dc835c1b939');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('6f32a2b6-a552-4a91-a10c-2962af63eca7','添加角色','1',0,'role_edit.do','3dc03dc5-56ba-46d9-b8ab-78d19c04cd86');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('74007605-cdce-4313-b874-8a26a2e8df7a','敏感词管理','1',1,'cms/sensitive_list.do','a5452f4f-1a1b-4980-90a3-4a60a38ba373');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('742470cc-eaf1-48c4-805c-44c9936a7622','部门信件','1',1,'cms/mail_list.do?mail.type=unit','67705234-603a-47c7-8f0d-8cdd349fd7c6');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('80453df3-35df-4c63-bbb5-1c333eadc8ab','统计分析','1',100,'','64f2084d-3fe7-4345-85c6-4dc835c1b939');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('88749e6a-a8ec-47ef-aa4a-f7912d0ed12c','下拉链接管理','1',2,'cms/link_list.do?link.type=1','26622672-9a10-4e4e-93a7-7fe50a9208b3');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('8acc3be4-a2f6-4fe8-903f-9fd5867f985a','会员','1',3,'','');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('8afb6f01-ae46-447c-acfa-1a6e0964bbba','角色管理','1',1,'role_list.do','3dc03dc5-56ba-46d9-b8ab-78d19c04cd86');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('8b8880d9-17f9-4f21-b1f9-531a9608afcb','统计分析','1',102,'','a5452f4f-1a1b-4980-90a3-4a60a38ba373');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('95088cf5-299d-495a-896e-b3eae1a404c0','积分规则','1',11,'cms/creditrule_list.do','8acc3be4-a2f6-4fe8-903f-9fd5867f985a');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('969d27f9-71f8-4cb8-a1bd-6343fe32bbb1','评论管理','1',13,'cms/comment_list.do','8acc3be4-a2f6-4fe8-903f-9fd5867f985a');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('98e94eff-8da7-4fcf-a175-2ad4cb6a42c0','访问频率统计','1',4,'cms/stat_sysVisit.do','8b8880d9-17f9-4f21-b1f9-531a9608afcb');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('a5452f4f-1a1b-4980-90a3-4a60a38ba373','系统','1',1,'','');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('b688f798-1ba8-48da-9786-de1a87579fe1','站点信息统计','1',2,'cms/stat_sysSiteStat.do','8b8880d9-17f9-4f21-b1f9-531a9608afcb');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('c0ac116b-2b2a-4a09-ba25-0c2fffc12b4d','栏目管理','1',1,'cms/channel_channel.do','64f2084d-3fe7-4345-85c6-4dc835c1b939');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('c1fea184-320f-4f65-89c1-e55fc4db9248','栏目访问统计','1',4,'cms/stat_channelVisit.do','80453df3-35df-4c63-bbb5-1c333eadc8ab');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('c6f3ee9c-e7e1-4050-835e-70977581acf9','工作量统计','1',1,'cms/stat_workload.do','80453df3-35df-4c63-bbb5-1c333eadc8ab');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('cb42d736-3386-42b8-a9f7-62840c4ecefa','信息管理','1',2,'','64f2084d-3fe7-4345-85c6-4dc835c1b939');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('d301815a-1583-4eb9-b1a2-44f1b819cc9d','系统链接','1',2,'adminlink_list.do?adminlink.type=0','a5452f4f-1a1b-4980-90a3-4a60a38ba373');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('dc48e8ad-331c-4f6e-967b-1d9240017d67','栏目信息统计','1',2,'cms/stat_channelStat.do','80453df3-35df-4c63-bbb5-1c333eadc8ab');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('dee27e76-ad55-45ff-b007-4f8a31db8621','信息提取','1',3,'cms/info_extract.do','cb42d736-3386-42b8-a9f7-62840c4ecefa');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('df4647eb-8758-451c-bdcd-54c2d180c474','会员管理','1',10,'cms/member_list.do','8acc3be4-a2f6-4fe8-903f-9fd5867f985a');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('e01bb9aa-b122-41ac-b28c-e97993c2d250','其他信件','1',3,'cms/mail_list.do?mail.type=other','67705234-603a-47c7-8f0d-8cdd349fd7c6');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('e3066945-edb5-43ca-b29a-a0f96f98a50e','首页静态化','1',1,'cms/html_indexConfirm.do','e63b222f-3ccb-4e22-b8ab-7cd0dece9f06');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('e63b222f-3ccb-4e22-b8ab-7cd0dece9f06','静态化管理','1',4,'','64f2084d-3fe7-4345-85c6-4dc835c1b939');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('e9136c39-c814-4d6d-9a21-0f78da23f5fc','信息访问统计','1',5,'cms/stat_infoVisit.do','80453df3-35df-4c63-bbb5-1c333eadc8ab');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('ea3034c4-5a98-4a8a-a175-7c43e42aa939','系统配置','1',102,'config_config.do','a5452f4f-1a1b-4980-90a3-4a60a38ba373');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('f0709c68-3af5-413b-8503-0f0bc2a3eb74','个人信件','1',2,'cms/mail_list.do?mail.type=user','67705234-603a-47c7-8f0d-8cdd349fd7c6');
insert  into `freecms_func`(`id`,`name`,`isOk`,`orderNum`,`url`,`parId`) values ('f7ed505c-069b-4a36-8bac-fa3e2fe5681e','工作量统计','1',1,'cms/stat_sysWorkload.do','8b8880d9-17f9-4f21-b1f9-531a9608afcb');

-- ----------------------------
-- Records of freecms_operbutton
-- ----------------------------
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('01587af4-0fd3-41e3-9dcb-8deab4ee35cf','95088cf5-299d-495a-896e-b3eae1a404c0','编 辑','edit()','1',2);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('02b90aa0-c2e0-4a63-bbe5-04838bd2d847','5257f8fd-9da2-4e83-8538-b6ffca22e45a','编 辑','edit()','1',1);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('031926ef-2738-40d6-9ef9-880199099955','df4647eb-8758-451c-bdcd-54c2d180c474','启 用','isok(\'1\')','1',3);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('05393847-a0d1-407d-97f5-8f8a4225e863','e01bb9aa-b122-41ac-b28c-e97993c2d250','转 交','forward()','1',1);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('0b547a0a-c5b9-4186-920e-507d0e4268d4','425d0211-0196-4456-a24b-3e8d614dec8b','编 辑','edit()','1',1);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('0d262669-48eb-4951-84cc-356765b771d4','df4647eb-8758-451c-bdcd-54c2d180c474','禁 用','isok(\'0\')','1',4);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('0db25404-44ac-429b-8ab7-66bd1bbc176a','5f3a8e01-4216-4982-b07b-ad367fe9ef96','生成所选栏目页','createChannel()','1',1);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('0e54a469-aa95-479b-9e82-20313dd4d1e6','6ad6b178-d6af-4fc6-9962-2b1ea49e0f2f','转 交','forward()','1',1);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('10aa08c7-6754-487b-9c4e-6d9b9776b0eb','d301815a-1583-4eb9-b1a2-44f1b819cc9d','添 加','add()','1',1);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('10e8612b-af7b-437d-b8da-1c1a550bdce5','58fe298f-b448-40bb-a1c0-d81134efa4af','生成信息页面','createHtml()','1',NULL);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('137705c8-8e68-410c-a61d-d13e0c01af6b','4331df96-2b8d-4dcf-9bdb-1015dfd0a759','添 加','add()','1',1);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('15a50d4c-4866-4533-93a8-a19887d230d1','6c561fe7-2013-4ce5-bf9a-42874b07a99e','保 存','save()','1',NULL);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('161b2215-d862-433c-aff2-3d99bc9236e0','19eebfb0-16b5-40eb-a909-1bd37ef7d745','编辑','edit()','1',NULL);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('17a4ab4a-3c1c-4a8e-b7f7-d41c3e49a00b','f0709c68-3af5-413b-8503-0f0bc2a3eb74','转 交','forward()','1',1);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('1a5ec49d-571b-4e42-a9da-2863c4704e94','66ecf6f7-1911-4e7e-8089-3a01f44a6d12','保存','save()','1',NULL);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('200d95de-bebc-4b99-bf42-19af32a4038f','6bf700a4-2526-4603-9187-addc3f066750','添 加','add()','1',1);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('21ca6c9c-c5dc-47ab-9d74-dfd6fca9e2c3','67025758-eb65-40b1-a59c-edee1b3ae938','删 除','del()','1',3);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('22c02db3-24e3-46bc-8dcc-f7248207c3ad','0af2a5d9-26e6-4b82-a07c-062a35b3a7e5','编 辑','edit()','1',2);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('22c09714-f443-456b-8ad3-992d1f02d9dc','19eebfb0-16b5-40eb-a909-1bd37ef7d745','改变所属站点','parButton()','1',NULL);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('238aa44d-d862-44f3-969d-d2abba6225ff','df4647eb-8758-451c-bdcd-54c2d180c474','编 辑','edit()','1',2);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('275224d4-00d0-43e8-a9e8-379fd24429c9','2403873a-48fb-48ac-acd0-af4098df1a0a','保存','WebForm_OnSubmit()','1',NULL);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('2aca3b79-6f94-473a-bfa8-420d92f9586b','66ecf6f7-1911-4e7e-8089-3a01f44a6d12','删除','del()','1',NULL);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('2b9262d4-5b64-42c5-b951-78190143c8e2','df4647eb-8758-451c-bdcd-54c2d180c474','删 除','del()','1',5);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('2db278fd-422f-44df-9072-2dca297c1b47','4331df96-2b8d-4dcf-9bdb-1015dfd0a759','编 辑','edit()','1',2);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('307bca7a-ec7f-4bb3-8c8c-b8a072390494','67025758-eb65-40b1-a59c-edee1b3ae938','编 辑','edit()','1',2);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('310108b1-a5dc-434d-b5de-d5f0064c004a','ea3034c4-5a98-4a8a-a175-7c43e42aa939','保 存','save()','1',NULL);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('3221edae-8f1e-4101-8ebe-5742dcc0edc1','18974989-cd85-48b2-8169-348bc3481ef8','添 加','add()','1',1);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('3561a44f-a0c9-491e-9300-9ffe59c3fca7','5257f8fd-9da2-4e83-8538-b6ffca22e45a','文件管理','fileManage()','1',3);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('3af3a17a-4267-43d0-ad08-8391a82a698e','2b89c1fd-9e85-40d0-9ad8-9d401526d8fe','设置选项','answer()','1',3);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('3c06e1ec-717d-4c2a-8340-47bbd2b3ff4f','3dc03dc5-56ba-46d9-b8ab-78d19c04cd86','授 权','auth()','1',0);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('3f167129-3d4d-4c92-8a91-5d1d5ed799d1','14a4e894-1a48-4145-b467-0fe0499e8758','删 除','del()','1',4);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('4090990b-9e87-4a0b-b2fa-9354d9c3a46a','12187d67-5ab9-4ae4-bbee-9a772cebd0de','编 辑','edit()','1',0);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('427b987d-b3c2-4e17-bb09-f4a6faf248bb','5a47681c-63c3-47b1-8e1f-34d4dbba7d85','添 加','add()','1',1);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('44e33169-b7b9-4995-a8f1-291b69286bcf','5a47681c-63c3-47b1-8e1f-34d4dbba7d85','删 除','del()','1',3);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('464b41df-f81e-4e54-b28d-436e9092eda2','4331df96-2b8d-4dcf-9bdb-1015dfd0a759','删 除','del()','1',3);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('4b40d194-3604-4656-b0f6-6e4e546cada4','55480f1c-d96f-4b53-b596-fc930f488692','办 理','pro()','1',2);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('4de14364-517b-4c41-a60f-318ec98296a0','6f32a2b6-a552-4a91-a10c-2962af63eca7','保存','WebForm_OnSubmit()','1',0);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('4de80a44-dc1a-4ead-a25c-9c2ff07902a3','425d0211-0196-4456-a24b-3e8d614dec8b','复 制','copy()','1',2);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('4e86fdcb-4240-4bd7-96f7-1921671bf650','19eebfb0-16b5-40eb-a909-1bd37ef7d745','添加下级站点','addSon()','1',NULL);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('4ec7e50a-a272-4a12-8f69-a36366595397','0bec6b84-19be-4d99-bc44-ca1d8472148f','编 辑','edit()','1',2);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('52fb7676-6ff5-41e7-bb7a-bff8c177f30f','969d27f9-71f8-4cb8-a1bd-6343fe32bbb1','审 核','state()','1',1);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('56227812-981f-488f-90b1-92eded41aa54','5f3a8e01-4216-4982-b07b-ad367fe9ef96','生成此站点所有栏目页','createAll()','1',2);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('562dd385-6990-4d80-a4ee-6937ab5580c6','95088cf5-299d-495a-896e-b3eae1a404c0','添 加','add()','1',1);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('597ad917-2681-444e-b92b-b5971c94aca2','12187d67-5ab9-4ae4-bbee-9a772cebd0de','删 除','del()','1',5);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('59a6b3e9-eafc-47cc-825c-eda5ef46a816','12187d67-5ab9-4ae4-bbee-9a772cebd0de','重置密码','resetPwd()','1',4);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('5a0b8732-af98-4270-acee-b5456898ff46','66ecf6f7-1911-4e7e-8089-3a01f44a6d12','添加下级单位','addSon()','1',NULL);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('5de475b4-6585-498b-93d7-9cd5f8d14f98','14a4e894-1a48-4145-b467-0fe0499e8758','编 辑','edit()','1',2);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('5e180d27-33ff-4dde-92ec-ee732447e114','e01bb9aa-b122-41ac-b28c-e97993c2d250','办 理','pro()','1',2);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('631db6b8-9fa7-4ce3-8198-55831d31d5db','6bf700a4-2526-4603-9187-addc3f066750','删 除','del()','1',3);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('67982f56-1b92-4e04-ae78-128a8853edb8','425d0211-0196-4456-a24b-3e8d614dec8b','添 加','add()','1',0);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('68658618-7538-4175-bb05-880a8af9f6ae','74007605-cdce-4313-b874-8a26a2e8df7a','删 除','del()','1',3);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('6866fac3-70dd-4895-b4bb-ea9a50c465dd','66ecf6f7-1911-4e7e-8089-3a01f44a6d12','改变所属单位','parButton()','1',NULL);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('6d5da20f-6885-41a2-a2c4-b46e907af07c','dee27e76-ad55-45ff-b007-4f8a31db8621','提取到栏目','extract()','1',NULL);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('6e1fa81d-8a23-4a29-8ced-095d79e914b2','2b89c1fd-9e85-40d0-9ad8-9d401526d8fe','删 除','del()','1',4);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('6f6ebd83-cace-4cb9-9b64-4fdbe60741ee','8afb6f01-ae46-447c-acfa-1a6e0964bbba','编 辑','edit()','1',0);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('70206d34-e4da-47ae-afd9-eb9985dba306','2b89c1fd-9e85-40d0-9ad8-9d401526d8fe','编 辑','edit()','1',2);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('754fd2a6-6094-4334-b457-e0107a0506bf','5257f8fd-9da2-4e83-8538-b6ffca22e45a','删 除','del()','1',2);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('768963aa-aa71-444a-a013-a06a31fcad2c','88749e6a-a8ec-47ef-aa4a-f7912d0ed12c','添 加','add()','1',1);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('77b23596-654b-4a54-993e-8e678e51cf74','66ecf6f7-1911-4e7e-8089-3a01f44a6d12','添加一级单位','addOne()','1',NULL);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('77e74e50-ed23-43a4-8afa-029aef42f065','0bec6b84-19be-4d99-bc44-ca1d8472148f','添 加','add()','1',1);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('7882b7f4-cb5b-4a18-b1f6-037cbf815661','5257f8fd-9da2-4e83-8538-b6ffca22e45a','添 加','add()','1',0);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('791f635b-6f69-43d7-9e2f-4a710daf3210','f0709c68-3af5-413b-8503-0f0bc2a3eb74','办 理','pro()','1',2);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('7d203eda-94be-4d56-8171-97d0b2ec28d0','df4647eb-8758-451c-bdcd-54c2d180c474','添 加','add()','1',1);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('7efb9cec-f40b-4978-ad33-8f2ca3d34f12','55480f1c-d96f-4b53-b596-fc930f488692','删 除','del()','1',3);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('80f3c1df-4df6-4c4c-8fd8-20a415536a2a','6c561fe7-2013-4ce5-bf9a-42874b07a99e','预览站点','preview()','1',NULL);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('8300b3ed-59f9-424f-94b6-ef4cf142d2a0','5257f8fd-9da2-4e83-8538-b6ffca22e45a','导 出','exportZip()','1',5);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('85ca4973-0e3c-4a14-be16-290850aa760c','0bec6b84-19be-4d99-bc44-ca1d8472148f','删 除','del()','1',3);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('8ce8c4c5-da00-49c6-9575-54851695f3ad','14a4e894-1a48-4145-b467-0fe0499e8758','添 加','add()','1',1);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('95872bc9-b7a3-43d7-b72c-8e20e5d43874','19eebfb0-16b5-40eb-a909-1bd37ef7d745','添加一级站点','addOne()','1',NULL);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('95c7f91f-eaff-4ceb-b88c-baf1bcb5ea39','003c47c5-7041-4cfa-8631-82c00ab3fb35','保存','save()','1',0);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('9a533db1-728f-45ce-882f-a75b5a5d9332','8afb6f01-ae46-447c-acfa-1a6e0964bbba','站点授权','siteAuth()','1',2);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('9b06c3d6-0198-4b6e-a2bb-44397fbdd9dd','742470cc-eaf1-48c4-805c-44c9936a7622','删 除','del()','1',3);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('9d156512-b615-4a26-a544-494db17d7edd','74007605-cdce-4313-b874-8a26a2e8df7a','编 辑','edit()','1',2);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('9d780208-d3d6-4dd9-99d5-4dfbc5870128','88749e6a-a8ec-47ef-aa4a-f7912d0ed12c','编 辑','edit()','1',2);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('9efc12ca-5991-43fd-ab74-435eb38fcfe6','95088cf5-299d-495a-896e-b3eae1a404c0','删 除','del()','1',3);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('a1503362-5cc4-46a0-bfe2-a57e9c1479e4','3dc03dc5-56ba-46d9-b8ab-78d19c04cd86','编 辑','edit()','1',0);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('adef49b9-1e4f-410b-bc35-e9611a255356','12187d67-5ab9-4ae4-bbee-9a772cebd0de','授 权','auth()','1',1);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('af01be01-45a6-4bf0-aafb-3415a86e5379','742470cc-eaf1-48c4-805c-44c9936a7622','转 交','forward()','1',1);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('b3627085-294d-4e71-ba74-6a98e6525530','003c47c5-7041-4cfa-8631-82c00ab3fb35','管理操作按钮','operButton()','1',0);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('b63b98f9-b572-41e0-a91e-c2bd0157e1da','d301815a-1583-4eb9-b1a2-44f1b819cc9d','删 除','del()','1',3);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('bae98298-d8c8-412f-bd0a-ce69225c2f96','e01bb9aa-b122-41ac-b28c-e97993c2d250','删 除','del()','1',3);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('beb25f53-7325-49b9-ab95-8abeff63448c','19eebfb0-16b5-40eb-a909-1bd37ef7d745','删除','del()','1',NULL);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('c1284d0d-5a79-4994-a1fa-13a7b50058ed','74007605-cdce-4313-b874-8a26a2e8df7a','添 加','add()','1',1);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('c3ce9418-9dcc-4578-90b2-3f6ab08f61a7','18974989-cd85-48b2-8169-348bc3481ef8','删 除','del()','1',3);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('c3f6186b-ef24-4a51-ab83-b7162d468125','2b89c1fd-9e85-40d0-9ad8-9d401526d8fe','添 加','add()','1',1);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('c6317410-cd09-4fee-abf1-e92146e6f665','6ad6b178-d6af-4fc6-9962-2b1ea49e0f2f','删 除','del()','1',3);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('c870fb65-cb88-49c6-b555-d2245eca76ea','425d0211-0196-4456-a24b-3e8d614dec8b','移 动','move()','1',3);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('ca0d70ff-0509-4d9b-b224-f0428934825b','003c47c5-7041-4cfa-8631-82c00ab3fb35','删除','del()','1',0);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('ca2e6805-c891-4876-abfe-5addf4e8a504','6bf700a4-2526-4603-9187-addc3f066750','编 辑','edit()','1',2);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('ca743b1d-c7d8-4c4a-849d-1da8a5f63d66','5257f8fd-9da2-4e83-8538-b6ffca22e45a','初始化数据','data()','1',4);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('cb52abdd-9a80-46d0-9115-f4c7cdf0c8f4','88749e6a-a8ec-47ef-aa4a-f7912d0ed12c','删 除','del()','1',3);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('cdcd83fe-3cc2-4bbb-bb7e-e279c1780a77','14a4e894-1a48-4145-b467-0fe0499e8758','授 权','auth()','1',3);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('cec4e057-a4e3-4126-9a3c-8bc2e4c5b0b4','55480f1c-d96f-4b53-b596-fc930f488692','转 交','forward()','1',1);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('cef54353-09d1-4ff6-bedd-370ab799913c','18974989-cd85-48b2-8169-348bc3481ef8','编 辑','edit()','1',2);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('d46540d4-03fb-4de8-a502-3cbe9e72e9bd','67025758-eb65-40b1-a59c-edee1b3ae938','添 加','add()','1',1);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('d6001817-3246-4d7b-a86e-49d771fdb082','12187d67-5ab9-4ae4-bbee-9a772cebd0de','禁 用','state(\'0\')','1',3);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('d6d1f29e-99a2-4621-b89c-b6f8ad2a4d52','425d0211-0196-4456-a24b-3e8d614dec8b','删 除','del()','1',4);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('db1df28e-ddf2-45b6-9a8c-c0f76d50a4ac','003c47c5-7041-4cfa-8631-82c00ab3fb35','添加一级菜单','addOne()','1',0);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('db28584c-7dfa-4ce2-9c37-fb6f69259938','6ad6b178-d6af-4fc6-9962-2b1ea49e0f2f','办 理','pro()','1',2);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('dd6018a7-1757-44e6-823d-b782c6cf94e3','969d27f9-71f8-4cb8-a1bd-6343fe32bbb1','删 除','del()','1',2);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('dfc3a95f-db39-42b8-91b9-2682aa32c0ea','742470cc-eaf1-48c4-805c-44c9936a7622','办 理','pro()','1',2);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('e234bf55-ecff-4689-b90e-f8f9f58f1c9f','0af2a5d9-26e6-4b82-a07c-062a35b3a7e5','删 除','del()','1',3);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('e6636e5a-f71f-433e-9e42-7dd3d8babb31','f0709c68-3af5-413b-8503-0f0bc2a3eb74','删 除','del()','1',3);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('e919a9bf-2a08-4c66-9924-c7207fe04bae','12187d67-5ab9-4ae4-bbee-9a772cebd0de','启 用','state(\'1\')','1',2);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('eda69cc3-77c0-4ba4-8dfd-57da1bc5ce97','8afb6f01-ae46-447c-acfa-1a6e0964bbba','授 权','auth()','1',1);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('f0966fd2-e63f-44a4-ae75-7e006592e33a','5a47681c-63c3-47b1-8e1f-34d4dbba7d85','编 辑','edit()','1',2);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('f802308a-b962-4835-937e-3f46caa88c18','003c47c5-7041-4cfa-8631-82c00ab3fb35','改变所属菜单','parButton()','1',0);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('f93e7a6a-3365-4166-aaf1-65e4d9c5f9e5','8afb6f01-ae46-447c-acfa-1a6e0964bbba','删 除','del()','1',6);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('f9df095f-5d08-426a-adde-442db13672eb','3dc03dc5-56ba-46d9-b8ab-78d19c04cd86','删 除','del()','1',0);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('fcff283e-2dcc-4735-afb7-ee0375d32a9d','0af2a5d9-26e6-4b82-a07c-062a35b3a7e5','添 加','add()','1',1);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('fe7040da-d2c6-4069-af3d-c9cbbcdf18db','d301815a-1583-4eb9-b1a2-44f1b819cc9d','编 辑','edit()','1',2);
insert  into `freecms_operbutton`(`id`,`func`,`name`,`code`,`isOk`,`orderNum`) values ('fe923f0e-62ac-4a00-ba51-6a27f37ddc60','003c47c5-7041-4cfa-8631-82c00ab3fb35','添加下级菜单','addSon()','1',0);

-- ----------------------------
-- Records of freecms_role_func
-- ----------------------------
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('011d8fd6-fd0c-4207-a6e0-648f06cf48d9','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','2b89c1fd-9e85-40d0-9ad8-9d401526d8fe');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('058bce5a-cd3b-4b73-bb5f-6eeef36fb326','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','95088cf5-299d-495a-896e-b3eae1a404c0');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('0ca42f48-c62b-4d3b-8dab-1343519051b8','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','47b80631-bb6e-4abd-8e47-5b99bce8b3bd');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('11351937-f2e3-4f10-9b9b-2cdc1babbbd7','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','5f3a8e01-4216-4982-b07b-ad367fe9ef96');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('150d09ee-c23a-46d2-8aaf-0b9c1bee4e2f','d5a82b5b-f0ba-4c7e-8554-26d88ee70a22','64f2084d-3fe7-4345-85c6-4dc835c1b939');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('1b7434e5-2f7e-4b77-bb0e-016c211d47e7','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','df4647eb-8758-451c-bdcd-54c2d180c474');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('1e9c224b-a4fe-465e-972f-724c5651807f','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','425d0211-0196-4456-a24b-3e8d614dec8b');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('210ba1a3-7a2e-4f86-b419-ec20c97d0a54','d5a82b5b-f0ba-4c7e-8554-26d88ee70a22','0bec6b84-19be-4d99-bc44-ca1d8472148f');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('213b1ac5-116d-4166-9c32-9facd4b1a98b','d5a82b5b-f0ba-4c7e-8554-26d88ee70a22','cb42d736-3386-42b8-a9f7-62840c4ecefa');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('2297cae4-a395-4cab-9af1-1f78d459a523','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','742470cc-eaf1-48c4-805c-44c9936a7622');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('263bc6bd-f274-4f1b-9191-b3b8d0c95152','d5a82b5b-f0ba-4c7e-8554-26d88ee70a22','67705234-603a-47c7-8f0d-8cdd349fd7c6');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('2b334331-7a66-4b5c-bd12-ac98109eb8e1','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','67025758-eb65-40b1-a59c-edee1b3ae938');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('2ff19fe8-b5c7-42a3-ad35-02f5caf187e2','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','5257f8fd-9da2-4e83-8538-b6ffca22e45a');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('3445c49f-d17a-43c4-a8f2-e56c35794aca','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','a5452f4f-1a1b-4980-90a3-4a60a38ba373');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('37f10813-6e90-42a4-b2bc-32727fc8302b','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','969d27f9-71f8-4cb8-a1bd-6343fe32bbb1');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('393cbffc-2d21-4203-8f27-ac8a40411932','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','66ecf6f7-1911-4e7e-8089-3a01f44a6d12');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('438df26e-94ee-454d-acc0-fd56cddb0bf9','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','cb42d736-3386-42b8-a9f7-62840c4ecefa');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('4676138f-1a2e-43b1-a8d4-d8fdb6afa878','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','19eebfb0-16b5-40eb-a909-1bd37ef7d745');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('4cd0268a-2afd-4138-8415-78e36463b92b','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','88749e6a-a8ec-47ef-aa4a-f7912d0ed12c');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('4d8f5c3f-2171-4ba8-8183-478edd4749c0','d5a82b5b-f0ba-4c7e-8554-26d88ee70a22','88749e6a-a8ec-47ef-aa4a-f7912d0ed12c');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('4dd72e33-2afd-40c5-8c5c-2b6cebb8d067','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','003c47c5-7041-4cfa-8631-82c00ab3fb35');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('56be2722-f688-4f39-9b08-41b943183b3b','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','0af2a5d9-26e6-4b82-a07c-062a35b3a7e5');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('5b4fa9b1-3dac-4547-8169-76f450e9e85a','d5a82b5b-f0ba-4c7e-8554-26d88ee70a22','5a47681c-63c3-47b1-8e1f-34d4dbba7d85');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('5b580be5-4552-495c-b503-49f326e55b68','d5a82b5b-f0ba-4c7e-8554-26d88ee70a22','08cfd343-2803-403e-b952-f7d41199d8e1');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('5ef90f9d-8cf3-42a8-a6eb-0091f3b52d54','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','ea3034c4-5a98-4a8a-a175-7c43e42aa939');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('60300c12-a38e-4968-8848-35e4a8c758b4','d5a82b5b-f0ba-4c7e-8554-26d88ee70a22','47b80631-bb6e-4abd-8e47-5b99bce8b3bd');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('60a5e528-31bb-4b2d-9047-efcf4b5c9b0e','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','26622672-9a10-4e4e-93a7-7fe50a9208b3');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('6100e3ba-4e2e-47e7-8f64-d2b2db0335a9','d5a82b5b-f0ba-4c7e-8554-26d88ee70a22','18974989-cd85-48b2-8169-348bc3481ef8');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('63d716ed-a17f-4144-ba14-1475972dcf8c','d5a82b5b-f0ba-4c7e-8554-26d88ee70a22','742470cc-eaf1-48c4-805c-44c9936a7622');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('64241dc0-fda4-4f58-8c17-75b0ab48f2db','d5a82b5b-f0ba-4c7e-8554-26d88ee70a22','e01bb9aa-b122-41ac-b28c-e97993c2d250');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('7328120e-7241-44c6-a852-54267155e187','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','18974989-cd85-48b2-8169-348bc3481ef8');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('738d4447-b9c7-43bc-a2e6-6ffcdf4d1ff1','d5a82b5b-f0ba-4c7e-8554-26d88ee70a22','c0ac116b-2b2a-4a09-ba25-0c2fffc12b4d');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('813b6de1-8d96-4a0e-be6b-89348a36f05c','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','08cfd343-2803-403e-b952-f7d41199d8e1');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('8aa8f12b-de3b-412d-89c4-c8dd94118b77','d5a82b5b-f0ba-4c7e-8554-26d88ee70a22','26622672-9a10-4e4e-93a7-7fe50a9208b3');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('8ffc46e4-14fb-4ba9-887e-fb372e4caaec','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','0bec6b84-19be-4d99-bc44-ca1d8472148f');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('92ad4f3a-ef23-4521-aad4-39dab6f4efd4','d5a82b5b-f0ba-4c7e-8554-26d88ee70a22','6c561fe7-2013-4ce5-bf9a-42874b07a99e');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('a2b3a078-d673-4752-ad0f-4c3bc9d18f37','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','58fe298f-b448-40bb-a1c0-d81134efa4af');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('a73eb267-54d8-4b61-b35f-0f2d97947971','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','14a4e894-1a48-4145-b467-0fe0499e8758');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('ac8e469d-07c1-42b2-8a88-f5a256f9f98e','d5a82b5b-f0ba-4c7e-8554-26d88ee70a22','e3066945-edb5-43ca-b29a-a0f96f98a50e');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('b2044d86-d02c-4342-945b-7ff6ee574b54','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','e63b222f-3ccb-4e22-b8ab-7cd0dece9f06');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('b25fc673-7ff0-4c34-af9b-efcdd683a2d4','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','12187d67-5ab9-4ae4-bbee-9a772cebd0de');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('b32ef6ec-c490-4388-8da0-391145a8e55a','d5a82b5b-f0ba-4c7e-8554-26d88ee70a22','425d0211-0196-4456-a24b-3e8d614dec8b');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('b39566ed-77e9-4cbf-89b5-4762d7122be3','d5a82b5b-f0ba-4c7e-8554-26d88ee70a22','f0709c68-3af5-413b-8503-0f0bc2a3eb74');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('bc7dfd13-29db-4dfc-9abc-0dc82f3ad7db','d5a82b5b-f0ba-4c7e-8554-26d88ee70a22','5257f8fd-9da2-4e83-8538-b6ffca22e45a');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('bed880b3-ab93-4d3a-9fed-0ce9214ff2d6','d5a82b5b-f0ba-4c7e-8554-26d88ee70a22','4331df96-2b8d-4dcf-9bdb-1015dfd0a759');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('bf9182d6-16ec-4d79-952d-8867a23a887a','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','3dc03dc5-56ba-46d9-b8ab-78d19c04cd86');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('c3e86733-7020-41bc-b888-58b1b6dba341','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','2403873a-48fb-48ac-acd0-af4098df1a0a');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('c940bb28-6519-4678-aad0-ac3b38be9df3','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','f0709c68-3af5-413b-8503-0f0bc2a3eb74');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('cd57e2f1-c307-414f-a13c-1a550e3a8cc8','d5a82b5b-f0ba-4c7e-8554-26d88ee70a22','a5452f4f-1a1b-4980-90a3-4a60a38ba373');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('cdfa9c7a-46da-45c3-bbaf-50315b9a59fd','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','5a47681c-63c3-47b1-8e1f-34d4dbba7d85');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('cedd82fc-9a02-460a-904d-03683c53fed5','d5a82b5b-f0ba-4c7e-8554-26d88ee70a22','e63b222f-3ccb-4e22-b8ab-7cd0dece9f06');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('cf58732e-cb40-4b9a-a78a-afacacf9ebfe','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','3e344b36-736e-4afd-8216-beb4fa54d467');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('d012680a-88b1-40b0-99a4-aa51dc11d7c8','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','4331df96-2b8d-4dcf-9bdb-1015dfd0a759');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('d16e529d-1691-4ed6-a8c7-d24a513cef70','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','15dfc8ac-bfda-40cc-abb1-f563c1a1d1d2');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('d3bde903-f60a-43f4-96dc-b2be8d37d0f4','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','e3066945-edb5-43ca-b29a-a0f96f98a50e');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('d9e664a8-03d8-40c3-8154-a97fb3a67615','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','64f2084d-3fe7-4345-85c6-4dc835c1b939');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('dd298cc2-70ef-4b4b-9306-44dd16595050','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','8afb6f01-ae46-447c-acfa-1a6e0964bbba');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('df926af7-bc89-4424-bf20-0f5a8d55846a','d5a82b5b-f0ba-4c7e-8554-26d88ee70a22','5f3a8e01-4216-4982-b07b-ad367fe9ef96');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('e0907746-36d5-4577-8453-8282d05cd516','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','8acc3be4-a2f6-4fe8-903f-9fd5867f985a');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('e21dbb10-38b6-4f1b-87f9-c7e4605ceb44','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','e01bb9aa-b122-41ac-b28c-e97993c2d250');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('e28496d1-77ca-4f87-8573-b94c7e8c2284','d5a82b5b-f0ba-4c7e-8554-26d88ee70a22','67025758-eb65-40b1-a59c-edee1b3ae938');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('e3c1df82-85f2-4f5a-8469-bd994a3ab1bf','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','c0ac116b-2b2a-4a09-ba25-0c2fffc12b4d');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('e49be6ae-7121-4a6e-9eb0-d639feb87bc5','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','6c561fe7-2013-4ce5-bf9a-42874b07a99e');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('ecad88b4-6c2e-4343-b53b-0f7f253b6406','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','6f32a2b6-a552-4a91-a10c-2962af63eca7');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('f5f92caf-cb4b-49a4-a605-d25b264776f6','d5a82b5b-f0ba-4c7e-8554-26d88ee70a22','2b89c1fd-9e85-40d0-9ad8-9d401526d8fe');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('f8bb0022-fc60-4a50-a061-cbe71aa8b794','db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','67705234-603a-47c7-8f0d-8cdd349fd7c6');
insert  into `freecms_role_func`(`id`,`roleId`,`funcId`) values ('f8f98529-8f63-4fb6-b211-f93cfe134029','d5a82b5b-f0ba-4c7e-8554-26d88ee70a22','58fe298f-b448-40bb-a1c0-d81134efa4af');

-- ----------------------------
-- Records of freecms_role_user
-- ----------------------------
insert  into `freecms_role_user`(`id`,`roles`,`users`) values ('b7b9ea15-47dc-458d-b99d-82d3567addfe','d5a82b5b-f0ba-4c7e-8554-26d88ee70a22','fdc995ef-e96f-4c00-9746-4b5a9b365caa');

-- ----------------------------
-- Records of freecms_roles
-- ----------------------------
insert  into `freecms_roles`(`id`,`name`,`isOk`,`adduser`) values ('d5a82b5b-f0ba-4c7e-8554-26d88ee70a22','站点管理员','1','admin');
insert  into `freecms_roles`(`id`,`name`,`isOk`,`adduser`) values ('db57809a-f8f5-43d5-8c97-8b6ccdd3b9a3','管理员','1','admin');

-- ----------------------------
-- Records of freecms_users
-- ----------------------------
insert  into `freecms_users`(`id`,`loginName`,`roleNames`,`name`,`pwd`,`sex`,`birthday`,`tel`,`mobilephone`,`email`,`isOk`,`lastLoginTime`,`lastestLoginTime`,`loginFailNum`,`loginNum`,`addTime`,`unitNames`,`unitIds`,`ismail`) values ('02debc9f-53cd-4bc9-887b-49ffc4e925f2','admin','管理员;','管理员','523af537946b79c4f8369ed39ba78605','1',NULL,'','','freeteam@foxmail.com','1','2013-06-24 20:32:40','2013-06-24 20:33:02',0,0,NULL,'','','1');
insert  into `freecms_users`(`id`,`loginName`,`roleNames`,`name`,`pwd`,`sex`,`birthday`,`tel`,`mobilephone`,`email`,`isOk`,`lastLoginTime`,`lastestLoginTime`,`loginFailNum`,`loginNum`,`addTime`,`unitNames`,`unitIds`,`ismail`) values ('fdc995ef-e96f-4c00-9746-4b5a9b365caa','freecms','站点管理员;','freecms','523af537946b79c4f8369ed39ba78605','1','2012-11-06 00:00:00','','','','1','2013-05-15 17:35:21','2013-05-29 16:49:48',0,0,'2012-11-28 20:25:41','freeteam','freeteam;',NULL);