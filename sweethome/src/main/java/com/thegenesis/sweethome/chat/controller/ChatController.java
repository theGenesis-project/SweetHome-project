package com.thegenesis.sweethome.chat.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.thegenesis.sweethome.chat.model.service.ChatService;
import com.thegenesis.sweethome.chat.model.vo.Chat;
import com.thegenesis.sweethome.member.model.vo.Member;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	@RequestMapping("/chat")
	public ModelAndView groupChattingController(HttpSession session, ModelAndView mv) {
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		ArrayList<Chat> chatList = chatService.selectRoomList(userNo);
		
		log.info("==========================");
		log.info(chatList);
		
		mv.addObject("chatList", chatList).setViewName("mypage/chatBoard");
		
		return mv;
	}
	
}
