var check=new Object();//检测类
var is_email=false;
var is_password=false;
var is_repassword=false;
var is_username=false;
var is_code=false;

check.num=function(e,d,s,b){//验证纯数字   input
	//alert(d);
	var p=/^[0-9]*$/;
	if(e==''){
		check.E(d,'<img src="../base/img/no-bg.gif"/><font color="999999">ID不能为空</font>');
		$("#E-ValidateCode").html('<img src="../base/img/no-bg.gif"/><font color="999999">ID不能为空</font>');
	}else if(!p.test(e)){//    /^[0-9]*$/.test
		check.E(d,'<img src="../base/img/no-bg.gif"/><font color="999999">该类型只能为数字</font>');
		$("#E-ValidateCode").html('<img src="../base/img/no-bg.gif"/><font color="999999">该类型只能为数字</font>');
	}else if(e.length<s || e.length>b){
		$("#E-ValidateCode").html('<img src="../base/img/no-bg.gif"/><font color="999999">长度不符合要求</font>');
		check.E(d,'<img src="../base/img/no-bg.gif"/><font color="999999">长度不符合要求</font>');
	}else{
		check.E(d,'<img src="../base/img/ok.jpg"/><font color="green"></font>');
	}
}

check.userName=function(e,d,s,b){//用户名   input
	var p=/^[A-Za-z0-9_]+$/;
	if(e==''){
		check.E(d,'<img src="../base/img/no-bg.gif"/><font color="999999">用户名不能为空</font>');
		$("#E-ValidateCode").html('<img src="../base/img/no-bg.gif"/><font color="999999">用户名不能为空</font>');
		is_username=false;
	}
	//else if(!p.test(e)){
	//	check.E(d,'<img src="../base/img/no-bg.gif"/><font color="999999">用户名只能为数字、字母和_组合</font>');
	//	$("#E-ValidateCode").html('<img src="../base/img/no-bg.gif"/><font color="999999">用户名只能为数字、字母和_组合</font>');
	//	is_username=false;
	//}
	//else if(e.length<s || e.length>b){
	//	check.E(d,'<img src="../base/img/no-bg.gif"/><font color="999999">用户名长度不符合要求,请输入5-25个字符</font>');
	//	$("#E-ValidateCode").html('<img src="../base/img/no-bg.gif"/><font color="999999">用户名长度不符合要求,请输入5-25个字符</font>');
	//	is_username=false;
	//}
	else{
		$.ajax({
			   cache: false,
			   type: "GET",
			   dataType:"text",
			   url: "../member_checkLoginname.do",
			   data: {"member.loginname":e},
			   success: function(msg){
				   if(msg=='此会员名已存在!'){
					   check.E(d,'<img src="../base/img/no-bg.gif"/><font color="999999">用户名已存在,请使用其他用户名</font>');
					   $("#E-ValidateCode").html('<img src="../base/img/no-bg.gif"/><font color="999999">用户名已存在,请使用其他用户名</font>');
					   is_username=false;
				   }else{
					   check.E(d,'<img src="../base/img/ok.jpg"/><font color="green"></font>');
					   is_username=true;
				   }
			   }
		});
	}
}

check.pwd=function(e,d,s,b){//密码   input
	var p=/^[A-Za-z0-9_]+$/;
	if(e==''){
		check.E(d,'<img src="../base/img/no-bg.gif"/><font color="999999">密码不能为空</font>');
		$("#E-ValidateCode").html('<img src="../base/img/no-bg.gif"/><font color="999999">密码不能为空</font>');
		is_password=false;
	}else if(!p.test(e)){
		check.E(d,'<img src="../base/img/no-bg.gif"/><font color="999999">该类型只能为数字、字母和_组合</font>');
		$("#E-ValidateCode").html('<img src="../base/img/no-bg.gif"/><font color="999999">该类型只能为数字、字母和_组合</font>');
		is_password=false;
	}else if(e.length<s || e.length>b){
		check.E(d,'<img src="../base/img/no-bg.gif"/><font color="999999">长度不符合要求,请输入6-16个字符</font>');
		$("#E-ValidateCode").html('<img src="../base/img/no-bg.gif"/><font color="999999">长度不符合要求,请输入6-16个字符</font>');
		is_password=false;
	}else{
		check.E(d,'<img src="../base/img/ok.jpg"/><font color="green"></font>');
		is_password=true;
	}
}

