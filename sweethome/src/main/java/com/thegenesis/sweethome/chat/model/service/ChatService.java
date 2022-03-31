package com.thegenesis.sweethome.chat.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thegenesis.sweethome.chat.model.dao.ChatDao;
import com.thegenesis.sweethome.chat.model.vo.Chat;

@Service
public class ChatService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ChatDao chatDao;

	public ArrayList<Chat> selectRoomList(int userNo) {
		return chatDao.selectRoomList(sqlSession, userNo);
	}

	public ArrayList<Chat> selectChatHistory(int roomNo) {
		return chatDao.selectChatHistory(sqlSession, roomNo);
	}

	public int insertChatMessage(Chat c) {
		return chatDao.insertChatMessage(sqlSession, c);
	}

	public List<Integer> searchChatMember(Chat c) {
		return chatDao.searchChatMember(sqlSession, c);
	}

	public int insertNewChatRoom(int[] participant, String houseName) {
		return chatDao.insertNewChatRoom(sqlSession, participant, houseName);
	}

}
