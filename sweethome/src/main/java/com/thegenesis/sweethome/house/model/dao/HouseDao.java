package com.thegenesis.sweethome.house.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	
	public ArrayList<House> houseSearch(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("houseMapper.houseSearch");
	}


	public ArrayList<House> keywordSearch(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("houseMapper.keywordSearch",keyword);
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

	/**
	 * 하우스 번호로 하우스 정보 가져오기
	 * @param sqlSession
	 * @param hno
	 * @return
	 */
	public House selectHouseByNo(SqlSessionTemplate sqlSession, int hno) {
		return sqlSession.selectOne("houseMapper.selectHouseByNo", hno);
	}

	/**
	 * 하우스 수정
	 * @param sqlSession
	 * @param h
	 * @return
	 */
	public int updateHouse(SqlSessionTemplate sqlSession, House h) {
		return sqlSession.update("houseMapper.updateHouse", h);
	}

	/**
	 * 해당 방 파일 목록 가져오기
	 * @param sqlSession
	 * @param roomNo
	 * @return
	 */
	public ArrayList<HouseFile> selectRoomFile(SqlSessionTemplate sqlSession, int roomNo) {
		return (ArrayList)sqlSession.selectList("houseMapper.selectRoomFile", roomNo);
	}

	/**
	 * 해당 방 파일 삭제
	 * @param sqlSession
	 * @param roomNo
	 * @return
	 */
	public int deleteRoomFile(SqlSessionTemplate sqlSession, int roomNo) {
		return sqlSession.delete("houseMapper.deleteRoomFile", roomNo);
	}
	

}
