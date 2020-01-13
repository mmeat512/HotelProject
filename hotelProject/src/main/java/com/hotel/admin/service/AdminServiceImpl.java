package com.hotel.admin.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.hotel.admin.mapper.AdminMapper;
import com.hotel.command.BookingVO;
import com.hotel.command.HotelVO;
import com.hotel.command.ReserveVO;
import com.hotel.command.RoomVO;
import com.hotel.command.SpecialIntVO;
import com.hotel.util.Criteria;

@Service("adminService")
@Repository
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public int roomInsert(HotelVO vo) {
		return adminMapper.roomInsert(vo);
	}

	@Override
	public ArrayList<HotelVO> roomgetList() {
		return adminMapper.roomgetList();
	}

	@Override
	public HotelVO roomgetInfo(String hotelName) {
		return adminMapper.roomgetInfo(hotelName);
	}

	@Override
	public int specialInsert(SpecialIntVO vo) {
		return adminMapper.specialInsert(vo);
	}

	@Override
	public ArrayList<HotelVO> specialgetList() {
		return adminMapper.specialgetList();
	}

	@Override
	public SpecialIntVO SpecialgetInfo(String specialName) {
		return adminMapper.SpecialgetInfo(specialName);
	}

	@Override
	public boolean specialUpdate(SpecialIntVO vo) {
		return adminMapper.specialUpdate(vo);
	}

	@Override
	public boolean roomUpdate(HotelVO vo) {
		return adminMapper.roomUpdate(vo);
	}

	@Override
	public boolean roomDelete(String hotelName) {
		return adminMapper.roomDelete(hotelName);
	}

	@Override
	public boolean specialDelete(String specialName) {
		return adminMapper.specialDelete(specialName);
	}

	@Override
	public ArrayList<ReserveVO> reservegetList(Criteria cri) {
		return adminMapper.reservegetList(cri);
	}

	@Override
	public ReserveVO reservemodal(String reserveNum) {
		return adminMapper.reservemodal(reserveNum);
	}

	@Override
	public boolean reserveUpdate(ReserveVO vo) {
		return adminMapper.reserveUpdate(vo);
	}

	@Override
	public boolean reserveDelete(String reserveNum) {
		return adminMapper.reserveDelete(reserveNum);
	}

	@Override
	public ArrayList<ReserveVO> totalgetList(Criteria cri) {
		return adminMapper.totalgetList(cri);
	}

	@Override
	public boolean reserveState() {
		return adminMapper.reserveState();
	}

	@Override
	public boolean deleteInsert(ReserveVO vo) {
		return adminMapper.deleteInsert(vo);
	}

	@Override
	public boolean deleteState() {
		return adminMapper.deleteState();
	}

	@Override
	public ArrayList<ReserveVO> RoomgetList(Criteria cri) {
		return adminMapper.RoomgetList(cri);
	}

	@Override
	public ArrayList<RoomVO> selectgetList(ReserveVO vo) {
		return adminMapper.selectgetList(vo);
	}

	@Override
	public boolean roomSel(String roomNum, String reserveNum) {
		return adminMapper.roomSel(roomNum, reserveNum);
	}
	
	

}
