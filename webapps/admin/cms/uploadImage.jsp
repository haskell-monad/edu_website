<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="http://localhost:8080/dty_cms/">    
    <title>上传示范</title>
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
   		   		buttonText:'插入图片',
				inpufFile:"#uploadImage",
				uploader:'http://localhost:8080/dty_cms/servlet/Upload',
				formData:{param1:"editarea"},
				onUploadSuccess:function(file, ptl, response){
					var obj=eval("("+ptl+")");
					var url=obj.url;
					alert(url);
		        }
   	   		 });
   	   	});
   	</script>
  </head>  
  <body>
  	<h3>上传文件示范</h3>
  	<div class="uploadform">
  		<input id="uploadImage" type="file" name="uploadImage" />
  	</div>
  </body>
</html>
