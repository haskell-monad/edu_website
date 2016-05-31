<%@page import="java.text.SimpleDateFormat"%>
<%@page import="cn.freeteam.util.DateUtil"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.safety.Whitelist"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String url="";
	url=request.getParameter("url");
	if(StringUtils.isBlank(url)){
		url="http:/www.10333.com";
	}
	url = Jsoup.clean(url, Whitelist.relaxed());
	String email="";
	email=request.getParameter("email");
	String tarUrl="http://mail.";
	if(StringUtils.isBlank(email)){
		email="";
	}else{
		if(email.length()>0){
			int n=email.indexOf("@");
			tarUrl+=email.substring(n+1,email.length());
		}
	}
	String uname="";
	uname=request.getParameter("uname");
	if(StringUtils.isBlank(uname)){
		uname="";
	}else{
		uname=java.net.URLDecoder.decode(uname,"UTF-8");
		uname = Jsoup.clean(uname, Whitelist.relaxed());
	}
	
	String memberid="";
	memberid=request.getParameter("memberid");
	if(StringUtils.isBlank(memberid)){
		memberid="";
	}
	
	/* if(StringUtils.isBlank(uname) || StringUtils.isBlank(email)|| StringUtils.isBlank(memberid)){
		response.sendRedirect("register.jsp");
	} */
	
	
	//点击邮箱激活后传过来的参数start
	//String loginname="";
	//loginname=request.getParameter("loginname");
	//if(StringUtils.isBlank(loginname)){
	//	loginname="";
	//}else{
	//	loginname=java.net.URLDecoder.decode(loginname,"UTF-8");
	//}
	//System.out.println("邮箱验证:loginname:"+loginname);
	
	String temp="";
	temp=request.getParameter("temp");
	if(temp==null){
		temp="";
	}
	String starttime="";
	if(StringUtils.isBlank(temp)){
		temp="";	
	}else{
		//获得发送邮件时的时间
		Date dt = new Date(Long.parseLong(temp));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		starttime=sdf.format(dt);
	}
	//获得当前点击激活的时间
	String endtime=DateUtil.format(new Date(), "yyyy-MM-dd HH:mm");
	//点击邮箱激活后传过来的参数end
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="baidu-site-verification" content="H0Wtnpjldf" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>大太阳建筑网注册成功</title>
<link href="../base/css/style.css" type="text/css" rel="stylesheet" />
<jsp:include page="../jbox.jsp" />
<style>
  	.hover{
  		background:url(../img/sub-bg.jpg) no-repeat;width:251px;height:36px;display:block;line-height:36px;text-align:center;color:#FFF;font-size:16px;font-family:"微软雅黑";
		color:#FFF;
  	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("a.button-email").hover(
			 function () {
			    $(this).addClass("hover");
			  },
			  function () {
			    $(this).removeClass("hover");
			  }
		)
		var loginname="<%=uname%>";
		var start="<%=starttime%>";
		var end="<%=endtime%>";
		var temp="<%=temp%>";
		var email="<%=email%>";
		var flag=false;
		flag=dateCompare(start,end);
		if(start!='' && end!='' && flag){
			$.ajax({
				   cache: false,
				   type: "POST",
				   dataType:"text",
				   url: "../member_clearResisterTmp.do",
				   data:{"member.email":email},
				   success: function(msg){
						   $.jBox.prompt('已经过了激活时间,请重新注册!', '大太阳用户激活', 'info', { closed: function () {
							  	 window.location.href="register.jsp";
							}
						});
				   },
				   error:function(XMLHttpRequest, textStatus, errorThrown){
					   //alert("ajax异常,状态码:"+XMLHttpRequest.status);
				   }
			});
		}else{
			if(temp!=''){
				$.ajax({
					   type: "post",
					   dataType:"text",
					   url:"../member_login2.do",
					   data: {"mark":"1","temp":temp,"member.loginname":loginname},
					   success: function(msg){
							var n=msg;
							var url="<%=url%>";
							var href="http://www.10333.com";
							if(url!='' && url.length>0){
								href=url;
							}
							if(n=='1'){
								$.jBox.tip("正在验证...", 'loading');
								// 模拟2秒后完成操作
								window.setTimeout(function (){
										$.jBox.tip('激活成功！', 'success'); 
										window.location.href=href;
								}, 2000);
							}else{
								$.jBox.tip("正在验证...", 'loading');
								// 模拟2秒后完成操作
								window.setTimeout(function (){
										$.jBox.tip(' 该会员已经验证过！', 'info'); 
										window.location.href="register.jsp";
								}, 2000);
							}
					   },
					   error:function(XMLHttpRequest, textStatus, errorThrown){
						   $.jBox.error("ajax异常,状态码:"+XMLHttpRequest.status, 'ajax请求');
					   }			
				});
			}	
		}
	});
	//重新发送邮件
	function sendEmailRegister(){
		var unames='<%=uname%>';
		var url='<%=url%>';
		var emails='<%=email%>';
		var memberid='<%=memberid%>';
		var pageurl="registerSuccess.jsp?uname="+unames+"&url="+url+"&memberid="+memberid+"&email="+emails;
		if(unames!='' && emails!=''){
			$.ajax({
				   type: "POST",
				   dataType:"text",
				   url:"../member_sendEmailRegister.do",
				   data: {"pageurl":pageurl,"member.email":emails},
				   success: function(msg){
					   if(msg=='ok'){
						   shows();
					   }else{
						   window.location.href="register.jsp";
					   }
				   },
				   error:function(XMLHttpRequest, textStatus, errorThrown){
					   $.jBox.error("ajax异常,状态码:"+XMLHttpRequest.status, 'ajax请求');
				   }			
			});
		}
	}
	//如果返回false说明已经过了激活期限了
	function dateCompare(startStr,endStr){
		 var d1, d2, s, arr, arr1, arr2;
		 if(startStr.length > 10){
			arr = startStr.split(" ");
			arr1 = arr[0].split("-");
			arr2 = arr[1].split(":");
			d1 = new Date(arr1[0], arr1[1] - 1, arr1[2], arr2[0], arr2[1]);
		 }
		 else{
			arr = startStr.split("-");
			d1 = new Date(arr[0], arr[1], arr[2]);
		 }
		 if(endStr.length > 10){
			arr = endStr.split(" ");
			arr1 = arr[0].split("-");
			arr2 = arr[1].split(":");
			d2 = new Date(arr1[0], arr1[1] - 1, arr1[2], arr2[0], arr2[1]);
		 }
		 else{
			arr = endStr.split("-");
			d2 = new Date(arr[0], arr[1], arr[2]);
		 }
		 s = d2 - d1 ;
		 if((s -172800000)<0){
			//alert("当前还处在激活时间内！");
			return false;
		 }
		 if((s -172800000)==0){
			//alert("过了激活时间！");
			return true;
		 }
		 return true;
	}
