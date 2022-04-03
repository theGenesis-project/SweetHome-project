package com.thegenesis.sweethome.room.model.service;

import java.util.ArrayList;


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

	/**
	 * 방 삭제
	 * @param hno
	 * @return
	 */
	public int deleteRoom(int hno) {
		return roomDao.deleteRoom(sqlSession, hno);
	}


	
	public ArrayList<Room> houseDetail(int hno) {
		return roomDao.houseDetail(sqlSession, hno);
	}

	/**
	 * 하우스 번호로 방 정보 가져오기
	 * @param hno
	 * @return
	 */
	public ArrayList<Room> selectRoom(int hno) {
		return roomDao.selectRoom(sqlSession, hno);
	}

	/**
	 * 하우스 수정에서 방 등록
	 * @param newRoom
	 * @return
	 */
	public int updateInsertRoom(Room newRoom) {
		return roomDao.updateInsertRoom(sqlSession, newRoom);
	}


}
