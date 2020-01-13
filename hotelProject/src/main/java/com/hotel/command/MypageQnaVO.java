package com.hotel.command;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MypageQnaVO {

	private int qnaBno;
	private String qnaTitle;
	private Timestamp qnaDate;
	private String qnaType;
	private String qnaAnswer;
}
