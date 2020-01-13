package com.hotel.command;

import lombok.Data;
import java.sql.Timestamp;

@Data
public class ReserveVO {
	//reserve
	private int roomNum;
	private String roomType;
	private String bedType;
	private String stayDate;
	private String reserveCheckin;
	private String reserveCheckout;
	private String userId;
	private String reserveNum;
	private int reserveAdult;
	private int reserveKid;
	private int reserveBaby;
	private String reserveState;
	private String reserveRequire;
	private String reserveDate;
		
	//reserveUser
    private String reserveName;
    private String reserveEmail1;
    private String reserveEmail2;
    private String reservePhone1;
    private String reservePhone2;
    private String reservePhone3;
    
	//HotelVO에 있는 price사용
	private double hotelPrice;
	private String hotelName;
}
