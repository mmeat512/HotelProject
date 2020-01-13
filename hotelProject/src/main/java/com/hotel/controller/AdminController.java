package com.hotel.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hotel.admin.service.AdminService;
import com.hotel.command.BookingVO;
import com.hotel.command.HotelVO;
import com.hotel.command.ReserveVO;
import com.hotel.command.RoomVO;
import com.hotel.command.SpecialIntVO;
import com.hotel.util.Criteria;
import com.hotel.util.UploadPath;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	@Qualifier("adminService")
	private AdminService adminService;

	//파일업로드
	private String uploadpth = UploadPath.uploadPath(); 
	private String day = UploadPath.day();
	
	@RequestMapping("/adminMain")
	public String adminMain() {
		return "admin/adminMain";
	}
	@RequestMapping("/adminTotal")
	public String adminTotal() {
		return "admin/adminTotal";
	}
	
   @RequestMapping("/adminRoomRegist")
   public String adminRegist() {
      return "admin/adminRoomRegist";
   }
   
   
   @RequestMapping("/adminRoomList")
   public String adminRoomList() {
      return "admin/adminRoomList";
   }

   @RequestMapping("/adminReserve")
   public String adminReserve() {
	   return "admin/adminReserve";
   }
   
   @RequestMapping("/adminSelect")
   public String adminSelect(@RequestParam("reserveNum") String reserveNum,Model model) {
	   System.out.println("asd"+reserveNum);
	   ReserveVO vo=adminService.reservemodal(reserveNum);
	   System.out.println("as:"+vo);
	   model.addAttribute("vo", vo);
	   return "admin/adminSelect";
   }

   @RequestMapping("/adminRoomDetail")
   public String adminRoomDetail(@RequestParam("hotelName") String hotelName,Model model) {
    
	   model.addAttribute("HotelVO", adminService.roomgetInfo(hotelName));
	   return "admin/adminRoomDetail";
   }
   
   @RequestMapping("/selectgetList")
   @ResponseBody
   public ArrayList<RoomVO> selectgetList(@RequestBody ReserveVO vo){
	   System.out.println("sel:"+vo);
	   ArrayList<RoomVO> room=adminService.selectgetList(vo);
	   System.out.println("ser:"+room);
	   return room;
   }
   
   @RequestMapping("/adminSpecialRegist")
   public String adminSpecialRegist() {
      return "admin/adminSpecialRegist";
   }
   
   @RequestMapping("/adminSpecialList")
   public String adminSpecialList() {
      return "admin/adminSpecialList";
   }
   
   @RequestMapping("/adminSpecialDetail")
   public String adminSpecialDetail(@RequestParam("specialName") String specialName,Model model) {
      
	   model.addAttribute("SpecialUntVO", adminService.SpecialgetInfo(specialName));
	   return "admin/adminSpecialDetail";
   }
   
   @RequestMapping("/roomSel")
   public String roomSel(@RequestParam("reroom") String roomNum,@RequestParam("renum") String reserveNum,RedirectAttributes RA){
	   System.out.println("bool="+roomNum);
	   System.out.println("bool="+reserveNum);
	   if(adminService.roomSel(roomNum, reserveNum)) {
		   RA.addFlashAttribute("msg", roomNum+"호 배정이 완료되었습니다");
		   return "redirect:/admin/adminMain";
	   }else {
		   RA.addFlashAttribute("msg", roomNum+"호 배정이 실패하였습니다");
		   return "redirect:/admin/adminMain";
	   }
	   
   }
   
  //객실등록메서드
   @RequestMapping(value = "/roomRegist")
   public String roomRegist(HotelVO vo,MultipartFile file) {
	   System.out.println("컨트롤러");
	   
	   //roomupload폴더 생성
	   UploadPath.roomFolder();
	   
	   String uploadPath=this.uploadpth+"roomUpload\\"+day;
	   File folder=new File(uploadPath);
	   if( ! folder.exists()) {
		   folder.mkdir();
	   }
	   String fileRealName=file.getOriginalFilename();
	   String fileLoca=day;
	   
	   String fileName=fileRealName;
	   
	   try {
		   File savefile=new File(uploadPath+"\\"+fileName);
			file.transferTo(savefile);
	   } catch (Exception e) {
		e.printStackTrace();
	   }
	   vo.setHotelfileLoca(fileLoca);
	   vo.setHotelfilename(fileName);
	   vo.setHotelfileRealname(fileRealName);
	   vo.setHotelfileUploadpath(uploadPath);
	   System.out.println(vo.toString());
	   adminService.roomInsert(vo);
	   
	   return "admin/adminRoomList";
   }
   //스페셜오퍼등록메서드
   @RequestMapping("/sepecialRegist")
   public String sepecialRegist(SpecialIntVO vo,MultipartFile file) {
	   
	   //specialUpload폴더 생성
	   UploadPath.specialFolder();
	   
	   String uploadPath=this.uploadpth+"specialUpload\\"+day;
	   File folder=new File(uploadPath);
	   if( ! folder.exists()) {
		   folder.mkdir();
	   }
	   String fileRealName=file.getOriginalFilename();
	   String fileLoca=day;
	   
	   
	   String fileName=fileRealName;
	   
	   try {
		   File savefile=new File(uploadPath+"\\"+fileName);
			file.transferTo(savefile);
	   } catch (Exception e) {
		e.printStackTrace();
	   }
	   vo.setSpecialfileloca(fileLoca);
	   vo.setSpecialfilename(fileName);
	   vo.setSpecialfilerealname(fileRealName);
	   vo.setSpecialfileuploadpath(uploadPath);
	   
	   System.out.println(vo.toString());
	   
	   adminService.specialInsert(vo);
	   
	   return "admin/adminSpecialList";
   }
   
   //객실리스트
   @RequestMapping("/roomgetList")
   @ResponseBody
   public ArrayList<HotelVO> roomgetList(){
	   ArrayList<HotelVO> list=adminService.roomgetList();
	   return list;
   }
   
   //스페셜오퍼리스트
   @RequestMapping("/specialgetList")
   @ResponseBody
   public ArrayList<HotelVO> specialgetList(){
	   ArrayList<HotelVO> list=adminService.specialgetList();
	   System.out.println(list);
	   return list;
   }
   
   	//사진보기
 	@RequestMapping("/view")
 	@ResponseBody
 	public byte[] view(@RequestParam("fileLoca") String fileLoca,
 						@RequestParam("filename") String filename,
 						@RequestParam("Name") String Name) {
 		System.out.println(Name);
 		byte[] result =null;
 		try {
 			File file=null;
 			if(Name.contains("Room")) { //객실
 				file=new File(this.uploadpth+"roomUpload\\"+fileLoca+"\\"+filename);
 			}else {//스페셜 오퍼 
 				file=new File(this.uploadpth+"specialUpload\\"+fileLoca+"\\"+filename);
 			}
 			result=FileCopyUtils.copyToByteArray(file);
 		
 		} catch (Exception e) {
 			e.printStackTrace();
 		}
 		return result;
 	}
 	
 	//스페셜오퍼수정
 	@RequestMapping("/sepecialUpdate")
 	public String specialUpdate(SpecialIntVO vo) {
 		if(adminService.specialUpdate(vo)) {
 			System.out.println(vo);
 			return "admin/adminSpecialList";
 		}else {
 			return "admin/adminSpecialList";
 		}
 	}
 	
 	//객실수정
 	@RequestMapping("/RoomUpdate")
 	public String RoomUpdate(HotelVO vo) {
 		if(adminService.roomUpdate(vo)) {
 			System.out.println(vo);
 			return "admin/adminRoomList";
 		}else {
 			return "admin/adminRoomList";
 		}
 	}
 	
 	//객실삭제
 	@RequestMapping("/roomDelete")
 	public String roomDelete(@RequestParam("hotelName") String hotelName){
 		System.out.println(hotelName);
 		HotelVO vo=adminService.roomgetInfo(hotelName);
 		System.out.println(vo.toString());
 		System.out.println(vo.getHotelfileUploadpath() +"\\"+vo.getHotelfilename());
 		boolean bool=adminService.roomDelete(hotelName);
 		 
		 if(bool) {//DB에서 삭제 성공
			 File file=new File(vo.getHotelfileUploadpath() +"\\"+vo.getHotelfilename());
			 file.delete();
			 return "redirect:/admin/adminRoomList";
		 }else {//삭제실패
			 return "redirect:/admin/adminRoomList";
		 }
 	
 	}
 	
 	//스페셜오퍼삭제
 	@RequestMapping("/specialDelete")
 	public String specialDelete(@RequestParam("specialName") String specialName){
 		System.out.println(specialName);
 		SpecialIntVO vo=adminService.SpecialgetInfo(specialName);
 		boolean bool=adminService.specialDelete(specialName);
 		
 		 if(bool) {//DB에서 삭제 성공
			 File file=new File(vo.getSpecialfileuploadpath() +"\\"+vo.getSpecialfilename());
			 file.delete();
			 return "redirect:/admin/adminSpecialList";
		 }else {//삭제실패
			 return "redirect:/admin/adminSpecialList";
		 }
 		
 	}
 	
 	//현재 예약현황리스트
 	@RequestMapping("/reservegetList/{searchType}/{searchName}")
 	@ResponseBody
 	public ArrayList<ReserveVO> reservegetList(@PathVariable("searchType") String searchType,@PathVariable("searchName") String searchName){
 		Criteria cri=new Criteria();
		cri.setSearchType(searchType);
		cri.setSearchName(searchName);
		System.out.println("cri: "+cri.toString());
 		System.out.println(adminService.reservegetList(cri));
 		return adminService.reservegetList(cri);
 	}
 	
 	//객실선택리스트
 	 @RequestMapping("/RoomgetList/{searchType}/{searchName}")
 	 @ResponseBody
 	public ArrayList<ReserveVO> RoomgetList(@PathVariable("searchType") String searchType,@PathVariable("searchName") String searchName){
 	 	Criteria cri=new Criteria();
 		cri.setSearchType(searchType);
 		cri.setSearchName(searchName);
 		System.out.println("cri2: "+cri.toString());
 	 	System.out.println("cri2: "+adminService.RoomgetList(cri));
 	 	return adminService.RoomgetList(cri);
 	 }
 	
 	//예약리스트 모달,객실선택모달
	@RequestMapping("/reservemodal/{reserveNum}")
	@ResponseBody 
	public ReserveVO reservemodal(@PathVariable("reserveNum") String reserveNum){
		System.out.println(reserveNum);
		System.out.println(adminService.reservemodal(reserveNum));
		return adminService.reservemodal(reserveNum);
	}
	
	//현재 예약리스트 모달 수정
	@RequestMapping(value = "/reserveUpdate")
	@ResponseBody
	public boolean reserveUpdate(@RequestBody ReserveVO vo){
		System.out.println("수정위한 vo:"+vo.toString());
		boolean result =adminService.reserveUpdate(vo);
		System.out.println("수정 후: "+result);
		return result;
	}
	
	//현재 예약리스트 모달 삭제
	@RequestMapping("/reserveDelete/{reserveNum}")
	@ResponseBody
	public boolean reserveDelete(@PathVariable("reserveNum") String reserveNum){
		System.out.println("삭제:"+reserveNum);
		System.out.println(reserveNum);
		ReserveVO vo=adminService.reservemodal(reserveNum);
		System.out.println(vo.toString());
		//System.out.println(adminService.deleteInsert(vo));
		
		boolean result=adminService.reserveDelete(reserveNum);
		if(result) {
			adminService.deleteInsert(vo);
			adminService.deleteState();
		}else {
			System.out.println("예약 DB삭제 실패");
		}
		
		return result;
	}
	
	//전체 예약리스트
	@RequestMapping("/totalgetList/{searchType}/{searchName}")
	@ResponseBody
	public ArrayList<ReserveVO> totalgetList(@PathVariable("searchType") String searchType,@PathVariable("searchName") String searchName){
		Criteria cri=new Criteria();
		cri.setSearchType(searchType);
		cri.setSearchName(searchName);
		System.out.println("cri: "+cri.toString());
		System.out.println("전체:"+adminService.totalgetList(cri));
		return adminService.totalgetList(cri);
		
	}
	
	//전체 예약리스트 상태수정
	@RequestMapping("/reserveState")
	@ResponseBody
	public boolean reserveState() {
		return adminService.reserveState();
	}
	
	 
}











