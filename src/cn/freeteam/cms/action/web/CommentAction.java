package cn.freeteam.cms.action.web;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;

import cn.freeteam.base.BaseAction;
import cn.freeteam.cms.model.Comment;
import cn.freeteam.cms.model.Info;
import cn.freeteam.cms.service.CommentService;
import cn.freeteam.cms.service.CreditruleService;
import cn.freeteam.cms.service.InfoService;
import cn.freeteam.cms.service.MembergroupAuthService;
import cn.freeteam.cms.service.SensitiveService;
import cn.freeteam.cms.util.DateTimeUtil;
import cn.freeteam.util.HtmlCode;
import dty.expand.util.Json;

/**
 * 
 * <p>Title: CommentAction.java</p>
 * 
 * <p>Description: 评论相关操作</p>
 * 
 * <p>Date: Feb 20, 2013</p>
 * 
 * <p>Time: 7:36:22 PM</p>
 * 
 * <p>Copyright: 2013</p>
 * 
 * <p>Company: freeteam</p>
 * 
 * @author freeteam
 * @version 1.0
 * 
 * <p>============================================</p>
 * <p>Modification History
 * <p>Mender: </p>
 * <p>Date: </p>
 * <p>Reason: </p>
 * <p>============================================</p>
 */
public class CommentAction extends BaseAction{

	private CommentService commentService;
	private Comment comment;
	private List<Comment> commentList;
	private Map<String, String> objtypes;
	private SensitiveService sensitiveService;

	private String ValidateCode;
	private InfoService infoService;
	private MembergroupAuthService membergroupAuthService;
	private CreditruleService creditruleService;

	public CommentAction() {
		init("commentService");
	}
	/**
	 * 提交评论
	 * @return
	 */
	public String add(){
		if (ValidateCode!=null && ValidateCode.equals(getHttpSession().getAttribute("rand"))) {
			if (comment!=null && comment.getContent()!=null && comment.getContent().trim().length()>0) {
				//敏感词处理
				init("sensitiveService");
				comment.setContent(sensitiveService.replace(comment.getContent()));
				//判断评论对象是否存在
				boolean isSubmit=false;
				//判断系统是否允许评论
				if ("是".equals(getConfigVal("iscomment").trim())) {
					if ("info".equals(comment.getObjtype())) {
						//信息
						init("infoService");
						Info info=infoService.findById(comment.getObjid());
						if (info!=null) {
							comment.setSiteid(info.getSite());
							comment.setInfotitle(info.getTitle()); //update by limengyu at 20131023
							if (Info.ISCOMMENT_NO.equals(info.getIscomment())) {
								showMessage="此信息不支持评论";
							}else if (Info.ISCOMMENT_MEMBER.equals(info.getIscomment())) {
								if (getLoginMember()!=null) {
									//判断会员是否有发表评论权限
									init("membergroupAuthService");
									if (getLoginMembergroup()!=null && 
											membergroupAuthService.hasAuth(getLoginMembergroup().getId(), "commentPub")) {
										isSubmit=true;
									}else {
										showMessage="您没有发表评论的权限";
									}
								}else {
									showMessage="会员登录后才能对此信息评论";
								}
							}else if (Info.ISCOMMENT_ALL.equals(info.getIscomment())) {
								if (getLoginMember()==null) {
									//如果没有会员登录默认设置为匿名
									comment.setIsanonymous("1");
								}
								isSubmit=true;
							}
						}else {
							showMessage="此信息不存在";
						}
					}
				}else {
					showMessage="系统不允许评论";
				}
				//提交评论
				if (isSubmit) {
					comment.setContent(HtmlCode.replaceHtml(comment.getContent()));
					if (getLoginMember()!=null) {
						comment.setMemberid(getLoginMember().getId());
						comment.setMembername(getLoginMember().getLoginname());
					}
					comment.setAddtime(new Date());
					comment.setIp(getHttpRequest().getRemoteAddr());
					if (getLoginMembergroup()!=null && getLoginMembergroup().getCommentneedcheck()==1) {
						comment.setState("1");
					}else {
						comment.setState("0");
					}
					try {
						commentService.add(comment);
						//处理积分
						init("creditruleService");
						creditruleService.credit(getLoginMember(), "comment_pub");
						showMessage="恭喜您,提交评论成功!";
					} catch (Exception e) {
						DBProException(e);
						showMessage="提交评论失败:"+e.toString();
					}
				}
			}else {
				showMessage="请输入评论内容";
			}
		}else {
			showMessage="验证码错误";
		}
		return showMessage(showMessage, getHttpRequest().getHeader("Referer"), 3);
	}
	
