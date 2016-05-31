<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	String url="";
	url=request.getParameter("url");
	if(StringUtils.isBlank(url)){
		url="";
	}
%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录中国少儿教育网</title>
<link href="../css/admin_style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../base/js/jquery-1.7.2.js"></script>
<script src="../base/js/adminCheck.js"></script>
<script type="text/javascript">
		var is_code=false;
		$(function(){
				$('input').focusin(function(){
						tmpID=$(this).attr('id');
						if(tmpID!='' && (typeof tmpID!="undefined")){
							$(this).addClass('focus');
							$("#E-checkCode").html('<img src="../base/img/fail-bg.gif"/><font color="#ffffff">'+tishi[tmpID]+'</font>');
						}
				});
				$("#changeImgs").click(function(){
						$("img.pic-yz").attr("src","../image.jsp?date="+new Date());
						$("#E-checkCode").html('<img src="../base/img/no-bg.gif"/><font color="999999">验证码错误</font>');
						is_code=false;
				});
			    $("#ValidateCode").keyup(function(){
			    	 		 var yanzheng=$("#ValidateCode").val();
					    	 if(yanzheng.length == 4){
						    		 $.ajax({
										 		   cache: false,
										 		   type: "GET",
										 		   dataType:"text",
										 		   url: "../login_sessionValidateCode.do?date="+new Date(),
										 		   data: "",
										 		   success: function(msg){
											 			   if(yanzheng==msg){
											 				   is_code=true;
											 				  $("#E-checkCode").html("<img src='../base/img/ok.jpg'/><font color='green'></font>");
											 			   }else{
											 				  $("#E-checkCode").html('<img src="../base/img/no-bg.gif"/><font color="999999">验证码错误</font>');
											 				   is_code=false;
											 			   }
										 		   }
					 				});
					    	 }
			    });
		});
		/*
		$(document).ready(function(){
				var cook2=GetCookie("loginAdmin");
		});*/
		//按下回车登录   
		document.onkeydown = function(event){   
			event = event?event:window.event;   
			if (event.keyCode == 13) {   
				submitForm();  
			}
		};
		
		function changeImg(){
				
		}
		
		function submitForm(){
			if($.trim($("#username").val())==""){
				$("#username").focus();
				$("#E-checkCode").html('<img src="../css/img/fail-bg.gif"/><font color="#ffffff">请输入您的用户名</font>');
				return false;
			}
			if($.trim($("#password").val())==""){
				$("#password").focus();
				$("#E-checkCode").html('<img src="../css/img/fail-bg.gif"/><font color="#ffffff">请输入您的密码</font>');
				return false;
			}
			if($.trim($("#ValidateCode").val())==""){
				$("#ValidateCode").focus();
				$("#E-checkCode").html('<img src="../css/img/fail-bg.gif"/><font color="#ffffff">请填写验证码</font>');
				return false;
			}
			if(!is_code){
				return false;
			}
			/*
			if(document.getElementById("RememberMe").checked==true){
				//设置cookie
				SetCookie("FreeCMS_loginName",document.getElementById("username").value,60*60*24*30);
			}*/
				$("#E-checkCode").html("<img src='../base/img/ok.jpg'/><font color='green'></font>");
				$.ajax({
					   type: "post",
					   dataType:"text",
					   url:"../login_newlogin.do",
					   data: {"user.loginname":$("#username").val(),"user.pwd":$("#password").val(),"ValidateCode":$("#ValidateCode").val()},
					   success: function(msg){
							var n=msg;
							var url="<%=url%>";
							var href="http://www.children-education.com";
							if(url!='' && url.length>0){
								href=url;
							}else{
								href="index.jsp";
							}
							if(n=='ok'){
								//var cook1=GetCookie("loginAdmin");
								window.location.href=href;
							}else{
								$("#E-checkCode").html("<img src='../base/img/no-bg.gif'/><font color='999999'>登录失败！</font>");
								window.location.reload();
							}
					   },
					   error:function(XMLHttpRequest, textStatus, errorThrown){
						   alert("ajax异常,状态码:"+XMLHttpRequest.status);
					   }
				});
		}
</script>
<script type="text/javascript">
		/*
	            if(GetCookie("FreeCMS_loginName")!=null&&GetCookie("FreeCMS_loginName")!=""){
	            	//document.getElementById("RememberMe").checked=true;
	            }
	            if(GetCookie("FreeCMS_loginName")!=null)document.getElementById("username").value=GetCookie("FreeCMS_loginName");
	            function RememberMeClick(){
	            	if(document.getElementById("RememberMe").checked==false){
	            		//删除cookie
	            		DelCookie("FreeCMS_loginName");
	            	}
	            }
	            $("#username").focus();*/
 </script>
</head>

<body>
	<div class="login-top">
    	
        <p class="wel">WELCOME TO <a href="#">children-education.com</a></p>
    </div>
    <div class="login-content">
    	<div class="login-box">
       
            <div class="login-search">
                <p class="login-theme">登录</p>
                 <form id="RegForm">
						<div class="input-box clearfix">
								<input id="username" class="box" type="text" name="user.loginname"/>
						</div>
						<div class="input-box clearfix" >
								<input id="password" class="box" type="password" name="user.pwd"/>
						</div>
						<div class="input-box clearfix">
								<input id="ValidateCode" size="5" maxlength="4" type="text" name="ValidateCode" class="box check-box" />
								<img class="pic-yz" width="73"  height="31" src="../image.jsp" />
								<span><a style="cursor:hand; " id="changeImgs">换张图片</a></span>
						</div>
						<div id="E-checkCode" class="checking"></div>
						<div class="input-box">
								<input type="hidden" name="lt" value="_c3F041F78-53B9-69A5-3B3C-01BAB6E90925_k37408022-0986-F9AF-9DBB-8FBEC82968E9" />
								<input type="hidden" name="_eventId" value="submit" />
								<input name="submit"  type="button"  class="user_submit"  value="登录" onclick="submitForm();"/>
						</div>
				</form>
            </div>
         </div>
    </div>
    <div class="sun-footer">
    	<div>
    		<p>copyright © 2010-2012 children-education.com All Rights Reserved</p>
        </div>
    </div>
</body>
</html>
