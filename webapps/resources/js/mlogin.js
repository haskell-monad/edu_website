$(document).ready(function(){
	//获取到当前的url
	var currUrl=window.location.href;
	//if(currUrl.lastIndexOf(".html")>=0){
	//	currUrl=currUrl.replace(".html",".htm1");
	//}
	//获取到登录入口的href
	var href=$("ul.subNav li:first").find("a").attr("href");
	//更改登录的href属性?url=
	//var src=href+"?url="+currUrl;
	
	currUrl=encodeURIComponent(currUrl);
	//alert(currUrl);
	//currUrl = noTag(currUrl);
	//alert(currUrl);
	
	var src=href+"?url="+currUrl;
	$("ul.subNav li:first").find("a").attr("href",src);
	//判断会员是否登录
	var loginMember=GetCookie("username");

	if(loginMember!="" && loginMember!=null){
		$("ul.subNav li:lt(2)").empty();
		var span=$("<a>欢迎您，"+loginMember+" </a>");
		var span2=$("<span class='line'/>");
		var span3=$("<a onclick='top_logouts();' style=\"cursor:pointer;\">注销</a>");
		var span4=$("<span class='line'/>");
		$("ul.subNav li:first").append(span).append(span2);
		$("ul.subNav li:eq(1)").append(span3).append(span4);
	}	
});

//首页、列表页、详情页头部会员注销事件
function top_logouts(){
	//会员注销的方法

	$.ajax({
		dataType:"text",
		type:"post",
		url:"/member_memberout.do",
		data:{},
		success: function(rData){
			window.location.reload();
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			alert("ajax异常,状态码:"+XMLHttpRequest.status);
		}
	})	
}

/**
 * 转换<>为&lt; &gt
 * @param {String} text
 * @return {String}
 */
function noTag (text) {
	// 正则表达式
	var REGEXP_LT = /</g;
	var REGEXP_GT = />/g;
	return text.replace(REGEXP_LT, '&lt;').replace(REGEXP_GT, '&gt;');
}