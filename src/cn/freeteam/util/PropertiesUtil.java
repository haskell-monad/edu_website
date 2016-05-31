package cn.freeteam.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import java.util.logging.Logger;

/**
 * 工具类
 * @author freeteam
 *
 */
public class PropertiesUtil {

	//获取配置文件的配置
	public static String getConfig(String path,String name){
		FileInputStream sins=null;
		String value="";
		try {
			Properties loginprop = new Properties();
			sins = new FileInputStream(path);
			loginprop.load(sins);
			value=loginprop.getProperty(name);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if (sins!=null) {
		        try {
					sins.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return value;
		}
	}
	public void sss(String key){
		String paths=this.getClass().getClassLoader().getResource("").getPath()+"watermark.properties";
		String value=PropertiesUtil.getConfig(paths,key);
		System.out.println(value);
	}
	public static void main(String[] args) {
//		String path = System.getProperty("user.dir")+"\\src\\db.properties"; 
//		System.out.println(path);
//		String value=getConfig(path,"wartermark");
//		System.out.println(value);
		PropertiesUtil f=new PropertiesUtil();
		f.sss("swatermark");
	}
}
