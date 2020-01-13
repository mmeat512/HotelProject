package com.hotel.reserve.service;

import java.util.ArrayList;

import com.hotel.command.HotelVO;
import com.hotel.command.ReserveVO;

public interface ReserveService {
   
   public void reserveInsert(ReserveVO vo);//예약정보 등록
   public void reserveUserInsert(ReserveVO vo);//예약자 정보 등록
   //예약검색
   public ArrayList<HotelVO> reserveSearch(ReserveVO vo);
   public ArrayList<HotelVO> reserveDetail(String hotelName);
}