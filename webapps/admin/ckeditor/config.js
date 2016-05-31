/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
    config.filebrowserBrowseUrl =  '/admin/ckfinder/ckfinder.html' ;   
    config.filebrowserImageBrowseUrl =  '/admin/ckfinder/ckfinder.html?type=Images' ;   
    config.filebrowserFlashBrowseUrl =  '/admin/ckfinder/ckfinder.html?type=Flash' ;   
    config.filebrowserUploadUrl =  '/admin/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files' ;   
    config.filebrowserImageUploadUrl =  '/admin/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images' ;   
    config.filebrowserFlashUploadUrl =  '/admin/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash' ;   
    config.filebrowserWindowWidth = '1000';   
    config.filebrowserWindowHeight = '700';
 
	config.removeDialogTabs = 'link:upload;image:Upload;flash:Upload;';
    config.language =  "zh-cn" ;  
    config.extraPlugins += (config.extraPlugins ? ',autoformat' : 'autoformat');
	config.pasteFromWordIgnoreFontFace = false; 
	config.pasteFromWordRemoveFontStyles = false;
	config.pasteFromWordRemoveStyles = false;
	config.removePlugins = 'elementspath';
	
	config.font_names ='宋体/宋体;黑体/黑体;仿宋/仿宋_GB2312;楷体/楷体_GB2312;隶书/隶书;幼圆/幼圆;微软雅黑/微软雅黑;'+
    'Arial/Arial, Helvetica, sans-serif;' +
    'Comic Sans MS/Comic Sans MS, cursive;' +
    'Courier New/Courier New, Courier, monospace;' +
    'Georgia/Georgia, serif;' +
    'Lucida Sans Unicode/Lucida Sans Unicode, Lucida Grande, sans-serif;' +
    'Tahoma/Tahoma, Geneva, sans-serif;' +
    'Times New Roman/Times New Roman, Times, serif;' +
    'Trebuchet MS/Trebuchet MS, Helvetica, sans-serif;' +
    'Verdana/Verdana, Geneva, sans-serif';
	
	//去除默认添加的p标签
	//config.shiftEnterMode=CKEDITOR.ENTER_P;
	//屏蔽br标签的,回车会产生br标签
	//config.enterMode = CKEDITOR.ENTER_BR;
	//默认进入源码模式
	//config.startupMode = 'source';
	//主题
    //config.theme = 'default';
	
	//插入<p></p>
	//config.enterMode = CKEDITOR.ENTER_P; 
	//插入<div></div>
	//config.enterMode = CKEDITOR.ENTER_DIV;
	//插入回车
	//config.enterMode = CKEDITOR.ENTER_BR; 
	//config.resize_enabled = true;
    //改变大小的最大高度
    //config.resize_maxHeight = '1000';
    //改变大小的最大宽度
    //config.resize_maxWidth = '650';
	
	//设置编辑区域的高度
	config.height = '400px';
	
	config.maxHeight='1000';
	config.maxWidth='650';
	

};
