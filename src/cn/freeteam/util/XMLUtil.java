package cn.freeteam.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.Date;
import java.util.List;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

import cn.freeteam.cms.model.Channel;
import cn.freeteam.cms.model.Info;

/**
 * 
 * <p>Title: XMLUtil.java</p>
 * 
 * <p>Description: xml工具类</p>
 * 
 * <p>Date: May 9, 2013</p>
 * 
 * <p>Time: 8:34:46 PM</p>
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
public class XMLUtil {
	private static String prechannelurl="http://www.10333.com/news/";
	private static String preinfourl="http://www.10333.com";
	private static String today=DateUtil.format(new Date(),"yyyy-MM-dd");
	/**
	 * 生成xml文件
	 * @param document
	 * @param filepath
	 */
	public static void writeFile(Document document,String filepath){
		XMLWriter out = null;

		BufferedWriter bw = null;
		OutputStreamWriter osw = null;
		FileOutputStream fos = null;

		try {
			File xmlFile = new File(filepath);//输出xml的路径
			fos = new FileOutputStream(xmlFile);
			osw = new OutputStreamWriter(fos, "UTF-8");//指定编码，防止写中文乱码
			bw = new BufferedWriter(osw);

			//对xml输出格式化
			OutputFormat format = OutputFormat.createPrettyPrint();
			format.setEncoding("UTF-8");
			out = new XMLWriter(bw, format);
			out.write(document);

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (bw != null) {
					bw.close();
				}
				if (osw != null) {
					osw.close();
				}
				if (fos != null) {
					fos.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	/**
	 * 生成sitemap.xml文件
	 * @param chanlist
	 * @param infolist
	 * @return
	 */
	public static Document createInfoXML(List<?> chanlist,List<?> infolist){
		Document document = DocumentHelper.createDocument();
		Element urlset = document.addElement("urlset", "http://www.sitemaps.org/schemas/sitemap/0.9");
		urlset.addNamespace("xsi","http://www.w3.org/2001/XMLSchema-instance");
		urlset.addAttribute("xsi:schemaLocation","http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd");
		Element url = null;
		Element loc = null;
		Element priority = null;
		Element lastmod = null;
		Element changefreq = null;
		//创建根节点
		url = urlset.addElement("url");
		loc = url.addElement("loc");
		loc.addText("http://www.10333.com");
		priority = url.addElement("priority");
		priority.addText("1.0");
		lastmod= url.addElement("lastmod");
		lastmod.addText(today);
		changefreq= url.addElement("changefreq");
		changefreq.addText("daily");
		//创建channel节点
		Channel channel=null;
		for (int i=0;i<chanlist.size();i++){
			channel=(Channel)chanlist.get(i);
			url = urlset.addElement("url");
			loc = url.addElement("loc");
			if(channel.getUrl()!=null && !channel.getUrl().trim().equals("") && channel.getUrl().trim().length()>0){
				if(channel.getUrl().equals("javascript:void(0);")){
					loc.addText(prechannelurl+channel.getPageurl());
				}else{
					loc.addText(channel.getUrl());
				}
			}else{
				loc.addText(prechannelurl+channel.getPageurl());
			}
			priority = url.addElement("priority");
			priority.addText("0.9");
			lastmod= url.addElement("lastmod");
			//lastmod.addText(today);
			lastmod.addText(getMdTime(channel.getMdtime()));  //设置栏目最后更新时间
			changefreq= url.addElement("changefreq");
			changefreq.addText("daily");
		}
		//创建info节点
		Info info=null;
		for (int i=0;i<infolist.size();i++){
			info=(Info)infolist.get(i);
			url = urlset.addElement("url");
			loc = url.addElement("loc");
			if(info.getUrl()!=null && !info.getUrl().trim().equals("") && info.getUrl().trim().length()>0){
				if(info.getUrl().equals("javascript:void(0);")){
					loc.addText(preinfourl+info.getPageurl());
				}else{
					loc.addText(info.getUrl());
				}
			}else{
				loc.addText(preinfourl+info.getPageurl());
			}
			priority = url.addElement("priority");
			priority.addText("0.8");
			lastmod= url.addElement("lastmod");

			//lastmod.addText(today);
			lastmod.addText(getMdTime(info.getMdtime()));  //文章最后更新时间

			changefreq= url.addElement("changefreq");
			changefreq.addText("daily");
		}
		return document;
	}
	
	/**
	 * 获取最后更新时间
	 * @param date
	 * @return
	 */
	public static String getMdTime(Date date){
		String mdtime = "";
		if(date==null){
			date = new Date();
		}
		mdtime = DateUtil.format(date,"yyyy-MM-dd");
		return mdtime;
	}
	
	
	public static void main(String[] args) {
		//writeFile(creatXML(),"D://test//test.xml");
		System.out.println(today);
	}

}
