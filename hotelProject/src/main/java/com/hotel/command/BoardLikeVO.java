package com.hotel.command;

import lombok.Data;

@Data
public class BoardLikeVO {
	
	private int reviewBno;
	private int likeHit;
	private String hitId;
}
