package com.hotel.qna.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.command.QnaReplyVO;
import com.hotel.qna.mapper.QnaReplyMapper;
import com.hotel.util.Criteria;
import com.hotel.util.QnaReplyPageVO;

@Service("qrService")
public class QnaReplyServiceImpl implements QnaReplyService{
	
	@Autowired
	private QnaReplyMapper qnaReplyMapper;

	@Override
	public int regist(QnaReplyVO vo) {

		return qnaReplyMapper.regist(vo);
	}

	@Override
	public QnaReplyPageVO getReply(Criteria cri, int qrBno) {
			ArrayList<QnaReplyVO> list = qnaReplyMapper.getReply(cri, qrBno);
			int replyCount = qnaReplyMapper.getTotal(qrBno);
			QnaReplyPageVO vo = new QnaReplyPageVO(list, replyCount);
			
		return vo;
	}

	@Override
	public int checkId(int qrNum, String qrId) {
		QnaReplyVO vo = qnaReplyMapper.checkId(qrNum);
		if(qrId.equals(vo.getQrId())) {
			return 1;
		}else {
			return 0;
		}
	}

	@Override
	public int delete(int qrNum) {
			
		return qnaReplyMapper.delete(qrNum);
	}


	@Override
	public int update(QnaReplyVO vo) {
		return  qnaReplyMapper.update(vo);
	}


}
