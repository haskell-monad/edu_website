$(document).ready(function(){
                //搜索热词
	$.ajax({
		dataType:"json",
		type: "GET",
		url: "/info_getAjaxImage.do",
		data: {"info.id":'e4a643ae-a805-4b7a-9f21-4a18084ca72c'},
		success: function(rdata){
			var data=rdata;
			var title=data.title;
			if(title!='' && title!='undefined'){
				$("#rcss").val(title);
			}
		}
	});

});
