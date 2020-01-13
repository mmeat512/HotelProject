package com.hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hotel")
public class HotelController {

	@RequestMapping("/hotelIntro")
	public String hotelIntro() {
		return "hotel/hotelIntro";
	}
	@RequestMapping("/hotelSpecial")
	public String hotelSpecial() {
		return "hotel/hotelSpecial";
	}

}
