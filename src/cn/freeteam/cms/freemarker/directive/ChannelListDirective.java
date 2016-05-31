package cn.freeteam.cms.freemarker.directive;

import cn.freeteam.base.BaseDirective;
import cn.freeteam.cms.model.Channel;
import cn.freeteam.cms.model.Site;
import cn.freeteam.cms.service.ChannelService;
import cn.freeteam.cms.service.SiteService;
import freemarker.core.Environment;
import freemarker.ext.beans.BeanModel;
import freemarker.ext.beans.BeansWrapper;
import freemarker.template.SimpleNumber;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import java.io.IOException;
import java.io.Writer;
import java.util.List;
import java.util.Map;

public class ChannelListDirective extends BaseDirective
  implements TemplateDirectiveModel
{
  private ChannelService channelService;
  private SiteService siteService;

  public ChannelListDirective()
  {
    init(new String[] { "channelService", "siteService" });
  }

  public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body)
    throws TemplateException, IOException
  {
    String siteid = getParam(params, "siteid");
    String parid = getParam(params, "parid");

    Writer out = env.getOut();
    if (body != null)
    {
      if ((loopVars != null) && (loopVars.length > 0) && (siteid.trim().length() > 0))
      {
        List channelList = this.channelService.findByPar(
          siteid, parid, getParam(params, "state"), getParam(params, "navigation"), getParam(params, "isSecNavigation"));
        if ((channelList != null) && (channelList.size() > 0)) {
          Site site = this.siteService.findById(siteid);
          for (int i = 0; i < channelList.size(); i++)
          {
            if (site != null) {
              ((Channel)channelList.get(i)).setSitepath(env.getDataModel().get("contextPath").toString() + 
                site.getSourcepath() + "/");
            }
            loopVars[0] = new BeanModel(channelList.get(i), new BeansWrapper());
            if (loopVars.length > 1) {
              loopVars[1] = new SimpleNumber(i);
            }
            body.render(env.getOut());
          }
        }
      }
    }
  }

  public ChannelService getChannelService() {
    return this.channelService;
  }

  public void setChannelService(ChannelService channelService) {
    this.channelService = channelService;
  }

  public SiteService getSiteService() {
    return this.siteService;
  }

  public void setSiteService(SiteService siteService) {
    this.siteService = siteService;
  }
}