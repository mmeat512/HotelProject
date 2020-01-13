package com.hotel.review.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hotel.command.ReviewBoardVO;
import com.hotel.util.Criteria;

public interface ReviewBoardMapper {

	public boolean reviewRegist(ReviewBoardVO reviewVO);
	public ArrayList<ReviewBoardVO> getList(Criteria cri);
	public ReviewBoardVO detail(int reviewBno);
	public boolean delete(int reviewBno);
	public boolean update(ReviewBoardVO vo);
	public int getTotal(Criteria cri);

	public boolean likeUpdate(@Param("likeHit") int likeHit,@Param("reviewBno") int reviewBno);
	public boolean likeBoardUpdate(@Param("likeHit") int likeHit,@Param("reviewBno") int reviewBno);
	public int likeSel(int reviewBno);
	public boolean userLikeInsert(@Param("hitId") String hitId,@Param("reviewBno") int reviewBno);
	public ArrayList<String> likeId(int reviewBno);
}
