<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="fs" uri="/fs-tags" %>
<%@include file="../../util/loading.jsp"%>
<%@include file="../../util/checkParentFrame.jsp"%>
<%@page import="cn.freeteam.base.BaseAction" %>
<%@page import="cn.freeteam.model.Roles" %>
<%@page import="java.util.*" %>
<%
	String bathPaths = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
	
	//获取当前登陆用户所属角色
	BaseAction base = new BaseAction();
	List<Roles> roleList = null;
	roleList = base.getLoginRoles();
	String rolename="";
	for(int i=0;i<roleList.size();i++){
		rolename = roleList.get(i).getName();
	}
	
%>
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

	<script type="text/javascript" src="js/infoList.js"></script>
	<script type="text/javascript">
		$(function(){
			//判断当前登录用户所属角色，如果是编辑的话，则隐藏删除按钮
			var rolename='<%=rolename%>';
			if(rolename=='编辑'){
				$("input[class='button']").each(function(){
					if($(this).attr("value")=='删 除'){
						$(this).hide();
					}
				});
			}
		});
	</script>
	</HEAD>
	<BODY style="padding:0;margin:0" onload="top.scrollTo(0,0)">
		<form name="myForm" method="post" action="info_list.do" id="myForm"
			style="margin: 0px">
			<input type="hidden" name="info.channel" id="channelId" value="${info.channel }"/>
			<input type="hidden" name="pageFuncId" id="pageFuncId" value="${param.pageFuncId }"/>
			<input type="hidden" name="aaa" id="channelnames" value="${channel.name}"/>
			<DIV class="column" style="width:99%">
				<div class="columntitle">
					信息搜索(${channel.name })
				</div>
				<TABLE width="100%" border=0 align=center cellpadding="2"
					cellspacing="0">
					<TBODY>
						<TR class=summary-title>
							<TD height="30" align=left style="padding-left: 10px;">
							
								html索引号：
								
								<input name="info.htmlIndexnum" type="text" maxlength="500"
									class="colorblur" onfocus="this.className='colorfocus';"
									onblur="this.className='colorblur';"  />
								信息标题：
								
								<input name="info.title" type="text" maxlength="500"
									class="colorblur" onfocus="this.className='colorfocus';"
									onblur="this.className='colorblur';"  />
									签收:
									<select name="info.issign">
									<option value="">全部</option>
									<option value="1">是</option>
									<option value="0">否</option>
									</select>
									评论:
									<select name="info.iscomment">
									<option value="">全部</option>
									<option value="0">否</option>
									<option value="1">会员评论</option>
									<option value="2">会员和匿名评论</option>
									</select>
								每页显示条数：
								<select name="pageSize"
									id="pageSize">
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
							</TD>
						</TR>
						
					</TBODY>
				</TABLE>
			</DIV>
