package cn.freeteam.cms.util;

import org.apache.commons.lang3.StringUtils;

import cn.freeteam.util.PropertiesUtil;

/**
 * 
 * <p>Title: DOMUtil.java</p>
 * 
 * <p>Description: xml解析工具类</p>
 * 
 * <p>Date: May 17, 2012</p>
 * 
 * <p>Time: 12:48:04 PM</p>
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
public class WebConfig {
	
	public static String getWebSiteUrl(){
		WebConfig wu = new WebConfig();
		return wu.webSiteUrl();
	}

	public String webSiteUrl(){
		String defaultValue="http://www.10333.com/";
		String paths=this.getClass().getClassLoader().getResource("").getPath()+"webconfig.properties";
		String value=PropertiesUtil.getConfig(paths,"websiteUrl");
		if(StringUtils.isBlank(value)){
			value = defaultValue;
		}
		return value;
	}
	
	public static String getParamValue(String param){
		WebConfig wu = new WebConfig();
		return wu.paramValue(param);
	}
	
	public String paramValue(String param){
		String defaultValue="";
		String paths=this.getClass().getClassLoader().getResource("").getPath()+"webconfig.properties";
		String value=PropertiesUtil.getConfig(paths,param);
		if(StringUtils.isBlank(value)){
			value = defaultValue;
		}
		return value;
	}
}
