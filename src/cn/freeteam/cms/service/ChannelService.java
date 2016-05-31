package cn.freeteam.cms.service;

import cn.freeteam.base.BaseService;
import cn.freeteam.cms.dao.ChannelMapper;
import cn.freeteam.cms.model.Channel;
import cn.freeteam.cms.model.ChannelExample;
import cn.freeteam.cms.model.Htmlquartz;
import cn.freeteam.cms.model.Site;
import cn.freeteam.cms.util.FreeMarkerUtil;
import cn.freeteam.cms.util.HtmlChannelJob;
import cn.freeteam.cms.util.QuartzUtil;
import cn.freeteam.util.FileUtil;
import cn.freeteam.util.OperLogUtil;
import freemarker.template.TemplateException;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.quartz.CronTrigger;
import org.quartz.JobDetail;
import org.quartz.SchedulerException;
import org.quartz.Trigger;

public class ChannelService extends BaseService
{
  public static String hasNextPage = "<!--FreeCMS_channel_info_list_hasNextPage-->";
  private ChannelMapper channelMapper;
  private RoleChannelService roleChannelService;
  private HtmlquartzService htmlquartzService;
  private SiteService siteService;

  public ChannelService()
  {
    initMapper(new String[] { "channelMapper" });
    init(new String[] { "roleChannelService" });
  }

  public boolean hasChildren(String parId)
  {
    ChannelExample example = new ChannelExample();
    ChannelExample.Criteria criteria = example.createCriteria();
    criteria.andParidEqualTo(parId);
    return this.channelMapper.countByExample(example) > 0;
  }

  public boolean hasPagemark(String siteid, String pagemark)
  {
    ChannelExample example = new ChannelExample();
    ChannelExample.Criteria criteria = example.createCriteria();
    criteria.andSiteEqualTo(siteid);
    criteria.andSql(" pagemark='" + pagemark + "' ");
    return this.channelMapper.countByExample(example) > 0;
  }

  public Channel findBySitePagemark(String siteid, String pagemark)
  {
    ChannelExample example = new ChannelExample();
    ChannelExample.Criteria criteria = example.createCriteria();
    criteria.andSiteEqualTo(siteid);
    criteria.andSql(" pagemark='" + pagemark + "' ");
    List channelList = this.channelMapper.selectByExampleWithBLOBs(example);
    if ((channelList != null) && (channelList.size() > 0)) {
      return (Channel)channelList.get(0);
    }
    return null;
  }

  public Channel findBySiteIndexnum(String siteid, Integer indexnum)
  {
    ChannelExample example = new ChannelExample();
    ChannelExample.Criteria criteria = example.createCriteria();
    criteria.andSiteEqualTo(siteid);
    criteria.andSql(" index=" + indexnum + " ");
    List channelList = this.channelMapper.selectByExampleWithBLOBs(example);
    if ((channelList != null) && (channelList.size() > 0)) {
      return (Channel)channelList.get(0);
    }
    return null;
  }

  public List<Channel> findByParWithBLOBs(String siteid, String parid)
  {
    return findByParWithBLOBs(siteid, parid, null, null);
  }

  public List<Channel> findByPar(String siteid, String parid)
  {
    return findByPar(siteid, parid, null, null);
  }

  public List<Channel> findByPar(String siteid, String parid, String state, String navigation)
  {
    ChannelExample example = new ChannelExample();
    ChannelExample.Criteria criteria = example.createCriteria();
    if ((siteid != null) && (siteid.trim().length() > 0)) {
      criteria.andSiteEqualTo(siteid.trim());
    }
    if ((parid != null) && (parid.trim().length() > 0) && (!"par".equals(parid))) {
      criteria.andParidEqualTo(parid.trim());
    }
    if ("par".equals(parid)) {
      criteria.andSql(" (parid is null or parid = '') ");
    }
    if ((state != null) && (state.trim().length() > 0)) {
      criteria.andStateEqualTo(state.trim());
    }
    if ((navigation != null) && (navigation.trim().length() > 0)) {
      criteria.andNavigationEqualTo(navigation.trim());
    }
    example.setOrderByClause(" orderNum ");
    return this.channelMapper.selectByExample(example);
  }

