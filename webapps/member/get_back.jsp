<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.safety.Whitelist"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	String email="";
	email=request.getParameter("email");
	//邮箱类型
	String tarUrl="http://mail.";  
	if(StringUtils.isBlank(email)){
		email="";
	}else{
		email = Jsoup.clean(email, Whitelist.relaxed());
		if(email.length()>0){
			int n=email.indexOf("@");
			tarUrl+=email.substring(n+1,email.length());
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../base/css/style.css" type="text/css" rel="stylesheet" />
<script src="../base/js/jquery.js"type="text/javascript"></script>
<script src="../base/js/mousedown.js"></script>
<title>找回大太阳建筑网密码</title>
<script type="text/javascript"> 
	$(document).ready(function(){
		var email="<%=email%>";
		$.ajax({
			   cache: false,
			   type: "POST",
			   dataType:"text",
			   url: "../member_validateEmailTemp.do",
			   data:{"member.email":email},
			   success: function(msg){
					if(msg!='1'){
						window.location.href="findPwd.jsp";
					}
			   },
			   error:function(XMLHttpRequest, textStatus, errorThrown){
				  // alert("ajax异常,状态码:"+XMLHttpRequest.status);
			   }  
		});
	});
	 var EX = {
			addEvent:function(k,v){
				var me = this;
				if(me.addEventListener)
				me.addEventListener(k, v, false);
				else if(me.attachEvent)
				me.attachEvent("on" + k, v);
				else
				me["on" + k] = v;
			},
			removeEvent:function(k,v){
				var me = this;
				if(me.removeEventListener)
				me.removeEventListener(k, v, false);
				else if(me.detachEvent)
				me.detachEvent("on" + k, v);
				else
				me["on" + k] = null;
			},
			stop:function(evt){
				evt = evt || window.event;
				evt.stopPropagation?evt.stopPropagation():evt.cancelBubble=true;
			}
		};
		document.getElementById('pop').onclick = EX.stop;
		var url = '#'; 
		function shows(){ 
			var o = document.getElementById('pop'); 
			o.style.display = ""; 
			setTimeout(function(){
				EX.addEvent.call(document,'click',hide);
			});
		}
		function hide(){ 
			var o = document.getElementById('pop'); 
			o.style.display = "none"; 
			EX.removeEvent.call(document,'click',hide);
		}
		//进入到邮箱登录页面
		function goToEmail(){
			var pageurl="<%=tarUrl%>";
			window.location.href=pageurl;
		}
		//重新发送邮件
		function sendEmailFind(){
			var emails='<%=email%>';
			if(emails!=''){
				$.ajax({
					   type: "POST",
					   dataType:"text",
					   url:"../member_sendEmailFind.do",
					   data: {"member.email":emails},
					   success: function(msg){
						   shows();
					   },
					   error:function(XMLHttpRequest, textStatus, errorThrown){
						   alert("ajax异常,状态码:"+XMLHttpRequest.status);
					   }			
				});
			}
		}
</script>
</head>
<body>
	<div class="header-warp">
    	<div class="header">
        	<div class="logo">
            	<img width="185" height="55" src="../base/img/logo-bg.jpg" />
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
    <div class="logon-box clearfix">
    	<div class="logon-left  clearfix">
        	<div class="success-box">
                <p class="success-theme">找回密码链接已发送至您的注册邮箱，请查收！</p>
                <p class="test-emill"></p>
                <p> <input name="提交" type="submit" class="user_submit  button-email" onclick="goToEmail();" id="user_submit"   value="点击进入邮箱"></p>
                 <p class="msg-email">提示：此链接30分钟内有效，请进入您的注册邮箱查看</p>	
            </div>
            <div class="msg-fail">
            	<h2>没有收到验证邮箱？</h2>
                <p class="but">到垃圾邮件目录里找找，或者
                <a  href="javascript:void(0);" onclick="sendEmailFind();"> 点击这里</a> 重新发送找回密码邮件 </p>
                <!--首先设置一个层:-->
                <div id="pop" class="pop" style="display:none">
                      <div class="pop_head"><a class="close" href="javascript:void(0);" onclick="hide()"></a></div>
                      <div class="pop_body">邮件已发送请查收</div>
                </div>
                <p>如果您始终无法验证成功，请<a href="findPwd.jsp"> 重新发送 </a></p>
            </div>
     	</div>
        <div class="logon-right fl">
        	<div class="number-input sun-h">大太阳产品</div>
            <div class="pic clearfix">
            	<a href="http://hyt.10333.com/"  target="_blank"><img height="73"width="73" src="../base/img/hyt-bg.jpg" /></a>
                <a href="http://bbs.10333.com/" target="_blank"><img height="73"width="73" src="../base/img/hdsq.jpg" /></a>
                <a href="http://wenku.10333.com/" target="_blank"><img height="73"width="73" src="../base/img/wk.jpg" /></a>
                <a href="http://bbs.10333.com/forum.php?mod=forumdisplay&fid=3285" target="_blank"><img height="73"width="73" src="../base/img/wd.jpg" /></a>
                <a href="http://edu.10333.com/" target="_blank"><img height="73"width="73" src="../base/img/ycjy-bg.jpg" /></a>
            </div>
            <p class="question">如注册遇到问题请联络客服</p>
            <p class="emil-msg">客服邮箱：<a href="">service#jzpt.com</a> 将#替换为@</p>
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
    </div>
</body>
</html>
