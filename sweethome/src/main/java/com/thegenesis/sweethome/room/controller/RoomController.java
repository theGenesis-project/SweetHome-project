package com.thegenesis.sweethome.room.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.thegenesis.sweethome.house.model.vo.House;
import com.thegenesis.sweethome.room.model.service.RoomService;
import com.thegenesis.sweethome.room.model.vo.Room;



@Controller
public class RoomController {
	
	@Autowired
	private RoomService roomService;
	

	@RequestMapping("house.de")
	public ModelAndView houseDetail(ModelAndView mv, int hno) {
	
		ArrayList<Room> room = roomService.houseDetail(hno);
		

		mv.addObject("room" ,room).setViewName("house/houseDetail");
		

		return mv;
		
	}	
	
	@RequestMapping("tour.re")
	public String tourRequest(int hno,int rno) {
		
		
		return "house/tour";
	}
	
}