</script>
<script type="text/javascript"> 
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
</script>
</head>

<body>
	<div class="header-warp">
    	<div class="header">
        	<div class="logo">
            	<img width="185" height="55" src="../base/img/logo-bg.jpg" />
            </div>
            <div class="sun-nav">
                <a href="http://www.10333.com/">大太阳首页</a>
                <a href="http://hyt.10333.com/">行业通</a>
                <a href="http://wenku.10333.com/">建筑文库</a>
                <a href="http://edu.10333.com/">大太阳教育</a>
                <a href="http://www.10333.com/site/dtyjzpt/zwjzsx/index.html">中外建筑赏析</a>
                <a href="http://bbs.10333.com/">建筑社区</a>
            </div>
        </div>
    </div>
    <div class="logon-box clearfix">
    	<div class="logon-left  clearfix">
        	<div class="success-box">
                <p class="success-theme">感谢您的注册，请立即验证邮箱地址</p><br/>
                <p style="line-height:22px;">
                	您的大太阳号为：<%=memberid%><br/>
	                                               您的用户名为：<%=uname%><br/>
	                                               您的邮箱为：<%=email%><br/>
	                                               激活后使用任意一种方式加密码均可登录。<br/>
                </p>                                                              
                <p class="test-emill">"验证邮箱" 已发至：<a href="<%=tarUrl%>"><%=email%></a></p>
                <p><a class="button-email" href="<%=tarUrl%>">点击进入邮箱页</a></p>
                 <p class="msg-email">提示：请在48小时内完成验证，48小时后邮件失效您将需要重新填写注册信息</p>	
            </div>
            <div class="msg-fail">
            	<h2>没有收到验证邮箱？</h2>
                <p class="but">到垃圾邮件目录里找找，或者
                <a  href="javascript:void(0);" onclick="sendEmailRegister();"> 点击这里</a> 重新发送注册确认邮件 </p>
                <!--首先设置一个层:-->
                <div id="pop" class="pop" style="display:none">
                      <div class="pop_head"><a class="close" href="javascript:void(0);" onclick="hide()"></a></div>
                      <div class="pop_body">邮件已发送请查收</div>
                </div>
                <p>如果您始终无法验证成功，请<a href="register.jsp?url=<%=url%>"> 重新注册 </a></p>
            </div>
     	</div>
        <div class="logon-right">
        	<div class="number-input">已有帐号，直接<a href="mlogin.jsp">登录</a></div>
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
