package com.thegenesis.sweethome.chat.controller;

import static com.thegenesis.sweethome.common.template.DateFormat.dateFormat;
import static com.thegenesis.sweethome.common.template.DateFormat.timeFormat;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.thegenesis.sweethome.chat.model.service.ChatService;
import com.thegenesis.sweethome.chat.model.vo.Chat;
import com.thegenesis.sweethome.common.template.jsonParser;
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
	
	@ResponseBody
	@RequestMapping(value="/getContent.chat", produces="application/json; chatset=utf-8")
	public String AjaxGetChatMessage(int roomNo, HttpSession session) {
		log.info("============getChatContent=============");
		log.info("roomNo: " + roomNo);
		
		/*
		// 이전 방번호 삭제
		session.removeAttribute("roomNo");
		// 현재 방번호 저장
		session.setAttribute("roomNo", roomNo);
		log.info("sessionRoomNo: " + session.getAttribute("roomNo"));
		*/
		
		// 이전 채팅내역 가져오기
		ArrayList<Chat> chatHistory = chatService.selectChatHistory(roomNo);
		log.info(chatHistory);
		
		// 시간 포맷 변경
		for(Chat c : chatHistory) {
			c.setFormatDate(dateFormat(c.getSendTime()));
			c.setFormatTime(timeFormat(c.getSendTime()));
		}
		
		return new Gson().toJson(chatHistory);
	}
	
	@ResponseBody
	@RequestMapping("/sendMsg.chat")
	public int AjaxSendMessage(@RequestBody String param) {

		JSONObject sendInfo = jsonParser.jsonToObjectParser(param);
		
		log.info("===============sendMsgInfo==============");
		log.info(sendInfo);
		
		Chat c = Chat.builder()
					.roomNo(Integer.parseInt((String)sendInfo.get("roomNo")))
					.userNo(Integer.parseInt((String)sendInfo.get("userNo")))
					.message((String)sendInfo.get("msg"))
					.build();
		log.info(c);
		// DB에 저장한 뒤 결과값 출력
		return chatService.insertChatMessage(c);
	}
	
	@RequestMapping("/newChat")
	public ModelAndView createNewChat(int other, String houseName, HttpSession session, ModelAndView mv) {
		log.info("=================newChat=================");
		log.info("mateNO: " + other); // 채팅할 회원 번호
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		Chat c = Chat.builder()
					.userNo(userNo) // 현재 로그인한 유저 번호
					.otherNo(other)
					.build();
		
		// 유저간 공유하는 방이 있는지 확인
		List<Integer> chatroom = chatService.searchChatMember(c);
		log.info("chatRoom: " + chatroom);
		
		// 유저간 공유하는 채팅방이 없다면 새로 만들기
		if(chatroom.isEmpty()) {
			// int 형 배열로 user를 하나씩 넣기
			int[] participant = new int[] {other, userNo};
			// 새로운 채팅방 번호 가져가기
			chatroom.add(chatService.insertNewChatRoom(c, participant, houseName));
			
			// roomNo == 0 이면 실패
			if(chatroom.get(0) == 0) {
				session.setAttribute("errorMsg", "채팅방 개설에 실패했습니다.");
			}
		}
		
		// 해당 채팅방 유저의 전체 채팅정보 가져오기
		ArrayList<Chat> chatList = chatService.selectRoomList(userNo);
		mv.addObject("chatList", chatList).addObject("chatroom", chatroom).setViewName("mypage/chatBoard");
		
		return mv;
	}
	
}
