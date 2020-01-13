package com.hotel.review.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.command.ReviewBoardVO;
import com.hotel.review.mapper.ReviewBoardMapper;
import com.hotel.util.Criteria;

@Service("reviewBoardService")
public class ReviewBoardServiceImpl implements ReviewBoardService{

	@Autowired
	private ReviewBoardMapper reviewBoardMapper;
	
	@Override
	public boolean reviewRegist(ReviewBoardVO reviewVO) {
		return reviewBoardMapper.reviewRegist(reviewVO);
	}

	@Override
	public ArrayList<ReviewBoardVO> getList(Criteria cri) {
		return reviewBoardMapper.getList(cri);
	}

	@Override
	public ReviewBoardVO detail(int reviewBno) {
		return reviewBoardMapper.detail(reviewBno);
	}

	@Override
	public boolean delete(int reviewBno) {
		return reviewBoardMapper.delete(reviewBno);
	}

	@Override
	public boolean update(ReviewBoardVO vo) {
		System.out.println(vo);
		return reviewBoardMapper.update(vo);
	}

	@Override
	public int getTotal(Criteria cri) {
		return reviewBoardMapper.getTotal(cri);
	}

	@Override
	public boolean likeUpdate(int likeHit, int reviewBno) {
		reviewBoardMapper.likeBoardUpdate(likeHit, reviewBno);
		return reviewBoardMapper.likeUpdate(likeHit,reviewBno);
	}

	@Override
	public int likeSel(int reviewBno) {
		return reviewBoardMapper.likeSel(reviewBno);
	}

	@Override
	public boolean userLikeInsert(String hitId, int reviewBno) {
		return reviewBoardMapper.userLikeInsert(hitId, reviewBno);
	}

	@Override
	public ArrayList<String> likeId(int reviewBno) {
		return reviewBoardMapper.likeId(reviewBno);
	}
	
	

}
