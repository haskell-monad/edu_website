<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.UUID"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="cn.freeteam.cms.model.Innerlink"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@include file="../../util/checkParentFrame.jsp"%>
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
<script type="text/javascript" src="../../js/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="../../js/check.js"></script>
<script src="../../js/jquery.cookie.js" type="text/javascript"></script>
<script type="text/javascript" src="../../js/weebox0.4/bgiframe.js"></script>
<script type="text/javascript" src="../../js/weebox0.4/weebox.js"></script>
<link type="text/css" rel="stylesheet" href="../../js/weebox0.4/weebox.css" />
<script type="text/javascript" src="../../js/jscolor/jscolor.js"></script>

<script type="text/javascript" src="js/innerlinkList.js"></script>

</head>
<body>
	<form id=MyForm method=post name=MyForm action=innerlink_editDo.do>
		<input type="hidden" name="pageFuncId" id="pageFuncId" value="${pageFuncId }" />
		<input type="hidden" name="innerlink.id" id="id" value="${innerlink.id}" /> 
		<div class=tab>
			<div class=tabOn>内链编辑</div>
			<div class=clearer></div>
		</div>
		<div class=column>
			<TABLE cellSpacing=4 cellPadding=4 width="98%" align=center>
				<tbody>
					<tr>
						<td width="10%" align="left"><label id=ctl01_ctl00_label>
<IMG style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px" id=ctl01_ctl00_imgHelp alt=请输入名称 src="../../img/help.gif"> <NOBR> 
<span id=ctl01_ctl00_lblLabel>名称：</span> </NOBR> </label></td>
						<td width="90%" colspan="3" align="left">
<input style="width: 100px; font-size: 14px" onblur="this.className='inputblur';" id="name" class=inputblur onfocus="this.className='inputfocus';" maxLength="250" name="innerlink.name" type="text" value=${innerlink.name} >
						<input type="button" value="生成内链url" onclick="createUrl();"/>
						
						<!--
						<select name="c_select" id="c_select" onchange="changeUrl();">
							<option value="0">操作</option>
							<option value="1">生成内链url</option>
						</select>
						-->
						
						</td>
					</tr>
					
					<tr>
						<td width="10%" align="left"><label id=ctl01_ctl00_label>
<IMG style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px" id=ctl01_ctl00_imgHelp  alt=请输入url src="../../img/help.gif"> <NOBR> 
<span id=ctl01_ctl00_lblLabel>内链url：</span> </NOBR> </label></td>
						<td width="90%" colspan="3" align="left">
						<textarea onblur="this.className='inputblur';" class=inputblur onfocus="this.className='inputfocus';" type=text id="url"
								name=innerlink.url cols="100" rows="4">${innerlink.url}</textarea>
						</td>
					</tr>
					
					<tr>
						<td width="30%" align="left">
							<label id=ctl01_ctl00_label>
								<IMG
										style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
										id=ctl01_ctl00_imgHelp alt=请选择显示颜色
										src="../../img/help.gif">
								<NOBR>
									<span id=ctl01_ctl00_lblLabel>显示颜色：</span>
								</NOBR>
							</label>
						</td>
						<td width="70%" align="left">
							<input id=color class="color {pickerPosition:'right'}" maxLength=50 type=text name=innerlink.color value="<s:if test='innerlink == null || innerlink.color==null'>004276</s:if><s:else>${innerlink.color}</s:else>" >
						</td>
					</tr>
					<tr>
						<td width="10%" align="left"><label id=ctl01_ctl00_label>
<IMG style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px" id=ctl01_ctl00_imgHelp  alt=请输入名称 src="../../img/help.gif"> <NOBR> 
<span id=ctl01_ctl00_lblLabel>是否加粗：</span> </NOBR> </label></td>
						<td width="40%" align="left"><input type="radio" id="isblob1"
							name="innerlink.isbold" value="1"
							<s:if test="innerlink==null || innerlink.isbold==null || innerlink.isbold==1">checked="checked"</s:if>>是
							<input type="radio" id="isblob0" name="innerlink.isbold" value="0"
							<s:if test="innerlink.isbold==0">checked="checked"</s:if>>否
						</td>
					</tr>
					
					<tr>
						<td colspan="4" align="center">
							<input type="button" value="保 存" onclick="save()" class="button" />&nbsp; 
							<input type="button" value="返 回" onclick="history.back(-1)" class="button" />
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</body>
</html>

