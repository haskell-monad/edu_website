<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String objtype=request.getParameter("objtype");
	String objid=request.getParameter("objid");
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" src="<%=basePath%>base/js/jquery-1.7.2.js" ></script>

<script type="text/javascript">
		$(function(){
				var objtype="<%=objtype%>";
				var objid="<%=objid%>";
				$.ajax({
					   type: "POST",
					   dataType:"text",
					   url: "<%=basePath%>comment_getCommentPageListByInfo.do",
					   data: {"comment.objtype":objtype,"comment.objid":objid,"comment.currPage":1,"comment.pageSize":10},
					   success: function(rdata){
						   	var data=eval(rdata);
						   	var insertContent="";
						   	var currPage = 1;
						   	var pageSize = 10;
						   	var totalPage = 1;
						   	var commentnum = 0;
						   	var commentList="[{}]";
						 	for(var i=0;i<data.length;i++){
						 		//var clicknum=data[i].clicknum;
								commentnum=data[i].commentnum;
								currPage=data[i].currPage;
								pageSize=data[i].pageSize;
								totalPage=data[i].totalPage;
								commentList=data[i].commentList;
						 	}

							var commentListData=eval(commentList);
						   	for(var j=0;j<commentListData.length;j++){
						   		var membername=commentListData[j].membername;
						   		if(membername=='' || membername==null){
						   			membername="大太阳匿名会员";
						   		}
						   		var content=commentListData[j].content;
						   		var addtime=commentListData[j].addtimeStr;
						   		
						   		insertContent+="<div class=\"tab-box\">";
						   		insertContent+="<div class=\"cont-head-gw\">";
						   		insertContent+="<div class=\"head-img-gw\">";
						   		insertContent+="<a href=\"javascript:void(0);\">";
						   		insertContent+="<img width=\"56\" height=\"56\" alt=\"\" src=\""+"<%=basePath%>base/comment/img/tab-box.jpg"+"\">";
						   		insertContent+="</a>";
						   		insertContent+="</div>";
						   		insertContent+="</div>";
						   		insertContent+="<div class=\"cont-msg-gw\">";
						   		insertContent+="<div class=\"msg-wrap-gw\">";
						   		insertContent+="<div class=\"wrap-user-gw\">";
			   					insertContent+="<span class=\"user-time-gw\">"+addtime+"</span>";
			   					insertContent+="<span class=\"user-name-gw\">"+membername+"</span>";
			   					insertContent+="</div>";
		   						insertContent+="<div class=\"wrap-issue-gw\">";
		   						insertContent+="<p class=\"issue-wrap-gw\">";
		   						insertContent+="<span class=\"wrap-word-bg\">"+content+"</span>";
		   						insertContent+="</p>";
		   						insertContent+="</div>";
		   						insertContent+="</div>";
		   						insertContent+="</div>";
		   						insertContent+="</div>";
						
						   		$("#yml").append(insertContent);
						   		insertContent="";
					     	}

						   	if(parseInt(commentnum)>parseInt(0)){
		   						insertContent+="<div class=\"black\">";
		   						if(parseInt(currPage) > parseInt(0) && parseInt(currPage) != parseInt(1)){
		   							insertContent+="<a id=\"prevPage\" class=\"disabled\" target=\"_self\" onclick=\"getCommentPageList('"+objtype+"','"+objid+"','"+(parseInt(currPage)-parseInt(1))+"','"+pageSize+"');\">上一页 </a>";
						 		}
			   					if((parseInt(currPage) - parseInt(2)) > parseInt(1)){
			   						insertContent+="<a id=\"prevPage\" target=\"_self\" onclick=\"getCommentPageList('"+objtype+"','"+objid+"','"+parseInt(1)+"','"+pageSize+"');\">1</a>";
			   						insertContent+="...";
								}
			   					insertContent+="<i id=\"pNo\">";
			   					for(var k=1;k<=2;k++){
			   						if((parseInt(currPage) - parseInt(3) + parseInt(k)) >= 1){
			   							insertContent+="<a target=\"_self\" onclick=\"getCommentPageList('"+objtype+"','"+objid+"','"+(parseInt(currPage) - parseInt(3) + parseInt(k))+"','"+pageSize+"');\">"+(parseInt(currPage) - parseInt(3) + parseInt(k))+"</a>";
			   						}
			   					}
			   					insertContent+="<span class=\"current\"> <a target=\"_self\" onclick=\"getCommentPageList('"+objtype+"','"+objid+"','"+parseInt(currPage)+"','"+pageSize+"');\">"+parseInt(currPage)+"</a> </span>";
			   					for(var k=1;k<=2;k++){
			   						 if((parseInt(currPage) + parseInt(k)) <= parseInt(totalPage)){
			   							insertContent+="<a target=\"_self\" onclick=\"getCommentPageList('"+objtype+"','"+objid+"','"+(parseInt(currPage) + parseInt(k))+"','"+pageSize+"');\">"+(parseInt(currPage) + parseInt(k))+"</a>";
			   						 }
			   					}
			   					insertContent+="</i>";
			   					if((parseInt(currPage) + parseInt(2)) < parseInt(totalPage)){
			   						insertContent+="...";
			   						insertContent+="<a id=\"nextPage\" target=\"_self\" onclick=\"getCommentPageList('"+objtype+"','"+objid+"','"+parseInt(totalPage)+"','"+pageSize+"');\">"+parseInt(totalPage)+"</a>";
			   					}
			   					if(parseInt(currPage) != parseInt(totalPage)){
			   						insertContent+="<a id=\"nextPage\" target=\"_self\" onclick=\"getCommentPageList('"+objtype+"','"+objid+"','"+(parseInt(currPage) + parseInt(1))+"','"+pageSize+"');\">下一页 </a>";
			   					}
		   						insertContent+="</div>";
						   	}
					   		$("#yml").append(insertContent);
					   		insertContent="";
					   }
				});
		});
		
		function getCommentPageList(objtype, objid, currPage, pageSize){
			$.ajax({
				   type: "POST",
				   dataType:"text",
				   url: "<%=basePath%>comment_getCommentPageListByInfo.do",
				   data: {"comment.objtype":objtype,"comment.objid":objid,"comment.currPage":currPage,"comment.pageSize":pageSize},
				   success: function(rdata){
					   	var data=eval(rdata);
					   	var insertContent="";
					 	for(var i=0;i<data.length;i++){
					 		//var clicknum=data[i].clicknum;
							var commentnum=data[i].commentnum;
							var currPage=data[i].currPage;
							//var pageSize=data[i].pageSize;
							var totalPage=data[i].totalPage;
							var commentList=data[i].commentList;
							var commentListData=eval(commentList);
						   	for(var j=0;j<commentListData.length;j++){
						   		var membername=commentListData[j].membername;
						   		if(membername=='' || membername==null){
						   			membername="大太阳匿名会员";
						   		}
						   		var content=commentListData[j].content;
						   		var addtime=commentListData[j].addtimeStr;
						   		
						   		insertContent+="<div class=\"tab-box\">";
						   		insertContent+="<div class=\"cont-head-gw\">";
						   		insertContent+="<div class=\"head-img-gw\">";
						   		insertContent+="<a href=\"javascript:void(0);\">";
						   		insertContent+="<img width=\"56\" height=\"56\" alt=\"\" src=\""+"<%=basePath%>base/comment/img/tab-box.jpg"+"\">";
						   		insertContent+="</a>";
						   		insertContent+="</div>";
						   		insertContent+="</div>";
						   		insertContent+="<div class=\"cont-msg-gw\">";
						   		insertContent+="<div class=\"msg-wrap-gw\">";
						   		insertContent+="<div class=\"wrap-user-gw\">";
			   					insertContent+="<span class=\"user-time-gw\">"+addtime+"</span>";
			   					insertContent+="<span class=\"user-name-gw\">"+membername+"</span>";
			   					insertContent+="</div>";
		   						insertContent+="<div class=\"wrap-issue-gw\">";
		   						insertContent+="<p class=\"issue-wrap-gw\">";
		   						insertContent+="<span class=\"wrap-word-bg\">"+content+"</span>";
		   						insertContent+="</p>";
		   						insertContent+="</div>";
		   						insertContent+="</div>";
		   						insertContent+="</div>";
		   						insertContent+="</div>";
					     	}
					   		
						   	if(parseInt(commentnum)>parseInt(0)){
		   						insertContent+="<div class=\"black\">";
		   						if(parseInt(currPage) > parseInt(0) && parseInt(currPage) != parseInt(1)){
		   							insertContent+="<a id=\"prevPage\" class=\"disabled\" target=\"_self\" onclick=\"getCommentPageList('"+objtype+"','"+objid+"','"+(parseInt(currPage)-parseInt(1))+"','"+pageSize+"');\">上一页 </a>";
						 		}
			   					if((parseInt(currPage) - parseInt(2)) > parseInt(1)&&(parseInt(commentnum)>parseInt(0))){
			   						insertContent+="<a id=\"prevPage\" target=\"_self\" onclick=\"getCommentPageList('"+objtype+"','"+objid+"','"+parseInt(1)+"','"+pageSize+"');\">1</a>";
			   						insertContent+="...";
								}
			   					insertContent+="<i id=\"pNo\">";
			   					for(var k=1;k<=2;k++){
			   						if((parseInt(currPage) - parseInt(3) + parseInt(k)) >= 1){
			   							insertContent+="<a target=\"_self\" onclick=\"getCommentPageList('"+objtype+"','"+objid+"','"+(parseInt(currPage) - parseInt(3) + parseInt(k))+"','"+pageSize+"');\">"+(parseInt(currPage) - parseInt(3) + parseInt(k))+"</a>";
			   						}
			   					}
			   					insertContent+="<span class=\"current\"> <a target=\"_self\" onclick=\"getCommentPageList('"+objtype+"','"+objid+"','"+parseInt(currPage)+"','"+pageSize+"');\">"+parseInt(currPage)+"</a> </span>";
			   					for(var k=1;k<=2;k++){
			   						 if((parseInt(currPage) + parseInt(k)) <= parseInt(totalPage)){
			   							insertContent+="<a target=\"_self\" onclick=\"getCommentPageList('"+objtype+"','"+objid+"','"+(parseInt(currPage) + parseInt(k))+"','"+pageSize+"');\">"+(parseInt(currPage) + parseInt(k))+"</a>";
			   						 }
			   					}
			   					insertContent+="</i>";
			   					if((parseInt(currPage) + parseInt(2)) < parseInt(totalPage)){
			   						insertContent+="...";
			   						insertContent+="<a id=\"nextPage\" target=\"_self\" onclick=\"getCommentPageList('"+objtype+"','"+objid+"','"+parseInt(totalPage)+"','"+pageSize+"');\">"+parseInt(totalPage)+"</a>";
			   					}
			   					if(parseInt(currPage) != parseInt(totalPage)){
			   						insertContent+="<a id=\"nextPage\" target=\"_self\" onclick=\"getCommentPageList('"+objtype+"','"+objid+"','"+(parseInt(currPage) + parseInt(1))+"','"+pageSize+"');\">下一页 </a>";
			   					}
		   						insertContent+="</div>";
						   	}
					   		$("#yml").html(insertContent);
					 	}
				   }
			});
	}
</script>