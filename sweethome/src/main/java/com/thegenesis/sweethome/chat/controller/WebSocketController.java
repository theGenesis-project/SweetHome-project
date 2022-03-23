package com.thegenesis.sweethome.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebSocketController {
	
	@RequestMapping("/chat")
	public String groupChattingController() {
		return "mypage/chatBoard";
	}
}
