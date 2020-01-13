package com.hotel.review.service;

import java.util.ArrayList;

import com.hotel.command.ReviewBoardVO;
import com.hotel.util.Criteria;

public interface ReviewBoardService {

	public boolean reviewRegist(ReviewBoardVO reviewVO);
	public ArrayList<ReviewBoardVO> getList(Criteria cri);
	public ReviewBoardVO detail(int reviewBno);
	public boolean delete(int reviewBno);
	public boolean update(ReviewBoardVO vo);
	public int getTotal(Criteria cri);
	
	//좋아요
	public boolean likeUpdate(int likeHit, int reviewBno);
	public int likeSel(int reviewBno);
	public boolean userLikeInsert(String hitId,int reviewBno);
	public ArrayList<String> likeId(int reviewBno);
}
