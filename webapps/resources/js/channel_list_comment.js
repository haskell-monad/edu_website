$(document).ready(function(){
	$('.info .md').click(function(){
		$(this).parent().parent().next('.box_v').slideToggle();
	});
	$('.info .mz').click(function(){
		$(this).parent().parent().nextAll('.fenx').slideToggle();
	});
	//列表页文章评论js
	$("textarea[id^='commentContent']").each(function(i){
		$(this).focus(function(){
			var value=$(this).val();
			if(value=="请输入评价内容！"){
				$(this).val("");
			}
		})
	});
	
    $("#produce").mouseenter(function(){
		  $(".option").show();
	});
	$("#produce").mouseleave(function(){
		  $(".option").hide();
	});
	$("textarea[id^='commentContent']").val("");
});
//提交评论时验证
function commentSubmit(index){
	var index=index;
	var value=$("#commentContent"+index).val();
	if(value=="" && value.length<1){
		$("#commentContent"+index).val("请输入评价内容！");
		return false;
	}
	if(value=='请输入评价内容！'){
		return false;
	}
	if(value.indexOf('请输入评价内容')>=0){
		return false;
	}
	return true;
}
