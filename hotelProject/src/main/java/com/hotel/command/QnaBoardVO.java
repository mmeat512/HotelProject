package com.hotel.command;

import lombok.Data;
import java.sql.Timestamp;

@Data
public class QnaBoardVO {
	private int qnaBno;
	private String qnaId;
	private Timestamp qnaDate;
	private String qnaTitle;
	private String qnaContent;
	private String qnaType;
	private String qnaBoardPw;
	private String qnaWriter;
	private String qnaemail1;
	private String qnaemail2;
	private String qnaphone1;
	private String qnaphone2;
	private String qnaphone3;
	private String qnaengName;
	private String reserveNum;
	private String qnaAnswer;
	private String qnasecret;
}
