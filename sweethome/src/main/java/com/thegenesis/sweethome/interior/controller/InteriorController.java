package com.thegenesis.sweethome.interior.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class InteriorController {
	
	
	@RequestMapping("interior.in")
	public String interiorList() {
		
		return "interior/interiorList";
	}

}
