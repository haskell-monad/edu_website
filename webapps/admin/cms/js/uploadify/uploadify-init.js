/**
 * uploadify上传插件相关JS
 */
$.extend( {
	/**
	 * uploadify上传插件初始化设置
	 * params:
	 * 
	 */
	initUploadify : function(params) {
		var opts = {
				//'buttonImage' : '',				// 选择文件按钮图片
				'buttonClass' : 'but but_blue',		// 选择文件按钮样式
				'debug': false,						// 是否开启调试模式
				'auto': true,						// 是否自动上传
				'multi': true,						// 是否允许多个上传
				'removeCompleted': true,			// 上传完毕上传列表是否消失
				'removeTimeout': 0,					// 上传完毕到列表消失的间隔时间
				'fileObjName': 'uploadFile',		// 上传文件数据的名字（服务器端获取文件时使用的名字）
				'queueID': false,				// 装载进度条的标签ID
				'progressData': 'percentage',		// 进度条效果percentage或speed 
				'buttonText': '图片',				// 上传按钮文本内容
				'formData' : {},			// 表单数据（json格式）
				'method': 'get',					// 提交方法(post或get）
				'fileSizeLimit': '30MB',				// 上传文件大小设置 单位可以是B、KB、MB、GB
				'fileTypeDesc' : '*.gif; *.jpg; *.bmp; *.jpeg; *.png',		// 选择文件框类型处提示文本
				'fileTypeExts' : '*.gif; *.jpg; *.bmp; *.jpeg; *.png',		// 上传时支持的文件类型
				'swf': 'js/uploadify/uploadify.swf',// swf文件位置（必设参数，插件自带文件，不可替换）
				'width': 120,						// 上传按钮宽度
				'height': 30,						// 上传按钮高度
				'successTimeout': 999999,			// 上传超时时间，若达到时间服务器没有响应，则当作成功（很扯淡的设置，默认为30秒）
				'uploader': '',			// 服务器处理上传的Action 
				'queueSizeLimit': 30,				// 允许一次上传的文件数
				'uploadLimit': 999999,				// 允许的总上传文件次数（刷新页面后重置）
				//'overrideEvents' : [],			// 设置不执行的默认事件				
				// 选中文件时事件
				'onSelect': function (event, queueID, fileObj) {
					
				},				
				// 上传文件出错事件
				'onUploadError': function (file,errorCode,errorMsg,errorString,swfuploadifyQueue) {					
					alert(errorMsg);
				},				
				// 上传完成时事件
				'onUploadComplete': function (file) {
					
				},				
				// 上传时发生错误事件
				'onUploadError': function (file, errorCode, errorMsg) {
					var msg = "服务器故障。";
					switch(errorCode) {
						case -100:
							msg = "上传的文件数量已经超出系统限制的"+$('#file_upload').uploadify('settings','queueSizeLimit') + "个文件。";
		                    break;
		                case -110:
		                    msg = "文件 ["+file.name+"] 大小超出系统限制的" + $('#file_upload').uploadify('settings','fileSizeLimit') + "大小。";
		                    break;
		                case -120:
		                	msg = "文件 ["+file.name+"] 大小异常。";
		                    break;
		                case -130:
		                	msg = "文件 ["+file.name+"] 类型不正确。";
		                    break;
		                case -280:
		                	return;
					}
					alert(msg+":"+errorCode);
				},				
				// 检测Flash失败调用
		        'onFallback': function(){
					var fallBackMsg = '您未安装Flash控件，无法上传图片！请安装FLASH控件后再试。';
					alert(fallBackMsg);
		        },		        
		        // 成功上传到服务器，服务器返回相应信息（服务器回写的数据存放于data中）
		        'onUploadSuccess': function(file, data, response){
		        	
		        },
		        'onDialogOpen':function(){
		        	
		        },
		        'onUploadStart' : function(file) {
		        	
		        },
		        inputFile:"#file_upload"
			};
		if (typeof params !== "undefined")
			$.extend(opts,params);
		
		if (typeof opts.uploader === "undefined" || opts.uploader === ""){
			alert("必须指定上传的地址");
			return;
		}
		if (typeof opts.inputFile === "undefined" || opts.inputFile === ""){
			alert("没有指定上传表单元素");
			return;
		}
		$(opts.inputFile).uploadify(opts);
	}
});
