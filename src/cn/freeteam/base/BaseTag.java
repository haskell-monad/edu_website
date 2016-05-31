package cn.freeteam.base;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.tagext.TagSupport;



/**
 * 标签公用
 * 2011-4-15
 * 
 * @author freeteam
 */
public class BaseTag extends TagSupport{

	public HttpServletRequest getRequest(){
		return (HttpServletRequest)pageContext.getRequest();
	}
	public HttpSession getSession(){
		return getRequest().getSession();
	}
}