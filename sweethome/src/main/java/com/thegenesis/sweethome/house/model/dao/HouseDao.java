package com.thegenesis.sweethome.house.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.thegenesis.sweethome.common.vo.PageInfo;
import com.thegenesis.sweethome.house.model.vo.House;
import com.thegenesis.sweethome.house.model.vo.HouseFile;

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

	public House houseDetail(SqlSessionTemplate sqlSession, int hno) {
		return sqlSession.selectOne("houseMapper.houseDetail", hno);
	}

	/**
	 * 현재 하우스 번호 확인
	 * @param sqlSession
	 * @return
	 */
	public int selectHouseNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("houseMapper.selectHouseNo");
	}
	
	/**
	 * 하우스 파일 등록
	 * @param sqlSession
	 * @param hfList
	 * @return
	 */
	public int insertHouseFile(SqlSessionTemplate sqlSession, ArrayList<HouseFile> hfList) {
		
		int result = 0;
		
		for(HouseFile hf: hfList) {
			result = sqlSession.insert("houseMapper.insertHouseFile", hf);
		}
		
		return result;
	}

	/**
	 * 하우스 삭제
	 * @param sqlSession
	 * @param userInfo
	 * @return
	 */
	public int deleteHouse(SqlSessionTemplate sqlSession, HashMap<String, Integer> userInfo) {
		return sqlSession.update("houseMapper.deleteHouse", userInfo);
	}

	/**
	 * 해당 하우스 파일 목록 가져오기
	 * @param sqlSession
	 * @param hno
	 * @return
	 */
	public ArrayList<HouseFile> selectHouseFile(SqlSessionTemplate sqlSession, int hno) {
		return (ArrayList)sqlSession.selectList("houseMapper.selectHouseFile", hno);
	}

	/**
	 * 해당 하우스 파일 삭제
	 * @param sqlSession
	 * @param hno
	 * @return
	 */
	public int deleteHouseFile(SqlSessionTemplate sqlSession, int hno) {
		return sqlSession.delete("houseMapper.deleteHouseFile", hno);
	}
	

}
