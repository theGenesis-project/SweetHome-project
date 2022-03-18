package com.thegenesis.sweethome.house.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.thegenesis.sweethome.house.model.vo.House;
import com.thegenesis.sweethome.house.model.vo.HouseFile;
import com.thegenesis.sweethome.room.model.vo.Room;

@Repository
public class HouseDao {
	
	/**
	 * 하우스 등록
	 * @param sqlSession
	 * @param h
	 * @return
	 */
	public int insertHouse(SqlSessionTemplate sqlSession, House h) {
		
		return sqlSession.insert("houseMapper.insertHouse", h);
		
	}

	public House selectHouse(SqlSessionTemplate sqlSession, String houseName) {
		return sqlSession.selectOne("houseMapper.selectHouse", houseName);
	}
	

}
