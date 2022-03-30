package com.thegenesis.sweethome.room.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thegenesis.sweethome.room.model.dao.RoomDao;
import com.thegenesis.sweethome.room.model.vo.Room;

@Service
public class RoomService {
	
	@Autowired
	private RoomDao roomDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 방 등록
	 * @param tempRoom
	 * @return
	 */
	public int insertRoom(Room tempRoom) {
		return roomDao.insertRoom(sqlSession, tempRoom);
	}

	/**
	 * 현재 방 번호 확인
	 * @return
	 */
	public int selectRoomNo() {
		return roomDao.selectRoomNo(sqlSession);
	}

	public int deleteHouse(int hno) {
		return 0;
	}

}
