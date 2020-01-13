package com.hotel.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hotel.command.QnaBoardVO;
import com.hotel.command.UserVO;
import com.hotel.qna.service.QnaBoardService;
import com.hotel.util.Criteria;
import com.hotel.util.PageVO;

@Controller
@RequestMapping("/qna")
public class QnaController {
	
	@Autowired
	@Qualifier("qnaBoardService")
	private QnaBoardService qnaBoardService;

	//문의글 등록 화면(회원일 때)
	@RequestMapping("/qnaUserRegist")
	public String qnaUserRegist(Model model, HttpSession session) {
		System.out.println(session.getAttribute("userId"));
		if(session != null) {
			String userId = (String)session.getAttribute("userId");
			System.out.println("userID : " + userId);
			UserVO vo = qnaBoardService.getRegist(userId);
			model.addAttribute("vo",vo);
		}
		return "qna/qnaRegist";
	}
	
	//문의글 등록(비회원일 때)
	@RequestMapping("/qnaRegist")
	public String qnaRegist() {
		return "qna/qnaRegist";
	}
	
	//문의글 등록 처리
	@RequestMapping("/qnaRegistForm")
	public String qnaRegistForm(QnaBoardVO vo, RedirectAttributes RA) {
		System.out.println(vo.toString());
		int result = qnaBoardService.qnaRegistForm(vo);
		if(result == 1) {
			RA.addFlashAttribute("msg","문의글 등록에 성공하였습니다");
		}else {
			RA.addFlashAttribute("msg","문의글 등록에 실패하였습니다");
		}
		return "redirect:/qna/qnaList";
	}
	
	//문의글 리스트(페이징&검색)
	@RequestMapping("/qnaList")
	public void qnaList(Model model, Criteria cri) {
		ArrayList<QnaBoardVO> qnaList = qnaBoardService.getQnaBoardList(cri);
		int total = qnaBoardService.getTotal(cri);
		//System.out.println("total:" + total);
		
		PageVO pageVO = new PageVO(cri, total);
		//System.out.println(pageVO.toString());
		
		model.addAttribute("qnaList",qnaList);
		model.addAttribute("pageVO",pageVO);
	}

	//상세보기 화면
	@RequestMapping(value= {"/qnaDetail", "/qnaModify", "/qnaPwCheck"})
	public void qnaView(@RequestParam("qnaBno") int qnaBno, Model model) {
		QnaBoardVO vo = qnaBoardService.getContent(qnaBno);
		model.addAttribute("vo",vo);
	}
	
	//문의글 업데이트 처리
	@RequestMapping("/qnaUpdate")
	public String qnaUpdate(QnaBoardVO vo, RedirectAttributes RA) {
		System.out.println(vo.toString());
		boolean result = qnaBoardService.qnaUpdate(vo);
		if(result == true) {//업데이트 성공
			RA.addFlashAttribute("msg","업데이트 성공");
		}else{
			RA.addFlashAttribute("msg","업데이트 실패");
		}
		return "redirect:/qna/qnaList";
	}
	
	//문의글 삭제 처리
	@RequestMapping("/qnaDelete")
	public String qnaDelete(QnaBoardVO vo, RedirectAttributes RA) {
		boolean result = qnaBoardService.qnaDelete(vo);
		if(result == true) {
			RA.addFlashAttribute("msg","문의글 삭제 성공");
		}else {
			RA.addFlashAttribute("msg","문의글 삭제 실패");
		}
		return "redirect:/qna/qnaList";
	}

	
}
