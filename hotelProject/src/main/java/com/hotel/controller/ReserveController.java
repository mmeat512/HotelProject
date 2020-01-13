package com.hotel.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.command.HotelVO;
import com.hotel.command.ReserveVO;
import com.hotel.reserve.service.ReserveService;
import com.hotel.util.UploadPath;

@Controller
@RequestMapping("/reserve")
public class ReserveController {
	
	@Autowired
	@Qualifier("reserveService")
	private ReserveService reserveService;
	
	//예약날짜
	private String day = UploadPath.day();

	@RequestMapping("/reservePay")
	public String reservePay() {
		return "reserve/reservePay";
	}
	
	@RequestMapping("/reserveRoom")
	public String reserveRoom() {
		//reserveService.reserveSearch();
		return "reserve/reserveRoom";
	}
	
	@RequestMapping("/reserveOrder")
	public String reserveRegist(ReserveVO vo, Model model) {
		//예약번호 생성
		UUID uuid2 = UUID.randomUUID();
		String uuid1 = uuid2.toString().replace("-","");
		String uuid = uuid1.substring(0,6);
		String reserveDay = day.substring(2, 8);
		String reserveNum = reserveDay+uuid;
		//System.out.println("예약번호 : " + reserveNum);
		vo.setReserveNum(reserveNum);

		//예약자 정보 등록(예약번호, 예약자이름, 이메일, 전화번호)
		reserveService.reserveUserInsert(vo);
		
		//날짜for문 돌려서 날짜수만큼 db에 넣기
		String s1=vo.getReserveCheckin();
		String s2=vo.getReserveCheckout();
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date d1=sdf.parse(s1);
			Date d2=sdf.parse(s2);
			
			Calendar c1=Calendar.getInstance();
			Calendar c2=Calendar.getInstance();
			
			c1.setTime(d1);
			c2.setTime(d2);
			
			while(c1.compareTo(c2) <= 0) {
				//System.out.println(sdf.format(c1.getTime()));
				vo.setStayDate(sdf.format(c1.getTime()));
				//System.out.println(vo.toString());
				//staydate 개수 만큼 예약 등록
				reserveService.reserveInsert(vo);
				c1.add(Calendar.DATE,1);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return "redirect:/users/userReservePage";
	}
	
	
	

		@RequestMapping("/reserveSearchForm")
	    public String reserveSearchForm(@ModelAttribute("vo") ReserveVO vo,
	                            @RequestParam("room") int room) {
	       System.out.println(vo.toString());
	       return "reserve/reserveRoom";
	    }
	   
	   @RequestMapping("/reserveSearch")
	   @ResponseBody
	   public ArrayList<HotelVO> reserveSerch(@RequestBody ReserveVO reservevo) {
	      String checkin = reservevo.getReserveCheckin().replace(". ","-");
	      String checkout = reservevo.getReserveCheckout().replace(". ","-");
	      reservevo.setReserveCheckin(checkin.substring(0,checkin.lastIndexOf("-")));
	      reservevo.setReserveCheckout(checkout = checkout.substring(0,checkout.lastIndexOf("-")));
	      System.out.println(reservevo.toString());
	      return reserveService.reserveSearch(reservevo);
	   }
	   
	   @RequestMapping("/reserveForm")
	   public String reserveForm(@ModelAttribute("reserveVO") ReserveVO vo,
	                      @RequestParam("room") int room,
	                      @RequestParam("fileloca") String fileloca,
	                      @RequestParam("filename") String filename,
	                      @RequestParam("hotelname") String hotelname,
	                      @RequestParam("hotelprice") int hotelprice,
	                      Model model) {
	      String checkin = vo.getReserveCheckin().replace(". ","-");
	      String checkout = vo.getReserveCheckout().replace(". ","-");
	      vo.setReserveCheckin(checkin.substring(0,checkin.lastIndexOf("-")));
	      vo.setReserveCheckout(checkout = checkout.substring(0,checkout.lastIndexOf("-")));
	      System.out.println(vo.toString());
	      model.addAttribute("room", room);
	      model.addAttribute("hotelprice", hotelprice);
	      model.addAttribute("fileloca", fileloca);
	      model.addAttribute("filename", filename);
	      model.addAttribute("hotelname", hotelname);
	      return "reserve/reservePay";
	   }
	   
	   @RequestMapping("reserveDetail/{hotelname}")
	   @ResponseBody
	   public ArrayList<HotelVO> reserveDetail(@PathVariable("hotelname") String hotelname ) {
	      ArrayList<HotelVO> list = reserveService.reserveDetail(hotelname);
	      return list;
	   }

	
	
	
	
}
