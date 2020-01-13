package com.hotel.command;

import lombok.Data;
import java.sql.Timestamp;
import java.util.ArrayList;

@Data
public class ReviewBoardVO {
	private int reviewBno;
	private Timestamp reviewDate;
	private Timestamp reviewUpdateDate;
	private String reviewTitle;
	private String reviewContent;
	private String reviewId;
	private int reviewRate;
	private String reviewfilename;
	private String reviewfilerealname;
	private String reviewfileloca;
	private String reviewfileUploadpath;
	private String reviewRoom;
	
	private ArrayList<ReviewReplyVO> replyvo;
	
	private int likeHit;
}
