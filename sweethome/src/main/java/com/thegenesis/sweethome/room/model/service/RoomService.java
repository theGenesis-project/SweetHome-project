package com.thegenesis.sweethome.room.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thegenesis.sweethome.common.vo.Report;
import com.thegenesis.sweethome.house.model.vo.HouseFile;
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


	public int reportCheck(HashMap<String, String> map) {
		return roomDao.reportCheck(sqlSession, map);
	}

	public int reportRoom(Report r) {
		return roomDao.reportRoom(sqlSession, r);
	}

	public int increaseCount(int hno) {
		return roomDao.increaseCount(sqlSession,hno);
	}

	public String checkHeart(HashMap<String, Integer> hm) {
		return roomDao.checkHeart(sqlSession,hm);
	}

	public int changeHeart(HashMap<String, Integer> hm) {
		return roomDao.changeHeart(sqlSession, hm);
	}

	public ArrayList<HouseFile> houseFileOne(int hno) {
		return roomDao.houseFileOne(sqlSession, hno);
	}


}
