<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String bathPath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>插入图片</title>
	<link rel="stylesheet" href="js/uploadify/uploadify.css" type="text/css" />
	<script type="text/javascript" src="js/uploadify/jquery-1.5.1.js"></script>
	<script type="text/javascript" src="js/uploadify/jquery.uploadify.min.js"></script>
	<script type="text/javascript" src="js/uploadify/uploadify-init.js"></script>
   	<style type="text/css">
   		body{
   			font-size:12px;
   		}
   		.uploadform{
   			background-color: gray;
   			border:1px solid;
   		}
   		table{
   			width:80%;
   			border-width: 1px;  			
   		}
   	</style>
   	<script type="text/javascript">
   		$(function(){
   		   	$.initUploadify({
   		   		inputFile:"#comment_images_upload",
				swf: 'js/uploadify/uploadify.swf',
				multi:false,
				method: 'get',
				fileSizeLimit:'20MB',	
				uploader:'/servlet/Upload.java',
				formData:{param1 : "insertImage"},
				onUploadStart:function(file){
					var b_bj=document.getElementById("bigcheck");
					var s_bj=document.getElementById("smallcheck");
					if(b_bj.checked==true){
						$("#comment_images_upload").uploadify("settings","formData",{"images":"imgs","iswater":"1"});
					}else if(s_bj.checked==true){
						$("#comment_images_upload").uploadify("settings","formData",{"images":"imgs","iswater":"2"});
					}else{
						$("#comment_images_upload").uploadify("settings","formData",{"images":"imgs","iswater":"0"});
					}
				},
				onUploadSuccess:function(file, ptl, response){
					var obj=eval("("+ptl+")");
					var url=obj.url;
					if(url!=null && url!=''){
						window.returnValue=url;   
				        window.close();   
					}
		        }
   	   		 });
   	   	});
   		//图片集
		function checkWater(cb) {
			for (var j = 0; j < 2; j++) {
				if (eval("document.insertForm.box[" + j + "].checked") == true) {
					document.insertForm.box[j].checked = false;
					if (j == cb) {
						document.insertForm.box[j].checked = true;
					}
				}
			}
		}
   	</script>
  </head>
  <body>
	  	<h3>上传文件示范</h3><br/>
	  	<form id="insertForm" name="insertForm" >
	  		添加大水印:<input type="checkbox" id="bigcheck" name="box" onClick="javascript:checkWater(0)" /> 
			添加小水印:<input type="checkbox" id="smallcheck" name="box" onClick="javascript:checkWater(1)" />
	  	</form>
	  	<div class="uploadform">
	  		<input id="comment_images_upload" type="file" name="comment_images_upload" />
	  	</div>
	  	<h5>文件列表</h5>
	  	<div>
	  		<table id="upfiles" border="1">
	  			<tbody>
	  				<tr>
		  				<th>文件名</th>
		  				<th>文件大小</th>
		  				<th>上传时间</th>
		  				<th>操作</th>
	  				</tr>
	  			</tbody>
	  		</table>
	  	</div>
  </body>
</html>