  public List<Channel> findByPar(String siteid, String parid, String state, String navigation, String isSecNavigation)
  {
    ChannelExample example = new ChannelExample();
    ChannelExample.Criteria criteria = example.createCriteria();
    if ((siteid != null) && (siteid.trim().length() > 0)) {
      criteria.andSiteEqualTo(siteid.trim());
    }
    if ((parid != null) && (parid.trim().length() > 0) && (!"par".equals(parid))) {
      criteria.andParidEqualTo(parid.trim());
    }
    if ("par".equals(parid)) {
      criteria.andSql(" (parid is null or parid = '') ");
    }
    if ((state != null) && (state.trim().length() > 0)) {
      criteria.andStateEqualTo(state.trim());
    }
    if ((navigation != null) && (navigation.trim().length() > 0)) {
      criteria.andNavigationEqualTo(navigation.trim());
    }
    if ((isSecNavigation != null) && (isSecNavigation.trim().length() > 0)) {
      criteria.andIssecnavigationEqualTo(isSecNavigation.trim());
    }
    example.setOrderByClause(" orderNum ");
    return this.channelMapper.selectByExample(example);
  }

  public List<Channel> findByParWithBLOBs(String siteid, String parid, String state, String navigation)
  {
    ChannelExample example = new ChannelExample();
    ChannelExample.Criteria criteria = example.createCriteria();
    if ((siteid != null) && (siteid.trim().length() > 0)) {
      criteria.andSiteEqualTo(siteid.trim());
    }
    if ((parid != null) && (parid.trim().length() > 0) && (!"par".equals(parid))) {
      criteria.andParidEqualTo(parid.trim());
    }
    if ("par".equals(parid)) {
      criteria.andSql(" (parid is null or parid = '') ");
    }
    if ((state != null) && (state.trim().length() > 0)) {
      criteria.andStateEqualTo(state.trim());
    }
    if ((navigation != null) && (navigation.trim().length() > 0)) {
      criteria.andNavigationEqualTo(navigation.trim());
    }
    example.setOrderByClause(" orderNum ");
    return this.channelMapper.selectByExampleWithBLOBs(example);
  }

  public List<Channel> findBySite(String siteid, String state, String navigation)
  {
    ChannelExample example = new ChannelExample();
    ChannelExample.Criteria criteria = example.createCriteria();
    if ((siteid != null) && (siteid.trim().length() > 0)) {
      criteria.andSiteEqualTo(siteid.trim());
    }
    if ((state != null) && (state.trim().length() > 0)) {
      criteria.andStateEqualTo(state.trim());
    }
    if ((navigation != null) && (navigation.trim().length() > 0)) {
      criteria.andNavigationEqualTo(navigation.trim());
    }
    example.setOrderByClause(" orderNum ");
    return this.channelMapper.selectByExample(example);
  }

  public List<Channel> findByRoles(String siteid, String roles)
  {
    ChannelExample example = new ChannelExample();
    ChannelExample.Criteria criteria = example.createCriteria();
    if ((siteid != null) && (siteid.trim().length() > 0)) {
      criteria.andSiteEqualTo(siteid);
    }
    criteria.andSql(" id in (select channelid from freecms_role_channel where roleid in (" + roles + " ))");
    return this.channelMapper.selectByExample(example);
  }

  public List<Channel> findByRolesWithBLOBs(String siteid, String roles)
  {
    ChannelExample example = new ChannelExample();
    ChannelExample.Criteria criteria = example.createCriteria();
    if ((siteid != null) && (siteid.trim().length() > 0)) {
      criteria.andSiteEqualTo(siteid);
    }
    criteria.andSql(" id in (select channelid from freecms_role_channel where roleid in (" + roles + " ))");
    return this.channelMapper.selectByExampleWithBLOBs(example);
  }

  public Channel findById(String id)
  {
    return this.channelMapper.selectByPrimaryKey(id);
  }

  public void update(Channel channel)
  {
    this.channelMapper.updateByPrimaryKeyWithBLOBs(channel);
    DBCommit();
  }

  public String insert(Channel channel)
  {
    String id = UUID.randomUUID().toString();
    channel.setId(id);
    this.channelMapper.insert(channel);
    DBCommit();
    return id;
  }

  public void del(String id, HttpServletRequest request)
    throws IOException, TemplateException
  {
    init(new String[] { "htmlquartzService" });
    Channel channel = findById(id);
    if (channel != null) {
      delhtml(channel, request);
      delPar(id, request);
      this.channelMapper.deleteByPrimaryKey(id);
      DBCommit();
    }
  }

