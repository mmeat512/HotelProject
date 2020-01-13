package com.hotel.command;
import lombok.Data;
import java.sql.Timestamp;

@Data
public class ReviewReplyVO {
	private int rBno;
	private int rNum;
	private Timestamp rDate;
	private String rContent;
	private String rId;
}
