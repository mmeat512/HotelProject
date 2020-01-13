package com.hotel.user.service;

import java.util.ArrayList;

import com.hotel.command.MypageQnaVO;
import com.hotel.command.ReserveVO;
import com.hotel.command.ReviewBoardVO;
import com.hotel.command.UserVO;

public interface UserService {
	//회원가입
	public boolean insert(UserVO userVO);
	//아이디,비밀번호찾기
	public String findInfo(UserVO userVO);
	//로그인유효성체크
	public boolean loginCheck(UserVO userVO);
	//마이페이지 정보
	public UserVO myPage(String userId);
	//마이페이지 정보 수정
	public int userUpdate(UserVO userVO);
	//회원탈퇴
	public int userDelete(String userId, String userPw);
	//아이디중복체크
	public int idCheck(String userId);
	//마이페이지 내 문의
	public ArrayList<MypageQnaVO> getMypageQna(String userId);
	//마이페이지 예약현황 리스트
	public ArrayList<ReserveVO> getReserve(String userId);
	//마이페이지 예약 상세보기
	public ReserveVO userReserveDetail(String reserveNum);
	//유저예약취소
	public boolean reserveDelete(String reserveNum);
	//유저 예약취소건 reserveDelete DB에 넣기
	public boolean insertReserveDelete(ReserveVO vo);
	//마이페이지 내 후기
	public ArrayList<ReviewBoardVO> getMypageReview(String userId);

}