  public void delPar(String parId, HttpServletRequest request)
    throws IOException, TemplateException
  {
    ChannelExample example = new ChannelExample();
    ChannelExample.Criteria criteria = example.createCriteria();
    criteria.andParidEqualTo(parId);
    List channelList = this.channelMapper.selectByExample(example);
    if ((channelList != null) && (channelList.size() > 0))
      for (int i = 0; i < channelList.size(); i++) {
        delhtml((Channel)channelList.get(i), request);
        delPar(((Channel)channelList.get(i)).getId(), request);
      }
    try
    {
      delHtmlChannelJob(parId);
    } catch (SchedulerException e) {
      e.printStackTrace();
    } catch (ParseException e) {
      e.printStackTrace();
    }
    this.htmlquartzService.delByChannelid(parId);
    this.channelMapper.deleteByPrimaryKey(parId);
  }

  public void delhtml(Channel channel, HttpServletRequest request)
    throws IOException, TemplateException
  {
    if (channel != null) {
      init(new String[] { "siteService" });
      Site site = this.siteService.findById(channel.getSite());
      if (site != null) {
        String rootPath = request.getRealPath("/") + "/site/" + site.getSourcepath() + "/" + channel.getFolder() + "/";

        File channelFolder = new File(rootPath);
        if (channelFolder.exists())
          FileUtil.deleteFile(channelFolder);
      }
    }
  }

  public void html(Site site, Channel channel, ServletContext context, HttpServletRequest request, String operuser, int pagenum)
    throws IOException, TemplateException
  {
    if ((site != null) && (channel != null) && 
      (site.getIndextemplet() != null) && (site.getIndextemplet().trim().length() > 0))
    {
      String templetPath = "templet/" + site.getIndextemplet().trim() + "/channel.shtml";
      if ((channel.getTemplet() != null) && (channel.getTemplet().trim().length() > 0)) {
        templetPath = "templet/" + site.getIndextemplet().trim() + "/" + channel.getTemplet().trim();
      }

      File templetFile = new File(request.getRealPath("/") + templetPath);
      channel.setSitepath(request.getContextPath() + "/" + site.getSourcepath() + "/");
      if (templetFile.exists())
      {
        htmlPage(site, channel, context, request, templetPath, 1, operuser, pagenum);
      }
    }
  }

  public void htmlPage(Site site, Channel channel, ServletContext context, HttpServletRequest request, String templetPath, int page, String operuser, int pagenum)
    throws IOException, TemplateException
  {
    if ((site != null) && (channel != null) && 
      (site.getIndextemplet() != null) && (site.getIndextemplet().trim().length() > 0))
    {
      if (channel.getMaxpage() > 0) {
        pagenum = channel.getMaxpage();
      }
      if ((pagenum == 0) || ((pagenum > 0) && (pagenum >= page)))
      {
        Map data = new HashMap();

        data.put("site", site);
        data.put("currChannel", channel);
        data.put("page", Integer.valueOf(page));
        data.put("pagenum", Integer.valueOf(pagenum));
        data.put("contextPath", request.getContextPath() + "/");
        data.put("contextPathNo", request.getContextPath());
        
        //生成目录 update by limengyu 20140213 添加新闻中心 
        String rootPath = "";
        	
//        if(channel.getName().equals("新闻中心") && channel.getPagemark().equals("xwzx")){
//        	 rootPath = request.getRealPath("/") + "/" + site.getSourcepath() + "/";
//        }else{
        	 rootPath = request.getRealPath("/") + "/" + site.getSourcepath() + "/" + channel.getFolder() + "/";
//        }
        File channelFolder = new File(rootPath);
        if (!channelFolder.exists()) {
          channelFolder.mkdirs();
        }
        FreeMarkerUtil.createHTML(context, data,templetPath, 
          rootPath + "index" + (page > 1 ? "_" + (page - 1) : "") + ".shtml");
        OperLogUtil.log(operuser, "栏目静态化:" + channel.getName() + " 第" + page + "页", request);
        String content = FileUtil.readFile(rootPath + "index" + (page > 1 ? "_" + (page - 1) : "") + ".shtml");

        if (content.indexOf(hasNextPage) > -1)
          htmlPage(site, channel, context, request, templetPath, page + 1, operuser, pagenum);
      }
    }
  }

