package cn.freeteam.cms.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

import org.apache.commons.lang3.StringUtils;

public class DateTimeUtil {

	private static final String yyyyMM = "yyyy-MM";
	private static final String yyyyMMdd = "yyyy-MM-dd";
	private static final String yyyyMMddHHmmss = "yyyy-MM-dd HH:mm:ss";
	
	public static int getRandomBetween(int min, int max){

        Random random = new Random();

        int s = random.nextInt(max)%(max-min+1) + min;
        
        return s;
	}
	
	/**
	* 日期转换成字符串
	* @param date
	* @return str
	*/
	public static String DateToStr(Date date) {
	  
	   SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	   String str = format.format(date);
	   return str;
	}

	/**
	* 字符串转换成日期
	* @param str
	* @return date
	*/	
	public static Date StrToDate(String str) {
	  
	   SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	   Date date = null;
	   try {
	    date = format.parse(str);
	   } catch (ParseException e) {
	    e.printStackTrace();
	   }
	   return date;
	}

	/**
	* 字符串转换成日期
	* @param str
	* @return date
	*/	
	public static Date StrToDate(String str, String dateFormat) {
	  
	   SimpleDateFormat format = new SimpleDateFormat(dateFormat);
	   Date date = null;
	   try {
	    date = format.parse(str);
	   } catch (ParseException e) {
	    e.printStackTrace();
	   }
	   return date;
	}
	
