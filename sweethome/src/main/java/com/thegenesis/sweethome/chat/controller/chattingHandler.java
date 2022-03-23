package com.thegenesis.sweethome.chat.controller;

import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.log4j.Log4j;

/* 
 * 접속한 사용자를 기억해두고 모두에 대한 처리를 수행하는 서버
 */
@Log4j
public class chattingHandler extends TextWebSocketHandler{ // 클래스 상속
	
	/*
	 * 사용자를 기억하기 위한 저장소
	 * - 중복 불가
	 * - 동기화 지원
	 */
	private Set<WebSocketSession> users = new CopyOnWriteArraySet<WebSocketSession>();

	/*
	 * 접속 시 실행되는 메소드(특정 상황에 실행) => 콜백
	 * session: 접속한 사용자의 웹소켓 정보
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		log.info("#ChattingHandler, afterConnectionEstablished");
		users.add(session);
		
		log.info("사용자 접속! 현재  " + users.size());
	}

	/*
	 * 메시지 수신 시 실행되는 메소드
	 * session: 접속한 사용자의 웹소켓 정보
	 * message: 사용자가 전송한 메시지 정도
	 * 	- payload: 실제 보낸 내용
	 * 	- byteCount: 보낸 메시지 크기(byte)
	 * 	- last: 메시지 종료 여부
	 */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.info("#ChattingHandler, handlerTextMessage");
		log.info("session: " + session);
		log.info("message: " + message);
		
		TextMessage newMessage = new TextMessage(message.getPayload());
		
		for(WebSocketSession user : users) {
			user.sendMessage(newMessage);
		}
	}

	/*
	 * 사용자가 접속 종료 시 실행되는 메소드
	 * session: 접속한 사용자의 웹소켓 정보
	 * status: 접속이 종료된 원인과 관련된 정보
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		users.remove(session);
		log.info("사용자 종료! 현재  " + users.size());
	}

}
