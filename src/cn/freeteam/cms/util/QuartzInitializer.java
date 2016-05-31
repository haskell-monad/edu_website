package cn.freeteam.cms.util;

import java.text.ParseException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.logging.Log;
import org.apache.log4j.Logger;
import org.quartz.CronTrigger;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.Trigger;

import cn.freeteam.cms.model.Htmlquartz;
import cn.freeteam.cms.service.HtmlquartzService;
/**
 * 
 * <p>Title: QuartzInitializer.java</p>
 * 
 * <p>Description: 处理所有调度</p>
 * 
 * <p>Date: Jan 24, 2013</p>
 * 
 * <p>Time: 7:27:59 PM</p>
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
@SuppressWarnings("serial")
public class QuartzInitializer extends HttpServlet{
	public static SchedulerFactory schedFact ;
	public static Scheduler sched;
	private static Logger logger = Logger.getLogger(QuartzInitializer.class);
	public void init(ServletConfig config) throws ServletException { 
		try {
			sched = QuartzUtil.getScheduler();
			QuartzUtil.startScheduler();
		} catch (SchedulerException e1) {
			e1.printStackTrace();
		}
		HtmlquartzService htmlquartzService=new HtmlquartzService();
		//查询所有调度
		List<Htmlquartz> htmlquartzList=htmlquartzService.findAll();
		addJob(config);
		addSourceJob(config);
		addAutoCommentJob(config);
		if (htmlquartzList!=null && htmlquartzList.size()>0) {
			//生成一个自动静态化时传递的唯一码
			String htmlQuartaKey=UUID.randomUUID().toString();
			config.getServletContext().setAttribute("htmlQuartaKey",htmlQuartaKey);
			Htmlquartz htmlquartz;
			try {
				for (int i = 0; i < htmlquartzList.size(); i++) {
					htmlquartz=htmlquartzList.get(i);
					
					JobDetail jobDetail = null;
					CronTrigger trigger = null;
					if (htmlquartz.getChannelid()!=null && htmlquartz.getChannelid().trim().length()>0) {
						//栏目静态化调度
						jobDetail = new JobDetail("HtmlChannelJob"+htmlquartz.getChannelid(), "HtmlChannelJob",HtmlChannelJob.class);
						trigger = new CronTrigger("HtmlChannelTrigger"+htmlquartz.getChannelid(), "HtmlChannelTrigger");
					}else if (htmlquartz.getSiteid()!=null && htmlquartz.getSiteid().trim().length()>0) {
						//站点静态化调度
						jobDetail = new JobDetail("HtmlSiteJob"+htmlquartz.getSiteid(), "HtmlSiteJob",HtmlSiteJob.class);
						trigger = new CronTrigger("HtmlSiteTrigger"+htmlquartz.getSiteid(), "HtmlSiteTrigger");
					}
					if (jobDetail!=null && trigger!=null) {
						//设置参数
						jobDetail.getJobDataMap().put("siteid", htmlquartz.getSiteid());
						jobDetail.getJobDataMap().put("channelid", htmlquartz.getChannelid());
						jobDetail.getJobDataMap().put("servletContext", config.getServletContext());
						jobDetail.getJobDataMap().put("htmlQuartaKey", htmlQuartaKey);
						//设置触发器
						String triggerStr=QuartzUtil.getTriggerStr(htmlquartz);
						if (triggerStr.trim().length()>0) {
							trigger.setCronExpression(triggerStr); 
							//添加到调度对列
							sched.scheduleJob(jobDetail, trigger);
						}
					}
				}
			} catch (Exception e) {
				System.out.println("QuartzInitializer失败");
				e.printStackTrace();
			}
		}
	}
	/**
	 * 生成SiteMap.xml定时任务
	 */
	public static Htmlquartz addJob(ServletConfig config){
		//生成一个自动静态化时传递的唯一码
		String htmlQuartaKey=UUID.randomUUID().toString();
		config.getServletContext().setAttribute("htmlQuartaKey",htmlQuartaKey);
		Htmlquartz htmlquartz = new Htmlquartz();
		//每天20:00执行
		htmlquartz.setExetimehour(20);
		htmlquartz.setExetimemin(00);
		//定时执行
		htmlquartz.setType("0");
		String siteid="0b82baf0-4fc5-4784-ad9e-e8a046213ea8";
		Trigger trigger=null;
		 //创建任务
		JobDetail jobDetail = null;
		//站点静态化调度
		jobDetail = new JobDetail("SiteMapJob"+siteid, "SiteMapJob",SiteMapJob.class);
		trigger = new CronTrigger("SiteMapTrigger"+siteid, "SiteMapTrigger");
		if (jobDetail!=null && trigger!=null) {
			//设置参数
			jobDetail.getJobDataMap().put("siteid",siteid);
			jobDetail.getJobDataMap().put("servletContext",config.getServletContext());
			jobDetail.getJobDataMap().put("htmlQuartaKey", htmlQuartaKey);
			//设置触发器
			String triggerStr=QuartzUtil.getTriggerStr(htmlquartz);
			if (triggerStr.trim().length()>0) {
				try {
					((CronTrigger) trigger).setCronExpression(triggerStr);
					//添加到调度队列
					QuartzUtil.startScheduler();
					QuartzUtil.getScheduler().scheduleJob(jobDetail, trigger);
					System.out.println("Sitemap tast has joined the queue.....");
				} catch (ParseException e) {
					e.printStackTrace();
				} catch (SchedulerException e) {
					e.printStackTrace();
				} 
			}
		}
		return htmlquartz;
	}
	/**
	 * 生成SiteMap.xml定时任务
	 */
	public static Htmlquartz addSourceJob(ServletConfig config){
		//生成一个自动静态化时传递的唯一码
		String htmlQuartaKey=UUID.randomUUID().toString();
		config.getServletContext().setAttribute("htmlQuartaKey",htmlQuartaKey);
		Htmlquartz htmlquartz = new Htmlquartz();
		//每天23:00执行
		htmlquartz.setExetimehour(23);
		htmlquartz.setExetimemin(00);
		//定时执行
		htmlquartz.setType("0");
		String siteid="0b82baf0-4fc5-4784-ad9e-e8a046213ea8";
		Trigger trigger=null;
		 //创建任务
		JobDetail jobDetail = null;
		//站点静态化调度
		jobDetail = new JobDetail("SourceJob"+siteid, "SourceJob",SourceJob.class);
		trigger = new CronTrigger("SourceTrigger"+siteid, "SourceTrigger");
		if (jobDetail!=null && trigger!=null) {
			//设置参数
			jobDetail.getJobDataMap().put("siteid",siteid);
			jobDetail.getJobDataMap().put("servletContext",config.getServletContext());
			jobDetail.getJobDataMap().put("htmlQuartaKey", htmlQuartaKey);
			//设置触发器
			String triggerStr=QuartzUtil.getTriggerStr(htmlquartz);
			if (triggerStr.trim().length()>0) {
				try {
					((CronTrigger) trigger).setCronExpression(triggerStr);
					//添加到调度队列
					QuartzUtil.startScheduler();
					QuartzUtil.getScheduler().scheduleJob(jobDetail, trigger);
					System.out.println("Source tast has joined the queue.....");
				} catch (ParseException e) {
					e.printStackTrace();
				} catch (SchedulerException e) {
					e.printStackTrace();
				} 
			}
		}
		return htmlquartz;
	}
	/**
	 * 每天22:30运行，自动生成评论
	 */
	public static Htmlquartz addAutoCommentJob(ServletConfig config){
		logger.info("AutoCommentJob execute");
		System.out.println("AutoCommentJob execute");
		//生成一个自动静态化时传递的唯一码
		String htmlQuartaKey=UUID.randomUUID().toString();
		config.getServletContext().setAttribute("htmlQuartaKey",htmlQuartaKey);
		Htmlquartz htmlquartz = new Htmlquartz();
		//每天22:30执行
		htmlquartz.setExetimehour(22);
		htmlquartz.setExetimemin(00);
		//定时执行
		htmlquartz.setType("0");
		String siteid="0b82baf0-4fc5-4784-ad9e-e8a046213ea8";
		Trigger trigger=null;
		 //创建任务
		JobDetail jobDetail = null;
		//站点静态化调度
		jobDetail = new JobDetail("AutoCommentJob"+siteid, "AutoCommentJob",AutoCommentJob.class);
		trigger = new CronTrigger("AutoCommentTrigger"+siteid, "AutoCommentTrigger");
		if (jobDetail!=null && trigger!=null) {
			//设置参数
			jobDetail.getJobDataMap().put("siteid",siteid);
			jobDetail.getJobDataMap().put("servletContext",config.getServletContext());
			jobDetail.getJobDataMap().put("htmlQuartaKey", htmlQuartaKey);
			//设置触发器
			String triggerStr=QuartzUtil.getTriggerStr(htmlquartz);
			if (triggerStr.trim().length()>0) {
				try {
					((CronTrigger) trigger).setCronExpression(triggerStr);
					//添加到调度队列
					QuartzUtil.startScheduler();
					QuartzUtil.getScheduler().scheduleJob(jobDetail, trigger);
					logger.info("autoComment tast has joined the queue.....");
					System.out.println("autoComment tast has joined the queue.....");
					
				} catch (ParseException e) {
					e.printStackTrace();
				} catch (SchedulerException e) {
					e.printStackTrace();
				} 
			}
		}
		return htmlquartz;
	}
}
