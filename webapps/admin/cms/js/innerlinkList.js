/**
 * 添加内链
 */
function add(){
	location.href="innerlink_edit.do?pageFuncId="+$("#pageFuncId").val();
}
/**
 * 编辑内链
 */
function edit(){
	if(isCheckOne()){
		location.href="innerlink_edit.do?pageFuncId="+$("#pageFuncId").val()+"&innerlink.id="+getCheckOneValue();
	}else{
		alert("请选择一条记录!");
	}
}
/**
 * 根据id删除内链事件
 */
function del(){
	if(isCheck()){
		if(confirm("确定删除操作么?此操作无法回退!")){
			$.post("innerlink_del.do","ids="+getCheckValue(),delComplete,"text");
		}
	}else{
		alert("请选择要操作的记录!");
	}
}
/**
 * 删除内链后执行
 * @param data
 */
function delComplete(data){
	if(data!=""){
		var datas=data.split(";");
		if(datas!=null && datas.length>0){
			for(var i=0;i<datas.length;i++){
				if(datas[i]!="" && document.getElementById("tr"+datas[i])!=null){
						document.getElementById("tr"+datas[i]).parentNode.removeChild(document.getElementById("tr"+datas[i]));
				}
			}
		}
	}
}
//提交验证
function save(){
	if($.trim($("#name").val())==""){
		alert("请输入名称");
		return false;
	}
	if($.trim($("#url").val())==""){
		alert("请输入内链");
		return false;
	}
	$("#MyForm").submit();
}

//生成内链url
function createUrl(){
	//获得关键词名称
	var name=$("#name").val();
	name=encodeURIComponent(name);
	var siteid="0b82baf0-4fc5-4784-ad9e-e8a046213ea8";
	var templetPath="search/qwjs_search.shtml";
	templetPath=encodeURIComponent(templetPath);
	var baseurl="http://www.10333.com/templet_pro.do?siteid="+siteid+"&templetPath="+templetPath+"&key="+name;
	$("#url").val("");
	$("#url").val(baseurl);
}

//下拉列表事件
function changeUrl(){
	var value=$("#c_select").val();
	if(value=="0"){
		
	}
}