	/**
	 * 获得指定日期的前、后days天,正数为当前日期后的日期,负数为当前日期前的日期
	 * 
	 * @param specifiedDay
	 * @return
	 * @throws Exception
	 */
	public static String getSpecifiedDate(String specifiedDay, Integer days) {

		String dayBefore = "";

		if (StringUtils.isBlank(specifiedDay)) {
			dayBefore = "";
		} else {
			Calendar c = Calendar.getInstance();
			Date date = null;
			try {
				date = new SimpleDateFormat(yyyyMMdd).parse(specifiedDay);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			c.setTime(date);
			Integer day = c.get(Calendar.DATE);
			c.set(Calendar.DATE, day + days);
			dayBefore = new SimpleDateFormat(yyyyMMdd).format(c.getTime());
		}

		return dayBefore;
	}

	/**
	 * 获得指定日期的前、后days天,正数为当前日期后的日期,负数为当前日期前的日期
	 * 
	 * @param specifiedDay
	 * @return
	 * @throws Exception
	 */
	public static String getSpecifiedDateTime(String specifiedDay, Integer days) {

		String dayBefore = "";

		if (StringUtils.isBlank(specifiedDay)) {
			dayBefore = "";
		} else {
			Calendar c = Calendar.getInstance();
			Date date = null;
			try {
				date = new SimpleDateFormat(yyyyMMddHHmmss).parse(specifiedDay);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			c.setTime(date);
			Integer day = c.get(Calendar.DATE);
			c.set(Calendar.DATE, day + days);
			dayBefore = new SimpleDateFormat(yyyyMMddHHmmss)
					.format(c.getTime());
		}
		return dayBefore;
	}

	/**
	 * 获得指定日期的前、后days天,正数为当前日期后的日期,负数为当前日期前的日期,用于处理前台传入yyyy-MM-dd格式但是数据库中是yyyy-
	 * MM-dd HH:mm:ss格式的日期比较
	 * 
	 * @param specifiedDay
	 * @return
	 * @throws Exception
	 */
	public static String getSpecifiedStartDateTime(String specifiedDay,
			Integer days) {

		String dayBefore = "";

		if (StringUtils.isBlank(specifiedDay)) {
			dayBefore = "";
		} else {
			Calendar c = Calendar.getInstance();
			Date date = null;
			try {
				date = new SimpleDateFormat(yyyyMMdd).parse(specifiedDay);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			c.setTime(date);
			Integer day = c.get(Calendar.DATE);
			c.set(Calendar.DATE, day + days);
			dayBefore = new SimpleDateFormat(yyyyMMdd).format(c.getTime());
		}
		return dayBefore + " 00:00:00";
	}

	/**
	 * 获得当前日期
	 * 
	 * @param
	 * @return
	 */
	public static String getCurrDate() {
		SimpleDateFormat df = new SimpleDateFormat(yyyyMMdd);// 设置日期格式
		String currDateTime = df.format(new Date());// 获取当前日期
		return currDateTime;
	}

	/**
	 * 获得当前时间
	 * 
	 * @param
	 * @return
	 */
	public static String getCurrDateTime() {
		SimpleDateFormat df = new SimpleDateFormat(yyyyMMddHHmmss);// 设置日期格式
		String currDateTime = df.format(new Date());// 获取当前日期
		return currDateTime;
	}

	/**
	 * 获得当前日期
	 * 
	 * @param
	 * @return
	 */
	public static String formatToDate(String str) {

		String dateTime = "";

		if (StringUtils.isBlank(str)) {
			dateTime = "";
		} else {
			SimpleDateFormat df = new SimpleDateFormat(yyyyMMdd);// 设置日期格式
			try {
				dateTime = df.format(df.parse(str));// 格式化时间
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return dateTime;
	}

	/**
	 * 获得当前时间
	 * 
	 * @param
	 * @return
	 */
	public static String formatToDateTime(String str) {
		String dateTime = "";

		if (StringUtils.isBlank(str)) {
			dateTime = "";
		} else {
			SimpleDateFormat df = new SimpleDateFormat(yyyyMMddHHmmss);// 设置日期格式
			try {
				dateTime = df.format(df.parse(str));// 格式化时间
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return dateTime;
	}

	/**
	 * 比较日期
	 * 
	 * @param
	 * @return
	 * @throws ParseException
	 */
	public static Integer daysBetween(String startDate, String endDate) {

		Long time1 = 0l;
		Long time2 = 0l;
		Long between_days = 0l;
		SimpleDateFormat sdf = new SimpleDateFormat(yyyyMMdd);
		Calendar cal = Calendar.getInstance();
		try {
			cal.setTime(sdf.parse(startDate));
			time1 = cal.getTimeInMillis();
			cal.setTime(sdf.parse(endDate));
			time2 = cal.getTimeInMillis();
			between_days = (time2 - time1) / (1000 * 3600 * 24);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return Integer.parseInt(String.valueOf(between_days));
	}

	/**
	 * 获取指定日期是周的第几天,0周日,1周一,2周二,...,6周六
	 * 
	 * @param
	 * @return
	 * @throws ParseException
	 */
	public static Integer getDayOfWeekWithSpecifiedTime(String specifiedDateTime) {

		SimpleDateFormat df = new SimpleDateFormat(yyyyMMdd);// 设置日期格式
		Calendar cal = Calendar.getInstance();
		Integer day = 0;
		try {
			cal.setTime(df.parse(specifiedDateTime));
			day = cal.get(Calendar.DAY_OF_WEEK);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return day - 1;
	}

	/**
	 * 获取指定日期周开始时间 specifiedDateTime指定日期 weekNum 0指本周 负数指本周之前的周数 正数指本周之后的周数
	 * 
	 * @param
	 * @return
	 * @throws ParseException
	 */
	public static String getWeekStartDateTimeOfSpecifiedTime(
			String specifiedDateTime, Integer weekNum) {

		Integer dayOfWeek = getDayOfWeekWithSpecifiedTime(specifiedDateTime);
		if (dayOfWeek == 0) {
			dayOfWeek = 7;
		}
		String specifiedTimeWeekStartDateTime = getSpecifiedStartDateTime(
				specifiedDateTime, -(dayOfWeek - 1));// 获取指定日期周一开始时间
		String weekStartDateTime = getSpecifiedStartDateTime(
				specifiedTimeWeekStartDateTime, weekNum * 7);
		return weekStartDateTime;
	}

	/**
	 * 获取指定日期 startDateTime和endDateTime之间的周间隔
	 * 
	 * @param
	 * @return
	 * @throws ParseException
	 */
	public static Integer weekBetween(String startDateTime, String endDateTime){
		
		startDateTime = getWeekStartDateTimeOfSpecifiedTime(startDateTime,0);
		endDateTime = getWeekStartDateTimeOfSpecifiedTime(endDateTime,0);
		
		Integer days = daysBetween(startDateTime , endDateTime);
		
		Integer weekNum = days / 7;
		
		return weekNum;
	}

	/**
	 * 获取指定日期月开始时间 specifiedDateTime指定日期 weekNum 0指本月 负数指本月之前的月数 正数指本月之后的月数
	 * 
	 * @param
	 * @return
	 * @throws ParseException
	 */
	public static String getMonthStartDateTimeOfSpecifiedTime(
			String specifiedDateTime, Integer monthNum) {

		SimpleDateFormat df = new SimpleDateFormat(yyyyMM);// 设置日期格式
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, monthNum);
		Date date = cal.getTime();
		String month = df.format(date) + "-01 00:00:00";
		return month;

	}

	/**
	 * 获取指定日期月开始时间 startDateTime和endDateTime之间的月间隔
	 * 
	 * @param
	 * @return
	 * @throws ParseException
	 */
	public static Integer monthBetween(String startDateTime, String endDateTime) {

		SimpleDateFormat df = new SimpleDateFormat(yyyyMM);// 设置日期格式

		int iMonth = 0;
		try {

			Calendar objCalendarDate1 = Calendar.getInstance();
			objCalendarDate1.setTime(df.parse(startDateTime));
			Calendar objCalendarDate2 = Calendar.getInstance();
			objCalendarDate2.setTime(df.parse(endDateTime));

			if (objCalendarDate2.equals(objCalendarDate1)) {
				return 0;
			}

			if (objCalendarDate1.after(objCalendarDate2)) {
				Calendar temp = objCalendarDate1;
				objCalendarDate1 = objCalendarDate2;
				objCalendarDate2 = temp;
			}
			if ((objCalendarDate2.get(Calendar.YEAR) > objCalendarDate1
					.get(Calendar.YEAR))) {

				iMonth = (objCalendarDate2.get(Calendar.YEAR) - objCalendarDate1
						.get(Calendar.YEAR))
						* 12
						+ objCalendarDate2.get(Calendar.MONTH)
						- objCalendarDate1.get(Calendar.MONTH);
			} else {
				iMonth = objCalendarDate2.get(Calendar.MONTH)
						- objCalendarDate1.get(Calendar.MONTH);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return iMonth;
	}

	/**
	 * 判断当前日期是否是月末
	 * 
	 * @param
	 * @return
	 * @throws ParseException
	 */
	public static Boolean isLastDayMonth(){
		
		Boolean isLastDayMonth = false;
		
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.YEAR, calendar.get(Calendar.YEAR));
		calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH));
		int endday = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
		int today = calendar.get(Calendar.DAY_OF_MONTH);
		
		if(today==endday){
			isLastDayMonth = true;
		}else{
			isLastDayMonth = false;
		}
		
		return isLastDayMonth;
		
	}
}
