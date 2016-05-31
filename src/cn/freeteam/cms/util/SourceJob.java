package cn.freeteam.cms.util;
import javax.servlet.ServletContext;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import cn.freeteam.base.Base;
/**
 * 来源source引用次数job
 */
public class SourceJob extends Base implements Job{
	public SourceJob() {
	}
    public void execute(JobExecutionContext cntxt)  throws  JobExecutionException   {
    	if (cntxt.getJobDetail().getJobDataMap().get("siteid")!=null 
    			&& cntxt.getJobDetail().getJobDataMap().get("servletContext")!=null) {
    		try {
    			ServletContext servletContext=(ServletContext)cntxt.getJobDetail().getJobDataMap().get("servletContext");
    			//servletContext.setAttribute("basePath","http://limengyu:8080/dty_cms/");
    			servletContext.setAttribute("basePath","http://www.10333.com/");
    			if (servletContext!=null && 
    					servletContext.getAttribute("basePath")!=null && 
    					servletContext.getAttribute("basePath").toString().trim().length()>0) {
        			HttpClient httpClient=new DefaultHttpClient();
//        			HttpGet httpget = new HttpGet(servletContext.getAttribute("basePath")
//        					+"html_referenceCount.do?siteid="+cntxt.getJobDetail().getJobDataMap().get("siteid")
//        					+"&htmlQuartaKey="+cntxt.getJobDetail().getJobDataMap().get("htmlQuartaKey"));
        			HttpGet httpget = new HttpGet(servletContext.getAttribute("basePath")
        					+"source_setReference.do");
        			
        			httpClient.execute(httpget);
        			System.out.println("update source job success！");
				}
    		} catch (Exception e) {
    			System.out.println("update source job error！");
    			e.printStackTrace();
    		}
		}
    }
}
