package dty.expand.util;

import org.apache.commons.lang3.StringEscapeUtils;

/**
 * 解码加密的正文
 * @author limengyu
 * 2013-10-18 下午2:09:07
 */
public class StringDecode {
	/**
	 * HTML代码的UnEscape处理方法--解码(配套ckEditor新闻编辑器) 
	 * @param content  加密的正文
	 * @return	解密的正文
	 */
	public static String  unescape(String content){
		return StringEscapeUtils.unescapeHtml3(StringEscapeUtils.unescapeXml(content));
	}
	public static void main(String[] args) {
		System.out.println(StringDecode.unescape(";&#21153;&#24066;&#22330;&#65292;&#21152;&#36895;&#25105;&#22269;&#24037;&#31243;&"));
	}
}