	/**
	 *	会员管理--提交评论
	 */
	public String add2(){
			if (comment!=null && comment.getContent()!=null && comment.getContent().trim().length()>0) {
				//敏感词处理
				init("sensitiveService");
				comment.setObjtype(Jsoup.clean(comment.getObjtype(), Whitelist.relaxed()));
				comment.setObjid(Jsoup.clean(comment.getObjid(),Whitelist.relaxed()));
				comment.setContent(sensitiveService.replace(comment.getContent()));
				//判断评论对象是否存在
				boolean isSubmit=false;
				//判断系统是否允许评论
				if ("是".equals(getConfigVal("iscomment").trim())) {
					if ("info".equals(comment.getObjtype())) {
						//信息
						init("infoService");
						Info info=infoService.findById(comment.getObjid());
						if (info!=null) {
							comment.setSiteid(info.getSite());
							comment.setInfotitle(info.getTitle());//update by limengyu at 20131023
							if (Info.ISCOMMENT_NO.equals(info.getIscomment())) {
								showMessage="此信息不支持评论";
							}else if (Info.ISCOMMENT_MEMBER.equals(info.getIscomment())) {
								if (getLoginMember()!=null) {
									//判断会员是否有发表评论权限
									init("membergroupAuthService");
									if (getLoginMembergroup()!=null && 
											membergroupAuthService.hasAuth(getLoginMembergroup().getId(), "commentPub")) {
										isSubmit=true;
									}else {
										showMessage="您没有发表评论的权限";
									}
								}else {
									showMessage="会员登录后才能对此信息评论";
								}
							}else if (Info.ISCOMMENT_ALL.equals(info.getIscomment())) {
								if (getLoginMember()==null) {
									//如果没有会员登录默认设置为匿名
									comment.setIsanonymous("1");
								}
								isSubmit=true;
							}
						}else {
							showMessage="此信息不存在";
						}
					}
				}else {
					showMessage="系统不允许评论";
				}
				//提交评论
				if (isSubmit) {
					comment.setObjtype(Jsoup.clean(comment.getObjtype(), Whitelist.relaxed()));
					comment.setObjid(Jsoup.clean(comment.getObjid(),Whitelist.relaxed()));
					comment.setContent(HtmlCode.replaceHtml(comment.getContent()));
					if (getLoginMember()!=null) {
						comment.setMemberid(getLoginMember().getId());
						comment.setMembername(getLoginMember().getLoginname());
					}
					comment.setAddtime(new Date());
					comment.setIp(getHttpRequest().getRemoteAddr());
					if (getLoginMembergroup()!=null && getLoginMembergroup().getCommentneedcheck()==1) {
						comment.setState("1");
					}else {
						comment.setState("0");
					}
					try {
						commentService.add(comment);
						//处理积分
						init("creditruleService");
						creditruleService.credit(getLoginMember(), "comment_pub");
						showMessage="恭喜您,提交评论成功!";
					} catch (Exception e) {
						DBProException(e);
						showMessage="提交评论失败:"+e.toString();
					}
				}
			}else {
				showMessage="请输入评论内容";
			}
		return showCommentMessage(showMessage, getHttpRequest().getHeader("Referer"), 3);
	}
	
	/**
	 * 文章页ajax显示最新评论
	 * @return
	 */
	public String getCommentListByInfo(){
		if (comment!=null){
			//信息
			init("infoService");
			Info info=infoService.findById(comment.getObjid());
			if (info!=null) {
				commentList=commentService.find(comment,"addtime desc",1,10,false);
				
				//commentList=commentService.find(comment, "addtime desc");
				Json json=new Json();
				String data=json.toJson(commentList);
				write(data, "UTF-8");
			}
		}
		return null;
	}
	
