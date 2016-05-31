<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>评论信息提示</title>
<link rel="stylesheet" href="<%=basePath%>base/comment/css/style.css" type="text/css" />
<script type="text/javascript" src="<%=basePath%>base/js/jquery-1.7.2.js" ></script>
<script type="text/javascript">
	$(function(){
		var msg='${showMessage}';
		if(msg=='恭喜您,提交评论成功!'){
			$("#shows").removeClass();
			$("#shows").addClass("msg-success");
		}else{
			$("#shows").removeClass();
			$("#shows").addClass("msg-fail");
		}
	});
</script>
</head>
<body>
	<div class="header-warp">
    	<div class="header">
        	<div class="logo">
            	<img width="185" height="55" src="<%=basePath%>base/comment/img/logo-bg.jpg" />
            </div>
            <div class="sun-nav">
            	<a href="http://www.children-education.com" target="_blank">中国少儿教育网首页</a>
				<a href="http://www.children-education.com" target="_blank">中国少儿教育网首页</a>
				<a href="http://www.children-education.com" target="_blank">中国少儿教育网首页</a>
				<a href="http://www.children-education.com" target="_blank">中国少儿教育网首页</a>
				<a href="http://www.children-education.com" target="_blank">中国少儿教育网首页</a>
				<a href="http://www.children-education.com" target="_blank">中国少儿教育网首页</a>
            </div>
        </div>
    </div>
    <div class="main-warp clearfix">
    	<div class="skip-contene">
        	<div class="skip-box" id="shows">
            	<h2>${showMessage}</h2>
                <p>	
                	<s:set name="forwardUrl" value="#request.forwardUrl" />
					<s:if test='%{#request.forwardUrl!=""}'>
						<script>setTimeout("window.location.href ='${forwardUrl}';", 1000*${forwardSeconds});</script>
						<a href="${forwardUrl}">页面跳转中...</a>
					</s:if>
                </p>
            </div>
            <p class="hd">您还可以</p>
            <p class="hd">返回<a href="javascript:history.go(-1);">上一页</a>,或去<a href="http://www.children-education.com"> children-education.com首页</a></p>
        </div>
    </div>
     <div class="footer clearfix">
        	<p class="footer-text fl"><span>©  2010-2013 </span><span>中国少儿教育网平台版权所有  </span><span>粤ICP备10009347号</span></p>
			<div class="foorer-nav fr">
			<a href="http://www.children-education.com" target="_blank">关于中国少儿教育网</a>
			<i>|</i>
			<a href="javascript:void(0);">服务条款</a>
			<i>|</i>
			<a href="http://www.children-education.com" target="_blank">商务合作 </a>
			<i>|</i>
			<a href="http://www.children-education.com" target="_blank">人才招聘</a>
			<i>|</i>
			<a href="http://www.children-education.com" target="_blank">客服中心</a>
			<i>|</i>
			<a href="http://www.children-education.com" target="_blank">网站导航</a>
			<i>|</i>
			<a href="http://www.children-education.com" target="_blank">联系方式</a>
			</div>
    </div>
</body>
</html>
 
 
               
	            

