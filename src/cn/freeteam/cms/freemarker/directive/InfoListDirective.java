package cn.freeteam.cms.freemarker.directive;

import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;


import cn.freeteam.base.BaseDirective;
import cn.freeteam.cms.model.Channel;
import cn.freeteam.cms.model.Info;
import cn.freeteam.cms.model.Site;
import cn.freeteam.cms.service.ChannelService;
import cn.freeteam.cms.service.InfoService;
import cn.freeteam.cms.service.SiteService;
import cn.freeteam.util.DateUtil;


import freemarker.core.Environment;
import freemarker.ext.beans.BeanModel;
import freemarker.ext.beans.BeansWrapper;
import freemarker.ext.beans.NumberModel;
import freemarker.template.SimpleNumber;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

/**
 * 
 * <p>Title: InfoListDirective.java</p>
 * 
 * <p>Description: 信息列表标签
 * 参数
 * siteid		站点id
 * channelid	栏目id
 * channelParid	栏目parid
 * num			显示数量
 * order		排序类型  
 * 				1 固顶有效并降序,发布时间降序(默认)
 * 				2 固顶有效并降序,发布时间升序
 * 				3 发布时间降序
 * 				4 发布时间升序
 * titleLen		标题显示长度
 * hot			是否按点击热度倒序，1是
 * dateFormat	日期格式
 * channelPagemark	栏目页面标识
 * channelParPagemark	父栏目页面标识
 * img			是否只提取带图片的新闻	1是
 * checkOpenendtime	检查公开时限 默认不检查，1检查
 * newdays		几天内为最新
 * 
 * 返回值
 * info			信息对象
 * index		索引
 * 
 * 
 * 使用示例
 * </p>
 * 
 * <p>Date: May 14, 2012</p>
 * 
 * <p>Time: 1:45:03 PM</p>
 * 
 * <p>Copyright: 2012</p>
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
public class InfoListDirective extends BaseDirective implements TemplateDirectiveModel{

	private InfoService infoService;
	private SiteService siteService;
	private ChannelService channelService;
	
	public SiteService getSiteService() {
		return siteService;
	}

	public void setSiteService(SiteService siteService) {
		this.siteService = siteService;
	}

	public InfoListDirective(){
		init("infoService","siteService");
	}

	public void execute(Environment env, Map params, TemplateModel[] loopVars, 
			TemplateDirectiveBody body)throws TemplateException, IOException {
		
		//获取参数
		//站点id
		String siteid=getParam(params, "siteid");
		//栏目id
		String channelid=getParam(params, "channelid");
		String channelParid=getParam(params, "channelParid");
		//显示数量
		int num=getParamInt(params, "num", 10);
		//排序
		String order=getParam(params, "order","1");
		//标题长度
		int titleLen=getParamInt(params, "titleLen",0);
		//几天内为最新
		int newdays=getParamInt(params, "newdays",0);
		//是否按点击热度查询
		String hot=getParam(params, "hot");
		
		//获取时间类型，0为addtime,1为mdtime,默认为0
		String timeorder=getParam(params,"timeorder","0");
		
		//所取数据时间区间
		String addtimeBetween=getParam(params, "addtimeBetween");
		
		/**
		 * ishot是否是热度，1为是，0为否
		 * istop是否是置顶，1为是，0为否
		 * isrecommend是否推荐，1为是，0为否
		 */
		String ishot=getParam(params,"ishot");
		String istop=getParam(params,"istop");
		String isrecommend=getParam(params,"isrecommend");
		//日期格式
		String dateFormat=getParam(params, "dateFormat");
		//栏目页面标识
		String channelPagemark=getParam(params, "channelPagemark");
		String channelParPagemark=getParam(params, "channelParPagemark");
		//是否只提取带图片的信息
		String img=getParam(params, "img");
		
		
		Writer out =env.getOut();
		if (body!=null) {
			//设置循环变量
			if (loopVars!=null && loopVars.length>0 ) {
				//查询信息
				Info info=new Info();
				if (siteid.trim().length()>0) {
					info.setSite(siteid);
				}
				if (channelid.trim().length()>0) {
					info.setChannel(channelid);
				}
				if (channelPagemark.trim().length()>0) {
					info.setChannelPagemark(channelPagemark);
				}
				if (channelParid.trim().length()>0) {
					List<String> channelids=new ArrayList<String>();
					channelids.add(channelParid);
					init("channelService");
					List<Channel> sonList=channelService.findSon(siteid, channelParid, "1", "");
					if (sonList!=null && sonList.size()>0) {
						for (int i = 0; i < sonList.size(); i++) {
							channelids.add(sonList.get(i).getId());
						}
					}
					info.setChannelids(channelids);
				}
				if (channelParPagemark.trim().length()>0) {
					List<String> channelids=new ArrayList<String>();
					init("channelService");
					Channel channel=channelService.findBySitePagemark(siteid, channelParPagemark);
					if (channel!=null) {
						channelids.add(channel.getId());
						List<Channel> sonList=channelService.findSon(siteid, channel.getId(), "1", "");
						if (sonList!=null && sonList.size()>0) {
							for (int i = 0; i < sonList.size(); i++) {
								channelids.add(sonList.get(i).getId());
							}
						}
						info.setChannelids(channelids);
					}
				}
				//update by limengyu @20131111
				if (ishot.trim().length()>0) {
					info.setIshot(ishot);
				}
				if (istop.trim().length()>0) {
					info.setIstop(istop);
				}
				if(isrecommend.trim().length()>0){
					info.setIsrecommend(isrecommend);
				}
				
				if (img.trim().length()>0) {
					info.setImg(img);
				}
				info.setCheckOpenendtime(getParam(params, "checkOpenendtime"));
				/**
				 *  update by limengyu at 20131008
				 *	ptype:调用这个标签时所在的位置，0为站点页，1为栏目页
				 *	是否在首页和列表页显示，1为显示，默认为1
				 */
				String ptype=getParam(params,"ptype");
				if(ptype.equals("0")){
					info.setIsshowindex(getParam(params,"isshowindex"));
				}else if(ptype.equals("1")){
					info.setIsshowlist(getParam(params,"isshowlist"));
				}
				
				//是否在新闻中心显示,1为显示，0为不显示
				String isshownewscenter = getParam(params,"isshownewscenter");
				if(!isshownewscenter.equals("") && isshownewscenter.length()>0){
					info.setIsshownewscenter(isshownewscenter);
				}
				//是否在新闻中心置顶，1为是，0为不是
				String istopnewscenter = getParam(params,"istopnewscenter");
				if(!istopnewscenter.equals("") && istopnewscenter.length()>0){
					info.setIstopnewscenter(istopnewscenter);
				}
				//是否在新闻中心推荐，1为是，0为不是
				String isrecommendnewscenter = getParam(params,"isrecommendnewscenter");
				if(!isrecommendnewscenter.equals("") && isrecommendnewscenter.length()>0){
					info.setIsrecommendnewscenter(isrecommendnewscenter);
				}
				
				//设置发布
				info.setIscheck("1");
				
				//notin参数, where id！=notin
				String notin=getParam(params,"notin");
				if(notin.trim().length()>0){
					info.setIsnotinid(notin);
				}
				
				//tags标签  如：足球,曼联
				String tags=getParam(params,"tags");
				if(!tags.equals("") && tags.length()>0){
						info.setTags(tags);
				}
				
				/**
				 * 读取数据的范围
				 * 是否读取有效并且是导航的栏目，1为是
				 */
				String scope=getParam(params,"scope");
				if(!scope.equals("") && scope.length()>0){
					info.setScope(scope);	
				}	
				
				String orderSql="";
				if ("1".equals(hot)) {
					orderSql=" clickNum desc,addtime desc ";
				}else {
					if ("1".equals(order)) {
						//固顶有效并降序,发布时间降序(默认)
						if(timeorder.equals("1")){
							orderSql=" firstvalue desc,isTop desc,mdtime desc";
						}else{
							orderSql=" firstvalue desc,isTop desc,addtime desc";
						}
					}
					else if ("2".equals(order)) {
						//固顶有效并降序,发布时间升序
						if(timeorder.equals("1")){
							orderSql=" firstvalue desc,isTop desc,mdtime";
						}else{
							orderSql=" firstvalue desc,isTop desc,addtime";
						}
					}
					else if ("3".equals(order)) {
						//发布时间倒序
						if(timeorder.equals("1")){
							orderSql=" firstvalue desc,mdtime desc";
						}else{
							orderSql=" firstvalue desc,addtime desc";
						}
					}
					else if ("4".equals(order)) {
						//发布时间升序
						if(timeorder.equals("1")){
							orderSql=" firstvalue desc,mdtime";
						}else{
							orderSql=" firstvalue desc,addtime";
						}
					}
					else if("5".equals(order)){
						//推荐降序，发布时间降序
						info.setIsrecommend(getParam(params,"isrecommend","1"));
						if(timeorder.equals("1")){
							orderSql=" firstvalue desc,isrecommend desc,mdtime desc";
						}else{
							orderSql=" firstvalue desc,isrecommend desc,addtime desc";
						}
					}else if("6".equals(order)){
						//nper降序，第几期
						orderSql=" nper desc";
					}
				}
				
				if(StringUtils.isNotBlank(addtimeBetween)){
					info.setAddtimeBetween(addtimeBetween);
				}
				
				List<Info> infoList=infoService.find(info, orderSql, 1, num);
				Site site=siteService.findById(siteid);
				if (infoList!=null && infoList.size()>0) {
					for (int i = 0; i < infoList.size(); i++) {
						Info currInfo = infoList.get(i);
						if(currInfo.getIsquote()==1 && StringUtils.isNotEmpty(currInfo.getQuoteinfoid())){
							//如果是引用类型的话
							Info oldInfo = infoService.findById(currInfo.getQuoteinfoid());
							infoList.get(i).setTitle(oldInfo.getTitle());
							infoList.get(i).setShorttitle(oldInfo.getShorttitle());
							infoList.get(i).setTags(oldInfo.getTags());
							infoList.get(i).setKeywords(oldInfo.getKeywords());
							infoList.get(i).setContent(oldInfo.getContent());
							infoList.get(i).setAuthor(oldInfo.getAuthor());
							infoList.get(i).setImg(oldInfo.getImg());
							infoList.get(i).setAttchs(oldInfo.getAttchs());
							infoList.get(i).setDescription(oldInfo.getDescription());
							infoList.get(i).setEditor(oldInfo.getEditor());
							infoList.get(i).setPageurl(oldInfo.getPageurl());
							infoList.get(i).setClicknum(oldInfo.getClicknum());
							infoList.get(i).setChannel(oldInfo.getChannel());
						}
						
						if (titleLen>0) {
							infoList.get(i).setShowtitleLen(titleLen);
							infoList.get(i).setShowtitleMark(getParam(params,"showtitleMark",""));
						}
						if (dateFormat.trim().length()>0) {
							infoList.get(i).setDateFormat(dateFormat);
						}
						if (newdays>0 && 
								(DateUtil.differ(infoList.get(i).getAddtime(), new Date())/(1000*60*60*24))<newdays) {
							//判断是否为最新新闻
							infoList.get(i).setIsnew("1");
						}
						//设置sitepath
						if (site!=null) {
							infoList.get(i).setSitepath(env.getDataModel().get("contextPath").toString()
									+site.getSourcepath()+"/");
						}
						loopVars[0]=new BeanModel(infoList.get(i),new BeansWrapper());  
						if(loopVars.length>1){
							loopVars[1]=new SimpleNumber(i);
						}
						body.render(env.getOut());  
					}
				}
			}
		}
	}
	public InfoService getInfoService() {
		return infoService;
	}

	public void setInfoService(InfoService infoService) {
		this.infoService = infoService;
	}

	public ChannelService getChannelService() {
		return channelService;
	}

	public void setChannelService(ChannelService channelService) {
		this.channelService = channelService;
	}
}
