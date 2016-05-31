<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中国少儿教育网-错误信息提示</title>
<link rel="stylesheet" href="<%=basePath%>base/comment/css/style.css" type="text/css" />
<script type="text/javascript" src="<%=basePath%>base/js/jquery-1.7.2.js" ></script>
<script type="text/javascript">
	function run(){
		var s = document.getElementById("dd");
		if(s.innerHTML == 0){
			window.location.href='http://www.children-education.com';
			return false;
		}
		s.innerHTML = s.innerHTML * 1 - 1;
	}
	window.setInterval("run();", 1000);  
</script>
</head>
<body>
	<div class="header-warp">
    	<div class="header">
        	<div class="logo"></div>
            <div class="sun-nav">
            	<a href="http://www.children-education.com/" target="_blank">中国少儿教育网</a>
		<a href="http://www.children-education.com/" target="_blank">中国少儿教育网</a>
		<a href="http://www.children-education.com/" target="_blank">中国少儿教育网</a>
		<a href="http://www.children-education.com/" target="_blank">中国少儿教育网</a>
	<a href="http://www.children-education.com" target="_blank">中国少儿教育网</a>
		<a href="http://www.children-education.com/" target="_blank">中国少儿教育网</a>           
            </div>
        </div>
    </div>
    <div class="main-warp clearfix">
    	<div class="error-box ">
    		
            <div class="error-msg">
            	<h2>非常抱歉，您访问的页面没有找到</h2>
                <p>将在<em id="dd">10</em>秒钟后自动转入<a href="http://www.children-education.com">频道首页</a></p>
                <div class="error-msg-1">
                    <p>您还可以</p>
                    <p>返回<a href="http://www.children-education.com">children-education.com首页</a>，再去逛逛</p>
                    <p>去<a href="http://www.children-education.com/">少儿教育</a>学习</p>
                    <p>去<a href="http://www.children-education.com/">少儿教育</a>学习</p>
                </div>
            </div>
        </div>
    </div>
     <div class="footer clearfix">
        	<p class="footer-text fl"><span>©  2010-2013 </span><span>中国少儿教育网版权所有  </span><span>粤ICP备10009347号</span></p>
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
			</div>        </div>
</body>
</html>
 
 
               
	            

