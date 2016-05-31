<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="fs" uri="/fs-tags" %>
<%@include file="../../util/loading.jsp"%>
<%@include file="../../util/checkParentFrame.jsp"%>
<HTML>
	<HEAD>
		<LINK rel=stylesheet type=text/css href="../../img/style.css">
		<LINK rel=stylesheet type=text/css href="../../img/style3.css">
		<script type="text/javascript" src="../../js/jquery-1.5.1.min.js"></script>
		<script type="text/javascript" src="../../js/check.js"></script>
		<script type="text/javascript" src="../../js/checkAll.js"></script>
		<script type="text/javascript" src="../../js/weebox0.4/bgiframe.js"></script>
		<script type="text/javascript" src="../../js/weebox0.4/weebox.js"></script>
		<link type="text/css" rel="stylesheet" href="../../js/weebox0.4/weebox.css" />
	<link rel="stylesheet" href="../../js/jquery.treeview.css" />
	<script src="../../js/jquery.cookie.js" type="text/javascript"></script>
	<script src="../../js/jquery.treeview.js" type="text/javascript"></script>
	<script src="../../js/jquery.treeview.edit.js" type="text/javascript"></script>
	<script src="../../js/jquery.treeview.async.js" type="text/javascript"></script>
		<script type="text/javascript" src="js/innerlinkList.js"></script>
	</HEAD>
	<BODY style="padding:0;margin:0">
		<form name="myForm" method="post" action="innerlink_list.do" id="myForm" style="margin: 0px">
			<input type="hidden" name="pageFuncId" id="pageFuncId" value="${param.pageFuncId }"/>
			<DIV class="column" style="width:99%">
				<div class="columntitle">
					内链管理
				</div>
				<TABLE width="100%" border=0 align=center cellpadding="2" cellspacing="0">
					<TBODY>
						<tr class=summary-title>
							<td height="30" align=left style="padding-left: 10px;">
								名称：
								<input name="innerlink.name" type="text" maxlength="500" value="${innerlink.name}"
									class="colorblur" onfocus="this.className='colorfocus';"
									onblur="this.className='colorblur';"  />
								每页显示条数：
								<select name="pageSize" id="pageSize">
									<option selected="selected" value="10">
										10
									</option>
									<option value="30">
										30
									</option>
									<option value="50">
										50
									</option>
									<option value="100">
										100
									</option>
									<option value="200">
										200
									</option>
									<option value="300">
										300
									</option>
								</select>
								<input type="button" name="Search" value="搜 索" id="Search" onclick="this.form.submit();"
									class="button" style="MARGIN-BOTTOM: 0px" />
							</td>
						</tr>
					</TBODY>
				</TABLE>
			</div>
</form>
			<DIV class="column" style="width:99%">
				<div class="columntitle">
					内链
				</div>
				<table id="MyDataList" cellspacing="1" cellpadding="1" Align="center" border="0" border="0"
					style="width: 100%; word-break: break-all">
					<tr class="summary-title" style="HEIGHT: 25px" align="center">
						<td width="20">
							<input onClick="checkAll(this.checked)" type="checkbox" />
						</td>
						<td width="30">
							<fs:order colName="ID" col="id"/>
						</td>
                        <td width="100">
							<fs:order colName="名称" col="name"/>
						</td>
						<td width="600">
							<fs:order colName="内链" col="url"/>
						</td>
						<td width="50">
							<fs:order colName="显示颜色" col="color"/>
						</td>
						<td width="50">
							<fs:order colName="是否加粗" col="isbold"/>
						</td>
                        <td width="70">
							<fs:order colName="添加人" col="createperson"/>
						</td>
						<td width="120">
							<fs:order colName="添加时间" col="addtime"/>
						</td>
					</tr>
					
					<s:iterator value="innerlinklist" id="obj" status="bean">
					<tr class="tdbg" onMouseOver="this.className='tdbg-dark';"  id="tr<s:property value="id"/>" style="HEIGHT: 25px" onMouseOut="this.className='tdbg';">
						<td align="center">
							<input name="ids" type="checkbox" value="<s:property value="id"/>"/>
						</td>
						<td  align="left" id="id<s:property value="id"/>">
							<s:property value="id"/>
						</td>
						<td  align="left" id="name<s:property value="id"/>">
							<s:property value="name"/>
						</td>
						<td  align="left" id="url<s:property value="id"/>">
							<s:property value="url"/>
						</td>
						<td  align="left" id="color<s:property value="id"/>">
							<s:property value="color"/>
						</td>
						<td  align="left" id="isbold<s:property value="id"/>">
							<s:if test='%{"1" == #obj.isbold }'>
								是
							</s:if>
							<s:if test='%{"1" != #obj.isbold }'>
								否
							</s:if>
						</td>
						<td  align="left" id="createperson<s:property value="id"/>">
							<s:property value="createperson"/>
						</td>
						<td  align="left" id="addtime<s:property value="id"/>">
								<s:property value="addtimeStr"/>
						</td>
					</tr>
					</s:iterator>
					<tr class="tdbg" style="HEIGHT: 25px" >
						<td  align="center" colspan="10">
							${pageStr }
						</td>
					</tr>
				</table>
			</div>
			<table width="95%" align="center">
				<tr>
					<td align="right">
						<table cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" id="buttontd">
									<fs:operButtons />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>

	</BODY>
</HTML>