  public void html(String siteid, String channelid, ServletContext context)
    throws IOException, TemplateException
  {
    init(new String[] { "siteService" });
    Site site = this.siteService.findById(siteid);
    Channel channel = findById(channelid);
    if ((site != null) && (channel != null) && 
      (site.getIndextemplet() != null) && (site.getIndextemplet().trim().length() > 0))
    {
      String templetPath = "templet/" + site.getIndextemplet().trim() + "/channel.shtml";
      if ((channel.getTemplet() != null) && (channel.getTemplet().trim().length() > 0)) {
        templetPath = "templet/" + site.getIndextemplet().trim() + "/" + channel.getTemplet().trim();
      }

      File templetFile = new File(context.getRealPath("/") + templetPath);
      channel.setSitepath(context.getContextPath() + "/" + site.getSourcepath() + "/");
      if (templetFile.exists())
      {
        htmlPage(site, channel, context, templetPath, 1);
      }
    }
  }

  public void htmlPage(Site site, Channel channel, ServletContext context, String templetPath, int page)
    throws IOException, TemplateException
  {
    if ((site != null) && (channel != null) && 
      (site.getIndextemplet() != null) && (site.getIndextemplet().trim().length() > 0) && (
      (channel.getMaxpage() == 0) || ((channel.getMaxpage() > 0) && (channel.getMaxpage() >= page))))
    {
      Map data = new HashMap();

      data.put("site", site);
      data.put("currChannel", channel);
      data.put("page", Integer.valueOf(page));
      if (channel.getMaxpage() > 0) {
        data.put("pagenum", Integer.valueOf(channel.getMaxpage()));
      }
      data.put("contextPath", context.getContextPath() + "/");
      data.put("contextPathNo", context.getContextPath());
      String rootPath = context.getRealPath("/") + "/" + site.getSourcepath() + "/" + channel.getFolder() + "/";

      File channelFolder = new File(rootPath);
      if (!channelFolder.exists()) {
        channelFolder.mkdirs();
      }
      FreeMarkerUtil.createHTML(context, data, 
        templetPath, 
        rootPath + "index" + (page > 1 ? "_" + (page - 1) : "") + ".shtml");
      String content = FileUtil.readFile(rootPath + "index" + (page > 1 ? "_" + (page - 1) : "") + ".shtml");

      if (content.indexOf(hasNextPage) > -1)
        htmlPage(site, channel, context, templetPath, page + 1);
    }
  }

  public void createTree(StringBuffer content, String adminRoles, String siteid, String roleid, String parid, String state, String navigation, String type)
  {
    List channeList = findByPar(siteid, parid, state, navigation);
    if ((channeList != null) && (channeList.size() > 0)) {
      content.append("<ul>");
      for (int i = 0; i < channeList.size(); i++) {
        content.append("<li>");

        if ((("admin".equals(adminRoles)) || (this.roleChannelService.haves(adminRoles, ((Channel)channeList.get(i)).getId()))) && 
          ("checkbox".equals(type))) {
          content.append("<input type='checkbox' onclick='channelTreeClick(this)' name='channelTree' value='" + ((Channel)channeList.get(i)).getId() + "' ");

          if (this.roleChannelService.have(roleid, ((Channel)channeList.get(i)).getId())) {
            content.append(" checked ");
          }
          content.append("/>");
        }

        content.append(((Channel)channeList.get(i)).getName());
        createTree(content, adminRoles, siteid, roleid, ((Channel)channeList.get(i)).getId(), state, navigation, type);
        content.append("</li>");
      }
      content.append("</ul>");
    }
  }

  public void updateHtmlChannelJob(ServletContext servletContext, Site site, Channel channel, Htmlquartz htmlquartz)
    throws SchedulerException, ParseException
  {
    if (channel != null) {
      Trigger trigger = QuartzUtil.getScheduler().getTrigger("HtmlChannelTrigger" + channel.getId(), "HtmlChannelTrigger");
      if (trigger != null)
      {
        QuartzUtil.getScheduler().pauseTrigger("HtmlChannelTrigger" + channel.getId(), "HtmlChannelTrigger");

        QuartzUtil.getScheduler().unscheduleJob("HtmlChannelTrigger" + channel.getId(), "HtmlChannelTrigger");

        QuartzUtil.getScheduler().deleteJob("HtmlChannelJob" + channel.getId(), "HtmlChannelJob");
      }

      JobDetail jobDetail = null;

      jobDetail = new JobDetail("HtmlChannelJob" + channel.getId(), "HtmlChannelJob", HtmlChannelJob.class);
      trigger = new CronTrigger("HtmlChannelTrigger" + channel.getId(), "HtmlChannelTrigger");
      if ((jobDetail != null) && (trigger != null))
      {
        jobDetail.getJobDataMap().put("siteid", site.getId());
        jobDetail.getJobDataMap().put("channelid", channel.getId());
        jobDetail.getJobDataMap().put("servletContext", servletContext);

        String triggerStr = QuartzUtil.getTriggerStr(htmlquartz);
        if (triggerStr.trim().length() > 0) {
          ((CronTrigger)trigger).setCronExpression(triggerStr);

          QuartzUtil.getScheduler().scheduleJob(jobDetail, trigger);
        }
      }
    }
  }

