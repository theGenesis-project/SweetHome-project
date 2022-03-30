package com.thegenesis.sweethome.room.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.thegenesis.sweethome.room.model.vo.Room;

@Repository
public class RoomDao {

	/**
	 * 방 등록
	 * @param sqlSession
	 * @param tempRoom
	 * @return
	 */
	public int insertRoom(SqlSessionTemplate sqlSession, Room tempRoom) {
		return sqlSession.insert("roomMapper.insertRoom", tempRoom);
	}

	/**
	 * 현재 방 번호 확인
	 * @param sqlSession
	 * @return
	 */
	public int selectRoomNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("roomMapper.selectRoomNo");
	}

	/**
	 * 방 삭제
	 * @param sqlSession
	 * @param hno
	 * @return
	 */
	public int deleteRoom(SqlSessionTemplate sqlSession, int hno) {
		return sqlSession.update("roomMapper.deleteRoom", hno);
	}

}
