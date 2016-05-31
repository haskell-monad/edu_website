<%@ page language="java" pageEncoding="UTF-8"%>
<%@   taglib uri="http://ckfinder.com" prefix="ckfinder"%>
<%@   taglib uri="http://ckeditor.com" prefix="ckeditor"%>
<%@page import="java.util.UUID"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="cn.freeteam.cms.model.Info"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="fs" uri="/fs-tags"%>
<%@include file="../../util/checkParentFrame.jsp"%>
<%@include file="checkSelectSite.jsp"%>

<%
	String bathPath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<html>
<head>
<link rel="stylesheet" href="../../img/common.css" type="text/css" />
<link rel="stylesheet" href="../../img/style.css" type="text/css" />
<link rel="stylesheet" href="../../img/style3.css" type="text/css" />
<link rel="stylesheet" href="../../js/jquery.treeview.css" />
<link type="text/css" rel="stylesheet" href="../../js/weebox0.4/weebox.css" />
<link rel="stylesheet" href="js/uploadify/uploadify.css" type="text/css" />
<script type="text/javascript" src="../../js/jquery-1.5.1.min.js"></script>
<jsp:include page="../../jbox.jsp" />
<script type="text/javascript" src="../../js/check.js"></script>
<script src="../../js/jquery.cookie.js" type="text/javascript"></script>
<script src="../../js/jquery.treeview.js" type="text/javascript"></script>
<script src="../../js/jquery.treeview.edit.js" type="text/javascript"></script>
<script src="../../js/jquery.treeview.async.js" type="text/javascript"></script>
<script type="text/javascript" src="../../js/weebox0.4/bgiframe.js"></script>
<script type="text/javascript" src="../../js/weebox0.4/weebox.js"></script>
<script type="text/javascript" src="../../js/jscolor/jscolor.js"></script>
<script language="javascript" type="text/javascript" src="../../My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/infoEdit.js"></script>
<script type="text/javascript" src="../ckfinder/ckfinder.js"></script>
<script type="text/javascript" src="../../js/ckfinderUtil.jsp"></script>
<script type="text/javascript" src="js/uploadify/swfobject.js"></script>
<script type="text/javascript" src="js/uploadify/jquery.uploadify.min.js"></script>
<script type="text/javascript" src="js/uploadify/uploadify-init.js"></script>

<script type="text/javascript">
				$(function(){
					$.ajax({
						   type: "GET",
						   dataType:"json",
						   url: "/source_findAllSource.do",
						   data: {},
						   success: function(rdata){
							   	var data=rdata;
							   	var content="";
							   	for(var i=0;i<data.length;i++){
							   		var name=data[i].name;
							   		content="<option value='"+name+"'>"+name+"</option>";
							   		$("#kssz").append(content);
							   	}
						   }
					});
					$("#kssz").change(function(){
						var value=$("#kssz").val();   //获取Select选择的来源 Value 	
						if(value!="kssz"){
							$("#source").val(value);
						}
					});
					var htmlorder=$("#htmlorder").attr("value");
					if(typeof(htmlorder) == "undefined"){
						//判断长标题是否存在重复的数据
						$("#title").focusout(function(){
							var titles=$("#title").val();
							$("#repeatTitle").empty();
							$.ajax({
								   type: "POST",
								   dataType:"json",
								   url: "/info_checkTitle.do",
								   data: {"info.title":titles},
								   success: function(rdata){
									   	var data=rdata;
									   	var content="";
									   	for(var i=0;i<data.length;i++){
									   		var title=data[i].title;
									   		var pageurl=data[i].pageurl;
									   		content+="<a href='/"+pageurl+"' target='_blank'>"+title+"</a><br/>";
									   	}
									   	$("#repeatTitle").append(content);
								   }							
							});
						});
					}
				});
				//信息图片
				function checkBoxValidate(cb) {
					for (var j = 0; j < 2; j++) {
						if (eval("document.MyForm.ckbox[" + j + "].checked") == true) {
							document.MyForm.ckbox[j].checked = false;
							if (j == cb) {
								document.MyForm.ckbox[j].checked = true;
							}
						}
					}
				}
				//图片集
				function imagesCheckBoxValidate(cb) {
					for (var j = 0; j < 2; j++) {
						if (eval("document.MyForm.ickbox[" + j + "].checked") == true) {
							document.MyForm.ickbox[j].checked = false;
							if (j == cb) {
								document.MyForm.ickbox[j].checked = true;
							}
						}
					}
				}
		</script>
