package com.hotel.review.mapper;

import java.util.ArrayList;

import com.hotel.command.ReviewReplyVO;

public interface ReviewReplyMapper {

	public boolean replyInsert(ReviewReplyVO replyvo);
	public boolean replyDelete(int rNum);
	public ArrayList<ReviewReplyVO> replyDetail(int rBno);
	public int replyBno(int rNum);
}
