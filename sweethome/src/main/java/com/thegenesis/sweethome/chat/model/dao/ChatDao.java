package com.thegenesis.sweethome.chat.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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

	public List<Integer> searchChatMember(SqlSessionTemplate sqlSession, Chat c) {
		return sqlSession.selectList("chatMapper.searchChatMember", c);
	}
	
	@Transactional(rollbackFor = {Exception.class})
	public int insertNewChatRoom(SqlSessionTemplate sqlSession, int[] participant, String houseName) {
		// 채팅방 추가
		int result = sqlSession.insert("chatMapper.insertNewChatRoom", houseName);
		
		// 채팅방 추가 시 채팅인원 추가
		if(result > 0) {
			for(int i : participant) {
				result += sqlSession.insert("chatMapper.insertNewChatMember", i);				
			}
		}
		
		return result;
	}

}
