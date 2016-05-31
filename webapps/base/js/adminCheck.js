/*
var checkCodeNum='ed8y';

var is_username=false;
var is_password=false;
var is_code=false;

var check=new Object();//检测类

check.username=function(e,d){//用户名 input
	if(e==''){
		check.E(d,'<img src="../base/img/no-bg.gif"/><font color="ffffff">用户名不能为空</font>');
		is_username=false;
	}else{
		is_username=true;
	}
}

check.password=function(e,d){//密码   input
	if(e==''){
		check.E(d,'<img src="../base/img/no-bg.gif"/><font color="ffffff">密码不能为空</font>');
		is_password=false;
	}else{
		is_password=true;
	}
}

check.ValidateCode=function(e,d){//验证码
	$.ajax({
		   cache: false,
		   type: "GET",
		   dataType:"text",
		   url: "../login_sessionValidateCode.do?date="+new Date(),
		   data: "",
		   success: function(msg){
			   if(e==''){
					check.E(d,'<img src="../base/img/no-bg.gif"/><font color="ffffff">请输入验证码</font>');
					is_code=false;
			   }else if(e!=msg){
					check.E(d,'<img src="../base/img/no-bg.gif"/><font color="999999">验证码错误</font>');
					is_code=false;
			   }else if(e==msg){
					is_code=true;
			   }
		   }
	});
}
$(function(){
	check.E=function(d,r){//填写错误信息
		$('#E-checkCode').html(r);
	}
});
 */
var tishi=new Array();//声明提示信息
tishi={
	'username':'请输入您的用户名',
	'password':'请输入您的密码',
	'ValidateCode':'请填写验证码'
}
