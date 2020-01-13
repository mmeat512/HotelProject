package com.hotel.command;

import lombok.Data;

@Data
public class UserVO {
	private String userId;
	private String userPw;
	private String userName;
	private String userEngName;
	private int userAddrzipNum;
	private String userAddrBasic;
	private String userAddrDetail;
	private String userPhone1;
	private String userPhone2;
	private String userPhone3;
	private String userEmail1;
	private String userEmail2;
	private int userBirth1;
	private int userBirth2;
	private int userBirth3;
}
