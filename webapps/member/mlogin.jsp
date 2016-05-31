<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.safety.Whitelist"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
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
<title>登录大太阳建筑网</title>
<link href="../css/style.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="../js/validate/jquery-1.7.2.js"></script>
<script type="text/javascript"src="../js/cookie.js"></script>
<style>
	.tipinfo{
		background:url(../css/img/fail-bg.gif) #faf7ed no-repeat 5px 3px;padding:2px;color:#666666;width:220px;display:block;border:1px solid #f1e2cb;margin-bottom:5px;padding-left:29px;line-height:18px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('.button').mouseover(function(){
			$(this).addClass('cur');
		});
		$('.button').mouseout(function(){
			$(this).removeClass('cur');
		});
		
		//自动登录
		//alert(GetCookie("FreeCMS_memberLoginName")+":"+GetCookie("FreeCMS_memberPassWord")+":"+GetCookie("autologin"));
		if(GetCookie("FreeCMS_memberLoginName")!=null && GetCookie("FreeCMS_memberLoginName")!=""){
		    document.getElementById("RememberMe").checked=true;
		    document.getElementById("userName").value=GetCookie("FreeCMS_memberLoginName");
			if(GetCookie("FreeCMS_memberPassWord")!=null && GetCookie("FreeCMS_memberPassWord")!="" && GetCookie("autologin")!=null && GetCookie("autologin")=='true'){
				document.getElementById("passWord").value=GetCookie("FreeCMS_memberPassWord");
				login();
			}
		}
	});
	function RememberMeClick(){
     	if(document.getElementById("RememberMe").checked==false){
     		//删除cookie
     		DelCookie("FreeCMS_memberLoginName");
     		DelCookie("FreeCMS_memberPassWord");
     	}
	 }
	$(function(){
		$("#userName").focus(function(){
			var value=$("#userName").val();
			if(value=="邮箱/用户名/ID号"){
				errMsg("请输入用户名");
				$("#userName").val("");
			}
		});
		$("#uname").children("#userName").focusout(function(){
			var userName=$("#userName").val();
			if(userName!='' && userName!='邮箱/用户名/ID号'){
			}
			if(userName=='' && userName.length<1){
				errMsg("");
				$("#userName").val("邮箱/用户名/ID号");
			}
		});
		$("#t_passWord").focus(function(){
			var value=$(this).val();
			if(value=="请输入密码"){
				$("#t_passWord").hide();
				errMsg("请输入密码");
				$("#passWord").show().focus();
			}
			
		});
		$("#mima").children("#passWord").focusout(function(){
				var passWord=$("#passWord").val();
				var reg2=/^\S{6,16}$/; //验证密码
				if(passWord=='' && passWord.length<1){
					$("#passWord").hide();
					$("#t_passWord").show();
					errMsg("");
				}
				if(!reg2.test(passWord)){
					errMsg("请输入6-16位密码");
					$("#passWord").focus();
				}
		});
		
	});
	//按下回车登录   
	document.onkeydown = function(event){   
		event = event?event:window.event;   
		if (event.keyCode == 13) {   
			login();   
		}   
	};
	//登陆
	function login(){
		errMsg("");
		var currUrl=window.location.href;
		var userName=$("#userName").val();
		var passWord=$("#passWord").val();
		var rememberMe=$("#RememberMe").val();
		var email_reg=/^[A-Za-z0-9_\.\-]+\@[A-Za-z0-9_]+\.[A-Za-z0-9_]+$/;
		var reg=/^[a-zA-Z]\w{4,24}$/; //验证用户名
		var reg2=/^\S{6,16}$/; //验证密码
		if(userName=='' && userName.length<1){
			errMsg("请输入用户名");
			$("#userName").focus();
			return false;
		}
		if(userName=='邮箱/用户名/ID号'){
			errMsg("请输入用户名");
			$("#userName").focus();
			return false;
		}
		if(userName.indexOf("@") >= 0){
			if(!email_reg.test(userName)){
				errMsg("请正确输入邮箱");
				$("#userName").focus();
				return false;
			}
		}else{
			if(!reg.test(userName)){
				//errMsg("请输入5-25位字母开头的字母或数字和下划线或汉字，一个汉字算2个字符");
				//$("#userName").focus();
				//return false;
			}
		}
		if(passWord=='' && passWord.length<1){
			errMsg("请输入密码,忘记密码?");
			$("#passWord").focus();
			return false;
		}
		if(!reg2.test(passWord)){
			errMsg("请输入6-16位密码");
			$("#passWord").focus();
			return false;
		}
		if(document.getElementById("RememberMe").checked==true){
    		//设置cookie
    		SetCookie("FreeCMS_memberLoginName",userName,60*60*24*10);
    		SetCookie("FreeCMS_memberPassWord",passWord,60*60*24*10);
    	}
		errMsg("");
		$.ajax({
			   type: "post",
			   dataType:"text",
			   url:"../member_login2.do",
			   data: {"loginMemberName":userName,"member.pwd":passWord,"RememberMe":rememberMe},
			   success: function(msg){
					var n=msg;
					var url="<%=url%>";
					var href="http://www.10333.com";
					if(currUrl.indexOf("?url")>=0){
						if(url!='' && url.length>0){
							url=decodeURIComponent(url);
							href=url;
						}else{
							href=href;
						}
					}else{
						//href="index.jsp";
						href=href;
					}
					if(n=='1'){
						window.location.href=href;
					}else{
						errMsg("登录名或密码错误!");
					}
			   },
			   error:function(XMLHttpRequest, textStatus, errorThrown){
				   alert("ajax异常,状态码:"+XMLHttpRequest.status);
			   }
		});
	}
	//显示表单验证错误信息
	function errMsg(msg){
		$("#msg").empty();
		if(msg==''){
			$("#msg").hide();
		}else{
			$("#msg").show();
		}
		$("#msg").html(msg);
	}
	//去除首位空格
	function trim(str){ 
		return str.replace(/(^\s*)|(\s*$)/g,""); 
	} 
