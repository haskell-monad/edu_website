$(document).ready(function(){
                //详情页中部一广告
	$.ajax({
		dataType:"json",
		type: "GET",
		url: "/info_getAjaxImage.do",
		data: {"info.id":'57afdebd-73af-40df-9706-3a064e9a525b'},
		success: function(rdata){
			var data=rdata;  
			var url=data.url;
			var pageurl=data.pageurl;
			var img=data.img;
			if(url !='' && url.length>0){
				$("#zb1").parent(".zb1").attr("href",url); 
		        $("#zb1").parent(".zb1").attr("target","_blank"); 
			 }else{
			       if(pageurl !='' && pageurl.length>0){
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
                //详情页中部二广告
     $.ajax({
		dataType:"json",
		type: "GET",
		url: "/info_getAjaxImage.do",
		data: {"info.id":'b52a57b3-bcda-4562-b025-8da858741126'},
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
                //详情页右部一广告
     $.ajax({
		dataType:"json",
		type: "GET",
		url: "/info_getAjaxImage.do",
		data: {"info.id":'09ccb7ef-b3e3-4220-a45f-37b35146cada'},
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
                 //详情页右部二广告
    $.ajax({
		dataType:"json",
		type: "GET",
		url: "/info_getAjaxImage.do",
		data: {"info.id":'bd19ef52-f1d1-413a-a5f4-a5acc25784d8'},
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
