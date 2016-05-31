<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<script type="text/javascript" src="../../base/js/jquery-1.7.2.js" ></script>
		<script type="text/javascript">
			$(function(){
					$.ajax({
						   type: "post",
						   dataType:"json",
						   url: "channel_getAllFirstChannel.do",
						   data: {},
						   success: function(rdata){
							   	var data=rdata;
							   	for(var i=0;i<data.length;i++){
							   		var id=data[i].id;
							   		var name=data[i].name;
							   		var url=data[i].url;
							   		var pageurl="http://www.10333.com/site/dtyjzpt/"+data[i].pageurl;
							   		var show;
							   		if(url.length<1){
							   			show=name+"***"+pageurl;
							   		}else{
							   			show=name+"***"+url;
							   		}
						
							   	 	sons(id,i,show);
						     	}
						   }
					});
			});
			function sons(id,i,show){
				$.ajax({
					   type: "post",
					   dataType:"json",
					   url: "channel_getAllSonChannel.do",
					   data: {"channel.id":id},
					   success: function(rdata2){
						    var data2=rdata2;
							$("#body").append(i+"."+show+"<br/>");
						    if(data2!=null){
						    	for(var k=0;k<data2.length;k++){
							   		var name2=data2[k].name;
							   		var url2=data2[k].url;
							   		var pageurl2="http://www.10333.com/site/dtyjzpt/"+data2[k].pageurl;
							   		var show2;
							   		if(url2.length<1){
							   			show2=name2+"==="+pageurl2;
							   		}else{
							   			show2=name2+"==="+url2;
							   		}
				$("#body").append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+k+"."+show2+"<br/>");
						     	}
						    }
						    $("#body").append("<br/><br/>");
					   }
				});
			}
	</script>
	</head>
	<body id="body">
	</body>
</html>