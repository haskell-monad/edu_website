package cn.freeteam.cms.action.web;


import java.io.IOException;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang3.StringUtils;
import cn.freeteam.base.BaseAction;
import cn.freeteam.cms.model.Info;
import cn.freeteam.cms.model.InfoSign;
import cn.freeteam.cms.model.Site;
import cn.freeteam.cms.service.ChannelService;
import cn.freeteam.cms.service.InfoService;
import cn.freeteam.cms.service.InfoSignService;
import cn.freeteam.cms.service.SiteService;
import cn.freeteam.model.Users;
import cn.freeteam.service.UserService;
import cn.freeteam.util.EscapeUnescape;
import dty.expand.util.Json;

/** 
 * <p>Title: InfoAction.java</p>
 * 
 * <p>Description: InfoAction</p>
 * 
 * <p>Date: May 22, 2012</p>
 * 
 * <p>Time: 8:46:48 PM</p>
 * 
 * <p>Copyright: 2011</p>
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
public class InfoAction extends BaseAction{

	private InfoService infoService;
	private InfoSignService infoSignService;
	private UserService userService;
	private SiteService siteService;
	private ChannelService channelService;
	private Info info;
	private Site site;
	private Users user;
	private String cansign;
	private List<InfoSign> infosignList;
	private List<Info> infoList;
	
	public InfoAction(){
		init("infoService","channelService");
	}
	
	/**
	 * 生成Sitemap.xml文件
	 */
	public String createSitemapXML(){
		String rooturl=getServletContext().getRealPath("")+"/Sitemap.xml";
		//System.out.println(rooturl);
		infoService.creatSiteMapXML(rooturl);
		return null;
	}

	/**
	 * ajax点击
	 * @return
	 */
	public String ajaxClick(){
		int clicknum=0;
		if (info!=null && info.getId()!=null && info.getId().trim().length()>0) {
			info=infoService.findClickById(info.getId());
			if (info!=null) {
				info.setClicknum((info.getClicknum()!=null?info.getClicknum():0)+1);
				if (!"1".equals(info.getIshot()) && StringUtils.isNotEmpty(getConfigVal("infoHotNum")) ) {
					try {
						//如果点击大于信息热点配置则设置为热点
						if (info.getClicknum()>Integer.parseInt(getConfigVal("infoHotNum").trim())) {
							info.setIshot("1");
						}
					} catch (Exception e) {
					}
				}
				infoService.click(info);
				clicknum=info.getClicknum();
				write(""+clicknum, "UTF-8");
			}
		}
		return null;
	}
	
	/**
	 * 验证标题在数据库中是否已经存在
	 * @return 返回存在的Info对象 
	 * @return json格式
	 */
	@SuppressWarnings("unchecked")
	public String checkTitle(){
		List<Info> checklist=null;
		if(info!=null){
			String title=info.getTitle();
			if(title!=null && !title.equals("") && title.trim().length()>0){
				checklist=infoService.findByTitle(title.trim());
				if(checklist!=null && checklist.size()>0){
					Json json=new Json();
					String value=json.toJson(checklist);
					write(value,"UTF-8");
				}
			}
		}
		return null;
	}
	
	/**
	 * 搜索页ajax显示近期热门（点击量）
	 * @return
	 */
	public String getSearchJQRMList(){
		init("infoService");
		String order=" clickNum desc,addtime desc";
		infoList=infoService.find(info,order,1,10);
		Json json=new Json();
		String data=json.toJson(infoList);
		write(data, "UTF-8");
		return null;
	}
	/**
	 * 搜索页ajax显示最近更新
	 * @return
	 */
	public String getSearchZJGXList(){
			init("infoService");
			String order=" addtime desc";
			infoList=infoService.find(info,order,1,10);
			Json json=new Json();
			String data=json.toJson(infoList);
			write(data, "UTF-8");
		return null;
	}
	/**
	 * ajax根据文章id获取广告
	 * @return
	 */
	public String getAjaxImage(){
		if(info!=null && info.getId()!=null && info.getId().trim().length()>0){
			info=infoService.findById(info.getId());
			if (info!=null) {
				Json json=new Json();
				String data=json.toJson(info);
				write(data,"UTF-8");
			}
		}
		return null;
	}
	
	public ChannelService getChannelService() {
		return channelService;
	}

	public void setChannelService(ChannelService channelService) {
		this.channelService = channelService;
	}

	/**
	 * 信息签收
	 * @return
	 */
	public String sign(){
		init("infoSignService");
		if (info!=null && info.getId()!=null && info.getId().trim().length()>0) {
			info=infoService.findById(info.getId());
			if (info!=null) {
				infosignList=infoSignService.findSignByInfo(info.getId());
			}
		}
		return "sign";
	}
	/**
	 * 签收处理
	 * @return
	 */
	public String signDo(){
		//记住用户名
		Cookie cookie=new Cookie("FreeCMS_infosignLoginName",EscapeUnescape.escape(user.getLoginname()));
		cookie.setMaxAge(1000*60*60*24*365);//有效时间为一年
		getHttpResponse().addCookie(cookie);
		//记住密码
		Cookie cookiePwd=new Cookie("FreeCMS_infosignPwd",EscapeUnescape.escape(user.getPwd()));
		cookiePwd.setMaxAge(1000*60*60*24*365);//有效时间为一年
		getHttpResponse().addCookie(cookiePwd);
		if (info!=null && info.getId()!=null && info.getId().trim().length()>0) {
			info=infoService.findById(info.getId());
			if (info!=null) {
				//判断用户信息是否正确
				init("userService");
				String msg=userService.checkLogin(getHttpSession(), user);
				if (msg!=null && msg.trim().length()>0) {
					write(msg, "UTF-8");
					return null;
				}
			    HttpSession session =getHttpSession();
			    user=(Users)session.getAttribute("loginAdmin");
				//判断是否需要此用户签收
				init("infoSignService");
				InfoSign infoSign=infoSignService.findByUserInfo(user.getId(), info.getId());
				if (infoSign!=null) {
					if (infoSign.getSigntime()!=null) {
						write("您已签收", "UTF-8");
					}else {
						infoSign.setIp(getHttpRequest().getRemoteAddr());
						infoSign.setSigntime(new Date());
						infoSignService.update(infoSign);
						write("操作成功"+user.getId(), "UTF-8");
					}
				}else {
					write("您不能指定的签收用户", "UTF-8");
				}
			}
		}
		return null;
	}
	/**
	 * 根据id访问信息 
	 * @return
	 * @throws IOException 
	 */
	public String visit() throws IOException{
		if (info!=null && info.getId()!=null && info.getId().trim().length()>0) {
			infoList=infoService.find(info, "", 1, 1);
			if (infoList!=null && infoList.size()>0) {
				info=infoList.get(0);
				if (info!=null) {
					init("siteService");
					site=siteService.findById(info.getSite());
					if (site!=null) {
						info.setSitepath(getHttpRequest().getContextPath()+"/site/"+site.getSourcepath()+"/");
						getHttpResponse().sendRedirect(info.getPageurl());
					}
				}
			}
		}
		return null;
	}
	
	/**
	 * 返回当前期数的最近10期专题
	 * @return
	 */
	public String getNperNear10(){
		int nper=0;
		List<Info> list=null;
		if(info!=null ){
			//当前的期数
			nper=info.getNper();
			if(nper>0){
				String order=" nper";
				int end=nper-10;
			
				if(end < 0){
					list=infoService.findInfoByZT(info,order,0,nper-1);
				}else if(end==0){
					list=infoService.findInfoByZT(info,order,0,nper-1);
				}else{
					list=infoService.findInfoByZT(info,order,end-1,10);					
				}
				if(list.size()>0){
					Json json=new Json();
					Collections.reverse(list);
					String nearvalue=json.toJson(list);
					nearvalue=nearvalue.replaceAll("\r","\\r").replace("\n","\\n");
					write(nearvalue,"UTF-8");
				}
			}
		}
		return null;
	}
	public InfoService getInfoService() {
		return infoService;
	}

	public void setInfoService(InfoService infoService) {
		this.infoService = infoService;
	}

	public Info getInfo() {
		return info;
	}

	public void setInfo(Info info) {
		this.info = info;
	}

	public InfoSignService getInfoSignService() {
		return infoSignService;
	}

	public void setInfoSignService(InfoSignService infoSignService) {
		this.infoSignService = infoSignService;
	}

	public List<InfoSign> getInfosignList() {
		return infosignList;
	}

	public void setInfosignList(List<InfoSign> infosignList) {
		this.infosignList = infosignList;
	}


	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public String getCansign() {
		return cansign;
	}

	public void setCansign(String cansign) {
		this.cansign = cansign;
	}

	public List<Info> getInfoList() {
		return infoList;
	}

	public void setInfoList(List<Info> infoList) {
		this.infoList = infoList;
	}

	public SiteService getSiteService() {
		return siteService;
	}

	public void setSiteService(SiteService siteService) {
		this.siteService = siteService;
	}

	public Site getSite() {
		return site;
	}

	public void setSite(Site site) {
		this.site = site;
	}
}
