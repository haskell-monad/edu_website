package dty.expand.util;

import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import cn.freeteam.base.BaseService;
import cn.freeteam.cms.model.Innerlink;
import cn.freeteam.cms.service.InnerlinkService;
public class ContentPageUtil extends BaseService{
	/**
	 * 处理文章的正文，根据分页符分页
	 * @param content 正文
	 * @return 返回处理后的正文
	 */
	public static String pageBreak(String content) {
		// 由于后台的分页格式在JAVA中获取不到，先替换。
		String patternStr = "(?is)<div style=\"page-break-after: always\">(.*?)<span style=\"display: none\">&nbsp;</span></div>";
		Pattern p = Pattern.compile(patternStr);
		Matcher m = p.matcher(content);
		content = m.replaceAll("<div style=\"page-break-after: always\"><span style=\"display: none\">&nbsp;</span></div>");
		// 对内容进行分页
		String pattern="<div style=\"page-break-after: always;?\">\\s*<span style=\"display: none;?\">&nbsp;</span></div>";
		String[] strSplit = content.split(pattern);
		int count = strSplit.length; //获取到总页数
		String outstr = "";
		String returnValue = "";
		if (count > 1) {
			outstr = "<div id='page_break'>";
			for (int i = 1; i <= strSplit.length; i++) {
				if (i <= 1) {
					//outstr += strSplit[i - 1];
					outstr += "<div id='page_" + String.valueOf(i) + "'>"+ strSplit[i - 1] + "</div>";
				} else {
					//outstr += strSplit[i - 1];
					outstr += "<div id='page_" + String.valueOf(i) + "' class='collapse'>" + strSplit[i - 1]+ "</div>";
				}
			}
			outstr += "<div class='num'>";
			outstr += "<span id=\"page_pre\">上一页</span>";
			for (int j = 1; j <= strSplit.length; j++) {
				outstr += "<a name='pages_"+String.valueOf(j)+"'>" + String.valueOf(j) + "</a>";
			}
			outstr += "<span id=\"page_next\">下一页</span>";
			outstr += "<span id=\"page_all\">显示全文</span>";
			outstr += "</div></div>";
			returnValue = outstr;
		} else {
			returnValue = content;
		}
		return returnValue;
	}
	/**
	 * 获取到正文被分隔的总页数
	 * @param content
	 * @return
	 */
	public static int getPageCount(String content){
		// 由于后台的分页格式在JAVA中获取不到，先替换。
		String patternStr = "(?is)<div style=\"page-break-after: always\">(.*?)<span style=\"display: none\">&nbsp;</span></div>";
		Pattern p = Pattern.compile(patternStr);
		Matcher m = p.matcher(content);
		content = m.replaceAll("<div style=\"page-break-after: always\"><span style=\"display: none\">&nbsp;</span></div>");
		// 对内容进行分页
		String pattern="<div style=\"page-break-after: always;?\">\\s*<span style=\"display: none;?\">&nbsp;</span></div>";
		String[] strSplit = content.split(pattern);
		int count = strSplit.length; //获取到总页数
		return count;
	}
	/**
	 * 分隔好的正文数组
	 * @param content
	 * @return
	 */
	public static String[] getContentByPattern(String content){
		// 由于后台的分页格式在JAVA中获取不到，先替换。
		String patternStr = "(?is)<div style=\"page-break-after: always\">(.*?)<span style=\"display: none\">&nbsp;</span></div>";
		Pattern p = Pattern.compile(patternStr);
		Matcher m = p.matcher(content);
		content = m.replaceAll("<div style=\"page-break-after: always\"><span style=\"display: none\">&nbsp;</span></div>");
		// 对内容进行分页
		String pattern="<div style=\"page-break-after: always;?\">\\s*<span style=\"display: none;?\">&nbsp;</span></div>";
		String[] strSplit = content.split(pattern);
		return strSplit;
	}
	/**
	 * 获取到某一页的数据
	 * @param content
	 * @param id
	 * @return
	 */
	public static String getContentByPageId(String content,int id){
		// 由于后台的分页格式在JAVA中获取不到，先替换。
		String patternStr = "(?is)<div style=\"page-break-after: always\">(.*?)<span style=\"display: none\">&nbsp;</span></div>";
		Pattern p = Pattern.compile(patternStr);
		Matcher m = p.matcher(content);
		content = m.replaceAll("<div style=\"page-break-after: always\"><span style=\"display: none\">&nbsp;</span></div>");
		// 对内容进行分页
		String pattern="<div style=\"page-break-after: always;?\">\\s*<span style=\"display: none;?\">&nbsp;</span></div>";
		String[] strSplit = content.split(pattern);
		int count = strSplit.length; //获取到总页数
		String outstr = "";
		String returnValue = "";
		if (count > 1) {
			outstr = "<div id='page_break'>";
			outstr += "<div id='page_"+ String.valueOf(id)+"'>" + strSplit[id-1] + "</div>";
			//outstr += strSplit[id - 1];
			outstr += "<div class='num'>";
			outstr += "<span id=\"page_pre\">上一页</span>";
			for (int j = 1; j <= strSplit.length; j++) {
				if(j==id){
					outstr += "<a class='highlight' name='pages_"+String.valueOf(j)+"'>" + String.valueOf(j) + "</a>";
				}else{
					outstr += "<a name='pages_"+String.valueOf(j)+"'>" + String.valueOf(j) + "</a>";
				}
			}
			outstr += "<span id=\"page_next\">下一页</span>";
			outstr += "<span id=\"page_all\">显示全文</span>";
			outstr += "</div></div>";
			returnValue = outstr;
		} else {
			returnValue = content;
		}
		return returnValue;
	}
	/**
	 * 显示全文的方法
	 * @param content 获取显示的全文数据
	 * @return
	 */
	public static String getContentByPageAll(String content) {
		// 由于后台的分页格式在JAVA中获取不到，先替换。
		String patternStr = "(?is)<div style=\"page-break-after: always\">(.*?)<span style=\"display: none\">&nbsp;</span></div>";
		Pattern p = Pattern.compile(patternStr);
		Matcher m = p.matcher(content);
		content = m.replaceAll("<div style=\"page-break-after: always\"><span style=\"display: none\">&nbsp;</span></div>");
		// 对内容进行分页
		String pattern="<div style=\"page-break-after: always;?\">\\s*<span style=\"display: none;?\">&nbsp;</span></div>";
		String[] strSplit = content.split(pattern);
		int count = strSplit.length; //获取到总页数
		String outstr = "";
		String returnValue = "";
		if (count > 1) {
			outstr = "<div id='page_break'>";
			for (int i = 1; i <= strSplit.length; i++) {
				//outstr += strSplit[i - 1];
				outstr += "<div id='page_" + String.valueOf(i) + "'>"+ strSplit[i - 1] + "</div>";

			}
			outstr += "<div class='num'>";
			outstr += "<span id=\"page_pre\">上一页</span>";
			for (int j = 1; j <= strSplit.length; j++) {
				outstr += "<a name='pages_"+String.valueOf(j)+"'>" + String.valueOf(j) + "</a>";
			}
			outstr += "<span id=\"page_next\">下一页</span>";
			outstr += "<span id=\"page_all\">显示全文</span>";
			outstr += "</div></div>";
			returnValue = outstr;
		} else {
			returnValue = content;
		}
		return returnValue;
	}
	/**
	 * 根据传过来的List内链列表和content正文
	 * 产生内链
	 */
	public static String convertContent(List<Innerlink> list,String content){
		String newcontent="";
		String name="";
		String link="";
		String color="004276";
		String isbold="1"; //是否加粗
		int innerWordCount=0;
		if(content!=null && !content.equals("") && content.length()>0){
			for(Innerlink innerlink:list){
				name=innerlink.getName();
				link=innerlink.getUrl();
				color=innerlink.getColor();
				if(color==null){
					color="004276";
				}
				isbold=innerlink.getIsbold();
				if(isbold==null){
					isbold="1";
				}
				if(name!=null && name.trim().length()>0){
					if(content.contains(name)){
						/**
						 * 如果isbold为1的话说明是加粗
						 */
						if(isbold.equals("1")){
							content=content.replaceFirst(name,"<a href='"+link+"' target='_blank' style='color:#"+color+"'><strong>"+name+"</strong></a>");
						}else{
							content=content.replaceFirst(name,"<a href='"+link+"' target='_blank' style='color:#"+color+"'>"+name+"</a>");
						}
						innerWordCount++;
						if(innerWordCount>10){
							break;
						}
					}
				}
			}
		}
		newcontent=content;
		//System.out.println("newcontent:"+newcontent);
		return newcontent;
	}
	
}
