package com.hotel.command;


import java.sql.Timestamp;

import lombok.Data;

@Data
public class QnaReplyVO {

	private int qrBno;
	private int qrNum;
	private Timestamp qrDate;
	private String qrId;
	private String qrContent;
	private String qrPw;
}
