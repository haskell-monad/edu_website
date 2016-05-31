<%@ page language="java" pageEncoding="UTF-8"%>
<%@   taglib   uri = "http://ckfinder.com"   prefix = "ckfinder"   %>   
<%@   taglib   uri = "http://ckeditor.com"   prefix = "ckeditor"   %>   
<%@page import="java.util.UUID"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="cn.freeteam.cms.model.Info"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%> 
<%@taglib prefix="fs" uri="/fs-tags" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<%@include file="checkSelectSite.jsp" %>
<html>
	<head>
		<link rel="stylesheet" href="../../img/common.css" type="text/css" />
		<link rel="stylesheet" href="../../img/style.css" type="text/css" />
		<link rel="stylesheet" href="../../img/style3.css" type="text/css" />
	<link rel="stylesheet" href="../../js/jquery.treeview.css" />
		<script type="text/javascript" src="../../js/jquery-1.5.1.min.js"></script>
		<script type="text/javascript" src="../../js/check.js"></script>
	<script src="../../js/jquery.cookie.js" type="text/javascript"></script>
	<script src="../../js/jquery.treeview.js" type="text/javascript"></script>
	<script src="../../js/jquery.treeview.edit.js" type="text/javascript"></script>
	<script src="../../js/jquery.treeview.async.js" type="text/javascript"></script>
		<script type="text/javascript" src="../../js/weebox0.4/bgiframe.js"></script>
		<script type="text/javascript" src="../../js/weebox0.4/weebox.js"></script>
		<link type="text/css" rel="stylesheet" href="../../js/weebox0.4/weebox.css" />
		<script type="text/javascript" src="../../js/jscolor/jscolor.js"></script>
		<script language="javascript" type="text/javascript" src="../../My97DatePicker/WdatePicker.js" ></script>
		<script type="text/javascript" src="js/infoEdit.js"></script>
		<script type="text/javascript" src="../ckfinder/ckfinder.js"></script>
		<script type="text/javascript" src="../../js/ckfinderUtil.jsp"></script>
		<script type="text/javascript" src="js/uploadify/swfobject.js"></script>
		<link rel="stylesheet" href="js/uploadify/uploadify.css" type="text/css" />
		<script type="text/javascript" src="js/uploadify/jquery.uploadify.min.js"></script>
		<script type="text/javascript" src="js/uploadify/uploadify-init.js"></script>
		<script type="text/javascript">
				$(function(){
					$("#kssz").change(function(){
						var value=$("#kssz").val();   //获取Select选择的Value 	
						if(value!="kssz"){
								$("#source").val(value);
						}
					});    				
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
						inputFile:"#file_uploads",
						buttonText:'图片集',
						method: 'get',
						uploader:'/servlet/Upload.java',
						formData:{param1 : "imgs"},
						onUploadStart:function(file){
							var b_bj=document.getElementById("b_images_checkbox");
							var s_bj=document.getElementById("s_images_checkbox");
							if(b_bj.checked==true){
								$("#file_uploads").uploadify("settings","formData",{"images":"imgs","iswater":"1"});
							}else if(s_bj.checked==true){
								$("#file_uploads").uploadify("settings","formData",{"images":"imgs","iswater":"2"});
							}else{
								$("#file_uploads").uploadify("settings","formData",{"images":"imgs","iswater":"0"});
							}
						},
						onUploadSuccess:function(file, ptl, response){
							var obj=eval("("+ptl+")");
							var url=obj.url;
							uploadImgShows(url);
				        }
		   		 });
		   		 $.initUploadify({
						inputFile:"#infoImg_uploads",
						uploader:'/servlet/Upload.java',
						buttonText:'信息图片',
						multi: false,
						method: 'get',
						formData:{param1 : "infoimg",'iswater':'0'},
						onUploadStart:function(file){
							var bbj=document.getElementById("b_checkbox");
							var sbj=document.getElementById("s_checkbox");
							if(bbj.checked==true){
								$("#infoImg_uploads").uploadify("settings","formData",{"images":"infoimg","iswater":"1"});
							}else if(sbj.checked==true){
								$("#infoImg_uploads").uploadify("settings","formData",{"images":"infoimg","iswater":"2"});
							}else{
								$("#infoImg_uploads").uploadify("settings","formData",{"images":"infoimg","iswater":"0"});
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
		<form id=MyForm 
			method=post name=MyForm action=info_yeditDo.do enctype="multipart/form-data">
			<input type="hidden" name="pageFuncId" id="pageFuncId" value="${pageFuncId }"/>
			<input type="hidden" name="info.id" value="${info.id }"/>
			<input type="hidden" name="info.ischeck" value="1"/>
			<input type="hidden" name="type" value="<%=((request.getParameter("channel.id")!=null || request.getParameter("info.id")!=null)?"channel":"quick") %>"/>
			<div class=tab>
				<div class=tabOn >
					信息编辑
				</div>
				<div class=clearer></div>
			</div>
			<div class=column>
				<TABLE cellSpacing=4 cellPadding=4 width="95%" align=center>
					<tbody>
								<input type="hidden" name="info.site" id="siteId" value="${site.id }"/>
						<s:if test="%{info.htmlIndexnum!=null}">
						<tr>
							<td width="30%" align="left">
								<label id=ctl01_ctl00_label><IMG
											style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											id=ctl01_ctl00_imgHelp tabIndex=-1 title=信息的唯一索引号，生成静态页面时使用
											src="../../img/help.gif">
									<NOBR>
										<span id=ctl01_ctl00_lblLabel>html索引号：</span>
									</NOBR>
								</label>
							</td>
							<td width="70%" align="left">
								<input onblur="this.className='inputblur';" readonly
									class=inputblur onfocus="this.className='inputfocus';" 
									maxLength=250 type=text  value="${info.htmlIndexnum }">
							</td>
						</tr>
						</s:if>
						<tr>
							<td width="30%" align="left">
								<label id=ctl01_ctl00_label><IMG
											style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择栏目
											src="../../img/help.gif">
									<NOBR>
										<span id=ctl01_ctl00_lblLabel>所属栏目：</span>
									</NOBR>
								</label>
							</td>
							<td width="70%" align="left">
								<input type="hidden" name="lmy_channelids" id="channelId" value="${channel.id}"/>
								<input type="hidden" name="info.channel" id="channelId" value="${channel.id}"/>
								<input type="hidden" name="oldchannelid" value="${channel.id }"/>
								<input readonly id="channelName" class=inputblur
									maxLength=50 type=text name=channel.name value="建筑师"/>
							</td>
						</tr>
					<!-- 
						<tr>
							<td width="30%" align="left">
								<label id=ctl01_ctl00_label><IMG
											style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入期数
											src="../../img/help.gif">
									<NOBR>
										<span id=ctl01_ctl00_lblLabel>期数：</span>
									</NOBR>
								</label>
							</td>
							<td width="70%" align="left">
								<input onblur="this.className='inputblur';" id=shortTitle
									class=inputblur onfocus="this.className='inputfocus';" 
									maxLength=10 type=text size="5" name=info.nper value="${info.nper}">如：500
							</td>
						</tr>
					 -->
						<tr>
							<td width="30%" align="left">
								<label id=ctl01_ctl00_label><IMG
											style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											id=ctl01_ctl00_imgHelp tabIndex=-1 alt=在列表中显示，留空则显示完整标题
											src="../../img/help.gif">
									<NOBR>
										<span id=ctl01_ctl00_lblLabel>标题：</span>
									</NOBR>
								</label>
							</td>
							<td width="70%" align="left">
								<input onblur="this.className='inputblur';" id=shortTitle
									class=inputblur onfocus="this.className='inputfocus';" 
									type=text size="55" name=info.shorttitle value="${info.shorttitle }">
							</td>
						</tr>
						<tr>
							<td width="30%" align="left">
								<label id=ctl01_ctl00_label><IMG
											style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择性别
											src="../../img/help.gif">
									<NOBR>
										<span id=ctl01_ctl00_lblLabel>性别：</span>
									</NOBR>
								</label>
							</td>
							<td width="70%" align="left">
								<input type="radio" id="ishot1"  name="info.ishot" value="1" <s:if test="info==null || info.ishot==null || info.ishot==1">checked="checked"</s:if> />男
								<input type="radio" id="ishot0" name="info.ishot" value="0" <s:if test="info.ishot==0">checked="checked"</s:if> />女
							</td>
						</tr>
						<tr>
							<td width="30%" align="left">
								<label id=ctl01_ctl00_label><IMG
											style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入出生日期
											src="../../img/help.gif">
									<NOBR>
										<span id=ctl01_ctl00_lblLabel>出生日期：</span>
									</NOBR>
								</label>
							</td>
							<td width="70%" align="left" >
								<input onblur="this.className='inputblur';" id=source
									class=inputblur onfocus="this.className='inputfocus';" 
									maxLength=50 type=text name=info.source value="${info.source}" />
							</td>
						</tr>
						<tr>
							<td width="30%" align="left">
								<label id=ctl01_ctl00_label><IMG
											style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入工作单位
											src="../../img/help.gif">
									<NOBR>
										<span id=ctl01_ctl00_lblLabel>工作单位：</span>
									</NOBR>
								</label>
							</td>
							<td width="70%" align="left">
								<input onblur="this.className='inputblur';" id=keywords
									class=inputblur onfocus="this.className='inputfocus';" 
									type=text name=info.keywords size="55" value="${info.keywords }">
							</td>
						</tr>
						<tr>
							<td width="30%" align="left">
								<label id=ctl01_ctl00_label><IMG
											style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入职称
											src="../../img/help.gif">
									<NOBR>
										<span id=ctl01_ctl00_lblLabel>职称：</span>
									</NOBR>
								</label>
							</td>
							<td width="70%" align="left">
								<input onblur="this.className='inputblur';" id=tags
									class=inputblur onfocus="this.className='inputfocus';" 
									maxLength=50 type=text name=info.tags value="${info.tags }"/>
							</td>
						</tr>
						<tr>
							<td width="30%" align="left">
								<label id=ctl01_ctl00_label><IMG
											style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入导语
											src="../../img/help.gif">
									<NOBR>
										<span id=ctl01_ctl00_lblLabel>导语：</span>
									</NOBR>
								</label>
							</td>
							<td width="70%" align="left">
								<textarea onblur="this.className='inputblur';"  
									class=inputblur onfocus="this.className='inputfocus';" 
									maxLength=500 type=text id=description name=info.description cols="60" rows="5">${info.description }</textarea>
							</td>
						</tr>
						<tr>
							<td width="30%" align="left">
								<label id=ctl01_ctl00_label><IMG
											style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入设计师简历
											src="../../img/help.gif">
									<NOBR>
										<span id=ctl01_ctl00_lblLabel>设计师简历：</span>
									</NOBR>
								</label>
							</td>
							<td width="80%" align="left">
								<textarea onblur="this.className='inputblur';"  
									class=inputblur onfocus="this.className='inputfocus';" 
									type=text id=title name=info.title cols="80" rows="10">${info.title}</textarea>
							</td>
						</tr>
						<tr>
							<td width="30%" align="left">
								<label id=ctl01_ctl00_label><IMG
											style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择生成信息静态页面的信息模板
											src="../../img/help.gif">
									<NOBR>
										<span id=ctl01_ctl00_lblLabel>信息模板：</span>
									</NOBR>
								</label>
							</td>
							<td width="70%" align="left">
								<input onblur="this.className='inputblur';" id=templet readonly style="cursor:hand" title="点击选择模板文件"
									class=inputblur onfocus="this.className='inputfocus';"  onclick="selectTempletFile('templet')"
									type=text name=info.templet value="${info.templet }"/>
							</td>
						</tr>
						<tr>
							<td width="30%" align="left" colspan="10">
								<label id=ctl01_ctl00_label><IMG
											style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入信息内容
											src="../../img/help.gif">
									<NOBR>
										<span id=ctl01_ctl00_lblLabel>创作理念：</span>
									</NOBR>
								</label>
							</td>
						</tr>
						<tr>
							<td width="70%" align="left"  colspan="10">
    							<textarea   cols = "80"   id = "editor1"   name = "info.content"   rows = "10" >${info.content }</textarea >
								<script type="text/javascript" src="<%=checkParentBasePath %>admin/ckeditor/ckeditor.js?t=B37D54V"></script>
								<script type="text/javascript">//<![CDATA[
								CKEDITOR.replace('editor1', {"filebrowserImageBrowseUrl":"\<%=checkParentBasePath %>admin\/ckfinder\/ckfinder.html?type=Images","filebrowserBrowseUrl":"\<%=checkParentBasePath %>admin\/ckfinder\/ckfinder.html","filebrowserFlashBrowseUrl":"\<%=checkParentBasePath %>admin\/ckfinder\/ckfinder.html?type=Flash","filebrowserUploadUrl":"\<%=checkParentBasePath %>ckfinder\/core\/connector\/java\/connector.java?command=QuickUpload&type=Files","filebrowserImageUploadUrl":"\<%=checkParentBasePath %>ckfinder\/core\/connector\/java\/connector.java?command=QuickUpload&type=Images","filebrowserFlashUploadUrl":"\<%=checkParentBasePath %>ckfinder\/core\/connector\/java\/connector.java?command=QuickUpload&type=Flash"});
								//]]></script>
								<input type="hidden" id="ckfinderCurrentFolder" value="${currentFolder }"/>
								<input type="hidden" id="ckfinderBasePath" value="<%=checkParentBasePath %>"/>
							</td>
						</tr>
						<tr>
							<td width="30%" align="left">
								<label id=ctl01_ctl00_label><IMG
											style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入关注栏目
											src="../../img/help.gif">
									<NOBR>
										<span id=ctl01_ctl00_lblLabel>关注栏目：</span>
									</NOBR>
								</label>
							</td>
							<td width="70%" align="left">
								<%
								if(request.getAttribute("info")!=null){
								%>
								<textarea onblur="this.className='inputblur';"  
									class=inputblur onfocus="this.className='inputfocus';" 
									type=text id=title name=info.gzlm cols="60" rows="10"><s:if test="%{info.gzlm!=null}">${info.gzlm}</s:if></textarea>
								<%
								}else{
								%>
								<textarea onblur="this.className='inputblur';"  
									class=inputblur onfocus="this.className='inputfocus';" 
									type=text id=title name=info.gzlm cols="60" rows="10">中国好建筑——青年建筑师专辑是由大太阳建筑网与中国建筑学会合作创办，旨在宣传中国杰出青年建筑师的非商业性的公益专题栏目。以专题的形式定期推出优秀的国内建筑师及作品，使行业内及社会对我国优秀的建筑人才得以更深的了解与认识；为行业的健康发展提供正能量。</textarea>
								<%
								}
								%>
							</td>
						</tr>
						<tr>
							<td width="30%" align="left">
								<label id=ctl01_ctl00_label><img
											style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入责任编辑
											src="../../img/help.gif" />
									<NOBR>
										<span id=ctl01_ctl00_lblLabel>责任编辑：</span>
									</NOBR>
								</label>
							</td>
							<td width="70%" align="left">
								<input onblur="this.className='inputblur';" id=editor
									class=inputblur onfocus="this.className='inputfocus';" 
									type=text name=info.editor value="${info.editor}" />
							</td>
						</tr>
						<tr>
							<td width="30%" align="left">
								<label id=ctl01_ctl00_label><img
											style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入编辑邮箱
											src="../../img/help.gif" />
									<NOBR>
										<span id=ctl01_ctl00_lblLabel>编辑邮箱：</span>
									</NOBR>
								</label>
							</td>
							<td width="70%" align="left">
								<input onblur="this.className='inputblur';" id=editor
									class=inputblur onfocus="this.className='inputfocus';" 
									type=text name=info.bjyx value="${info.bjyx}" />
							</td>
						</tr>
						<tr>
							<td width="30%" align="left">
								<label id=ctl01_ctl00_label><IMG
											style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入内容合作
											src="../../img/help.gif">
									<NOBR>
										<span id=ctl01_ctl00_lblLabel>内容合作：</span>
									</NOBR>
								</label>
							</td>
							<td width="70%" align="left">
								<input onblur="this.className='inputblur';" id=author
									class=inputblur onfocus="this.className='inputfocus';" 
									type=text name=info.author value="<s:if test='info == null || info.author==null'></s:if><s:else>${info.author}</s:else>">
							</td>
						</tr>
						<!--update by limengyu @20131209 图片集更改start-->
						<tr>
							<td width="30%" align="left">
								<label id=ctl02_ctl00_label>
									<IMG
											style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											id=ctl02_ctl00_imgHelp tabIndex=-1 alt=请上传主要工程设计作品
											src="../../img/help.gif">
									<NOBR>
										<span id=ctl02_ctl00_lblLabel>主要工程设计作品：</span>
										<br />
										添加大水印:<input type="checkbox" id="b_images_checkbox" name="ickbox"
										checked onClick="javascript:imagesCheckBoxValidate(0)" /> 
										添加小水印:<input type="checkbox" id="s_images_checkbox" name="ickbox"
										onClick="javascript:imagesCheckBoxValidate(1)" />
									</NOBR>
								</label>
							</td>
							<td align="left"> 
							<input id="file_uploads" type="file" name="file_uploads" /> <br />
							<input type="hidden" name="delOldimgs" id="delOldimgs"/>
							<div id="imgs">
								<s:iterator value="infoImgList" id="bean">
								<table id='oldimgtable<s:property value="id"/>'><tr>
					    		<td rowspan='4'>
					    		<input type='hidden' name='oldimgsid<s:property value="id"/>' value='<s:property value="id"/>' />
					    		<input type='hidden' name='oldimgsurl<s:property value="id"/>' value='<s:property value="img"/>' ><a href='<s:property value="img"/>' target='_blank'>
								<img src='<s:property value="img"/>' width='150' height='120' title='点击查看大图'/></a></td>
					    		<td>标题:</td>
					    		<td><input onblur="this.className='inputblur';" class=inputblur onfocus="this.className='inputfocus';"  size=40 type=text name=oldimgstitle<s:property value="id"/> value='<s:property value="title"/>'/></td>
					  			</tr><tr>
					    		<td>顺序:</td>
					    		<td><input onblur="this.className='inputblur';" class=inputblur onfocus="this.className='inputfocus';" onkeyup=if(!isInt(value))execCommand('undo') onafterpaste=if(!isInt(value))execCommand('undo') .
					    		  maxLength=10 size=4 type=text name=oldimgsordernum<s:property value="id"/> value='<s:property value="ordernum"/>'/></td>
					  			</tr><tr>
					    		<td>描述:</td>
					    		<td><textarea  class=inputblur onfocus="this.className='inputfocus';" onblur="this.className='inputblur';if(this.value.length>500){alert('最多500个字符');this.focus()}" name=oldimgscontent<s:property value="id"/> cols=40 rows=3><s:property value="content"/></textarea>(最多500个字符)</td>
					  			</tr><tr>
					    		<td><input type='button'  class='button' value='删 除' onclick="delOldImgs('<s:property value="id"/>');"/></td>
					    		<td></td>
					  			</tr></table>
								</s:iterator>
							</div>
									<!--<input type="button" class="button" value="添加图片" onclick="selectImgs()" />-->
							</td>
						</tr>
						<!--update by limengyu @20131209 图片集更改end-->
						<!--update by limengyu @21031210 信息图片start-->
						<tr>
							<td width="30%" align="left">
								<label id=ctl02_ctl00_label>
									<IMG
											style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											id=ctl02_ctl00_imgHelp tabIndex=-1 alt=请上传形象图
											src="../../img/help.gif">
									<NOBR>
										<span id=ctl02_ctl00_lblLabel>形象图：</span> <br> 
										添加大水印:<input type="checkbox" id="b_checkbox" name="ckbox"
										onClick="javascript:checkBoxValidate(0)" /> 
										添加小水印:<input type="checkbox" id="s_checkbox" name="ckbox"
										onClick="javascript:checkBoxValidate(1)" />
									</NOBR>
								</label>
							</td>
							<td align="left"> 
									<input id="infoImg_uploads" type="file" name="infoImg_uploads" /> 
									<input type="hidden" name="info.img" id="img" value="${info.img }"/>
									<span id="imgSpan">
									<s:if test='%{info.img!=null && info.img != "" && info.img != "null"}'>
									<a href="${info.img }?date=<%=UUID.randomUUID() %>" target="_blank">
									<img src="${info.img }?date=<%=UUID.randomUUID() %>" width="100" height="100" title="点击查看大图"/>
									</a>
									</s:if>
									</span>
									<s:if test='%{info.img!=null && info.img != "" && info.img != "null"}'>
									<a style="display:block" id="imgDelBtn" href="javascript:delImg()">删除</a>
									</s:if>
									<s:if test='%{info.img==null || info.img == "" || info.img == "null"}'>
									<a style="display:none" id="imgDelBtn" href="javascript:delImg()">删除</a>
									</s:if>
									<br/>
									<!-- <input type="button" class="button" value="选择图片" onclick="selectImg()" /> -->
									<!--专题附件是默认的一张图片-->
									<input type="hidden" name="info.attchs" id="attchs" value="/userfiles/images/admin/201312041248401386132520670.jpg"/>
							</td>
						</tr>
						<!--update by limengyu @21031210 信息图片end-->
						<tr>
							<td width="30%" align="left">
								<label id=ctl01_ctl00_label><IMG
											style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入信息浏览次数
											src="../../img/help.gif">
									<NOBR>
										<span id=ctl01_ctl00_lblLabel>浏览次数：</span>
									</NOBR>
								</label>
							</td>
							<td width="70%" align="left">
								<input onblur="this.className='inputblur';" id=clicknum
									class=inputblur onfocus="this.className='inputfocus';" 
									type=text name=info.clicknum value="<s:if test='info.clicknum== null'>0</s:if><s:else>${info.clicknum}</s:else>">
							</td>
						</tr>
						<tr>
							<td width="30%" align="left">
								<label id=ctl01_ctl00_label><IMG
											style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入优先值
											src="../../img/help.gif">
									<NOBR>
										<span id=ctl01_ctl00_lblLabel>优先值：</span>
									</NOBR>
								</label>
							</td>
							<td width="70%" align="left">
								<input onblur="this.className='inputblur';" id=firstvalue
									class=inputblur onfocus="this.className='inputfocus';" 
									maxLength=50 type=text name=info.firstvalue value="<s:if test='info.firstvalue== null'>0</s:if><s:else>${info.firstvalue}</s:else>" />
							</td>
						</tr>
						<tr>
							<td width="10%" align="left"><label id=ctl01_ctl00_label><IMG
								style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
								id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择是否固顶
								src="../../img/help.gif"> <NOBR> <span
									id=ctl01_ctl00_lblLabel>是否固顶：</span> </NOBR> </label></td>
							<td width="40%" align="left">
								<input type="radio" id="istop1" name="info.istop" value="1"
								<s:if test="info.istop==1">checked="checked"</s:if>>是 
								<input type="radio" id="istop0" name="info.istop" value="0"
								<s:if test="info==null || info.istop==null || info.istop==0">checked="checked"</s:if>>否
							</td>
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
					 </tr>
					  <tr>
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
							<td width="30%" align="left">
								<label id=ctl01_ctl00_label><IMG
											style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择发布时间，默认是当前时间
											src="../../img/help.gif">
									<NOBR>
										<span id=ctl01_ctl00_lblLabel>发布时间：</span>
									</NOBR>
								</label>
							</td>
							<td width="70%" align="left">
							<input name="info.addtime" id="addtime"  class="Wdate"  type="text" size="24" value="${info.addtimeStr }"  onClick="WdatePicker({skin:'default',dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
							</td>
						</tr>
						<tr>
							<td  align="center" colspan="10">
							<input type="button" value="保 存" onclick="save()"  class="button"  />&nbsp;
							<input type="button" value="返 回" onclick="history.back(-1)"  class="button"  />
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</form>
	</body>
</html>

