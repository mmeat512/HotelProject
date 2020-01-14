package com.hotel.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hotel.command.ReserveVO;
import com.hotel.command.UserVO;
import com.hotel.review.service.ReviewBoardService;
import com.hotel.user.service.UserService;

@Controller
@RequestMapping("/users")
public class UserController {

	@Autowired
	@Qualifier("userService")
	private UserService userService;
	
	@Autowired
	@Qualifier("reviewBoardService")
	private ReviewBoardService reviewBoardService;
	
	@RequestMapping("/userJoin")
	public String userJoin() {
		return "users/userJoin";
	}

	// 회원가입form
	@RequestMapping("/joinForm")
	public String joinForm(UserVO userVO, RedirectAttributes RA) {
		System.out.println(userVO.toString());
		if (userService.insert(userVO)) {
			return "users/userLogin";
		} else {
			RA.addFlashAttribute("msg", "가입에 실패했습니다.");
			return "redirect:/users/userJoin";
		}
	}

	@RequestMapping("/userLogin")
	public String userLogin() {
		return "users/userLogin";
	}

	// 아이디,비밀번호 찾기
	@RequestMapping("/findInfo")
	@ResponseBody
	public String findInfo(@RequestBody UserVO userVO) {
		System.out.println(userVO.toString());
		return userService.findInfo(userVO);
	}

	// 로그인form
	@RequestMapping("/loginForm")
	public String loginForm(UserVO userVO, HttpSession session, RedirectAttributes RA) {
		if (userService.loginCheck(userVO)) {
			System.out.println(userService.myPage(userVO.getUserId()).toString());
			session.setAttribute("userId", userVO.getUserId());
			session.setAttribute("userName", userService.myPage(userVO.getUserId()).getUserName());
			return "home";
		} else {
			RA.addFlashAttribute("msg", "아이디와 비밀번호를 확인해 주세요");
			return "redirect:/users/userLogin";
		}

	}

	// 아이디중복확인
	@RequestMapping("/idCheck/{userId}")
	@ResponseBody
	public int idCheck(@PathVariable("userId") String userId) {
		System.out.println(userId);
		return userService.idCheck(userId);
	}

	// 마이페이지 화면이동
	@RequestMapping("/userMypage")
	public String userMypage(Model model, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		model.addAttribute("uservo", userService.myPage(userId));

		// 마이페이지 내 문의 리스트
		model.addAttribute("qnaList", userService.getMypageQna(userId));

		// 마이페이지 예약현황 리스트
		ArrayList<ReserveVO> reserveList = userService.getReserve(userId);
		for (int i = 0; i < reserveList.size(); i++) {
			ReserveVO vo = reserveList.get(i);
			if(vo.getReserveState().equals("pay")) {
				vo.setReserveState("결제완료");
			}else if (vo.getReserveState().equals("now")) {
				vo.setReserveState("예약완료");
			} else if (vo.getReserveState().equals("past")) {
				vo.setReserveState("이용완료");
			} else {
				vo.setReserveState("예약취소");
			}
		}
		model.addAttribute("reserveList", reserveList);
		System.out.println(reserveList);
		model.addAttribute("att", "mypage");
		// System.out.println(userService.myPage(userId).toString());
		
		//마이페이지 내 후기 리스트
		model.addAttribute("reviewList", userService.getMypageReview(userId));
		
		
		return "users/userMypage";
	}

	// 마이페이지 수정하기
	@RequestMapping("/userUpdate")
	@ResponseBody
	public String userUpdate(@RequestBody UserVO userVO) {
		return userService.userUpdate(userVO) == 1 ? "success" : "fail";
	}

	// 회원탈퇴하기
	@RequestMapping("/userDelete")
	public String userDelete(@RequestParam("userId") String userId, @RequestParam("userPw") String userPw,
			RedirectAttributes RA) {
		int result = userService.userDelete(userId, userPw);
		if (result == 1) {
			return "home";
		} else {
			RA.addFlashAttribute("msg", "회원탈퇴가 실패했습니다.");
			return "redirect:/users/userMypage";
		}
	}

	// 예약확인 화면이동
	@RequestMapping("/userReservePage")
	public String userReservePage(Model model, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		model.addAttribute("uservo", userService.myPage(userId));

		// 마이페이지 내 문의 리스트
		model.addAttribute("qnaList", userService.getMypageQna(userId));

		// 마이페이지 예약현황 리스트
		ArrayList<ReserveVO> reserveList = userService.getReserve(userId);
	      for(int i = 0; i < reserveList.size(); i++) {
	  		if(reserveList.get(i).getReserveState().equals("pay")) {
				reserveList.get(i).setReserveState("결제완료");
			}else if(reserveList.get(i).getReserveState().equals("now")) {
				reserveList.get(i).setReserveState("예약완료");
			}else if(reserveList.get(i).getReserveState().equals("past")) {
				reserveList.get(i).setReserveState("이용완료");
			}else {
				reserveList.get(i).setReserveState("예약취소");
			}
	          
	       }
		model.addAttribute("reserveList", reserveList);

		model.addAttribute("att", "reserve");
		return "users/userMypage";
	}

	//로그아웃
	   @RequestMapping("/userLogout")
	   public String userLogout(HttpSession session,RedirectAttributes RA) {
		   session.invalidate();
		   RA.addFlashAttribute("msg", "로그아웃되었습니다.");
		   return "redirect:/"; 
	   }

	// 마이페이지 예약 상세보기
	@RequestMapping("/userReserveDetail/{reserveNum}")
	@ResponseBody
	public ReserveVO userReserveDetail(@PathVariable("reserveNum") String reserveNum) {
		System.out.println(reserveNum);
		ReserveVO vo = userService.userReserveDetail(reserveNum);
		return vo;
	}

	
	 //마이페이지 예약 취소
	 @RequestMapping("/reserveDelete/{reserveNum}")
	 @ResponseBody 
	 public boolean reserveDelete(@PathVariable("reserveNum") String reserveNum) {
		 ReserveVO vo = userService.userReserveDetail(reserveNum);
		 boolean result = userService.reserveDelete(reserveNum);
		 boolean result2;
		 if(result) {
			 //예약취소건 취소디비에 삽입
			 vo.setReserveState("delete");
			 result2 = userService.insertReserveDelete(vo);
		 }else {
			 result2 = false;
		 }
		 return result2;
	 }

	 

}