package com.hotel.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hotel.command.QnaReplyVO;
import com.hotel.qna.service.QnaBoardService;
import com.hotel.qna.service.QnaReplyService;
import com.hotel.util.Criteria;
import com.hotel.util.QnaReplyPageVO;


@RestController
@RequestMapping("/qnaReply")
public class QnaReplyController {

	@Autowired
	@Qualifier("qrService")
	private QnaReplyService qrService;
	
	@Autowired
	@Qualifier("qnaBoardService")
	private QnaBoardService qnaBoardService;
	
	//댓글 등록
	@RequestMapping("/new")
	public int regist(@RequestBody QnaReplyVO vo) {
		
		if(vo.getQrId().equals("더 벤자민")) {
			qnaBoardService.qnaAnswerUpdate(vo.getQrBno());
		}
		
		int result = qrService.regist(vo);
		
		return result;
	}
	
	//댓글 리스트
	@RequestMapping("/getReply/{qrBno}/{pageNum}")
	public QnaReplyPageVO getReply(@PathVariable("qrBno") int qrBno, @PathVariable("pageNum") int pageNum) {

		Criteria cri = new Criteria(pageNum, 5);
		QnaReplyPageVO vo = qrService.getReply(cri, qrBno);
		System.out.println(vo.toString());
		return vo;
	}
	
	//댓글 비밀번호 확인
	public int checkId(int qrNum, String qrId) {
		
		return qrService.checkId(qrNum, qrId);
	}
	
	//댓글 삭제
	@RequestMapping("/delete")
	public int delete(@RequestBody QnaReplyVO vo) {
		int result = qrService.checkId(vo.getQrNum(),vo.getQrId());
		if(result == 1) {
			System.out.println(vo.getQrId() + "삭제 컨트롤러");
			return qrService.delete(vo.getQrNum());
		}else {
			return 0;
		}
	}
	
	@RequestMapping("/update")
	public int update(@RequestBody QnaReplyVO vo) {
		int result = qrService.checkId(vo.getQrNum(), vo.getQrId());
		if(result == 1) {
			return qrService.update(vo);
		}else {
			return 0;
		}
	}	
	
}
