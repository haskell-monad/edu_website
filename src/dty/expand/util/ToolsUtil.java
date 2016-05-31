package dty.expand.util;

public class ToolsUtil {
	/**
	 * 判断字符串是否是整型
	 * @param str
	 * @return 如果是int类型的话返回true
	 */
	public static boolean isNumeric(String str){
		  for (int i = str.length();--i>=0;){   
			   if (!Character.isDigit(str.charAt(i))){
				   return false;
			   }
		  }
		  return true;
	}
}
