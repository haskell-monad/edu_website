<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.safety.Whitelist"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache");
	response.setDateHeader("Expires", 0);
	response.flushBuffer(); 
	String url="";
	url=request.getParameter("url");
	if(StringUtils.isBlank(url)){
		url="";
	}else{
		url = Jsoup.clean(url, Whitelist.relaxed());
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="baidu-site-verification" content="H0Wtnpjldf" />
		<title>大太阳会员注册</title>
		<link href="../base/css/style.css" type="text/css" rel="stylesheet" />
		<jsp:include page="../jbox.jsp" /> 
		<script src="../base/js/Check.js"></script>
		<script src="../base/js/agree.js"></script>
		
		<script type="text/javascript">
			$(function(){
				var tmpID;
				$('input').focusin(function(){
					tmpID=$(this).attr('id');
					$(this).addClass('focus');
					$('#E-'+tmpID).html('<img src="../base/img/fail-bg.gif"/><font color="#999999">'+tishi[tmpID]+'</font>');
				});
				$('input').focusout(function(){
					$(this).removeClass('focus');
					var pval=$(this).val();
					switch(tmpID){
						case 'email':
							check.email(pval,tmpID);
						break;
						case 'pwd':
							check.pwd(pval,tmpID,6,16);
						break;
						case 'repwd':
							var apwd=$('#pwd').val();
							check.repwd(pval,apwd,tmpID);
						break;
						case 'userName':
							check.userName(pval,tmpID,5,25);
						break;
						case 'ValidateCode':
							check.ValidateCode(pval,tmpID);
						break;
						default:
						//alert('未知验证项');
					}
				});
			});
			$(document).ready(function(){
				$('.user_submit').mouseover(function(){
					$(this).addClass('cur');
				});
				$('.user_submit').mouseout(function(){
					$(this).removeClass('cur');
				});

			});
			//按下回车登录   
			document.onkeydown = function(event){   
				event = event?event:window.event;   
				if (event.keyCode == 13) {   
					formSubmit();
				}   
			};
			//表单提交验证
			function formSubmit(){
				var treaty=$("#treaty").is(":checked");
				var pwd=$("#pwd").val();
				var repwd=$("#repwd").val();
				var email=$("#email").val();
				var ValidateCode=$("#ValidateCode").val();
				var userName=$("#userName").val();
				var href="<%=url%>";
				
				if(email==''){
					$("#E-email").html('<img src="../base/img/no-bg.gif"/><font color="999999">邮箱未填写</font>');
					return false;
				}if(pwd==''){
					$("#E-pwd").html('<img src="../base/img/no-bg.gif"/><font color="999999">输入您的密码</font>');
					return false;
				}if(repwd==''){
					$("#E-repwd").html('<img src="../base/img/no-bg.gif"/><font color="999999">重新输入密码</font>');
					return false;
				}if(pwd!=repwd){
					$("#E-repwd").html('<img src="../base/img/no-bg.gif"/><font color="999999">两次输入的密码不一致</font>');
					return false;
				}
				if(userName==''){
					$("#E-userName").html('<img src="../base/img/no-bg.gif"/><font color="999999">输入您的用户名</font>');
					return false;
				}
				if(!treaty){
					$("#E-ValidateCode").html('<img src="../base/img/no-bg.gif"/><font color="999999">请勾选《大太阳网络服务使用协议》</font>');
					return false;
				}
				if(ValidateCode==''){
					$("#E-ValidateCode").html('<img src="../base/img/no-bg.gif"/><font color="999999">验证码未填写</font>');
					return false;
				}
				
				if(href==''){
					href="?url=http://www.10333.com&email="+email;
				}else{
					href="?url="+href+"&email="+email;
				}
				var pageurl="registerSuccess.jsp"+href;
				
				if(is_email && is_password && is_repassword && is_username && is_code){
					$.ajax({
						   cache: false,
						   type: "POST",
						   dataType:"json",
						   url: "../member_newregister.do",
						   data:{"pageurl":pageurl,"member.email":email,"member.pwd":repwd,"member.loginname":userName,"ValidateCode":ValidateCode},
						   success: function(msg){
							  var status=msg[0].status;
							  var username=msg[0].username;
							  var email=msg[0].email;
							  var memberid=msg[0].memberid;
							  if(status=="ok"){
								  window.location.href="registerSuccess.jsp"+href+"&uname="+userName+"&memberid="+memberid;
							  }else{
								  $.jBox.info('注册失败!','注册');
								  //alert("注册失败！");
								  window.location.reload();
							  }
						   }
					});
				}
			}
			//驗證碼切換
			function changeImg(){
				$("img.pic-yz").attr("src","../image.jsp?date="+new Date());	
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
	    	<div class="logon-left clearfix">
	       		 <div class="logon-theme">
	                <span>注册大太阳建筑网</span>
	            </div>
	            <%--
	            <p class="sun-nuber"><i><img src="../base/img/bot-bg.gif" /></i>你的太阳号是：<span id="dtyNumber" name="dtyNumber">123123</span></p>
	            --%>
	            <p class="sun-nuber"></p>
	            <div class="clearfix">
	            <form id="RegForm" action="" method="post">
	                <div class="input-box clearfix">
	                    <span><i><img src="../base/img/bot-bg.gif" /></i>邮件地址：</span>
	                    <input class="box" id="email" type="text" name="member.email"/>
	                    <div id="E-email" class="msg-box"></div>
	                </div>
	                <div class="input-box clearfix" >
	                    <span><i><img src="../base/img/bot-bg.gif" /></i>密码：</span>
	                    <input id="pwd" class="box" type="password" name="member.pwd"/>
	                    <div id="E-pwd" class="msg-box"></div>
	                </div>
	                <div class="input-box clearfix">
	                    <span><i><img src="../base/img/bot-bg.gif" /></i>确认密码：</span>
	                    <input id="repwd" class="box" type="password" name="repwd"/>
	                    <div id="E-repwd" class="msg-box"></div>
	                </div>
	                <div class="input-box clearfix">
	                    <span><i><img src="../base/img/bot-bg.gif" /></i>用户名：</span>
	                    <input id="userName"  class="box" type="text" name="member.loginname"/>
	                    <div id="E-userName" class="msg-box"></div>
	                </div>
	                <div class="input-box clearfix">
	                    <span><i><img src="../base/img/bot-bg.gif" /></i>验证码：</span>
	                    <input id="ValidateCode"  class="box check-box" type="text" name="ValidateCode" value="" size="5" maxlength="4"/>
	                   	<img class="pic-yz" width="73" height="31" src="../image.jsp" title="点击重新获取验证码"  onclick="this.src='../image.jsp?date='+new Date();"/><em>看不清楚？</em>
						<a onclick="changeImg();">换张图片</a>
	                </div>
	                <!--首先设置一个层:-->
	                <div id="pop-h" class="pop-h" style="display:none;">
	                  <div class="pop_head-h"><a class="close" href="javascript:void(0);" onclick="hide()"></a></div>
	                  <div class="pop_body-h">
	                  	<div class="pop-text">
	                      <h2>《大太阳网络服务使用协议》</h2>
	                      <p class="text-p">大太阳服务条款（以下简称服务条款）是用户（您）与深圳大太阳网络科技有限公司（以下称大太阳或大太阳公司，所涉域名为：10333.com）之间的协议。</p>
	                      <h3>1用户需知</h3>
	                      <p>大太阳在此提醒您，如欲访问大太阳网，您必须事先认真阅读本服务条款，包括免除或限制大太阳责任的条款及对您的权利进行限制的条款。如您不同意本服务条款及随时对其进行的修改，请您立即停止大太阳提供的全部服务。您的使用行为将被视为您对本服务条款全部内容的完全接受，包括接受大太阳对服务条款随时所做的任何修改。</p>
	                      <h3>2服务的内容</h3>
	                      <p>大太阳目前向您提供丰富的网上及线下资源及诸多产品与服务。本条款适用于大太阳提供的各种服务，但当您使用大太阳某一特定服务时，如该服务另有单独的服务条款、指引或规则，您应遵守本服务条款及大太阳随时公布的与该服务相关的指引或规则等，所有的指引或规则，均构成本服务条款的一部分。除非本服务条款另有其他明示规定，新推出的产品或服务，均受本服务条款之约束。</p>
	                      <p>大太阳目前向您提供丰富的网上及线下资源及诸多产品与服务。本条款适用于大太阳提供的各种服务，但当您使用大太阳某一特定服务时，如该服务另有单独的服务条款、指引或规则，您应遵守本服务条款及大太阳随时公布的与该服务相关的指引或规则等，所有的指引或规则，均构成本服务条款的一部分。除非本服务条款另有其他明示规定，新推出的产品或服务，均受本服务条款之约束。</p>
	                      </div>
	                  </div>
	                </div>
	                <p class="agree">
	                	<input type="checkbox" id="treaty" name="treaty"/> 我已看过并同意<a href="javascript:void(0);" onclick="show();">《大太阳网络服务使用协议》</a>
	                </p>
	                <div id="E-ValidateCode" class="checking"></div>
	                 <div class="input-box">
	                    <input name="提交" type="button" onclick="formSubmit();" class="user_submit" id="user_submit" style="margin-left:152px;"  value="提交"/>
	                </div>
	            </form>
	            </div>
	    	</div>
	        <div class="logon-right fl">
	        	<div class="number-input">已有帐号，直接<a href="mlogin.jsp?url=http://www.10333.com">登录</a></div>
	            <p class="sun-f">成为大太阳建筑网注册用户即可享受大太阳产品服务</p>
	            <div class="pic">
	            	<a href="http://hyt.10333.com/" target="_blank"><img height="73"width="73" src="../base/img/hyt-bg.jpg" /></a>
	                <a href="http://bbs.10333.com/" target="_blank"><img height="73"width="73" src="../base/img/hdsq.jpg" /></a>
	                <a href="http://wenku.10333.com/" target="_blank"><img height="73"width="73" src="../base/img/wk.jpg" /></a>
	                <a href="http://bbs.10333.com/forum.php?mod=forumdisplay&fid=3285" target="_blank"><img height="73"width="73" src="../base/img/wd.jpg" /></a>
	                <a href="http://edu.10333.com/" target="_blank"><img height="73"width="73" src="../base/img/ycjy-bg.jpg" /></a>
	            </div>
	            <p class="question">如注册遇到问题请联络客服</p>
	            <p class="emil-msg">客服邮箱：<a href="">service#10333.com</a> 将#替换为@</p>
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
	        <script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F17ce3c7c77ab27639325f09daa9e74e4' type='text/javascript'%3E%3C/script%3E"));
</script>
	        
	</body>
</html>
