package com.hotel.util;

import java.util.ArrayList;

import com.hotel.command.QnaReplyVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QnaReplyPageVO {

	
	private ArrayList<QnaReplyVO> list; //댓글 vo
	private int replyCount;//댓글 개수
}


