package com.hotel.qna.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hotel.command.QnaBoardVO;
import com.hotel.command.UserVO;
import com.hotel.qna.mapper.QnaBoardMapper;
import com.hotel.util.Criteria;

@Service("qnaBoardService")
public class QnaBoardServiceImpl implements QnaBoardService{
	
	@Autowired
	private QnaBoardMapper qnaBoardMapper;

	@Override
	public UserVO getRegist(String userId) {
		UserVO vo = qnaBoardMapper.getRegist(userId);
		System.out.println(vo.toString());
		return vo;
	}

	@Override
	public int qnaRegistForm(QnaBoardVO vo) {
		
		return qnaBoardMapper.qnaRegistForm(vo);
	}

	@Override
	public ArrayList<QnaBoardVO> getQnaBoardList(Criteria cri) {

		return qnaBoardMapper.getQnaBoardList(cri);
	}

	@Override
	public QnaBoardVO getContent(int qnaBno) {
		
		return qnaBoardMapper.getContent(qnaBno);
	}

	@Override
	public boolean qnaUpdate(QnaBoardVO vo) {
		
		return qnaBoardMapper.qnaUpdate(vo);
	}

	@Override
	public boolean qnaDelete(QnaBoardVO vo) {
			
		return qnaBoardMapper.qnaDelete(vo);
	}

	@Override
	public int getTotal(Criteria cri) {
		
		return qnaBoardMapper.getTotal(cri);
	}

	@Override
	public void qnaAnswerUpdate(int qnaBno) {
		
		qnaBoardMapper.qnaAnswerUpdate(qnaBno);
	}


	
}
