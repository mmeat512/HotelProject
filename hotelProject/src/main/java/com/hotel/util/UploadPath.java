package com.hotel.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UploadPath {
	
	public static String day() {
		
		Date date = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd");
		String day = sd.format(date);
		return day;
	}
	public static String uploadPath() {
		return "D:\\hotelProject\\upload\\";
	}
	
	public static void roomFolder() {
		
		File folder = new File(uploadPath()+"roomUpload");
		if(!folder.exists()) {
			folder.mkdir();
		}
		
	}
	
	public static void specialFolder() {
		
		File folder = new File(uploadPath()+"specialUpload");
		if(!folder.exists()) {
			folder.mkdir();
		}
		
	}
}
