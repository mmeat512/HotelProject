package com.hotel.admin.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hotel.command.BookingVO;
import com.hotel.command.HotelVO;
import com.hotel.command.ReserveVO;
import com.hotel.command.RoomVO;
import com.hotel.command.SpecialIntVO;
import com.hotel.util.Criteria;

public interface AdminMapper {
	public int roomInsert(HotelVO vo); //객실사진추가
	public ArrayList<HotelVO> roomgetList();//객실리스트출력
	public HotelVO roomgetInfo(String hotelName);//객실디테일화면
	public int specialInsert(SpecialIntVO vo);//스페셜 오퍼 추가
	public ArrayList<HotelVO> specialgetList();//스페셜오퍼 리스트 출력
	public SpecialIntVO SpecialgetInfo(String specialName);//스페셜오퍼 디테일
	public boolean specialUpdate(SpecialIntVO vo);//스페셜오퍼 수정
	public boolean roomUpdate(HotelVO vo);//객실 수정
	public boolean roomDelete(String hotelName);//객실삭제
	public boolean specialDelete(String specialName);//스페셜오퍼삭제
	
	public ArrayList<ReserveVO> reservegetList(Criteria cri);//현재예약현황리스트
	public ReserveVO reservemodal(String reserveNum);//현제예약현황모달
	public boolean  reserveUpdate(ReserveVO vo);//현재예약현황모달수정
	public boolean  reserveDelete(String reserveNum);//현재예약현황모달삭제
	
	public boolean deleteInsert(ReserveVO vo);//delete DB에 insert
	public boolean deleteState();//delete 상태변경
	
	public ArrayList<ReserveVO> totalgetList(Criteria cri);//전체예약리스트
	public boolean reserveState();//전체예약리스트 상태수정
	
	public ArrayList<ReserveVO> RoomgetList(Criteria cri);//객실신청현황
	public ArrayList<RoomVO> selectgetList(ReserveVO vo);//객실배정화면리스트
	public boolean roomSel(@Param("roomNum") String roomNum,@Param("reserveNum") String reserveNum);//객실배정과정
	
}

