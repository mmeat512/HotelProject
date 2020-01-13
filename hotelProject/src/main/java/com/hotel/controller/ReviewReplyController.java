package com.hotel.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hotel.command.ReviewBoardVO;
import com.hotel.command.ReviewReplyVO;
import com.hotel.review.service.ReviewBoardService;
import com.hotel.review.service.ReviewReplyService;

@RestController
@RequestMapping("review")
public class ReviewReplyController {

	@Autowired
	@Qualifier("reviewReplyService")
	private ReviewReplyService reviewReplyService;
	
	@Autowired
	@Qualifier("reviewBoardService")
	private ReviewBoardService reviewBoardService;
	
	@RequestMapping("/replyRegist/{rBno}/{rId}/{rContent}")
	public ReviewBoardVO replyRegist(@PathVariable("rBno") int rBno,
							  @PathVariable("rId") String rId,
							  @PathVariable("rContent") String rContent) {
		ReviewReplyVO replyvo = new ReviewReplyVO();
		replyvo.setRBno(rBno);
		replyvo.setRId(rId);
		replyvo.setRContent(rContent);
		System.out.println(replyvo.toString());
		if(reviewReplyService.replyInsert(replyvo)) {
			return reviewBoardService.detail(rBno);
		}
		return null;
		
	}
	
	@RequestMapping("replyDelete/{rNum}")
	public ReviewBoardVO replyDelete(@PathVariable("rNum") int rNum){
		int replybno = reviewReplyService.replyBno(rNum);
		if(reviewReplyService.replyDelete(rNum)) {
			return reviewBoardService.detail(replybno);
		}else {
			return null;
		}
	}
	
	//좋아요
	@RequestMapping("likeUpdate/{likehit}/{reviewBno}")
	public int likeInsert(@PathVariable("likehit") int likehit,
						  @PathVariable("reviewBno") int reviewBno) {
		if(reviewBoardService.likeUpdate(likehit,reviewBno)) {
			return reviewBoardService.likeSel(reviewBno);
		}else {
			return 0;
		}
	}
	
	//좋아요
	@RequestMapping("userLike/{userId}/{reviewBno}")
	public String userLike(@PathVariable("userId") String rId,@PathVariable("reviewBno") int reviewBno) {
		System.out.println(rId);
		if(reviewBoardService.userLikeInsert(rId,reviewBno)) {
			return "success";
		}else{
			return "fail";
		}
	}
	
	//좋아요 아이디
	@RequestMapping("likeId/{reviewBno}")
	public ArrayList<String> likeId(@PathVariable("reviewBno") int reviewBno){
		return reviewBoardService.likeId(reviewBno);
	}
	
	

	

}
