// JavaScript Document当前状态
$(document).ready(function(){
		   $('.nav ul li a').mouseover(function(){
			   $('.nav ul li a').removeClass('cur');
			   $(this).addClass('cur');		   
			   });
		   });