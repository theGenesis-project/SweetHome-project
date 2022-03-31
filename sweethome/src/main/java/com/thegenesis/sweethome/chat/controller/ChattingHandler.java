package com.thegenesis.sweethome.chat.controller;

import static com.thegenesis.sweethome.common.template.DateFormat.dateFormat;
import static com.thegenesis.sweethome.common.template.DateFormat.timeFormat;

import java.util.Date;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.thegenesis.sweethome.common.template.jsonParser;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class ChattingHandler extends TextWebSocketHandler{
	private Set<WebSocketSession> users = new CopyOnWriteArraySet<WebSocketSession>();
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		users.add(session);
		log.info(session);
		log.info("사용자 접속! 현재 " + users.size() + "명");
		/*
		JSONObject obj = new JSONObject();
		obj.put("type", "getId");
		obj.put("sessionId", session.getId());
		log.info(obj);
		*/
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 현재시간 구하기
		Date now = new Date();
		String today = dateFormat(now);
		String nowTime = timeFormat(now);
		
		// 전달된 메시지 받아오기
		String newMessage = message.getPayload();
		JSONObject obj = jsonParser.jsonToObjectParser(newMessage);
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
	
}
