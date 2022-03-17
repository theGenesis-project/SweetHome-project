package com.thegenesis.sweethome.house.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thegenesis.sweethome.house.model.dao.HouseDao;
import com.thegenesis.sweethome.house.model.vo.House;
import com.thegenesis.sweethome.house.model.vo.HouseFile;
import com.thegenesis.sweethome.room.model.vo.Room;

@Service
public class HouseService {
	
	@Autowired
	private HouseDao houseDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
//	public int insertHouse(House h, HouseFile hf, Room r) {
//		return houseDao.insertHouse(sqlSession, h, r);
//	}
	
}