<script type="text/javascript">
	   		$(function(){
		   		 $.initUploadify({
						inputFile:"#file_upload",
						buttonText:'图片集',
						method: 'get',
						uploader:'/servlet/Upload.java',
						formData:{param1 : "imgs"},
						onUploadStart:function(file){
							var b_bj=document.getElementById("b_images_checkbox");
							var s_bj=document.getElementById("s_images_checkbox");
							if(b_bj.checked==true){
								$("#file_upload").uploadify("settings","formData",{"images":"imgs","iswater":"1"});
							}else if(s_bj.checked==true){
								$("#file_upload").uploadify("settings","formData",{"images":"imgs","iswater":"2"});
							}else{
								$("#file_upload").uploadify("settings","formData",{"images":"imgs","iswater":"0"});
							}
						},
						onUploadSuccess:function(file, ptl, response){
							var obj=eval("("+ptl+")");
							var url=obj.url;
							uploadImgShows(url);
				        }
		   		 });
		   		 $.initUploadify({
						inputFile:"#infoImg_upload",
						uploader:'/servlet/Upload.java',
						buttonText:'信息图片',
						multi: false,
						method: 'get',
						formData:{param1 : "infoimg",'iswater':'0'},
						onUploadStart:function(file){
							var bbj=document.getElementById("b_checkbox");
							var sbj=document.getElementById("s_checkbox");
							if(bbj.checked==true){
								$("#infoImg_upload").uploadify("settings","formData",{"images":"infoimg","iswater":"1"});
							}else if(sbj.checked==true){
								$("#infoImg_upload").uploadify("settings","formData",{"images":"infoimg","iswater":"2"});
							}else{
								$("#infoImg_upload").uploadify("settings","formData",{"images":"infoimg","iswater":"0"});
							}
						},
						onUploadSuccess:function(file, ptl, response){
							var obj=eval("("+ptl+")");
							var url=obj.url;
							infoImgShow(url);
				        }
                	});
			});

		</script>
</head>
<body>
	<form id=MyForm method=post name=MyForm action=info_editDo.do enctype="multipart/form-data">
		<input type="hidden" name="pageFuncId" id="pageFuncId" value="${pageFuncId }" /> 
		<input type="hidden" name="info.id" value="${info.id }" /> 
		<input type="hidden" name="type" value="<%=((request.getParameter("channel.id") != null || request
					.getParameter("info.id") != null) ? "channel" : "quick")%>" />
		<div class=tab>
			<div class=tabOn>信息编辑</div>
			<div class=clearer></div>
		</div>
		<div class=column>
			<TABLE cellSpacing=4 cellPadding=4 width="98%" align=center>
				<tbody>
					<input type="hidden" name="info.site" id="siteId"
						value="${site.id }" />
					<s:if test="%{info.htmlIndexnum!=null}">
						<tr>
							<td width="10%" align="left"><label id=ctl01_ctl00_label><IMG
									style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
									id=ctl01_ctl00_imgHelp tabIndex=-1 title=信息的唯一索引号，生成静态页面时使用
									src="../../img/help.gif"> <NOBR> <span
										id=ctl01_ctl00_lblLabel>html索引号：</span> </NOBR> </label></td>
							<td width="90%" colspan="3" align="left">
							<input id="htmlorder" onblur="this.className='inputblur';" readonly class=inputblur
								onfocus="this.className='inputfocus';" maxLength=250 type=text
								value="${info.htmlIndexnum }"></td>
						</tr>
					</s:if>
					<tr>
						<td width="10%" align="left"><label id=ctl01_ctl00_label><IMG
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择栏目
								src="../../img/help.gif"> <NOBR> <span
									id=ctl01_ctl00_lblLabel>所属栏目：</span> </NOBR> </label></td>
						<td width="90%" colspan="3" align="left"><input type="hidden"
							name="lmy_channelids" id="channelId" value="${channel.id }" /> <input
							type="hidden" name="info.channel" id="channelId"
							value="${channel.id }" /> <input type="hidden"
							name="oldchannelid" value="${channel.id }" /> <input
							onblur="this.className='inputblur';" readonly id="channelName"
							onclick="selectChannel()" class=inputblur
							onfocus="this.className='inputfocus';" style="cursor: hand"
							title="点击选择栏目" maxLength=50 type=text name=channel.name
							value="${channel.name }" /> <span id=ctl03>*</span></td>
					</tr>
					<tr>
						<td width="10%" align="left"><label id=ctl01_ctl00_label>
<IMG style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px" id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入长标题 src="../../img/help.gif"> <NOBR> 
<span id=ctl01_ctl00_lblLabel>长标题：</span> </NOBR> </label></td>
						<td width="90%" colspan="3" align="left">
						<img src="../../img/biaochi.gif" /><br />
<input style="width: 450px; font-size: 14px" onblur="this.className='inputblur';" id="title" class=inputblur onfocus="this.className='inputfocus';" maxLength="250" name="info.title" type="text" value='${info.title}' >
						</td>
					</tr>
					
					<!--显示重复的标题列表-->
					<tr>
						<td width="10%" align="left"></td>
						<td width="90%" colspan="3" align="left">
							<em id="repeatTitle"></em>
						</td>
					</tr>
					
					<tr>
						<td width="10%" align="left"><label id=ctl01_ctl00_label>
