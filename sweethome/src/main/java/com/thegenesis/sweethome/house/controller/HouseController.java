package com.thegenesis.sweethome.house.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.thegenesis.sweethome.house.model.service.HouseService;
import com.thegenesis.sweethome.house.model.vo.House;
import com.thegenesis.sweethome.room.model.service.RoomService;
import com.thegenesis.sweethome.room.model.vo.Room;

@Controller
public class HouseController {
	
	@Autowired
	private HouseService houseService;
	
	@Autowired
	private RoomService roomService;
	
	// 테스트용
	@RequestMapping("houseInsert")
	public String houseInsert() {
		return "house/houseInsert";
	}
	
	/**
	 * 하우스 등록
	 */
	@RequestMapping("insertHouse.ho")
	public ModelAndView insertHouse(House h, Room r, ModelAndView mv) {
		
		// textarea 줄바꿈 => <br> 처리
		h.setHouseTitle(h.getHouseTitle().replace(System.lineSeparator(), "<br>"));
		h.setHouseIntroduce(h.getHouseIntroduce().replace(System.lineSeparator(), "<br>"));
		h.setShareSpace(h.getShareSpace().replace(System.lineSeparator(), "<br>"));
		h.setPersonalSpace(h.getPersonalSpace().replace(System.lineSeparator(), "<br>"));
		h.setTraffic(h.getTraffic().replace(System.lineSeparator(), "<br>"));
		h.setConvenience(h.getConvenience().replace(System.lineSeparator(), "<br>"));
		
		int result = houseService.insertHouse(h);
		
		System.out.println(h.getHouseName());
		
		House h2 = houseService.selectHouse(h.getHouseName());
		
		System.out.println(h2);
		
		
		mv.addObject("h2", h2).setViewName("main");
		
		
		
		return mv;
		
	}
	
	
}
