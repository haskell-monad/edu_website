<%@page import="cn.freeteam.util.DateUtil"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script src="../base/js/jquery.js"></script>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	String email="";
	email=request.getParameter("email");
	if(StringUtils.isBlank(email)){
		email="";	
	}
	String temp="";
	temp=request.getParameter("temp");
	if(StringUtils.isBlank("temp")){
		temp="";	
	}
	
	String pwd="";
	pwd=request.getParameter("pwd");
	if(StringUtils.isBlank("pwd")){
		pwd="";	
	}
	
	//获得发送邮件时的时间
	String starttime="";
	starttime=request.getParameter("starttime");
	if(StringUtils.isBlank("starttime")){
		starttime="";	
	}
	//获得当前点击激活的时间
	String endtime=DateUtil.format(new Date(), "yyyy-MM-dd HH:mm");
	
%>
<script type="text/javascript">
	$(document).ready(function(){
		var email="<%=email%>";
		var temp="<%=temp%>";
		var pwd="<%=pwd%>";
		var start="<%=starttime%>";
		var end="<%=endtime%>";
		var flag=false;
		flag=dateCompare(start,end);
		if(flag){
			$.ajax({
				   cache: false,
				   type: "POST",
				   dataType:"text",
				   url: "../member_clearTmp.do",
				   data:{"member.email":email},
				   success: function(msg){
							//alert("已经过了激活时间!");
							//window.location.href="findPwd.jsp";
							window.location.href="http://www.10333.com/member/findPwdSuccess.jsp?message="+2;
				   },
				   error:function(XMLHttpRequest, textStatus, errorThrown){
					   //alert("ajax异常,状态码:"+XMLHttpRequest.status);
				   }  
			});
		}else{
			$.ajax({
				   cache: false,
				   type: "POST",
				   dataType:"text",
				   url: "../member_findPwdByEmailActivate.do",
				   data:{"member.email":email,"temp":temp,"pwd":pwd},
				   success: function(msg){
						if(msg=='1'){
							//alert("验证通过,成功激活!");
							//window.location.href="<%=basePath%>member";
							window.location.href="http://www.10333.com/member/findPwdSuccess.jsp?message="+0;
						}else{
							//alert("验证失败,请重新激活!");
							window.location.href="http://www.10333.com/member/findPwdSuccess.jsp?message="+1;
							//window.location.href="findPwd.jsp";
						}
				   },
				   error:function(XMLHttpRequest, textStatus, errorThrown){
					   alert("ajax异常,状态码:"+XMLHttpRequest.status);
				   }  
			});
		}
	});
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
		 //alert(s-1800000);	
		 if((s -1800000)<0){
			//alert("当前还处在激活时间内！");
			return false;
		 }
		 if((s -1800000)==0){
			//alert("过了激活时间！");
			return true;
		 }
		 return true;
	}
</script>