  public void delHtmlChannelJob(String channelid)
    throws SchedulerException, ParseException
  {
    if (channelid != null) {
      Trigger trigger = QuartzUtil.getScheduler().getTrigger("HtmlChannelTrigger" + channelid, "HtmlChannelTrigger");
      if (trigger != null)
      {
        QuartzUtil.getScheduler().pauseTrigger("HtmlChannelTrigger" + channelid, "HtmlChannelTrigger");

        QuartzUtil.getScheduler().unscheduleJob("HtmlChannelTrigger" + channelid, "HtmlChannelTrigger");

        QuartzUtil.getScheduler().deleteJob("HtmlChannelJob" + channelid, "HtmlChannelJob");
      }
    }
  }

  public List<Channel> findPath(String id)
  {
    List channelList = new ArrayList();
    channelList = findParPath(id, channelList);
    if ((channelList != null) && (channelList.size() > 0))
    {
      List channelListTemp = new ArrayList();
      for (int i = channelList.size() - 1; i >= 0; i--) {
        channelListTemp.add((Channel)channelList.get(i));
      }
      channelList = channelListTemp;
    }
    return channelList;
  }

  public List<Channel> findParPath(String id, List<Channel> channelList)
  {
    Channel channel = findById(id);
    if (channel != null) {
      channelList.add(channel);

      if ((channel.getParid() != null) && (channel.getParid().trim().length() > 0)) {
        findParPath(channel.getParid(), channelList);
      }
    }
    return channelList;
  }

  public List<Channel> findSonByPagemark(String siteid, String pagemark, String state, String navigation)
  {
    List list = new ArrayList();
    Channel channel = findBySitePagemark(siteid, pagemark);
    if (channel != null) {
      return findSonPro(list, siteid, channel.getId(), state, navigation);
    }
    return list;
  }

  public List<Channel> findSon(String siteid, String parid, String state, String navigation)
  {
    List list = new ArrayList();
    return findSonPro(list, siteid, parid, state, navigation);
  }

  public List<Channel> findSon(String siteid, String parid, String state, String navigation, String isSecNavigation)
  {
    List list = new ArrayList();
    return findSonPro(list, siteid, parid, state, navigation, isSecNavigation);
  }

  public List<Channel> findSonPro(List<Channel> list, String siteid, String parid, String state, String navigation)
  {
    List sonlist = findByPar(siteid, parid, state, navigation);
    if ((sonlist != null) && (sonlist.size() > 0)) {
      for (int i = 0; i < sonlist.size(); i++) {
        list.add((Channel)sonlist.get(i));

        findSonPro(list, siteid, ((Channel)sonlist.get(i)).getId(), state, navigation);
      }
    }
    return list;
  }

  public List<Channel> findSonPro(List<Channel> list, String siteid, String parid, String state, String navigation, String isSecNavigation)
  {
    List sonlist = findByPar(siteid, parid, state, navigation, isSecNavigation);
    if ((sonlist != null) && (sonlist.size() > 0)) {
      for (int i = 0; i < sonlist.size(); i++) {
        list.add((Channel)sonlist.get(i));

        findSonPro(list, siteid, ((Channel)sonlist.get(i)).getId(), state, navigation, isSecNavigation);
      }
    }
    return list;
  }
  public ChannelMapper getChannelMapper() {
    return this.channelMapper;
  }

  public void setChannelMapper(ChannelMapper channelMapper) {
    this.channelMapper = channelMapper;
  }
  public RoleChannelService getRoleChannelService() {
    return this.roleChannelService;
  }
  public void setRoleChannelService(RoleChannelService roleChannelService) {
    this.roleChannelService = roleChannelService;
  }
  public HtmlquartzService getHtmlquartzService() {
    return this.htmlquartzService;
  }
  public void setHtmlquartzService(HtmlquartzService htmlquartzService) {
    this.htmlquartzService = htmlquartzService;
  }
  public SiteService getSiteService() {
    return this.siteService;
  }
  public void setSiteService(SiteService siteService) {
    this.siteService = siteService;
  }
}