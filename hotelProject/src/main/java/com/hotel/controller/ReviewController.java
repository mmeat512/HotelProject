package com.hotel.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hotel.command.ReviewBoardVO;
import com.hotel.review.service.ReviewBoardService;
import com.hotel.util.Criteria;
import com.hotel.util.PageVO;
import com.hotel.util.UploadPath;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	@Qualifier("reviewBoardService")
	private ReviewBoardService reviewBoardService; 

	//파일업로드 경로
	private String reviewfileUploadpath = UploadPath.uploadPath();
	private String day = UploadPath.day();
	
	@RequestMapping("/reviewDetail")
	public String reviewDetail(@RequestParam("reviewbno") int reviewbno, Model model) {
		model.addAttribute("vo", reviewBoardService.detail(reviewbno));
		return "review/reviewDetail";
	}
	
	//삭제form
	@RequestMapping("/reviewDelForm")
	public String reviewDelForm(@RequestParam("reviewBno") int reviewBno,
								RedirectAttributes RA) {
		if(reviewBoardService.detail(reviewBno) != null) {
			ReviewBoardVO  vo = reviewBoardService.detail(reviewBno);
			File file = new File(vo.getReviewfileUploadpath());
			if(file != null || file.exists()) {
				file.delete();
			}
			reviewBoardService.delete(reviewBno);
			RA.addFlashAttribute("msg","게시글이 삭제되었습니다.");
		}else {
			RA.addFlashAttribute("msg", "게시글 삭제가 실패했습니다.");
		}
		return "redirect:/review/reviewList";
	}
	
	//수정form
	@RequestMapping("/updateForm")
	public String update(@RequestParam("file") MultipartFile file,
						 @RequestParam("empty") String empty,
						 ReviewBoardVO vo) {
		String reviewfilerealname = file.getOriginalFilename();
		if(reviewfilerealname.trim().equals("") && empty.trim().equals("notEmpty")) {
			ReviewBoardVO prevo = reviewBoardService.detail(vo.getReviewBno());
			vo.setReviewfileloca(prevo.getReviewfileloca());
			vo.setReviewfilename(prevo.getReviewfilename());
			vo.setReviewfilerealname(prevo.getReviewfilerealname());
			vo.setReviewfileUploadpath(prevo.getReviewfileUploadpath());
			reviewBoardService.update(vo);
		}else if(reviewfilerealname.trim().equals("") && empty.equals("empty")) {
			vo.setReviewfileloca("");
			vo.setReviewfilename("");
			vo.setReviewfilerealname("");
			vo.setReviewfileUploadpath("");
			reviewBoardService.update(vo);
		}else {
			//기존파일 삭제
			ReviewBoardVO prevo = reviewBoardService.detail(vo.getReviewBno());
			File prefile = new File(reviewfileUploadpath+prevo.getReviewfileloca()+prevo.getReviewfilename());
			if(prefile.exists()) {
				prefile.delete();
			}
			
			//새로운파일 생성
			File folder = new File(reviewfileUploadpath+day);
			if(!folder.exists()) {
				folder.mkdir();
			}
			
			String extension = reviewfilerealname.substring(reviewfilerealname.lastIndexOf("."), reviewfilerealname.length());
			
			UUID uuid1 = UUID.randomUUID();
			String uuid2 = uuid1.toString().replace("-", "");
			String uuid = uuid2.substring(0, 8);
			
			String reviewfilename = uuid+extension;
			String reviewfileloca = day;
			String reviewfileUploadpath = this.reviewfileUploadpath + day;
			
			File newfile = new File(reviewfileUploadpath+"\\"+reviewfilename);
			try {
				file.transferTo(newfile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			vo.setReviewfileloca(reviewfileloca);
			vo.setReviewfilename(reviewfilename);
			vo.setReviewfilerealname(reviewfilerealname);
			vo.setReviewfileUploadpath(reviewfileUploadpath);
			
			reviewBoardService.update(vo);
		}
		
		return "redirect:/review/reviewList";
	}
	
	@RequestMapping("/reviewList")
	public String reviewList(Model model,Criteria cri) {
		PageVO vo = new PageVO(cri, reviewBoardService.getTotal(cri));
		System.out.println(cri.toString());
		//ArrayList<ReviewBoardVO> list = reviewBoardService.getList(cri);
		//model.addAttribute("list",list);
		ArrayList<ReviewBoardVO> list = reviewBoardService.getList(cri);
		System.out.println(list.toString());
		System.out.println(reviewBoardService.getTotal(cri));
		model.addAttribute("list", list);
		model.addAttribute("pageVO",vo);
		return "review/reviewList";
	}
	
	@RequestMapping("/reviewRegist")
	public String reviewRegist() {
		return "review/reviewRegist";
	}
	
	//게시글등록 form
	@RequestMapping("/reviewForm")
	public String reviewRegist(@RequestParam("file") MultipartFile file,
								ReviewBoardVO reviewVO,
								RedirectAttributes RA) {
		
		File folder = new File(reviewfileUploadpath+day);
		
		if(!folder.exists()) {
			folder.mkdir();
		}
		//파일이름
		String reviewfilerealname = file.getOriginalFilename();

		//파일이 존재하지 않으면 파일을 저장하지않음.
		if(!reviewfilerealname.trim().equals("")) {
			String extension = reviewfilerealname.substring(reviewfilerealname.lastIndexOf("."), reviewfilerealname.length());
			
			//저장될파일이름
			UUID uuid2 = UUID.randomUUID();
			String uuid1 = uuid2.toString().replace("-","");
			String uuid = uuid1.substring(0,8);
			
			String reviewfilename = uuid+extension;
			String reviewfileloca = day;
			
			reviewVO.setReviewfilename(reviewfilename);
			reviewVO.setReviewfileloca(reviewfileloca);
			reviewVO.setReviewfilerealname(reviewfilerealname);
			reviewVO.setReviewfileUploadpath(reviewfileUploadpath+day);
			
			//파일저장
			File savefile = new File(reviewfileUploadpath+day+"\\"+reviewfilename);
			try {
				file.transferTo(savefile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			reviewVO.setReviewfilename("");
			reviewVO.setReviewfileloca("");
			reviewVO.setReviewfilerealname("");
			reviewVO.setReviewfileUploadpath("");
		}
		if(reviewBoardService.reviewRegist(reviewVO)) {
			RA.addFlashAttribute("msg","게시글이 정상적으로 등록되었습니다.");
			return "redirect:/review/reviewList";			
		}else {
			RA.addFlashAttribute("msg","게시글 등록이 실패했습니다.");
			return "redirect:/review/reviewRegist";
		}
		
	}
	
	//디테일모달
	@RequestMapping("/detail/{reviewbno}")
	@ResponseBody
	public ReviewBoardVO detail(@PathVariable("reviewbno") int reviewbno) {
		System.out.println(reviewBoardService.detail(reviewbno));
		return reviewBoardService.detail(reviewbno);
	}
	
	//디테일 모달 이미지
	@RequestMapping("/viewImg")
	@ResponseBody
	public byte[] viewImg(@RequestParam("fileLoca") String reviewfileloca,
						  @RequestParam("filename") String reviewfilename) {
		File file = new File(reviewfileUploadpath+reviewfileloca+"\\"+reviewfilename);
		byte[] result = null;
		try {
			result = FileCopyUtils.copyToByteArray(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping("/reviewLInter")
	   public String loginInterceptor() {
	      return "redirect:/review/reviewList";
	   }
	

	
}
