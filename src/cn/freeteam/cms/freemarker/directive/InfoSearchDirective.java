package cn.freeteam.cms.freemarker.directive;

import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import cn.freeteam.cms.util.FreemarkerPager;
import cn.freeteam.util.DateUtil;


import freemarker.core.Environment;
import freemarker.ext.beans.ArrayModel;
import freemarker.ext.beans.BeanModel;
import freemarker.ext.beans.BeansWrapper;
import freemarker.template.SimpleNumber;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

/**
 * 
 * <p>Title: InfoSearchDirective.java</p>
 * 
 * <p>Description: 信息列表分页标签
 * 参数
 * siteid		站点id
 * num			显示数量
 * order		排序类型  
 * 				1 固顶有效并降序,发布时间降序(默认)
 * 				2 固顶有效并降序,发布时间升序
 * 				3 发布时间降序
 * 				4 发布时间升序
 * titleLen		标题长度
 * hot			是否按点击热度倒序，1是
 * dateFormat	日期格式
 * img			是否只提取带图片的新闻	1是
 * page			当前第几页，默认1	
 * action		提交页面地址		
 * key			搜索关键词
 * newdays		几天内为最新
 * 
 * 返回值
 * infoList		信息对象列表
 * pager		分页对象
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
public class InfoSearchDirective extends BaseDirective implements TemplateDirectiveModel{

	private InfoService infoService;
	private SiteService siteService;
	private ChannelService channelService;
	
	public InfoSearchDirective(){
		init("infoService","siteService","channelService");
	}

	public void execute(Environment env, Map params, TemplateModel[] loopVars, 
			TemplateDirectiveBody body)throws TemplateException, IOException {
		
		//获取参数
		//站点id
		String siteid=getParam(params, "siteid");
		//显示数量
		int num=getParamInt(params, "num", 10);
		//排序
		String order=getParam(params, "order","1");
		//标题长度
		int titleLen=getParamInt(params, "titleLen",0);
		//是否按点击热度查询
		String hot=getParam(params, "hot");
		//日期格式
		String dateFormat=getParam(params, "dateFormat");
		//是否只提取带图片的信息
		String img=getParam(params, "img");
		//当前第几页
		int page=getParamInt(params, "page", 1);
		//页面地址
		String action=getParam(params, "action");
		//获取关键字
		String key=getParam(params, "key");
		//几天内为最新
		int newdays=getParamInt(params, "newdays",0);
		//update by limengyu @20131108
		//检索方式，0为全文检索，1为标题检索，默认为0
		String way=getParam(params,"way","0");
		
		//在父栏目及其子栏目中检索
		//parids父栏目id
		List<String> chanlist=null;
		chanlist=new ArrayList<String>();
		List<Channel> Channel_list=null;
		Channel channel=null;
		String parids=getParam(params,"parids");
		

		Writer out =env.getOut();
		if (body!=null) {
			//设置循环变量
			if (loopVars!=null && loopVars.length>0 ) {
				//查询信息
				Info info=new Info();
				if (siteid.trim().length()>0) {
					info.setSite(siteid);
				}
				if (img.trim().length()>0) {
					info.setImg(img);
				}
				if (key.trim().length()>0) {
					info.setSearchKey(key);
				}
				String orderSql="";
				if ("1".equals(hot)) {
					orderSql=" clickNum desc,addtime desc ";
				}else {
					if ("1".equals(order)) {
						//固顶有效并降序,发布时间降序(默认)
						orderSql=" isTop desc,addtime desc";
					}
					else if ("2".equals(order)) {
						//固顶有效并降序,发布时间升序
						orderSql=" isTop desc,addtime";
					}
					else if ("3".equals(order)) {
						//发布时间倒序
						orderSql=" addtime desc";
					}
					else if ("4".equals(order)) {
						//发布时间升序
						orderSql=" addtime";
					}
				}
				//有效的栏目
				if(parids!=null && parids.length()>0){
					//将父栏目添加进去
					chanlist.add(parids);
					//获取到父栏目的所有子栏目
					List<Channel> sonList=channelService.findSon(siteid,parids,"1", "");
					if (sonList!=null && sonList.size()>0) {
						for (int i = 0; i < sonList.size(); i++) {
							chanlist.add(sonList.get(i).getId());
						}
					}
					info.setChannelids(chanlist);
				}

				//检索的方式，0为全文检索，1为标题检索，默认为0
				if ("1".equals(way)) {
					info.setWay("1");
				}else{
					info.setWay("0");
				}
				//获取总数
				int count=infoService.count(info);
				FreemarkerPager pager=new FreemarkerPager();
				if (action.trim().length()>0) {
					pager.setAction(action);
				}
				pager.setCurrPage(page);
				pager.setTotalCount(count);
				pager.setPageSize(num);
				
				HashMap<String, String> paramMap=new HashMap<String, String>();
				paramMap.put("templetPath", env.getDataModel().get("templetPath")!=null?env.getDataModel().get("templetPath").toString():"");
				paramMap.put("key", env.getDataModel().get("key")!=null?env.getDataModel().get("key").toString():"");
				paramMap.put("siteid", env.getDataModel().get("siteid")!=null?env.getDataModel().get("siteid").toString():"");
				pager.setParams(paramMap);
				
				List<Info> infoList=infoService.find(info, orderSql, page, num);
				Site site=siteService.findById(siteid);
				if (infoList!=null && infoList.size()>0) {
					for (int i = 0; i < infoList.size(); i++) {
						if (titleLen>0) {
							infoList.get(i).setShowtitleLen(titleLen);
						}
						String description="";
						description=infoList.get(i).getDescription();
						if(StringUtils.isBlank(description)){
							description="";
						}
						String showtitle="";
						showtitle=infoList.get(i).getShowtitle();
						if(StringUtils.isBlank(showtitle)){
							showtitle="";
						}
						//infoList.get(i).setShowtitle(showtitle.replace(key, "<font color='red'>"+key+"</font>"));
						//infoList.get(i).setDescription(description.replace(key, "<font color='red'>"+key+"</font>"));
						if(!key.equals("") && key.trim().length()>0){
							infoList.get(i).setShowtitle(showtitle.replace(key, "<em>"+key+"</em>"));
							infoList.get(i).setDescription(description.replace(key, "<em>"+key+"</em>"));
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
									+"site/"+site.getSourcepath()+"/");
						}
					}
				}
				loopVars[0]=new ArrayModel(infoList.toArray(),new BeansWrapper()); 
				if(loopVars.length>1){
					loopVars[1]=new BeanModel(pager,new BeansWrapper()); 
				}
				body.render(env.getOut());  
			}
		}
	}
	public InfoService getInfoService() {
		return infoService;
	}

	public void setInfoService(InfoService infoService) {
		this.infoService = infoService;
	}

	public SiteService getSiteService() {
		return siteService;
	}

	public ChannelService getChannelService() {
		return channelService;
	}

	public void setChannelService(ChannelService channelService) {
		this.channelService = channelService;
	}

	public void setSiteService(SiteService siteService) {
		this.siteService = siteService;
	}
}