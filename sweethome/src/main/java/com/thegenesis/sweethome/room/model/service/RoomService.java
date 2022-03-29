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
	
	public ArrayList<Room> houseDetail(int hno) {
		return roomDao.houseDetail(sqlSession, hno);
	}


}
