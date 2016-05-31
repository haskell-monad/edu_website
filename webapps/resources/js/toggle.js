// JavaScript Document下拉弹框
$(document).ready(function(){
	$('.info .md').click(function(){
		$(this).parent().parent().next('.box_v').slideToggle();
		});
		$('.info .mz').click(function(){
		$(this).parent().parent().nextAll('.fenx').slideToggle();
		});
	});

$(document).ready(function(){
	  $("#produce").mouseenter(function(){
	  $(".option").show();
	  });
	 $("#produce").mouseleave(function(){
	  $(".option").hide();
	  });
	});