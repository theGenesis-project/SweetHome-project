package com.thegenesis.sweethome.house.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HouseController {
	
	// 테스트용
	@RequestMapping("houseInsert")
	public String houseInsert() {
		return "house/houseInsert";
	}
	
	/**
	 * 하우스 등록
	 */
	@RequestMapping("insertHouse.ho")
	public void insertHouse() {
		System.out.println("ㅇㅇ");
	}
	
	
}
