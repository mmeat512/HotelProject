package com.hotel.qna.mapper;

import java.util.ArrayList;

import com.hotel.command.QnaBoardVO;
import com.hotel.command.UserVO;
import com.hotel.util.Criteria;

public interface QnaBoardMapper {
	
	public UserVO getRegist(String userId);//회원일 때 문의글 등록폼에 회원정보 자동 기재
	public int qnaRegistForm(QnaBoardVO vo);//문의 게시글 등록
	public ArrayList<QnaBoardVO> getQnaBoardList(Criteria cri);//문의 게시글 리스트
	public QnaBoardVO getContent(int qnaBno);//상세 글 내용 가져오기
	public boolean qnaUpdate(QnaBoardVO vo);//문의글 수정 처리
	public boolean qnaDelete(QnaBoardVO vo);//문의글 삭제 처리
	public int getTotal(Criteria cri);//전체 게시글 수(검색x)
	public void qnaAnswerUpdate(int qnaBno);//관리자가 댓글 달면 답변여부 ok로 변경

}
