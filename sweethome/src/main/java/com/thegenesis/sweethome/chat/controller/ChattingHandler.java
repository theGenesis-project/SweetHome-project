package com.thegenesis.sweethome.chat.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class ChattingHandler extends TextWebSocketHandler{
	private Set<WebSocketSession> users = new CopyOnWriteArraySet<WebSocketSession>();
	
	@SuppressWarnings("unchecked")
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		users.add(session);
		log.info(session);
		log.info("사용자 접속! 현재 " + users.size() + "명");
		
		JSONObject obj = new JSONObject();
		obj.put("type", "getId");
		obj.put("sessionId", session.getId());
		log.info(obj);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 현재시간 구하기
		SimpleDateFormat date = new SimpleDateFormat("yyyy년 MM월 dd일 E요일");
		SimpleDateFormat time = new SimpleDateFormat("HH:mm a");
		
		Date now = new Date();
		String today = date.format(now);
		String nowTime = time.format(now);
		
		// 전달된 메시지 받아오기
		String newMessage = message.getPayload();
		JSONObject obj = jsonToObjectParser(newMessage);
		obj.put("today", today);
		obj.put("nowTime", nowTime);

		// 메세지를 모든 사용자에게 전송(사용자 수만큼 반복하여 전송)
		for(WebSocketSession ws : users) {
			ws.sendMessage(new TextMessage(obj.toJSONString()));
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		users.remove(session);
		log.info("사용자 종료! 현재 " + users.size() + "명");
	}
	
	// 받아온 String형 JSON 객체를 JSONObject로 바꿔주기
	private static JSONObject jsonToObjectParser(String jsonStr) {
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		try {
			obj = (JSONObject)parser.parse(jsonStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return obj;
	}
}