</form>
			<DIV class="column" style="width:99%">
				<div class="columntitle">
					信息列表
				</div>

				<table id="MyDataList" cellspacing="1" cellpadding="3" Align="center" border="0" border="0" style="width: 100%; word-break: break-all">
					<TR class="summary-title" style="HEIGHT: 25px" align="center">
						<TD width="20">
							<INPUT onClick="checkAll(this.checked)" type="checkbox" />
						</TD>
						<TD width="50">
							<fs:order colName="ID" col="htmlIndexnum"/>
						</TD>
						<TD>
							<fs:order colName="标题" col="title"/>
						</TD>
                        <TD width="70">
							<fs:order colName="优先级" col="id"/>
						</TD>
						<TD width="50">
							<fs:order colName="编辑" col="id"/>
						</TD>
						<TD width="240">
							<fs:order colName="状态" col="iscomment"/>
						</TD>
                        <TD width="70">
							<fs:order colName="责任编辑" col="editor"/>
						</TD>
						<TD width="125">
							<fs:order colName="添加时间" col="addtime"/>
						</TD>
					</TR>
					
					<s:iterator value="infoList" id="obj" status="bean">
					<TR class="tdbg" onMouseOver="this.className='tdbg-dark';"  id="tr<s:property value="id"/>"
						style="HEIGHT: 25px" onMouseOut="this.className='tdbg';">
						<TD align="center">
							<%-- <s:if test='%{#obj.isquote == "1" }'>
								<INPUT name="ids" type="checkbox" value="<s:property value="quoteinfoid"/>"/>
							</s:if>
							<s:else>
								<INPUT name="ids" type="checkbox" value="<s:property value="id"/>"/>
							</s:else> --%>
							<INPUT name="ids" type="checkbox" value="<s:property value="id"/>"/>
						</TD>
						<TD align="left" id="htmlIndexnum<s:property value="id"/>">
							<s:property value="htmlIndexnum"/>
						</TD>
						<TD align="left" id="title<s:property value="id"/>">
							
							<a title="点击打开信息页面" href="<s:if test='{#info.url !="" && info.url !=null}'><s:property value="url"/></s:if><s:else><s:property value="pageurl"/></s:else>" target="_blank">
								<s:if test='%{"1" == #obj.isquote}'>
									<span><img src="../../img/icon.png" height="12px"/></span>
								</s:if>
								<s:property value="title"/>
							</a>
						</TD>
                        <TD align="center" id="firstvalue<s:property value="id"/>" class="firstvalue">
							<input type="text" size="4" value="<s:property value="firstvalue"/>" name="firstvalue"/>
						</TD>
						<TD align="center" id="editor<s:property value="id"/>">
							<%-- <s:if test="{#isquote =='1'}"><a href='#' onclick='editById("${obj.quoteinfoid}","${obj.isquote}")' title="编辑">编辑</a></s:if>
							<s:else><a href='#' onclick='editById("${obj.id }","${obj.isquote}")' title="编辑">编辑</a></s:else> --%>
							<a href='#' onclick='editById("${obj.id }","${obj.isquote}")' title="编辑">编辑</a>
						</TD>
						<TD align="center" id="iscomment<s:property value="id"/>">
							<ul class="zt">                          
                            	<s:if test='%{"1" == #obj.ishot }'>
                            	<li class="zt_1">热</li>
                            	</s:if>
                            	<s:else>
                            	<li></li>
                           		</s:else>
                    
								<s:if test='%{"1" == #obj.isrecommend }'>
								<li class="zt_2">荐</li>
								</s:if>
                                <s:else>
                            	<li></li>
                           		</s:else>                           		
                                
								<s:if test='%{"1" == #obj.isshowindex }'>
								<li class="zt_3">首</li>
								</s:if>
                                <s:else>
                            	<li></li>
                           		</s:else>
                           		
								<s:if test='%{"1" == #obj.isshowlist }'>
								<li class="zt_4">列</li>
								</s:if>
                                <s:else>
                            	<li></li>
                           		</s:else>

								<s:if test='%{"1" == #obj.istop }'>
								<li class="zt_5">固</li>
								</s:if>
                                <s:else>
                            	<li></li>
                           		</s:else>
                                
								<s:if test='%{"1" == #obj.ischeck }'>
								<li class="zt_6">发</li>
								</s:if>
                                <s:else>
                            	<li></li>
                           		</s:else>
                            </ul>
						</TD>
						<TD  align="center" id="editor<s:property value="id"/>">
							<s:property value="editor"/>
						</TD>
						<TD  align="center" id="addtime<s:property value="id"/>">
							<s:property value="addtimeStr"/>
						</TD>
					</TR>
					</s:iterator>
					<TR class="tdbg" style="HEIGHT: 25px" >
						<TD  align="center" colspan="10">
							${pageStr }
						</TD>
					</TR>
				</table>
			</DIV>

			<table width="95%" align="center">
				<tr>
					<td align="right">
						<table cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left">
									<fs:operButtons />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
	</BODY>
</HTML>

