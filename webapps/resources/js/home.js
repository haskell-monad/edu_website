// JavaScript Document
define(function(require, exports, module){
	var $ = require('jquery.js');
	require('slideView.js');
	require('placeholder.js');
	//require('select.js');
	
	$(document).ready(function(){
		/***************************************
		搜索选择
		****************************************/	
		(function(){
			var $btn = $('#type').find('a');
			$btn.bind('click', function(){
				$btn.removeClass('cur');
				$(this).addClass('cur');
			})
		})();
		
		
		/***************************************
		焦点图
		****************************************/
		(function(){
			 var as = $("#cFocus > .btn > span")
				if (as.length>1) {
				$("#cFocus").slideView({
					vertical:false,
					timer:3000,
					 showtype: {
						smallImg: as
					},
					evt: "click"
				});
			 }
		})();
		
		
		/***************************************
		点击产品下拉
		****************************************/	
		(function(){
			var $btn = $('#produce');
			var $con = $btn.find('.option');
			$btn.bind('mouseover', function(){
				$con.removeClass('none');
			});
			$btn.bind('mouseout', function(){
				$con.addClass('none');
			});
			$con.bind('click', function(){
				$(this).addClass('none');
			});
		})();
		/***************************************
		登录
		****************************************/	
		(function(){
			var $btn = $('#btnLogin');
			var $con = $('#conLogin');
			
			$btn.bind('mouseover', function(){
				if(!$con.hasClass('none'))
				{ return;
				}
	
				$con.hasClass('none')?$con.removeClass('none'):$con.addClass('none');
			})
			$con.find('.close').bind('click', function(){
				$con.addClass('none');
			})
		})();
		
		/***************************************
		添加到收藏夹
		****************************************/	
		(function(){
			$("#favorites").bind('click', function () {　　　　//$里面是链接的id 
				var ctrl = (navigator.userAgent.toLowerCase()).indexOf('mac') != -1 ? 'Command/Cmd' : 'CTRL'; 
				if (document.all) { 
				window.external.addFavorite('http://www.10333.com', '大太阳') 
				} else if (window.sidebar) { 
				window.sidebar.addPanel('大太阳', 'http://www.10333.com', "") 
				} else {　　　　//添加收藏的快捷键 
				alert('添加失败\n您可以尝试通过快捷键' + ctrl + ' + D 加入到收藏夹~') 
				} 
			})
		})();
		/***************************************
		设为首页
		****************************************/	
		(function(){
			$("#addHomePage").bind('click', function () { 
				if (document.all) {//设置IE 
				document.body.style.behavior = 'url(#default#homepage)'; 
				document.body.setHomePage(document.URL); 
				} else {//网上可以找到设置火狐主页的代码，但是点击取消的话会有Bug，因此建议手动设置 
				alert("设置首页失败，请手动设置！"); 
				} 
			})
		})();
	
		(function(){
			var $btn = $('#cDTY');
			$btn.hover(function(){
				$(this).addClass('liHover');
			}, function(){
				$(this).removeClass('liHover');
			})
		})();
		
		/***************************************
		点击功能导航弹出层
		****************************************/	
		(function(){
			var $btn = $('#cGndh');
			var $aBtn = $btn.find('a');
			var $popCon = $('#cConPop');
			var $close = $popCon.find('.close');
			var h = $popCon.outerHeight();
	
			$popCon.css({height:0}).hide();//设置弹层默认高度为0,隐藏
			$aBtn.bind('click', function(){
				//如果弹层已经打开则关闭
				if($(this).hasClass('close'))
				{
					fnClose();
					return false;
				}
				//如果弹未经打开则打开弹层
				$(this).addClass('close');
				$popCon.show().stop(true, true).animate({height:h});
			})
			
			//点击关闭按钮
			$close.bind('click', fnClose);
			function fnClose(){
				$popCon.stop(true, true).animate({height:0},function(){
					$popCon.hide();
					$aBtn.removeClass('close');
				})
			}
		})();
	})
});
