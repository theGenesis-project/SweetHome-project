package com.thegenesis.sweethome.chat.controller;

import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class ChattingHandler extends TextWebSocketHandler{
	private Set<WebSocketSession> users = new CopyOnWriteArraySet<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		users.add(session);
		log.info("사용자 접속! 현재 " + users.size() + "명");
	}
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 메세지를 모든 사용자에게 전송(사용자 수만큼 반복하여 전송)
		
		TextMessage newMessage = new TextMessage(message.getPayload());
		// session.sendMessage(message); // 메세지를 보낸 사람한테 다시 메세지를 보낸다
		
		for(WebSocketSession ws : users) {
			ws.sendMessage(newMessage);
			
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		users.remove(session);
		log.info("사용자 종료! 현재 " + users.size() + "명");
	}
}