check.repwd=function(e,v,d){//重复密码   input
	if(e==''){
		check.E(d,'<img src="../base/img/no-bg.gif"/><font color="999999">密码不能为空</font>');
		$("#E-ValidateCode").html('<img src="../base/img/no-bg.gif"/><font color="999999">密码不能为空</font>');
		is_repassword=false;
	}else if(e!==v){//v是输的的密码   由开始就带进来
		check.E(d,'<img src="../base/img/no-bg.gif"/><font color="999999">两次输入的密码不一致</font>');
		$("#E-ValidateCode").html('<img src="../base/img/no-bg.gif"/><font color="999999">两次输入的密码不一致</font>');
		is_repassword=false;
	}else{
		check.E(d,'<img src="../base/img/ok.jpg"/><font color="green"></font>');
		is_repassword=true;
	}
}

check.ValidateCode=function(e,d){//验证码
	$.ajax({
		   cache: false,
		   type: "GET",
		   dataType:"text",
		   url: "../member_sessionValidateCode.do?date="+new Date(),
		   data: "",
		   success: function(msg){
			   if(e==''){
					check.E(d,'<div style="border:2px solid f1e2cb; height="30px"><img src="../base/img/no-bg.gif"/><font color="999999">验证码未填写</font>');
					$("#E-ValidateCode").html('<img src="../base/img/no-bg.gif"/><font color="999999">验证码未填写</font>');
					is_code=false;
			   }else if(e!=msg){
					check.E(d,'<img src="../base/img/no-bg.gif"/><font color="999999">验证码错误</font>');
					$("#E-ValidateCode").html('<img src="../base/img/no-bg.gif"/><font color="999999">验证码错误</font>');
					is_code=false;
			   }else if(e==msg){
					check.E(d,'<img src="../base/img/ok.jpg"/><font color="green"></font>');
					is_code=true;
			   }
		   }
	});
}

check.email=function(e,d){//邮箱格式------------------√
	var p=/^[A-Za-z0-9_\.\-]+\@[A-Za-z0-9_]+\.[A-Za-z0-9_]+$/;
	if(e==''){
		check.E(d,'<img src="../base/img/no-bg.gif"/><font color="999999">邮箱未填写</font>');
		$("#E-ValidateCode").html('<img src="../base/img/no-bg.gif"/><font color="999999">邮箱未填写</font>');
		is_email=false;	
	}else if(!p.test(e)){
		check.E(d,'<img src="../base/img/no-bg.gif"/><font color="999999">您填写的邮箱格式不正确</font>');
		$("#E-ValidateCode").html('<img src="../base/img/no-bg.gif"/><font color="999999">您填写的邮箱格式不正确</font>');
		is_email=false;
	}else{
		$.ajax({
			   cache: false,
			   type: "GET",
			   dataType:"text",
			   url: "../member_checkEmail.do",
			   data: {"member.email":e},
			   success: function(msg){
				   if(msg=='1'){
					   check.E(d,'<img src="../base/img/no-bg.gif"/><font color="999999">邮箱已存在,请使用其他邮箱</font>');
					   $("#E-ValidateCode").html('<img src="../base/img/no-bg.gif"/><font color="999999">邮箱已存在,请使用其他邮箱</font>');
					   is_email=false;	
				   }else{
					   check.E(d,'<img src="../base/img/ok.jpg"/><font color="green"></font>');
					   is_email=true;
				   }
			   }
		});
	}
}
var tishi=new Array();//声明提示信息
tishi={'email':'输入您的电子邮箱，请注意格式',
	'pwd':'输入您的密码',
	'repwd':'重新输入密码',
	'userName':'输入您的用户名',
	'ValidateCode':'输入验证码'
}
$(function(){
	check.E=function(d,r){//填写错误信息
		$('#E-'+d).html(r);
		
	}
});