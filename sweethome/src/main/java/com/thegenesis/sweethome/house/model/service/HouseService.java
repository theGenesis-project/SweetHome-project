package com.thegenesis.sweethome.house.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thegenesis.sweethome.common.vo.PageInfo;
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
	
	
	/**
	 * 하우스 등록
	 * @param h
	 * @return
	 */
	public int insertHouse(House h) {
		return houseDao.insertHouse(sqlSession, h);
	}


	public House selectHouse(String houseName) {
		return houseDao.selectHouse(sqlSession, houseName);
	}
	
	public ArrayList<House> houseSearch(PageInfo pi){
		return houseDao.houseSearch(sqlSession,pi);
	}
	
	public int selectHouseCount() {
		return houseDao.selectHouseCount(sqlSession);
	}
	
	public ArrayList<House> houseSearchOne(){
		return houseDao.houseSearchOne(sqlSession);
	}
	
}
