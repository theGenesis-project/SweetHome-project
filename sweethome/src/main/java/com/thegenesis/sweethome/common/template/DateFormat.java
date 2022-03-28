package com.thegenesis.sweethome.common.template;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormat {
	public static String dateFormat(Date date) {
		SimpleDateFormat Format = new SimpleDateFormat("yyyy년 MM월 dd일 E요일");
		
		return Format.format(date);
	}
	
	public static String timeFormat(Date date) {
		SimpleDateFormat Format = new SimpleDateFormat("HH:mm a");
		return Format.format(date);
	}
}
