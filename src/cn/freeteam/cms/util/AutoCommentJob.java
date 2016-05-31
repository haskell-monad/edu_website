package cn.freeteam.cms.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.log4j.Logger;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import cn.freeteam.base.Base;
import cn.freeteam.cms.model.Info;
import cn.freeteam.cms.service.InfoService;
import cn.freeteam.util.DateUtil;

/**
 * 来源source引用次数job
 */
public class AutoCommentJob extends Base implements Job {

	private InfoService infoService;
	private List<Info> infoList;
	private Info info;
	private static Logger logger = Logger.getLogger(AutoCommentJob.class);

	public AutoCommentJob() {
		init("infoService");
	}

	public void execute(JobExecutionContext cntxt) throws JobExecutionException {
		if (cntxt.getJobDetail().getJobDataMap().get("siteid") != null
				&& cntxt.getJobDetail().getJobDataMap().get("servletContext") != null) {
			try {

				ServletContext servletContext = (ServletContext) cntxt
						.getJobDetail().getJobDataMap().get("servletContext");

				servletContext.setAttribute("basePath",
						WebConfig.getWebSiteUrl());
				if (servletContext != null
						&& servletContext.getAttribute("basePath") != null
						&& servletContext.getAttribute("basePath").toString()
								.trim().length() > 0) {

					infoList = infoService.find(info, "addtime desc", 1, 100);
					logger.info("autoComment infoList.size == "+infoList.size());
					System.out.println("autoComment infoList.size == "+infoList.size());
					String autoCommentWords = WebConfig
							.getParamValue("autoCommentWord");
					String[] words = autoCommentWords.split("\\\\");
					SimpleDateFormat df_HH = new SimpleDateFormat("HH");
					SimpleDateFormat df_yyMMdd = new SimpleDateFormat("yyyyMMdd");
					for (int i = 0; i < infoList.size(); i++) {
						int length = words.length > 5 ? 5 : words.length;
						if(length>0){
							length = DateTimeUtil.getRandomBetween(1, length);
						}
						Date infoAddTime = infoList.get(i).getAddtime();
						String infoAddTimeStr_yyyyMMdd = df_yyMMdd.format(infoAddTime);
						String currDate = DateUtil.format(new Date(), "yyyyMMdd");
						if(infoAddTimeStr_yyyyMMdd.equalsIgnoreCase(currDate)){
							for (int j = 0; j < length; j++) {
								Random random = new Random();
								int randomNum = random.nextInt(words.length);
								String word = words[randomNum];
								HttpClient httpClient = new DefaultHttpClient();
								String infoAddTimeHoursStr = df_HH.format(infoAddTime);
								int infoAddTimeHours = 8;
								if(StringUtils.isNotBlank(infoAddTimeHoursStr)){
									infoAddTimeHours = Integer.valueOf(infoAddTimeHoursStr);
								}
								String comment_objid = infoList.get(i).getId();
								HttpPost httpPost = new HttpPost(
										servletContext.getAttribute("basePath")
												+ "comment_add2.do?comment.objtype=info&comment.objid="
												+ comment_objid
												+ "&comment.content=" + word
												+ "&comment.isRandomAddTime=1"
												+ "&comment.infoAddTimeHours="+infoAddTimeHours);
	
								httpClient.execute(httpPost);

								logger.info("AutoCommentJob job success!");
								System.out.println("AutoCommentJob job success!");
							}
						}
					}
				}
			} catch (Exception e) {
				logger.info("update AutoCommentJob job error!"+e);
				System.out.println("update AutoCommentJob job error!");
				e.printStackTrace();
			}
		}
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

	public List<Info> getInfoList() {
		return infoList;
	}

	public void setInfoList(List<Info> infoList) {
		this.infoList = infoList;
	}

}
