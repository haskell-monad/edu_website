var check=new Object();//检测类
var is_email=false;
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
		check.E(d,'<img src="../base/img/no-bg.gif"/><font color="999999">长度不符合要求</font>');
		$("#E-ValidateCode").html('<img src="../base/img/no-bg.gif"/><font color="999999">长度不符合要求</font>');
	}else{
		check.E(d,'<img src="../base/img/ok.jpg"/><font color="green"></font>');
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
			   }else{
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
		 check.E(d,'<img src="../base/img/ok.jpg"/><font color="green"></font>');
		 is_email=true;
	}
}
var tishi=new Array();//声明提示信息
tishi={'email':'输入您的电子邮箱，请注意格式',
	'ValidateCode':'输入验证码'
}
$(function(){
	check.E=function(d,r){//填写错误信息
		$('#E-'+d).html(r);
	}
});