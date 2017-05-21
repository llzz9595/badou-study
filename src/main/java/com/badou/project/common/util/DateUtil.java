package com.badou.project.common.util;

import java.util.Date;

import com.shengdai.global.util.DateUtils;

public class DateUtil {
	
	/**
	 * 获得指定月份头一天，最后一天
	 */
	public static Date[] getMonth(Date date){
			
		Date[] dates = new Date[2];	
		dates[0] = DateUtils.getMonthFirstDate(date);
		dates[1] = DateUtils.getMonthEndDate(date);
		return dates;
		
		
	}
	
}