</script>
</head>

<body>
	<div class="header-warp">
    	<div class="header">
        	<div class="logo">
            	<img width="185" height="55" src="../css/img/logo-bg.jpg" />
            </div>
            <div class="sun-nav">
            	<a href="http://www.10333.com/"  target="_blank">大太阳首页</a>
                <a href="http://hyt.10333.com/"  target="_blank">行业通</a>
                <a href="http://wenku.10333.com/"  target="_blank">建筑文库</a>
                <a href="http://edu.jzpt.com/"  target="_blank">大太阳教育</a>
                <a href="http://www.10333.com/site/dtyjzpt/zwjzsx/index.html"  target="_blank">中外建筑赏析</a>
                <a href="http://bbs.10333.com/"  target="_blank">建筑社区</a>
            </div>
        </div>
    </div>
     <div class="content">
    	<div class="login">
        <div class="login-box">
        	<div class="login-theme"><span>登录</span></div>
            <div class="demo">
                    <table width="100%">
                        <tr>
                            <td id="uname">
                                <div style="height: 22px;margin-bottom:5px"><div class="tipinfo" id="msg" style="display:none"></div></div>
                                <input class="stext" type="text" name="userName" value="邮箱/用户名/ID号" id="userName"/>
                            </td>
                        </tr>
                        <tr>
                            <td id="mima">
                            	<input class="stext" type="text" value="请输入密码" id="t_passWord"/>
                                <input class="stext" type="password" name="passWord" id="passWord" style="display:none"/>
                            </td>
                        </tr>
                        <tr>
                        	<td>
                                <span class="safe-login">
                                    <input id="RememberMe" type="checkbox" name="RememberMe" onclick="RememberMeClick()"/>
                                    <label for="RememberMe">自动登录</label>
                				</span>
                                <a class="wj" href="findPwd.jsp">忘记密码</a>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                            	<input type="button" id="login" class="button" onclick="login();" value="登录" />
                            </td>
                        </tr>
                    </table>
                	<p class="msg-login">
                    	<span>还没有大太阳帐号？</span>
                        <a href="register.jsp">立即注册</a>
                    </p>
                    <p class="pass-msg">注册为会员后，您将享受行业资讯、在线教育、资料下载、推广等服务，为您的事业助力！</p>
				</div>
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
