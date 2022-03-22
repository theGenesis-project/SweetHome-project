package com.thegenesis.sweethome.house.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.thegenesis.sweethome.ask.model.vo.Ask;
import com.thegenesis.sweethome.common.vo.PageInfo;
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


	public int selectHouseCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("houseMapper.selectHouseCount");
	}
	
	public ArrayList<House> houseSearch(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("houseMapper.houseSearch", null, rowBounds);
	}

	public ArrayList<House> houseSearchOne(SqlSessionTemplate sqlSession){
		
		return (ArrayList)sqlSession.selectList("houseMapper.houseSearch");
	}

}
