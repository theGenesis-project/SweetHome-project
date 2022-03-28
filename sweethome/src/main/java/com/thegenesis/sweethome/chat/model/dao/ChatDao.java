package com.thegenesis.sweethome.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.thegenesis.sweethome.chat.model.vo.Chat;

@Repository
public class ChatDao {

	public ArrayList<Chat> selectRoomList(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectRoomList", userNo);
	}

	public ArrayList<Chat> selectChatHistory(SqlSessionTemplate sqlSession, int roomNo) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatHistory", roomNo);
	}

	public int insertChatMessage(SqlSessionTemplate sqlSession, Chat c) {
		return sqlSession.insert("chatMapper.insertChatMessage", c);
	}

}
