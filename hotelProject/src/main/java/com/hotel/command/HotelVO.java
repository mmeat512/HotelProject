package com.hotel.command;

import lombok.Data;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

@Data
public class HotelVO {
	private String hotelName;
	private String hotelName2;//객실이름(한글)-스탠다드,디럭스,그랜드
	private String hotelLoca;
	private String hotelBed;
	private int hotelsize;
	private int hotelPeople;
	private String hotelView;
	private int hotelPrice;
	private String hotelCheckin;
	private String hotelCheckout;
	private String hotelContent;
	
	private String hotelfileLoca;
	private String hotelfilename; 
	private String hotelfileRealname; 
	private String hotelfileUploadpath;
	
	private int roomNum;
	private String roomType;
	private String BedType;
	private int peopleCnt;
	private String roomname;
	
	 
}

