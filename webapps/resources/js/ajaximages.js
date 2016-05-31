$(document).ready(function(){
                //列表页中部一广告
	$.ajax({
		dataType:"json",
		type: "GET",
		url: "/info_getAjaxImage.do",
		data: {"info.id":'d18194c1-5c0d-4f6b-b2b9-e6142a78e097'},
		success: function(rdata){
			var data=rdata;  
			var url=data.url;
			var pageurl=data.pageurl;
			var img=data.img;
			if(url !=null && url.length>0){
					   $("#zb1").parent(".zb1").attr("href",url); 
					   $("#zb1").parent(".zb1").attr("target","_blank"); 
			 }else{
					if(pageurl !=null && pageurl.length>0){
								$("#zb1").parent(".zb1").attr("href",imageurls+"/"+pageurl); 
								$("#zb1").parent(".zb1").attr("target","_blank"); 
					} 
			 }
			 if(img!=null && img.length>0){
				   $("#zb1").attr("src",img);
				   $("#zb1").width(980);
				   $("#zb1").height(90);
			}			
		}
	});
                //列表页中部二广告
     $.ajax({
		dataType:"json",
		type: "GET",
		url: "/info_getAjaxImage.do",
		data: {"info.id":'02540564-68e8-42ae-b7d7-371ce669e8b8'},
		success: function(rdata){
			var data=rdata;  
			var url=data.url;
			var pageurl=data.pageurl;
			var img=data.img;
			if(url !=null && url.length>0){
					   $("#zb2").parent(".zb2").attr("href",url); 
					   $("#zb2").parent(".zb2").attr("target","_blank"); 
			 }else{
					if(pageurl !=null && pageurl.length>0){
								$("#zb2").parent(".zb2").attr("href",imageurls+"/"+pageurl); 
								$("#zb2").parent(".zb2").attr("target","_blank"); 
					} 
			 }
			 if(img!=null && img.length>0){
				   $("#zb2").attr("src",img);
				   $("#zb2").width(980);
				   $("#zb2").height(90);
			}			
		}
	});
                //列表页右部一广告
     $.ajax({
		dataType:"json",
		type: "GET",
		url: "/info_getAjaxImage.do",
		data: {"info.id":'4eb9f8b0-c89b-4d2a-9eeb-453a4e3ab795'},
		success: function(rdata){
			var data=rdata;  
			var url=data.url;
			var pageurl=data.pageurl;
			var img=data.img;
			if(url !=null && url.length>0){
					   $("#yb1").parent(".yb1").attr("href",url); 
					   $("#yb1").parent(".yb1").attr("target","_blank"); 
			 }else{
					if(pageurl !=null && pageurl.length>0){
								$("#yb1").parent(".yb1").attr("href",imageurls+"/"+pageurl); 
								$("#yb1").parent(".yb1").attr("target","_blank"); 
					} 
			 }
			 if(img!=null && img.length>0){
				   $("#yb1").attr("src",img);
				   $("#yb1").width(280);
				   $("#yb1").height(210);
			}			
		}
	});
                 //列表页右部二广告
    $.ajax({
		dataType:"json",
		type: "GET",
		url: "/info_getAjaxImage.do",
		data: {"info.id":'ec419cb8-6c17-4ee0-9a0d-594f439ca65c'},
		success: function(rdata){
			var data=rdata;  
			var url=data.url;
			var pageurl=data.pageurl;
			var img=data.img;
			if(url !=null && url.length>0){
					   $("#yb2").parent(".yb2").attr("href",url); 
					   $("#yb2").parent(".yb2").attr("target","_blank"); 
			 }else{
					if(pageurl !=null && pageurl.length>0){
								$("#yb2").parent(".yb2").attr("href",imageurls+"/"+pageurl); 
								$("#yb2").parent(".yb2").attr("target","_blank"); 
					} 
			 }
			 if(img!=null && img.length>0){
				   $("#yb2").attr("src",img);
				   $("#yb2").width(280);
				   $("#yb2").height(210);
			}			
		}
	});
});
