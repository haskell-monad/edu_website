<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<script type="text/javascript" src="base/js/jquery-1.7.2.js" ></script>
		<script type="text/javascript">
			$(function(){
					$.ajax({
						   type: "post",
						   dataType:"json",
						   url: "channel_getAllFirstChannel.do",
						   data: {},
						   success: function(rdata){
							   alert(rdata);
							   	var data=rdata;
							   	for(var i=0;i<data.length;i++){
							   		var id=data[i].id;
							   		var parId=data[i].parId;
							   		var name=data[i].name;
							   		var url=data[i].url;
							   		var show=name+"---"+url;
							   		$("#body").append(show);
							   		$.ajax({
										   type: "post",
										   dataType:"json",
										   url: "channel_getAllSonChannel.do",
										   data: {"channel.id":id},
										   success: function(rdata){
											   	if(rdata==0){
											   		
											   	}else{
											   		var data=rdata;
												   	for(var i=0;i<data.length;i++){
												   		var id2=data[i].id;
												   		var parId2=data[i].parId;
												   		var name2=data[i].name;
												   		var url2=data[i].url;
												   		var show2="   "+name+"---"+url;
												   		$("#body").append(show2);
											     	}
											   	}
										   }
									});
						     	}
						   }
					});
			});
	</script>
	</head>
	<body id="body">
	</body>
</html>