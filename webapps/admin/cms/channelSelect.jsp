<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@include file="../../util/checkParentFrame.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">
	$(function(){
		var lists=$("#channelId").val();
		var nows=lists+";";
		$("input[id^='lmy_']").each(function(){
			var value=$(this).val();
			if(nows.indexOf(value+";")>=0){
					$(this).attr("checked",true);
			}
		});
	})
</script>
<div class="column">
<div id="man_zone" >
  <table width="99%" border="0" align="left"  cellpadding="3" cellspacing="1" >
    <tr>
      <td  align="left" valign="top" class="treetd">
      
	<ul id="mixedpar" >
		<s:if test='%{"1" != #request.noShowSite}'>
		<a onclick="parSite('${site.id }')" ><b>${site.name }</b></a>
		</s:if>
		<s:iterator value="channelList" var="bean" status="stuts">
			<li id="<s:property value="id"/>" class="hasChildren">
					<!--  添加、编辑文章 update-->
					<s:if test='%{onclick==null || onclick=="" }'>
							<s:if  test='%{actions==null ||actions=="" }'>
								<input name="channels"  id="lmy_<s:property value="id"/>"  onclick="check('<s:property value="id"/>','<s:property value="name"/>',this)"  type="checkbox" value="<s:property value="id"/>" />
							</s:if>	
					</s:if>
					<span>
							<font size="2">
									<s:if test='%{#session.siteAdmin || "1" == #bean.haveChannelRole }'>
										<s:if test='%{onclick!=null && onclick!="" }'>
												<a onclick="${onclick }('<s:property value="id"/>','<s:property value="name"/>')" ><b><s:property value="name"/></b></a>
										</s:if>
										<s:if test='%{onclick==null || onclick=="" }'>
													<!--  添加、编辑文章 update-->
													<s:if  test='%{actions==null ||actions=="" }'>
														<b><s:property value="name"/></b>
													</s:if>
													<!--  移动、复制文章 update-->
													<s:else>
															<a onclick="showOne('<s:property value="id"/>','<s:property value="name"/>')" ><b><s:property value="name"/></b></a>
													</s:else>
										</s:if>
									</s:if>
									<s:if test='%{!#session.siteAdmin && "1"!=#bean.haveChannelRole}'>
												<s:property value="name"></s:property>
									</s:if>
						    </font>
					</span>
					 <s:if test='%{"1"==#bean.hasChildren}'>
						<ul>
								<li>
									<span  >&nbsp;</span>
								</li>
						</ul>
					</s:if>
			</li>
		</s:iterator>
		
	</ul>	
      </td>
    </tr>
  </table>
</div>
</div>

	<script type="text/javascript">
	function initTreesPar() {
		//需要添加文档的栏目id字符串，以;分割
		var lists=$("#channelId").val();
		$("#mixedpar").treeview({
			//提取文章到栏目 
			<s:if test='%{onclick!=null && onclick!="" }'>
			url: "channel_son.do?auth=1&channel.id=${channel.id}&onclick=${onclick}",
			</s:if>
 			<s:if test='%{onclick==null || onclick=="" }'>
 					//添加、编辑文章 update
 					<s:if  test='%{actions==null ||actions=="" }'>
						url: "channel_sonCheck.do?auth=1&channel.id=${channel.id}&lmy_urls="+lists,
						//	url: "channel_sonCheck.do?auth=1&channel.id=${channel.id}",
					</s:if>
					//复制、移动文章 update
					<s:else>
						url: "channel_son.do?auth=1&channel.id=${channel.id}",
					</s:else>
			</s:if>
			ajax: {
				data: {
					"additional": function() {
						return "yeah: " + new Date;
					}
				},
				type: "post"
			}
		});
	}
	initTreesPar();
	</script>
	