	/**
	 * 文章页ajax显示最新评论
	 * @return
	 */
	public String getCommentPageListByInfo(){
		if (comment!=null){
			//信息
			init("infoService");
			Info info=infoService.findById(comment.getObjid());
			int currPage = 1;
			int num = 10;
			if(comment.getPageSize()>0){
				num = comment.getPageSize();
			}
			if(comment.getCurrPage()>1){
				currPage = comment.getCurrPage();
			}
			if (info!=null) {
				int clicknum=0;
				int commentnum=0;
				clicknum=info.getClicknum();
				commentList=commentService.find(comment,"addtime desc");
				commentnum=commentList.size();
				commentList=commentService.find(comment,"addtime desc",currPage,num,false);
				int totalPage = (commentnum / num + (commentnum % num != 0 ? 1 : 0));
	            if(totalPage <= 0){
	            	totalPage = 1;
	            }
				Json json=new Json();
				for(int i=0; i<commentList.size(); i++){
					String memberName  = StringUtils.isNotBlank(commentList.get(i).getMembername())?commentList.get(i).getMembername().replace("\"", "\\\""):commentList.get(i).getMembername();
					commentList.get(i).setMembername(memberName);
					String content = StringUtils.isNotBlank(commentList.get(i).getContent())?commentList.get(i).getContent().replace("\"", "\\\""):commentList.get(i).getContent();
					commentList.get(i).setContent(content);
					String infotitle = StringUtils.isNotBlank(commentList.get(i).getInfotitle())?commentList.get(i).getInfotitle().replace("\"", "\\\""):commentList.get(i).getInfotitle();
					commentList.get(i).setInfotitle(infotitle);
				}
				String jsons="[{\"clicknum\":'"+clicknum+"',\"commentnum\":'"+commentnum+"',\"currPage\":'"+currPage+"',\"pageSize\":'"+num+"',\"totalPage\":'"+totalPage+"',\"commentList\":'"+json.toJson(commentList)+"'}]";
				write(jsons, "UTF-8");
			}
		}
		return null;
	}
	
	/**
	 * 通过infoId获取该文章总的点击量和评论数
	 * @return
	 */
	public String getCommentNumByInfoId(){
		if (comment!=null){
			//信息
			init("infoService");
			Info info=infoService.findById(comment.getObjid());
			if (info!=null) {
				int clicknum=0;
				int commentnum=0;
				clicknum=info.getClicknum();
				commentList=commentService.find(comment,"addtime desc");
				commentnum=commentList.size();
				String jsons="[{\"clicknum\":'"+clicknum+"',\"commentnum\":'"+commentnum+"'}]";
				write(jsons, "UTF-8");
			}
		}
		return null;
	}
	
	public CommentService getCommentService() {
		return commentService;
	}
	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	public Map<String, String> getObjtypes() {
		return objtypes;
	}
	public void setObjtypes(Map<String, String> objtypes) {
		this.objtypes = objtypes;
	}
	public InfoService getInfoService() {
		return infoService;
	}
	public void setInfoService(InfoService infoService) {
		this.infoService = infoService;
	}
	public String getValidateCode() {
		return ValidateCode;
	}
	public void setValidateCode(String validateCode) {
		ValidateCode = validateCode;
	}
	public MembergroupAuthService getMembergroupAuthService() {
		return membergroupAuthService;
	}
	public void setMembergroupAuthService(
			MembergroupAuthService membergroupAuthService) {
		this.membergroupAuthService = membergroupAuthService;
	}
	public CreditruleService getCreditruleService() {
		return creditruleService;
	}
	public void setCreditruleService(CreditruleService creditruleService) {
		this.creditruleService = creditruleService;
	}
	public SensitiveService getSensitiveService() {
		return sensitiveService;
	}
	public void setSensitiveService(SensitiveService sensitiveService) {
		this.sensitiveService = sensitiveService;
	}
}
