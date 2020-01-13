package com.hotel.qna.service;

import com.hotel.command.QnaReplyVO;
import com.hotel.util.Criteria;
import com.hotel.util.QnaReplyPageVO;

public interface QnaReplyService {

	public int regist(QnaReplyVO vo);//댓글 등록
	public QnaReplyPageVO getReply(Criteria cri, int qrBno);//댓글목록
	public int delete(int qrNum);//댓글 삭제
	public int checkId(int qrNum, String qrId);
	public int update(QnaReplyVO vo);//수정
}
