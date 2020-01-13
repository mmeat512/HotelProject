package com.hotel.review.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.command.ReviewReplyVO;
import com.hotel.review.mapper.ReviewReplyMapper;

@Service("reviewReplyService")
public class ReviewReplyServiceImpl implements ReviewReplyService{

	@Autowired
	private ReviewReplyMapper reviewreplymapper;
	
	public boolean replyInsert(ReviewReplyVO replyvo) {
		return reviewreplymapper.replyInsert(replyvo);
	}

	@Override
	public boolean replyDelete(int rNum) {
		return reviewreplymapper.replyDelete(rNum);
	}

	@Override
	public ArrayList<ReviewReplyVO> replyDetail(int rBno) {
		return reviewreplymapper.replyDetail(rBno);
	}

	@Override
	public int replyBno(int rNum) {
		return reviewreplymapper.replyBno(rNum);
	}

}