<IMG style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px" id=ctl01_ctl00_imgHelp tabIndex=-1 alt=在列表中显示，留空则显示完整标题 src="../../img/help.gif"> 
								<NOBR><span id=ctl01_ctl00_lblLabel>短标题：</span></NOBR> </label>
						</td>
						<td width="90%" colspan="3" align="left">
						<img src="../../img/biaochi.gif" /><br /> 
		<input style="width: 450px; font-size: 14px" onblur="this.className='inputblur';" id=shortTitle class=inputblur onfocus="this.className='inputfocus';" maxLength="250" name="info.shorttitle" type="text"  value='${info.shorttitle}' ></td>
					</tr>
					<!-- 
						<tr>
							<td width="30%" align="left">
								<label id=ctl01_ctl00_label><IMG
											style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择标题颜色
											src="../../img/help.gif">
									<NOBR>
										<span id=ctl01_ctl00_lblLabel>标题颜色：</span>
									</NOBR>
								</label>
							</td>
							<td width="70%" align="left">
								<input  id=titleColor
									class="color"
									maxLength=50 type=text name=info.titlecolor value="${info.titlecolor }">
							</td>
						</tr>
						 -->
					<tr>
						<td width="10%" align="left"><label id=ctl01_ctl00_label><IMG
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入信息来源
								src="../../img/help.gif"> <NOBR> <span
									id=ctl01_ctl00_lblLabel>来源：</span> </NOBR> </label></td>
						<td width="40%" align="left"><input
							onblur="this.className='inputblur';" id=source class=inputblur
							onfocus="this.className='inputfocus';" maxLength=50 type=text
							name=info.source value="${info.source }" /> 
							<select id="kssz" name="kssz" >
								<option value="kssz" selected="selected">快速设置</option>
						</select></td>
						<td width="10%" align="left"><label id=ctl01_ctl00_label><IMG
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入信息作者
								src="../../img/help.gif"> <NOBR> <span
									id=ctl01_ctl00_lblLabel>作者：</span> </NOBR> </label></td>
						<td width="40%" align="left"><input
							onblur="this.className='inputblur';" id=author class=inputblur
							onfocus="this.className='inputfocus';" maxLength=50 type=text
							name=info.author
							value="<s:if test='info == null || info.author==null'></s:if><s:else>${info.author}</s:else>"></td>
					</tr>
					<tr>
						<td width="10%" align="left"><label id=ctl01_ctl00_label><IMG
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入关键词，用,分隔
								src="../../img/help.gif"> <NOBR> <span
									id=ctl01_ctl00_lblLabel>关键词：</span> </NOBR> </label></td>
						<td width="40%" align="left"><input name=info.keywords
							type=text class=inputblur id=keywords
							onfocus="this.className='inputfocus';"
							onblur="this.className='inputblur';" value="${info.keywords }"
							size="50" maxLength=50> <br /> 多个关键词之间用,分隔</td>
						<td width="10%" align="left"><label id=ctl01_ctl00_label><IMG
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入Tag标签，用,分隔
								src="../../img/help.gif"> <NOBR> <span
									id=ctl01_ctl00_lblLabel>Tag标签：</span> </NOBR> </label></td>
						<td width="40%" align="left"><input name=info.tags type=text
							class=inputblur id=tags onfocus="this.className='inputfocus';"
							onblur="this.className='inputblur';" value="${info.tags }"
							size="50" maxLength=50> <br /> 多个标签之间用,分隔</td>
					</tr>
					<tr>
						<td width="10%" align="left"><label id=ctl01_ctl00_label><IMG
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl01_ctl00_imgHelp tabIndex=-1
								alt=请输入外部链接,输入后点击此信息标题会直接进入此外部链接 src="../../img/help.gif">
								<NOBR> <span id=ctl01_ctl00_lblLabel>外部链接：</span> </NOBR> </label></td>
						<td width="40%" align="left"><input
							onblur="this.className='inputblur';" id=url class=inputblur
							onfocus="this.className='inputfocus';" maxLength=250 size="50"
							type=text name=info.url value="${info.url }"></td>
						<td width="10%" align="left"><label id=ctl01_ctl00_label><IMG
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择标题是否加粗
								src="../../img/help.gif"> <NOBR> <span
									id=ctl01_ctl00_lblLabel>标题加粗：</span> </NOBR> </label></td>
						<td width="40%" align="left"><input type="radio" id="isblob1"
							name="info.titleblod" value="1"
							<s:if test="info.titleblod==1">checked="checked"</s:if>>是
							<input type="radio" id="isblob0" name="info.titleblod" value="0"
							<s:if test="info==null || info.titleblod==null || info.titleblod==0">checked="checked"</s:if>>否
						</td>
					</tr>
					<tr>
						<td width="10%" align="left"><label id=ctl01_ctl00_label><IMG
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入信息摘要
								src="../../img/help.gif"> <NOBR> <span
									id=ctl01_ctl00_lblLabel>新闻摘要：</span> </NOBR> </label></td>
						<td width="90%" colspan="3" align="left"><textarea
								onblur="this.className='inputblur';" class=inputblur
								onfocus="this.className='inputfocus';" type=text id=description
								name=info.description cols="100" rows="4">${info.description }</textarea>
						</td>
					</tr>


					<tr>
						<td width="10%" align="left"><label id=ctl01_ctl00_label><IMG
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择是否评论
								src="../../img/help.gif"> <NOBR> <span
									id=ctl01_ctl00_lblLabel>是否评论：</span> </NOBR> </label></td>
						<td width="40%" align="left"><input type="radio"
							id="iscomment0" name="info.iscomment" value="0"
							<s:if test="info.iscomment==0">checked="checked"</s:if>>否
							<input type="radio" id="iscomment1" name="info.iscomment"
							value="1" <s:if test="info.iscomment==1">checked="checked"</s:if>>会员评论
							<input type="radio" id="iscomment2" name="info.iscomment"
							value="2"
							<s:if test="info==null || info.iscomment==null || info.iscomment==2">checked="checked"</s:if>>会员和匿名评论
						</td>
						<td width="10%" align="left"><label id=ctl01_ctl00_label><IMG
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择生成信息静态页面的信息模板
								src="../../img/help.gif"> <NOBR> <span
									id=ctl01_ctl00_lblLabel>信息模板：</span> </NOBR> </label></td>
						<td width="40%" align="left"><input
							onblur="this.className='inputblur';" id=templet readonly
							style="cursor: hand" title="点击选择模板文件" class=inputblur
							onfocus="this.className='inputfocus';"
							onclick="selectTempletFile('templet')" maxLength=50 type=text
							name=info.templet value="${info.templet }" /></td>
					</tr>
					<!-- 
						<tr>
							<td width="30%" align="left">
								<label id=ctl01_ctl00_label><IMG
											style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择是否签收
											src="../../img/help.gif">
									<NOBR>
										<span id=ctl01_ctl00_lblLabel>是否签收：</span>
									</NOBR>
								</label>
							</td>
							<td width="70%" align="left">
								<input type="radio" id="issign1" onclick="issign(1)" name="info.issign" value="1" <s:if test="info.issign==1">checked="checked"</s:if>>是
								<input type="radio" id="issign0"  onclick="issign(0)" name="info.issign" value="0" <s:if test="info==null || info.issign==null || info.issign==0">checked="checked"</s:if> >否
							
							</td>
						</tr>
						<tr style="display:${"1"==info.issign?"block":"none" }" id="signtr">
							<td width="30%" align="left">
								<label id=ctl01_ctl00_label><IMG
											style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择签收用户
											src="../../img/help.gif">
									<NOBR>
										<span id=ctl01_ctl00_lblLabel>签收用户：</span>
									</NOBR>
								</label>
							</td>
							<td width="70%" align="left">
							<input type="checkbox" onclick="checkallsign(this.checked)">全部<br/>
							<table><tr>
							<s:iterator value="userList" id="obj" status="bean">
							<td><input name="signusers" 
							
								<s:iterator value="infosignList" id="infosign" >
								${obj.id == infosign.userid ?"checked":"" }
								</s:iterator>
							 type="checkbox" value="<s:property value="id"/>"><s:property value="name"/></td>
							${(bean.index+1)%6==0?"</tr><tr>":""  }							
							</s:iterator>
							</tr></table>
							</td>
						</tr>
						<tr>
							<td width="30%" align="left">
								<label id=ctl01_ctl00_label><IMG
											style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入索引号，政府信息公开使用
											src="../../img/help.gif">
									<NOBR>
										<span id=ctl01_ctl00_lblLabel>政府信息索引号：</span>
									</NOBR>
								</label>
							</td>
							<td width="70%" align="left">
								<input onblur="this.className='inputblur';" id=indexnum size="50"
									class=inputblur onfocus="this.className='inputfocus';" 
									maxLength=50 type=text name=info.indexnum value="${info.indexnum }">
							</td>
						</tr>
						<tr>
							<td width="30%" align="left">
								<label id=ctl01_ctl00_label><IMG
											style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择政府信息公开形式
											src="../../img/help.gif">
									<NOBR>
										<span id=ctl01_ctl00_lblLabel>政府信息公开形式：</span>
									</NOBR>
								</label>
							</td>
							<td width="70%" align="left">
								<input type="radio"   name="info.opentype" value="1" <s:if test="info==null || info.opentype==null || info.opentype==1">checked="checked"</s:if>>主动公开
								<input type="radio"   name="info.opentype" value="0" <s:if test="info.opentype==0">checked="checked"</s:if> >依申请公开
							
							</td>
						</tr>
						<tr>
							<td width="30%" align="left">
								<label id=ctl01_ctl00_label><IMG
											style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择政府信息公开时限
											src="../../img/help.gif">
									<NOBR>
										<span id=ctl01_ctl00_lblLabel>政府信息公开时限：</span>
									</NOBR>
								</label>
							</td>
							<td width="70%" align="left">
								<input type="radio" id="opentimetype1" onclick="opentimetype(1)" name="info.opentimetype" value="1" <s:if test="info==null || info.opentimetype==null || info.opentimetype==1">checked="checked"</s:if>>常年公开
								<input type="radio" id="opentimetype0"  onclick="opentimetype(0)" name="info.opentimetype" value="0" <s:if test="info.opentimetype==0">checked="checked"</s:if> >限时公开
							<input name="info.openendtime" id="openendtime" style="display:${"0"==info.opentimetype?"block":"none"}"
							 class="Wdate"  
							title="选择公开结束时间，没有则表示常年公开!" type="text" size="24" value="${info.openendtimeStr }"  
							onClick="WdatePicker({skin:'default',dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
							
							</td>
						</tr>
						 -->
					<tr>
						<td width="10%" rowspan="3" align="left"><label
							id=ctl01_ctl00_label><IMG
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入视频地址或上传视频文件
								src="../../img/help.gif"> <NOBR> <span
									id=ctl01_ctl00_lblLabel>视频：</span> </NOBR> </label></td>
						<td width="90%" colspan="3" align="left">视频地址:<input
							onblur="this.className='inputblur';" id=video class=inputblur
							onfocus="this.className='inputfocus';" maxLength=250 size="45"
							type=text name=info.video value="${info.video }"><br>
						</td>
					</tr>
					<tr>
						<td colspan="3" align="left">视频上传:<input
							onblur="this.className='inputblur';" id=videoUpload
							class=inputblur onfocus="this.className='inputfocus';" size="45"
							type=file name=videoUpload value=""></td>
					</tr>
					<tr>
						<td height="18" colspan="3" align="left">(请上传格式为flv的视频文件,最大支持1G)</td>
					</tr>
					<!--update by limengyu @20131209 图片集更改start-->
					<tr>
						<td width="10%" align="left"><label id=ctl02_ctl00_label>
								<IMG
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl02_ctl00_imgHelp tabIndex=-1 alt=请上传信息图片集
								src="../../img/help.gif"> <NOBR> 
								 <span id=ctl02_ctl00_lblLabel>图片集：</span> <br />
									添加大水印:<input type="checkbox" id="b_images_checkbox" name="ickbox"
										checked onClick="javascript:imagesCheckBoxValidate(0)" /> 
									添加小水印:<input type="checkbox" id="s_images_checkbox" name="ickbox"
										onClick="javascript:imagesCheckBoxValidate(1)" /> </NOBR>
						</label></td>
						<td colspan="3" align="left">
							<input id="file_upload" type="file" name="file_upload" /> <br />
							<input type="hidden" name="delOldimgs" id="delOldimgs" />
							<div id="imgs">
								<s:iterator value="infoImgList" id="bean">
									<table id='oldimgtable<s:property value="id"/>'>
										<tr>
											<td rowspan='4'>
												<input type='hidden' name='oldimgsid<s:property value="id"/>'
												value='<s:property value="id"/>' /> 
												<input type='hidden' name='oldimgsurl<s:property value="id"/>'
												value='<s:property value="img"/>'>
												<a href='<s:property value="img"/>' target='_blank'> 
												<img src='<s:property value="img"/>' width='150' height='120' title='点击查看大图' />
												</a>
											</td>
											<td>标题:</td>
											<td>
												<input onblur="this.className='inputblur';" class=inputblur onfocus="this.className='inputfocus';"
												maxLength=250 size=40 type=text name=oldimgstitle
												<s:property value="id"/> value='<s:property value="title"/>' />
											</td>
										</tr>
										<tr>
											<td>顺序:</td>
											<td>
												<input onblur="this.className='inputblur';" class=inputblur onfocus="this.className='inputfocus';"
												onkeyup=if(!isInt(value))execCommand('undo') onafterpaste=if(!isInt(value))execCommand('undo').maxLength=10 size=4 type=text
												name=oldimgsordernum <s:property value="id"/>
												value='<s:property value="ordernum"/>' />
											</td>
										</tr>
										<tr>
											<td>描述:</td>
											<td><textarea class=inputblur
													onfocus="this.className='inputfocus';"
													onblur="this.className='inputblur';if(this.value.length>500){alert('最多500个字符');this.focus()}"
													name=oldimgscontent <s:property value="id"/> cols=40 rows=3>
													<s:property value="content" />
												</textarea>(最多500个字符)</td>
										</tr>
										<tr>
											<td><input type='button' class='button' value='删 除'
												onclick="delOldImgs('<s:property value="id"/>');" /></td>
											<td></td>
										</tr>
									</table>
								</s:iterator>
							</div> 
							<!--<input type="button" class="button" value="添加图片" onclick="selectImgs()" />-->
							</td>
					</tr>
					<!--update by limengyu @20131209 图片集更改end-->
					<!--update by limengyu @21031210 信息图片start-->
					<tr>
						<td width="10%" align="left"><label id=ctl02_ctl00_label>
								<IMG
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl02_ctl00_imgHelp tabIndex=-1 alt=请上传信息图片
								src="../../img/help.gif"> <NOBR> <span
										id=ctl02_ctl00_lblLabel>信息图片：</span> <br> 
										添加大水印:<input type="checkbox" id="b_checkbox" name="ckbox"
										onClick="javascript:checkBoxValidate(0)" /> 
										添加小水印:<input type="checkbox" id="s_checkbox" name="ckbox"
										onClick="javascript:checkBoxValidate(1)" />
									</NOBR>
						</label></td>
						<td colspan="3" align="left">
						 <input id="infoImg_upload" type="file"
							name="infoImg_upload" /> 
						<input type="hidden" name="info.img" id="img" value="${info.img }" /> <span
							id="imgSpan"> <s:if
									test='%{info.img!=null && info.img != "" && info.img != "null"}'>
									<a href="${info.img }?date=<%=UUID.randomUUID() %>"
										target="_blank"> <img
										src="${info.img }?date=<%=UUID.randomUUID() %>" width="100"
										height="100" title="点击查看大图" />
									</a>
								</s:if>
						</span> <s:if
								test='%{info.img!=null && info.img != "" && info.img != "null"}'>
								<a style="display: block" id="imgDelBtn"
									href="javascript:delImg()">删除</a>
							</s:if> <s:if
								test='%{info.img==null || info.img == "" || info.img == "null"}'>
								<a style="display: none" id="imgDelBtn"
									href="javascript:delImg()">删除</a>
							</s:if> <br /> 
							<!-- <input type="button" class="button" value="选择图片" onclick="selectImg()" /> -->
						  </td>
					</tr>
					<!--update by limengyu @21031210 信息图片end-->
					<tr>
						<td width="10%" align="left"><label id=ctl01_ctl00_label><IMG
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请上传附件
								src="../../img/help.gif"> <NOBR> <span
									id=ctl01_ctl00_lblLabel>附件：</span> </NOBR> </label></td>
						<td width="90%" colspan="3" align="left"><input type="hidden"
							name="info.attchs" id="attchs" value="${info.attchs }" /> <span
							id="attchSpan"> <%
 	//获取附件列表
 	if (request.getAttribute("info") != null) {
 		Info info = (Info) request.getAttribute("info");
 		if (info != null && info.getAttchs() != null
 				&& info.getAttchs().trim().length() > 0) {
 			String[] attchs = info.getAttchs().split(";");
 			if (attchs != null && attchs.length > 0) {
 				for (int i = 0; i < attchs.length; i++) {
 					if (attchs[i].trim().length() > 0) {
 						String id = UUID.randomUUID().toString();
 						out.println("<span id='attch"
 								+ id
 								+ "' value='"
 								+ attchs[i]
 								+ "'><br><a  href='"
 								+ attchs[i]
 								+ "' target='_blank' title='点击下载'>"
 								+ URLDecoder.decode(attchs[i]
 										.substring(attchs[i]
 												.lastIndexOf("/") + 1),
 										"utf-8")
 								+ "</a>&nbsp;&nbsp;<a  href='javascript:delAttch(\""
 								+ id + "\")'>删除</a></span>");
 					}
 				}
 			}
 		}
 	}
 %>
						</span><br /> <input type="button" class="button" value="添加附件"
							onclick="selectFile()" /></td>
					</tr>
					<tr>
						<td width="10%" align="left"><label id=ctl01_ctl00_label><IMG
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入信息浏览次数
								src="../../img/help.gif"> <NOBR> <span
									id=ctl01_ctl00_lblLabel>浏览次数：</span> </NOBR> </label></td>
						<td width="40%" align="left"><input
							onblur="this.className='inputblur';" id=clicknum class=inputblur
							onfocus="this.className='inputfocus';" maxLength=50 type=text
							size="10" name=info.clicknum
							value="<s:if test='info.clicknum== null'>0</s:if><s:else>${info.clicknum}</s:else>">
						</td>
						<td width="10%" align="left"><label id=ctl01_ctl00_label><IMG
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入优先值
								src="../../img/help.gif"> <NOBR> <span
									id=ctl01_ctl00_lblLabel>优先值：</span> </NOBR> </label></td>
						<td width="40%" align="left"><input
							onblur="this.className='inputblur';" id=firstvalue
							class=inputblur onfocus="this.className='inputfocus';"
							maxLength=50 type=text size="10" name=info.firstvalue
							value="<s:if test='info.firstvalue== null'>0</s:if><s:else>${info.firstvalue}</s:else>"></td>
					</tr>
					<tr>
						<td width="10%" align="left"><label id=ctl01_ctl00_label><IMG
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择是否热点
								src="../../img/help.gif"> <NOBR> <span
									id=ctl01_ctl00_lblLabel>是否热点：</span> </NOBR> </label></td>
						<td width="40%" align="left"><input type="radio" id="ishot1"
							name="info.ishot" value="1"
							<s:if test="info.ishot==1">checked="checked"</s:if>>是 <input
							type="radio" id="ishot0" name="info.ishot" value="0"
							<s:if test="info==null || info.ishot==null || info.ishot==0">checked="checked"</s:if>>否

						</td>
						<td width="10%" align="left"><label id=ctl01_ctl00_label><IMG
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择是否固顶
								src="../../img/help.gif"> <NOBR> <span
									id=ctl01_ctl00_lblLabel>是否固顶：</span> </NOBR> </label></td>
						<td width="40%" align="left"><input type="radio" id="istop1"
							onclick="istop(1)" name="info.istop" value="1"
							<s:if test="info.istop==1">checked="checked"</s:if>>是 <input
							type="radio" id="istop0" onclick="istop(0)" name="info.istop"
							value="0"
							<s:if test="info==null || info.istop==null || info.istop==0">checked="checked"</s:if>>否
							<input name="info.topendtime" id="topendtime"
							style="display: none"
							<s:if test="info==null || info.istop==null || info.istop==0"></s:if>
							class="Wdate" title="选择固顶结束时间，没有则表示永远固顶!" type="text" size="24"
							value="${info.topendtimeStr }"
							onClick="WdatePicker({skin:'default',dateFmt:'yyyy-MM-dd HH:mm:ss'})" /></td>
					</tr>
					<tr>
						<td width="10%" align="left"><label id=ctl01_ctl00_label><img
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择是否发布
								src="../../img/help.gif" /> <NOBR> <span
									id=ctl01_ctl00_lblLabel>是否发布：</span> </NOBR> </label></td>
						<td width="40%" align="left"><input type="radio"
							id="ischeck1" name="info.ischeck" value="1"
							<s:if test="info==null || info.ischeck==null || info.ischeck==1">checked="checked"</s:if> />发布
							<input type="radio" id="ischeck0" name="info.ischeck" value="0"
							<s:if test="info.ischeck==0">checked="checked"</s:if> />不发布</td>
						<td width="10%" align="left"><label id=ctl01_ctl00_label><img
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择是否在首页显示
								src="../../img/help.gif" /> <NOBR> <span
									id=ctl01_ctl00_lblLabel>首页显示：</span> </NOBR> </label></td>
						<td width="40%" align="left"><input type="radio"
							id="isshowindex1" name="info.isshowindex" value="1"
							<s:if test="info==null || info.isshowindex==null || info.isshowindex==1">checked="checked"</s:if> />显示
							<input type="radio" id="isshowindex0" name="info.isshowindex"
							value="0"
							<s:if test="info.isshowindex==0">checked="checked"</s:if> />不显示
						</td>
					</tr>

					<tr>
						<td width="10%" align="left"><label id=ctl01_ctl00_label><img
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择是否在列表页显示
								src="../../img/help.gif" /> <NOBR> <span
									id=ctl01_ctl00_lblLabel>列表页显示：</span> </NOBR> </label></td>
						<td width="40%" align="left"><input type="radio"
							id="isshowlist1" name="info.isshowlist" value="1"
							<s:if test="info==null || info.isshowlist==null || info.isshowlist==1">checked="checked"</s:if> />显示
							<input type="radio" id="isshowlist0" name="info.isshowlist"
							value="0"
							<s:if test="info.isshowlist==0">checked="checked"</s:if> />不显示</td>
						<td width="10%" align="left"><label id=ctl01_ctl00_label><img
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择是否推荐
								src="../../img/help.gif" /> <NOBR> <span
									id=ctl01_ctl00_lblLabel>是否推荐：</span> </NOBR> </label></td>
						<td width="40%" align="left"><input type="radio"
							id="isrecommend1" name="info.isrecommend" value="1"
							<s:if test="info==null || info.isrecommend==null || info.isrecommend==1">checked="checked"</s:if> />推荐
							<input type="radio" id="isrecommend0" name="info.isrecommend"
							value="0"
							<s:if test="info.isrecommend==0">checked="checked"</s:if> />不推荐</td>
					</tr>
					
					<!--是否在新闻中心显示，1为显示，0为不显示-->
					<tr>
						<td width="10%" align="left"><label id=ctl01_ctl00_label><img
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择是否在新闻中心栏目显示
								src="../../img/help.gif" /> <NOBR> <span
									id=ctl01_ctl00_lblLabel>新闻中心显示：</span> </NOBR> </label></td>
						<td width="40%" align="left">
							<input type="radio" id="isshownewscenter1" name="info.isshownewscenter" value="1"
							<s:if test="info==null || info.isshownewscenter==null || info.isshownewscenter==1">checked="checked"</s:if> />显示
							<input type="radio" id="isshownewscenter0" name="info.isshownewscenter" value="0"
							<s:if test="info.isshownewscenter==0">checked="checked"</s:if> />不显示</td>
							
						<td width="10%" align="left"><label id=ctl01_ctl00_label><img
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择是否在新闻中心栏目置顶
								src="../../img/help.gif" /> <NOBR> <span
									id=ctl01_ctl00_lblLabel>新闻中心置顶：</span> </NOBR> </label></td>
						<td width="40%" align="left">
							<input type="radio" id="istopnewscenter1" name="info.istopnewscenter" value="1"
							<s:if test="info==null || info.istopnewscenter==null || info.istopnewscenter==1">checked="checked"</s:if> />是
							<input type="radio" id="istopnewscenter0" name="info.istopnewscenter" value="0"
							<s:if test="info.istopnewscenter==0">checked="checked"</s:if> />否</td>
					 </tr>
					 <tr>
						<td width="10%" align="left">
							<label id=ctl01_ctl00_label>
								  <img style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
									id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择是否在新闻中心栏目推荐 src="../../img/help.gif" />
								  <NOBR><span id=ctl01_ctl00_lblLabel>新闻中心推荐：</span> </NOBR>
							</label>
						</td>
						<td width="40%" align="left">
							<input type="radio" id="isrecommendnewscenter1" name="info.isrecommendnewscenter" value="1"
							<s:if test="info==null || info.isshownewscenter==null || info.isrecommendnewscenter==1">checked="checked"</s:if> />推荐
							<input type="radio" id="isrecommendnewscenter0" name="info.isrecommendnewscenter" value="0"
							<s:if test="info.isrecommendnewscenter==0">checked="checked"</s:if> />不推荐
						</td>
					 </tr>
					
					
					
					<tr>
						<td width="10%" align="left"><label id=ctl01_ctl00_label><IMG
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择发布时间，默认是当前时间
								src="../../img/help.gif"> <NOBR> <span
									id=ctl01_ctl00_lblLabel>发布时间：</span> </NOBR> </label></td>
						<td width="40%" align="left"><input name="info.addtime"
							id="addtime" class="Wdate" type="text" size="24"
							value="${info.addtimeStr }"
							onClick="WdatePicker({skin:'default',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />

						</td>
						<td width="10%" align="left"><label id=ctl01_ctl00_label><img
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入信息编辑者
								src="../../img/help.gif" /> <NOBR> <span
									id=ctl01_ctl00_lblLabel>编辑：</span> </NOBR> </label></td>
						<td width="40%" align="left"><input
							onblur="this.className='inputblur';" id=editor class=inputblur
							onfocus="this.className='inputfocus';" maxLength=50 type=text
							size="20" name=info.editor
							value="<s:if test='info==null || info.editor== null || info.editor==""'>${loginAdmin.name }</s:if><s:else>${info.editor}</s:else>" /></td>
					</tr>
					
					<tr>
						<td width="10%" align="left"><label id=ctl01_ctl00_label><IMG
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入推荐理由
								src="../../img/help.gif"> <NOBR> <span
									id=ctl01_ctl00_lblLabel>推荐理由：</span> </NOBR> </label></td>
						<td width="40%" align="left"><input
							onblur="this.className='inputblur';" id=recommendreason class=inputblur
							onfocus="this.className='inputfocus';" maxLength=50 type=text
							name=info.recommendreason
							value="<s:if test='info == null || info.recommendreason==null'></s:if><s:else>${info.recommendreason}</s:else>"></td>
						
						<td width="10%" align="left"><label id=ctl01_ctl00_label><IMG
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入适读年龄
								src="../../img/help.gif"> <NOBR> <span
									id=ctl01_ctl00_lblLabel>适读年龄：</span> </NOBR> </label></td>
						<td width="40%" align="left"><input
							onblur="this.className='inputblur';" id=suitage class=inputblur
							onfocus="this.className='inputfocus';" maxLength=50 type=text
							name=info.suitage
							value="<s:if test='info == null || info.suitage==null'></s:if><s:else>${info.suitage}</s:else>"></td>
					</tr>
					<tr>
						<td width="10%" align="left"><label id=ctl01_ctl00_label><IMG
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入深度阅读
								src="../../img/help.gif"> <NOBR> <span
									id=ctl01_ctl00_lblLabel>深度阅读：</span> </NOBR> </label></td>
						<td width="40%" align="left"><input
							onblur="this.className='inputblur';" id=depth class=inputblur
							onfocus="this.className='inputfocus';" maxLength=50 type=text
							name=info.depth
							value="<s:if test='info == null || info.depth==null'></s:if><s:else>${info.depth}</s:else>"></td>
					</tr>
					
					<tr>
						<td width="10%" align="left" colspan="10"><label
							id=ctl01_ctl00_label><IMG
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入信息内容
								src="../../img/help.gif"> <NOBR> <span
									id=ctl01_ctl00_lblLabel>新闻内容：</span> </NOBR> </label></td>
					</tr>
					<tr>
						<td width="90%" align="left" colspan="10"><textarea cols="80"
								id="editor1" name="info.content" rows="10">${info.content }</textarea>
							<script type="text/javascript"
								src="<%=checkParentBasePath%>admin/ckeditor/ckeditor.js?t=B37D54V"></script>
							<script type="text/javascript">
							            	//<![CDATA[
								 CKEDITOR.replace('editor1',{"filebrowserImageBrowseUrl":"\<%=checkParentBasePath%>admin\/ckfinder\/ckfinder.html?type=Images","filebrowserBrowseUrl":"\<%=checkParentBasePath%>admin\/ckfinder\/ckfinder.html","filebrowserFlashBrowseUrl":"\<%=checkParentBasePath%>admin\/ckfinder\/ckfinder.html?type=Flash","filebrowserUploadUrl":"\<%=checkParentBasePath%>ckfinder\/core\/connector\/java\/connector.java?command=QuickUpload&type=Files","filebrowserImageUploadUrl":"\<%=checkParentBasePath%>ckfinder\/core\/connector\/java\/connector.java?command=QuickUpload&type=Images","filebrowserFlashUploadUrl":"\<%=checkParentBasePath%>ckfinder\/core\/connector\/java\/connector.java?command=QuickUpload&type=Flash"},addUploadButton(this));
								 function addUploadButton(editor){
							           CKEDITOR.on('dialogDefinition', function( ev ){
							               var dialogName = ev.data.name;
							               var dialogDefinition = ev.data.definition;
							               if ( dialogName == 'image' ){
							                   var infoTab = dialogDefinition.getContents( 'info' );
							                   infoTab.add({
							                       type : 'button',
							                       id : 'upload_image',
							                       align : 'center',
							                       label : '上传',
							                       onClick : function( evt ){
							                           var thisDialog = this.getDialog();
							                           var txtUrlObj = thisDialog.getContentElement('info', 'txtUrl');
							                           var txtUrlId = txtUrlObj.getInputElement().$.id;
							                           addUploadImage(txtUrlId);
							                       }
							                   }, 'browse'); //place front of the browser button
							               }
							           });
							       }
								 function addUploadImage(theURLElementId){ 
							           var uploadUrl = "insertImage.jsp"; //这是我自己的处理文件/图片上传的页面URL 
							           //上传后返回过来的图片url
							           var imgUrl = window.showModalDialog(uploadUrl); 
							           //alert("imgUrl:"+imgUrl);
							           //在upload结束后通过js代码window.returnValue=...可以将图片url返回给imgUrl变量。 
							           var urlObj = document.getElementById(theURLElementId); 
							           urlObj.value = imgUrl; 
							   			//alert(urlObj.value);	
							            //urlObj.fireEvent("onchange"); //触发url文本框的onchange事件，以便预览图片 
							   			//urlObj.fireEvent("onchange"); 
							   			//urlObj.onchange(); 
							   			//以下仅支持firefox 
									    var evt = document.createEvent('HTMLEvents');  
								       evt.initEvent('change',true,true);  
								       urlObj.dispatchEvent(evt);  
							     } 
								 //]]>
							</script> <input type="hidden" id="ckfinderCurrentFolder"
							value="${currentFolder }" /> <input type="hidden"
							id="ckfinderBasePath" value="<%=checkParentBasePath%>" /></td>
					</tr>
					<tr>
						<td colspan="4" align="center">
							<a href="#myForm" onclick="save()" class="button">保 存</a>&nbsp;
							<!-- 
							<input type="button" value="保 存" onclick="save()" class="button" />
							&nbsp; 
							 -->
							<input type="button" value="返 回" onclick="history.back(-1)" class="button" />
						</td>
					</tr>
				</tbody>
			</table>
		</div>

	</form>
</body>
</html>

