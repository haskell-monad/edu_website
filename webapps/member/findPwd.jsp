<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>找回大太阳建筑网密码</title>
<link href="../base/css/style.css" type="text/css" rel="stylesheet" />
<jsp:include page="../jbox.jsp" /> 
<script src="../base/js/pwdCheck.js"></script>
<script src="../base/js/openDialog.js"></script>
</head>
<body>
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
					submitForms();  
				}   
			};
			//驗證碼切換
			function changeImg(){
				$("img.pic-yz").attr("src","../image.jsp?date="+new Date());	
			}
			//表单提交
			function submitForms(){
				var email=$("#email").val();
				var ValidateCode=$("#ValidateCode").val();
				
				if(email==''){
					$("#E-email").html('<img src="../base/img/no-bg.gif"/><font color="999999">邮箱未填写</font>');
					$("#E-ValidateCode").html('<img src="../base/img/no-bg.gif"/><font color="999999">邮箱未填写</font>');
					return false;
				}
				if(ValidateCode==''){
					$("#E-ValidateCode").html('<img src="../base/img/no-bg.gif"/><font color="999999">验证码未填写</font>');
					return false;
				}
				if(is_email && is_code){
					$.ajax({
						   cache: false,
						   type: "POST",
						   dataType:"text",
						   url: "../member_findPwdByEmail.do",
						   data:{"member.email":email,"ValidateCode":ValidateCode},
						   success: function(msg){
								if(msg=='1'){
									window.location.href="get_back.jsp?email="+email;
								}else{
									d_show();
									$("#email").val("");
									$("#ValidateCode").val("");
									//window.location.reload();
								}
						   },
						   error:function(XMLHttpRequest, textStatus, errorThrown){
							   $.jBox.error("ajax异常,状态码:"+XMLHttpRequest.status, 'ajax请求');
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
    	<div class="logon-left clearfix">
       		 <div class="logon-theme">
                <span>找回密码</span>
            </div>
            <div class="cypher-box clearfix">
                <div class="input-box clearfix">
                    <span><i><img src="../base/img/bot-bg.gif" /></i>注册邮件：</span>
                    <input class="box" id="email" type="text" name="member.email"/>
                    <div id="E-email" class="msg-box"></div>
                </div>
                <div class="input-box clearfix">
	                    <span><i><img src="../base/img/bot-bg.gif" /></i>验证码：</span>
	                    <input id="ValidateCode"  class="box check-box" type="text" name="ValidateCode"  value="" size="5" maxlength="4" />
	                   	<img class="pic-yz" width="73" height="31" src="../image.jsp" title="点击重新获取验证码"  onclick="this.src='../image.jsp?date='+new Date();"/><em>看不清楚？</em>
						<a onclick="changeImg();">换张图片</a>
	            </div>
                <p class="agree agree-bor"></p>
                <div id="E-ValidateCode" class="checking"></div>
                <div class="input-box">
                    <input name="提交" type="button" class="user_submit" onclick="submitForms();" id="user_submit" style="margin-left:152px;"  value="发送验证邮箱">
                </div>
                 <!--首先设置一个层:-->
                <div id="pop" class="pop" style="display:none">
                      <div class="pop_head"><a class="close" href="javascript:void(0);" onclick="d_hide()"></a></div>
                      <div class="pop_no_body">该会员不存在！</div>
                </div>
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
