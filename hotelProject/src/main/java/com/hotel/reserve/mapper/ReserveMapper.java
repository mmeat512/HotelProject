package com.hotel.reserve.mapper;

import java.util.ArrayList;

import com.hotel.command.HotelVO;
import com.hotel.command.ReserveVO;

public interface ReserveMapper {

   public void reserveInsert(ReserveVO vo);//예약정보 등록
   public void reserveUserInsert(ReserveVO vo);//예약자 정보 등록
   public int reserveDelete(String reserveNum);//예약취소
   public ArrayList<HotelVO> reserveSearch(ReserveVO vo);
   public ArrayList<HotelVO> reserveDetail(String hotelName);
}