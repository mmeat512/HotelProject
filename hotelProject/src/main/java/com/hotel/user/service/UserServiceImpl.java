package com.hotel.user.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.command.MypageQnaVO;
import com.hotel.command.ReserveVO;
import com.hotel.command.ReviewBoardVO;
import com.hotel.command.UserVO;
import com.hotel.user.mapper.UserMapper;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;
	
	//회원가입
	@Override
	public boolean insert(UserVO userVO) {
		return userMapper.insert(userVO);
	}
	
	//아이디,비밀번호찾기
	@Override
	public String findInfo(UserVO userVO) {
		String userId = userVO.getUserId();
		if(userId == "") {
			System.out.println(userMapper.findId(userVO));
			return userMapper.findId(userVO);
		}else {
			System.out.println(userMapper.findPw(userVO));
			return userMapper.findPw(userVO);
		}
	}

	//로그인유효체크
	@Override
	public boolean loginCheck(UserVO userVO) {
		int result = userMapper.loginCheck(userVO);
		if(result == 1) {
			return true;
		}else {
			return false;
		}
	}

	//마이페이지
	@Override
	public UserVO myPage(String userId) {
		return userMapper.myPage(userId);
	}

	@Override
	public int userUpdate(UserVO userVO) {
		return userMapper.userUpdate(userVO);
	}

	@Override
	public int userDelete(String userId, String userPw) {
		return userMapper.userDelete(userId, userPw);
	}

	@Override
	public int idCheck(String userId) {
		return userMapper.idCheck(userId);
	}

	@Override
	public ArrayList<MypageQnaVO> getMypageQna(String userId) {
		return userMapper.getMypageQna(userId);
	}

	@Override
	public ArrayList<ReserveVO> getReserve(String userId) {
		
		return userMapper.getReserve(userId);
	}

	@Override
	public ReserveVO userReserveDetail(String reserveNum) {
		return userMapper.userReserveDetail(reserveNum);
	}

	@Override
	public boolean reserveDelete(String reserveNum) {
		return userMapper.reserveDelete(reserveNum);
	}

	@Override
	public boolean insertReserveDelete(ReserveVO vo) {
		return userMapper.insertReserveDelete(vo);
	}

	@Override
	public ArrayList<ReviewBoardVO> getMypageReview(String userId) {
		return userMapper.getMypageReview(userId);
	}

	
	
}
