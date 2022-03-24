package com.thegenesis.sweethome.chat.model.service;

import java.util.ArrayList;

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

}
