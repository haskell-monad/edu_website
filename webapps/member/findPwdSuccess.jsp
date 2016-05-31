<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	//0为成功，1为失败，2为过了激活时间，如果为空则为1
	String msg=request.getParameter("message");
	if(StringUtils.isBlank(msg)){
		msg="1";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>成功找回大太阳建筑网密码</title>
<link href="../base/comment/css/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../base/js/jquery-1.7.2.js"></script>
<script type="text/javascript">
	$(function(){
		var msg='<%=msg%>';
		var show="验证不成功,找回密码失败!";
		if(msg=='0'){
			show="成功找回大太阳建筑网密码!";
			$("#shows").removeClass();
			$("#shows").addClass("find-success");
		}else if(msg=='2'){
			show="激活链接已经失效!";
			$("#shows").removeClass();
			$("#shows").addClass("find-fail");
		}else{
			show="验证不成功,找回密码失败!";
			$("#shows").removeClass();
			$("#shows").addClass("find-fail");
		}
		$("#showmessage").html(show);
	});
	function run(){
		var s = document.getElementById("dd");
		if(s.innerHTML == 0){
			window.location.href='http://www.10333.com/member/mlogin.jsp';
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
        	<div class="logo">
            	<img width="185" height="55" src="<%=basePath%>base/comment/img/logo-bg.jpg" />
            </div>
            <div class="sun-nav">
            	<a href="http://www.10333.com/" target="_blank">大太阳首页</a>
				<a href="http://hyt.10333.com/" target="_blank">行业通</a>
				<a href="http://wenku.10333.com/" target="_blank">建筑文库</a>
				<a href="http://edu.10333.com/" target="_blank">大太阳教育</a>
				<a href="http://www.10333.com/site/dtyjzpt/zwjzsx/index.html" target="_blank">中外建筑赏析</a>
				<a href="http://bbs.10333.com/" target="_blank">建筑社区</a>
            </div>
        </div>
    </div>
    <div class="main-warp clearfix">
    	<div class="skip-contene">
        	<div id="shows" class="find-fail">
            	<h2 id="showmessage"></h2>
                <p>	
					将在<span id="dd">10</span>秒后自动转入<a id="showurl" href="http://www.10333.com/member/mlogin.jsp">大太阳登陆页</a>
                </p>
            </div>
            <p class="hd">您还可以</p>
            <p class="hd">返回<a href="http://www.10333.com/member/findPwd.jsp">上一页</a>,或去<a href="http://www.10333.com"> 10333.com首页</a></p>
        </div>
    </div>
     <div class="footer clearfix">
        	<p class="footer-text fl"><span>©  2010-2013 </span><span>大太阳建筑平台版权所有  </span><span>粤ICP备10009347号</span></p>
			<div class="foorer-nav fr">
			<a href="http://www.10333.com/aboutus/index.html" target="_blank">关于大太阳</a>
			<i>|</i>
			<a href="javascript:void(0);">服务条款</a>
			<i>|</i>
			<a href="http://www.10333.com/aboutus/partenr.html" target="_blank">商务合作 </a>
			<i>|</i>
			<a href="http://www.10333.com/aboutus/Looking_for.html" target="_blank">人才招聘</a>
			<i>|</i>
			<a href="http://www.10333.com/aboutus/kufu.html" target="_blank">客服中心</a>
			<i>|</i>
			<a href="http://www.10333.com/nav/nav-list.html" target="_blank">网站导航</a>
			<i>|</i>
			<a href="http://www.10333.com/aboutus/keep.html" target="_blank">联系方式</a>
			</div>
    </div>
</body>
</html>
 
 
               
	            

