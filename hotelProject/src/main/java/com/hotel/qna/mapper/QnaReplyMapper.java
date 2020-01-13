package com.hotel.qna.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hotel.command.QnaReplyVO;
import com.hotel.util.Criteria;
import com.hotel.util.QnaReplyPageVO;

public interface QnaReplyMapper {

	public int regist(QnaReplyVO vo);//댓글 등록
	public ArrayList<QnaReplyVO> getReply(@Param("cri") Criteria cri, @Param("qrBno") int qrBno);//댓글목록
	public int getTotal(int qrBno);//댓글개수
	public int delete(int qrNum);//댓글 삭제
	public QnaReplyVO checkId(int qrNum);
	public int update(QnaReplyVO vo);//수정
}
