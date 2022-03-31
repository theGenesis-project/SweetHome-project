package com.thegenesis.sweethome.house.model.service;

import java.util.ArrayList;
import java.util.HashMap;

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
	
	public ArrayList<House> houseSearch(){
		return houseDao.houseSearch(sqlSession);
	}
	

	public ArrayList<House> keywordSearch(String keyword) {
		return houseDao.keywordSearch(sqlSession,keyword);
	}





	
	/**
	 * 현재 하우스 번호 확인
	 * @return
	 */
	public int selectHouseNo() {
		return houseDao.selectHouseNo(sqlSession);
	}
	
	/**
	 * 하우스 파일 등록
	 * @param hfList
	 * @return
	 */
	public int insertHouseFile(ArrayList<HouseFile> hfList) {
		return houseDao.insertHouseFile(sqlSession, hfList);
	}
	
	/**
	 * 하우스 삭제
	 * @param userInfo
	 * @return
	 */
	public int deleteHouse(HashMap<String, Integer> userInfo) {
		return houseDao.deleteHouse(sqlSession, userInfo);
	}
	
	/**
	 * 해당 하우스 파일 목록 가져오기
	 * @param hno
	 * @return
	 */
	public ArrayList<HouseFile> selectHouseFile(int hno) {
		return houseDao.selectHouseFile(sqlSession, hno);
	}
	
	/**
	 * 해당 하우스 파일 삭제
	 * @param hno
	 * @return
	 */
	public int deleteHouseFile(int hno) {
		return houseDao.deleteHouseFile(sqlSession, hno);
	}


	public ArrayList<House> houseSearchOne() {
		return houseDao.houseSearchOne(sqlSession);
	}
	
}
