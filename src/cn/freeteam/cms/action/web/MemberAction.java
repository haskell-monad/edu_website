package cn.freeteam.cms.action.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import cn.freeteam.base.BaseAction;
import cn.freeteam.cms.model.Member;
import cn.freeteam.cms.model.Membergroup;
import cn.freeteam.cms.service.MemberService;
import cn.freeteam.cms.service.MembergroupService;
import cn.freeteam.util.DateUtil;
import cn.freeteam.util.EscapeUnescape;
import cn.freeteam.util.MD5;
import cn.freeteam.util.Mail;
import cn.freeteam.util.OperLogUtil;

/**
 * 
 * <p>Title: MemberAction.java</p>
 * 
 * <p>Description:会员相关操作 </p>
 * 
 * <p>Date: Feb 1, 2013</p>
 * 
 * <p>Time: 8:00:46 PM</p>
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
public class MemberAction extends BaseAction{

	private MemberService memberService;
	private MembergroupService membergroupService;
	private Member member;
	private Membergroup membergroup;
	private String ValidateCode;
	private String RememberMe;
	private String msg;
	public MemberAction() {
		init("memberService");
	}
	/**
	 * 注册处理
	 * @return
	 */
	public String register(){
		try {
			init("membergroupService");

		    HttpSession session =getHttpSession();
			if (ValidateCode!=null && !ValidateCode.equals(session.getAttribute("rand"))) {
				write("<script>alert('验证码错误!');history.back();</script>", "UTF-8");
				return null;
			}
			//判断是否是禁用会员名
			String memberLimitName = getConfigVal("memberLimitName");
			if (memberLimitName.indexOf(member.getLoginname()+",") >-1 
					|| memberLimitName.indexOf(","+member.getLoginname()) >-1 ) {
				write("<script>alert('禁止使用此会员名!');history.back();</script>", "UTF-8");
				return null;
			}
			//判断用户是否存在
			if (memberService.have(member)) {
				write("<script>alert('此会员名已存在!');history.back();</script>", "UTF-8");
				return null;
			}
			member.setPwd(MD5.MD5(member.getPwd()));
			member.setAddtime(new Date());
			member.setIsok("1");
			member.setGrouptype(0);
			member.setExperience(0);
			member.setCredit(0);
			//默认注册会员是经验会员并处理所属会员组
			if (member.getExperience()!=null) {
				membergroup=membergroupService.findByExperience(0);
				if (membergroup!=null) {
					member.setGroupid(membergroup.getId());
				}else {
					member.setGroupid("");
				}
			}else {
				member.setGroupid("");
			}
			memberService.add(member);
			getHttpSession().setAttribute("loginMember", member);
		} catch (Exception e) {
			DBProException(e);
			write(e.toString(), "GBK");
		}
		return showMessage("恭喜您，注册成功了!<br>正在跳转到会员中心!", "member/member_index.do", 3);
	}
	/**
	 * update by limengyu @2010.10.31
	 * 新的注册页面-注册处理
	 * @return
	 */
	public String newregister(){
		try {
			init("membergroupService");
			//判断是否是禁用会员名
			String memberLimitName = getConfigVal("memberLimitName");
			if (memberLimitName.indexOf(member.getLoginname()+",") >-1 
					|| memberLimitName.indexOf(","+member.getLoginname()) >-1 ) {
				write("<script>alert('禁止使用此会员名!');history.back();</script>", "UTF-8");
				return null;
			}
			//判断用户是否存在
			if (memberService.have(member)) {
				write("<script>alert('此会员名已存在!');history.back();</script>", "UTF-8");
				return null;
			}
			//获得当前时间毫秒数
			String temp=Long.toString(System.currentTimeMillis());
			//发送给邮箱激活的url信息start
			HttpServletRequest requests=getHttpRequest();
			String pageurl="";
			pageurl=requests.getParameter("pageurl");
			if(StringUtils.isBlank(pageurl)){
				pageurl=getBasePath()+"member/registerSuccess.jsp?email="+member.getEmail()+"&url=http://www.10333.com&temp="+temp;
			}else{
				pageurl=getBasePath()+"member/"+pageurl+"&temp="+temp;
			}
			
			//发送给邮箱激活的url信息end
			member.setPwd(MD5.MD5(member.getPwd()));
			member.setAddtime(new Date());
			member.setIsok("0");
			member.setGrouptype(0);
			member.setExperience(10);
			member.setCredit(10);
			member.setTemp(temp);
			//默认注册会员是经验会员并处理所属会员组
			if (member.getExperience()!=null) {
				membergroup=membergroupService.findByExperience(0);
				if (membergroup!=null) {
					member.setGroupid(membergroup.getId());
				}else {
					member.setGroupid("");
				}
			}else {
				member.setGroupid("");
			}
			Member members=memberService.add_member(member);
			pageurl=pageurl+"&memberid="+member.getMemberid()+"&uname="+java.net.URLEncoder.encode(member.getLoginname(),"UTF-8");
			//发送邮件
			Mail mail=new Mail(getConfig());
			mail.sendMessage(member.getEmail(), "大太阳会员激活", 
					"请点击以下链接完成激活<br><a href='"+pageurl+"'>"+pageurl+"</a>");
		 //  getHttpSession().setAttribute("loginMember", member);
			String json="";
			json="[{\"status\":\"ok\",\"memberid\":\""+members.getMemberid()+"\",\"username\":\""+members.getName()+"\",\"email\":\""+members.getEmail()+"\"}]";
			write(json,"UTF-8");
		} catch (Exception e) {
			DBProException(e);
			write(e.toString(), "GBK");
		}
		//return showMessage("恭喜您，注册成功了!<br>正在跳转到会员中心!", "member/member_index.do", 3);
		return null;
	}
	/**
	 * 会员注册邮箱激活重新发送
	 * @return
	 */
	public String sendEmailRegister(){
		HttpServletRequest requests=getHttpRequest();
		String pageurl="";
		pageurl=requests.getParameter("pageurl");
		if(StringUtils.isBlank(pageurl)){
			pageurl="";
		}
		//判断邮箱是否存在
		member=memberService.findByEmail(member);
		if (member!=null && member.getTemp().length()>0 && pageurl.length()>0 ) {
			//获得当前时间毫秒数
			String temp=Long.toString(System.currentTimeMillis());
			member.setTemp(temp);
			memberService.update(member);
			
			pageurl=getBasePath()+"member/"+pageurl+"&temp="+temp;
			//发送邮件
			Mail mail=new Mail(getConfig());
			boolean flag=mail.sendMessage(member.getEmail(), "大太阳会员激活", 
					"请点击以下链接完成激活<br><a href='"+pageurl+"'>"+pageurl+"</a>");
			write("ok","UTF-8");
			return null;
		}else{
			write("0","UTF-8");
			return null;
		}
	}

	/**
	 * 检查登录名是否重复
	 * @return
	 */
	public String checkLoginname(){
		//判断用户是否存在
		if (memberService.have(member)) {
			write("此会员名已存在!", "UTF-8");
			return null;
		}
		return null;
	}
	/**
	 * 判断邮箱是否存在
	 * @return
	 */
	public String checkEmail(){
		if(memberService.haveEmail(member)){
			write("1", "UTF-8");
			return null;
		}
		return null;
	}
	
	/**
	 * 会员登录
	 * @return
	 */
	public String login(){
		try {
			//记住用户名
			if("on".equals(RememberMe)){
				Cookie cookie1=new Cookie("FreeCMS_memberLoginName",EscapeUnescape.escape(member.getLoginname()));
				cookie1.setMaxAge(1000*60*60*24*30);//有效时间为一年
				Cookie cookie2=new Cookie("FreeCMS_memberLoginName",EscapeUnescape.escape(member.getLoginname()));
				cookie2.setMaxAge(1000*60*60*24*30);//有效时间为一年
				cookie1.setDomain(".jzpt.com");
				cookie2.setDomain(".10333.com");
				getHttpResponse().addCookie(cookie1);
				getHttpResponse().addCookie(cookie2);
			}
		    HttpSession session =getHttpSession();
			if (ValidateCode!=null && ValidateCode.equals(session.getAttribute("rand"))) {
				showMessage=memberService.checkLogin(getHttpSession(), member);
			}else {
				showMessage="验证码错误!";
			}
			if (showMessage==null || "".equals(showMessage)) {
				/*
				 * update by limengyu@20131029
				 */
				Cookie cookie1=new Cookie("loginMember",member.getLoginname());
				cookie1.setDomain(".jzpt.com");
				Cookie cookie2=new Cookie("loginMember",member.getLoginname());
				cookie2.setDomain(".10333.com");
				getHttpResponse().addCookie(cookie1);
				getHttpResponse().addCookie(cookie2);
				
				Cookie cookie_status1=new Cookie("loginMemberStatus","true");
				cookie_status1.setDomain(".jzpt.com");
				Cookie cookie_status2=new Cookie("loginMemberStatus","true");
				cookie_status2.setDomain(".10333.com");
				getHttpResponse().addCookie(cookie_status1);
				getHttpResponse().addCookie(cookie_status2);
				//会员评论登陆用
				Cookie cookie3=new Cookie("username",member.getLoginname());
				cookie3.setMaxAge(40*60); // 设置Cookie的存活时间为40分钟
				getHttpResponse().addCookie(cookie3);
				
				OperLogUtil.log(member.getLoginname(), "会员登录", getHttpRequest());
				getHttpResponse().sendRedirect("member/member_index.do");
				return null;
			}else {
				return showMessage(showMessage, forwardUrl, forwardSeconds);
			}
		} catch (Exception e) {
			DBProException(e);
			OperLogUtil.log(member.getLoginname(), "会员登录失败:"+e.toString(), getHttpRequest());
			return showMessage("出现错误:"+e.toString()+"", forwardUrl, forwardSeconds);
		}
	}
	public static <T> String getType(T t){ 
	    if(t instanceof String){ 
	        return "string"; 
	    }else if(t instanceof Integer){ 
	        return "int"; 
	//  }else if(t instanceof 其他类型){
//	      return 其他类型
	    }else
	    return "do not know"; 
	}
	/**
	 * 会员登录 ---用户评论用
	 */
	public String login2(){
		
		 HttpServletRequest request=getHttpRequest();
		 String loginMemberName="";
		 loginMemberName=request.getParameter("loginMemberName");
		if(loginMemberName!=null && !loginMemberName.equals("") && loginMemberName.trim().length()>0){
				 Member member_s = null;
				 member_s= memberService.findByMemberId(loginMemberName);
				 if(member_s!=null  && (member_s.getPwd().equals(MD5.MD5( member.getPwd())))){
					 member.setLoginname(member_s.getLoginname());
				 }
				 member_s=memberService.findByLoginname(loginMemberName);
				 if(member_s!=null && (member_s.getPwd().equals(MD5.MD5( member.getPwd())))){
					 member.setLoginname(member_s.getLoginname());
				 }
				 member_s=memberService.findByEmail(loginMemberName);
				 if(member_s!=null && (member_s.getPwd().equals(MD5.MD5( member.getPwd())))){
					 member.setLoginname(member_s.getLoginname());
			    }
				 
				 if(member.getLoginname()==null || member.getLoginname().trim().equals("") || member.getLoginname().trim().length()<1){
					 return null;
				 }
		}
		System.out.println(member.getLoginname()+":"+member.getPwd());
		 HttpServletResponse response=getHttpResponse();
		 response.setCharacterEncoding("utf-8");  
	     PrintWriter pw=null;  
	     try {
	    	 pw = response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}  
		
		String temp="";
		temp=request.getParameter("temp");
		if(StringUtils.isBlank(temp)){
			temp="";	
		}
		String mark="";
		mark=request.getParameter("mark");
		if(StringUtils.isBlank(mark)){
			mark="";	
		}
		//激活会员并登陆start
		if(mark.equals("1")){
			Member member_tem=null;
			member_tem=member;
			//member=memberService.findByTemp(member);
			member=memberService.findByLoginname(member);
			if (member!=null) {
				if(member.getTemp().length()>0 && member.getTemp().equals(temp)){
				 	member.setIsok("1");
				 	member.setTemp("");
					memberService.update(member);
					System.out.println(member.getLoginname()+" 会员激活成功！");
					member_tem.setPwd(member.getPwd());
					member=member_tem;
				}else{
					 System.out.println(member.getLoginname()+" 会员激活失败！");
					 pw.write("0"); 
				     pw.flush();
				     pw.close();
				     return null;
				}
			}
		}
		//激活会员并登陆end
		//记住会员用户名和密码，自动登录用
		if("on".equals(RememberMe)){
			Cookie cookie1=new Cookie("FreeCMS_memberLoginName",EscapeUnescape.escape(member.getLoginname().trim()));
			cookie1.setMaxAge(1000*60*60*24*30);//有效时间为一个月
			cookie1.setDomain(".jzpt.com");
			getHttpResponse().addCookie(cookie1);
			Cookie cookie2=new Cookie("FreeCMS_memberLoginName",EscapeUnescape.escape(member.getLoginname().trim()));
			cookie2.setMaxAge(1000*60*60*24*30);//有效时间为一个月
			cookie2.setDomain(".10333.com");
			getHttpResponse().addCookie(cookie2);
			
			Cookie cookie3=new Cookie("FreeCMS_memberPassWord",EscapeUnescape.escape(member.getPwd()));
			cookie3.setMaxAge(1000*60*60*24*30);//有效时间为一个月
			cookie3.setDomain(".jzpt.com");
			getHttpResponse().addCookie(cookie3);
			Cookie cookie4=new Cookie("FreeCMS_memberPassWord",EscapeUnescape.escape(member.getPwd()));
			cookie4.setMaxAge(1000*60*60*24*30);//有效时间为一个月
			cookie4.setDomain(".10333.com");
			getHttpResponse().addCookie(cookie4);
			
			Cookie autologin=new Cookie("autologin",EscapeUnescape.escape("true"));
			autologin.setMaxAge(1000*60*60*24*30);//有效时间为一个月
			getHttpResponse().addCookie(autologin);
		}
		try {
			showMessage=memberService.checkLogin(getHttpSession(), member);
			System.out.println("检查评论登录信息结果showMessage:"+showMessage);
			if (showMessage==null || "".equals(showMessage)) {
				OperLogUtil.log(member.getLoginname(), "会员登录", getHttpRequest());
				 //getHttpResponse().sendRedirect("member/member_index.do");
				/*
				 * update by limengyu@20131029
				 */
				Cookie cookie1=new Cookie("loginMember",EscapeUnescape.escape(member.getLoginname().trim()));
				Cookie cookie2=new Cookie("loginMember",EscapeUnescape.escape(member.getLoginname().trim()));
				cookie1.setDomain(".jzpt.com");
				cookie2.setDomain(".10333.com");
				getHttpResponse().addCookie(cookie1);
				getHttpResponse().addCookie(cookie2);
				Cookie cookie_status1=new Cookie("loginMemberStatus","true");
				cookie_status1.setDomain(".jzpt.com");
				Cookie cookie_status2=new Cookie("loginMemberStatus","true");
				cookie_status2.setDomain(".10333.com");
				getHttpResponse().addCookie(cookie_status1);
				getHttpResponse().addCookie(cookie_status2);
				//会员评论登陆用
				
				Cookie cookie3=new Cookie("username",EscapeUnescape.escape(member.getLoginname().trim()));
				cookie3.setMaxAge(40*60); // 设置Cookie的存活时间为40分钟
				getHttpResponse().addCookie(cookie3);
				
			     pw.write("1");  
			     pw.flush();  
			     pw.close();  
				 return null;
			}else {
				 pw.write("0");  
			     pw.flush();
			     pw.close(); 
			     return null;
				// return showMessage(showMessage, forwardUrl, forwardSeconds);
			}
		} catch (Exception e) {
			DBProException(e);
			OperLogUtil.log(member.getLoginname(), "会员登录失败:"+e.toString(), getHttpRequest());
			return showMessage("出现错误:"+e.toString()+"", forwardUrl, forwardSeconds);
		}
	}
	/**
	 * wenku use
	 * @return
	 */
	public String memberoutWenKu(){
		HttpSession session =getHttpSession();
	    session.removeAttribute("loginMember");
	    session.removeAttribute("loginMembergroup");
	    
	    Cookie cookie_status1=new Cookie("loginMemberStatus","false");
		cookie_status1.setDomain(".jzpt.com");
		Cookie cookie_status2=new Cookie("loginMemberStatus","false");
		cookie_status2.setDomain(".10333.com");
		getHttpResponse().addCookie(cookie_status1);
		getHttpResponse().addCookie(cookie_status2);
		
		
	    Cookie[] cookies=getHttpRequest().getCookies();
	    for(Cookie cookie : cookies){
	        String name="";
	        name=cookie.getName();
	        if(name.equals("username")){
	        	cookie.setValue(null);
	        	cookie.setMaxAge(0);
	        	getHttpResponse().addCookie(cookie);
	        }
	        if(name.equals("loginMember")){
	        	cookie.setValue(null);
	        	cookie.setMaxAge(0);
	        	getHttpResponse().addCookie(cookie);
	        }
	        if(name.equals("FreeCMS_memberPassWord")){
	        	cookie.setValue(null);
	        	cookie.setMaxAge(0);
	        	getHttpResponse().addCookie(cookie);
	        }
	    }
		HttpServletRequest request=getHttpRequest();
		String url=request.getParameter("url");
		HttpServletResponse res=getHttpResponse();
		if(StringUtils.isBlank(url)){
			try {
				res.sendRedirect("http://www.10333.com");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			try {
				res.sendRedirect(url);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	//会员评论注销用--注销
	public String memberout(){
		    HttpSession session =getHttpSession();
		    session.removeAttribute("loginMember");
		    session.removeAttribute("loginMembergroup");
		    
		    Cookie cookie_status1=new Cookie("loginMemberStatus","false");
			cookie_status1.setDomain(".jzpt.com");
			Cookie cookie_status2=new Cookie("loginMemberStatus","false");
			cookie_status2.setDomain(".10333.com");
			getHttpResponse().addCookie(cookie_status1);
			getHttpResponse().addCookie(cookie_status2);
			
//			Cookie autologin=new Cookie("autologin",EscapeUnescape.escape("false"));
//			autologin.setMaxAge(1000*60*60*24*30);
//			getHttpResponse().addCookie(autologin);
			Cookie autologin = new Cookie("autologin", "false");
		    getHttpResponse().addCookie(autologin);
			
		    Cookie[] cookies=getHttpRequest().getCookies();
		    for(Cookie cookie : cookies){
		        String name="";
		        name=cookie.getName();
		        if(name.equals("username")){
		        	cookie.setValue(null);
		        	cookie.setMaxAge(0);
		        	getHttpResponse().addCookie(cookie);
		        }
		        if(name.equals("loginMember")){
		        	cookie.setValue(null);
		        	cookie.setMaxAge(0);
		        	getHttpResponse().addCookie(cookie);
		        }
		        if(name.equals("FreeCMS_memberPassWord")){
		        	cookie.setMaxAge(0);
		        	Cookie pwdcookie;
		        	pwdcookie = new Cookie("FreeCMS_memberPassWord", null);
		        	getHttpResponse().addCookie(pwdcookie);
		        }
		    }
		    msg="<script>parent.location.href=parent.location.href;</script>";
		    return "msg";
		}
	//退出
	public String out(){
	    HttpSession session =getHttpSession();
	    
	    Cookie cookie_status1=new Cookie("loginMemberStatus","false");
		cookie_status1.setDomain(".jzpt.com");
		Cookie cookie_status2=new Cookie("loginMemberStatus","false");
		cookie_status2.setDomain(".10333.com");
		getHttpResponse().addCookie(cookie_status1);
		getHttpResponse().addCookie(cookie_status2);
	    
	    session.removeAttribute("loginMember");
	    session.removeAttribute("loginMembergroup");
	    Cookie[] cookies=getHttpRequest().getCookies();
	    for(Cookie cookie : cookies){
	        String name="";
	        name=cookie.getName();
	        if(name.equals("FreeCMS_memberLoginName")){
	        	cookie.setValue(null);
	        	cookie.setMaxAge(0);
	        	getHttpResponse().addCookie(cookie);
	        }
	        if(name.equals("FreeCMS_memberPassWord")){
	        	cookie.setValue(null);
	        	cookie.setMaxAge(0);
	        	getHttpResponse().addCookie(cookie);
	        }
	        if(name.equals("username")){
	        	cookie.setValue(null);
	        	cookie.setMaxAge(0);
	        	getHttpResponse().addCookie(cookie);
	        }
	        if(name.equals("loginMember")){
	        	cookie.setValue(null);
	        	cookie.setMaxAge(0);
	        	getHttpResponse().addCookie(cookie);
	        }
	    }
	    msg="<script>parent.location.href=parent.location.href;</script>";
	    return "msg";
	}
	/**
	 *	获取到session中的验证码
	 */
	public String sessionValidateCode(){
		String code="";
		HttpSession session =getHttpSession();
		code=(String) session.getAttribute("rand");
		write(code,"UTF-8");
		return null;
	}
	/**
	 * 找回密码
	 * @return
	 */
	public String findPwd(){
		//判断用户是否存在
		member=memberService.findByLoginname(member);
		if (member!=null) {
			String newPwd=UUID.randomUUID().toString().substring(0, 8);
			member.setPwd(MD5.MD5(newPwd));
			memberService.update(member);
			//发送邮件
			Mail mail=new Mail(getConfig());
			mail.sendMessage(member.getEmail(), "大太阳建筑网:"+member.getLoginname()+"找回密码邮件", 
					"您的新密码为"+newPwd+",请使用新密码登录，原密码已不可用。<br><a href='"+getBasePath()+"/member/mlogin.jsp'>"+getBasePath()+"/mlogin.jsp</a>");
		    return showMessage("已发送新密码到您的邮箱，请查收，并使用新密码登录!", forwardUrl, forwardSeconds);
		}else {
		    return showMessage("此会员不存在!", forwardUrl, forwardSeconds);
		}
	}
	
	/**
	 * 通过邮箱找回密码
	 * update by limengyu at 2013.11.01
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String findPwdByEmail(){
		//判断邮箱是否存在
		member=memberService.findByEmail(member);
		if (member!=null) {
			//获得当前时间毫秒数
			String temp=Long.toString(System.currentTimeMillis());
			member.setTemp(temp);
			//获得随机密码
			String newPwd=UUID.randomUUID().toString().substring(0, 8);
			//member.setPwd(MD5.MD5(newPwd));
			memberService.update(member);
			//获得当前时间
			String starttime=DateUtil.format(new Date(), "yyyy-MM-dd HH:mm");
			//发送邮件
			Mail mail=new Mail(getConfig());
			boolean flag=mail.sendMessage(member.getEmail(),"大太阳建筑网:"+member.getEmail()+"找回密码邮件", 
					"您的新密码为"+newPwd+",请点击以下链接进行激活验证。<br><a href='"+getBasePath()+"/member/findPwdActivate.jsp?email="+member.getEmail()+"&temp="+temp+"&pwd="+newPwd+"&starttime="+starttime+"'>"+getBasePath()+"member/findPwdByEmailActivate.jsp</a>");
			//getHttpSession().setAttribute("loginMember", member);
			write("1","UTF-8");
			return null;
		}else {
			write("0","UTF-8");
			return null;
		}
	}
	/**
	 * 找回密码邮箱激活验证
	 * 返回验证结果，1为成功并更改密码，0为失败
	 * @return
	 */
	public String findPwdByEmailActivate(){
		//判断邮箱是否存在
		member=memberService.findByEmail(member);
		if (member!=null) {
				String temp="";
				HttpServletRequest request=getHttpRequest();
				temp=request.getParameter("temp");
				if(StringUtils.isBlank("temp")){
					temp="";	
				}
				String newpwd="";
				newpwd=request.getParameter("pwd");
				if(StringUtils.isBlank("newpwd")){
					newpwd="";	
				}
				String mtemp=member.getTemp();
				if(mtemp.equals(temp)){
						if(!newpwd.equals("") && newpwd.length()>0){
							member.setTemp("");
							member.setPwd(MD5.MD5(newpwd));
							memberService.update(member);
							write("1","UTF-8");
							getHttpSession().setAttribute("loginMember", member);
							return null;
						}else{
							member.setTemp("");
							memberService.update(member);
							write("0","UTF-8");
							return null;
						}
				}	
		}else{
			write("0","UTF-8");
			return null;
		}
		return null;
	}
	/**
	 * 找回密码邮箱重新发送验证信息
	 * @return
	 */
	public String sendEmailFind(){
		//判断邮箱是否存在
		member=memberService.findByEmail(member);
		if (member!=null && member.getTemp().length()>0) {
			String newPwd=UUID.randomUUID().toString().substring(0, 8);
			//获得当前时间毫秒数
			String temp=Long.toString(System.currentTimeMillis());
			member.setTemp(temp);
			memberService.update(member);
			//获得当前时间
			String starttime=DateUtil.format(new Date(), "yyyy-MM-dd HH:mm");
			//发送邮件
			Mail mail=new Mail(getConfig());
			boolean flag=mail.sendMessage(member.getEmail(),"大太阳建筑网:"+member.getEmail()+"找回密码邮件", 
					"您的新密码为"+newPwd+",请点击以下链接进行激活验证。<br><a href='"+getBasePath()+"/member/findPwdActivate.jsp?email="+member.getEmail()+"&temp="+temp+"&pwd="+newPwd+"&starttime="+starttime+"'>"+getBasePath()+"member/findPwdByEmailActivate.jsp</a>");
			//getHttpSession().setAttribute("loginMember", member);
			return null;
		}else {
			write("0","UTF-8");
			return null;
		}
	}
	/**
	 * 判断找回密码时当前邮箱的temp是否为空
	 * 如果为空说明已经验证过了返回0
	 * 不为空说明正在验证返回1
	 * @return
	 */
	public String validateEmailTemp(){
		member=memberService.findByEmail(member);
		if (member!=null) {
			if(!member.getTemp().equals("") && member.getTemp().length()>0){
				write("1","UTF-8");
				return null;
			}else{
				write("0","UTF-8");
				return null;
			}
		}else{
			write("0","UTF-8");
			return null;
		}
	}
	/**
	 * 密码找回激活时间过期，清空temp
	 * @return
	 */
	public String clearTmp(){
		member=memberService.findByEmail(member);
		if (member!=null) {
			if(!member.getTemp().equals("") && member.getTemp().length()>0){
				member.setTemp("");	
				memberService.update(member);
				write("1","UTF-8");
				return null;
			}else{
				write("0","UTF-8");
				return null;
			}
		}else{
			write("0","UTF-8");
			return null;
		}
	}
	/**
	 * 会员注册激活时间过期，删除记录
	 * @return
	 */
	public String clearResisterTmp(){
		member=memberService.findByEmail(member);
		if (member!=null) {
			String id=member.getId();
			if(id!=null && id.length()>0){
				memberService.del(id);
				write("1","UTF-8");
				return null;
			}else{
				write("0","UTF-8");
				return null;
			}
		}else{
			write("0","UTF-8");
			return null;
		}
	}
	public MemberService getMemberService() {
		return memberService;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	public MembergroupService getMembergroupService() {
		return membergroupService;
	}

	public void setMembergroupService(MembergroupService membergroupService) {
		this.membergroupService = membergroupService;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Membergroup getMembergroup() {
		return membergroup;
	}

	public void setMembergroup(Membergroup membergroup) {
		this.membergroup = membergroup;
	}

	public String getValidateCode() {
		return ValidateCode;
	}

	public void setValidateCode(String validateCode) {
		ValidateCode = validateCode;
	}

	public String getRememberMe() {
		return RememberMe;
	}

	public void setRememberMe(String rememberMe) {
		RememberMe = rememberMe;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
}
