package com.hotel.reserve.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.command.HotelVO;
import com.hotel.command.ReserveVO;
import com.hotel.reserve.mapper.ReserveMapper;

@Service("reserveService")
public class ReserveServiceImpl implements ReserveService{

   @Autowired
   private ReserveMapper reserveMapper;
   
   @Override
   public void reserveInsert(ReserveVO vo) {
       reserveMapper.reserveInsert(vo);
   }

   @Override
   public void reserveUserInsert(ReserveVO vo) {
       reserveMapper.reserveUserInsert(vo);
   }

   @Override
   public ArrayList<HotelVO> reserveSearch(ReserveVO vo) {
      return reserveMapper.reserveSearch(vo);
   }

   @Override
   public ArrayList<HotelVO> reserveDetail(String hotelName) {
      return reserveMapper.reserveDetail(hotelName);
   }

   
}