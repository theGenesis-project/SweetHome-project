package com.thegenesis.sweethome.room.model.dao;


import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.thegenesis.sweethome.common.vo.Report;
import com.thegenesis.sweethome.room.model.vo.Room;

@Repository
public class RoomDao {


	public ArrayList<Room> houseDetail(SqlSessionTemplate sqlSession, int hno) {
		return (ArrayList)sqlSession.selectList("roomMapper.houseDetail", hno);
	}
	/**
	 * 방 등록
	 * @param sqlSession
	 * @param tempRoom
	 * @return
	 */
	public int insertRoom(SqlSessionTemplate sqlSession, Room tempRoom) {
		return sqlSession.insert("roomMapper.insertRoom", tempRoom);
	}

	/**
	 * 현재 방 번호 확인
	 * @param sqlSession
	 * @return
	 */
	public int selectRoomNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("roomMapper.selectRoomNo");
	}

	/**
	 * 방 삭제
	 * @param sqlSession
	 * @param hno
	 * @return
	 */
	public int deleteRoom(SqlSessionTemplate sqlSession, int hno) {
		return sqlSession.update("roomMapper.deleteRoom", hno);

	}
	public Room houseDetailOne(SqlSessionTemplate sqlSession, int hno) {
		return sqlSession.selectOne("roomMapper.houseDetailOne",hno);
	}
	public int reportCheck(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("roomMapper.reportCheck", map);
	}
	public int reportRoom(SqlSessionTemplate sqlSession, Report r) {
		return sqlSession.insert("roomMapper.reportRoom", r);
	}
	public int increaseCount(SqlSessionTemplate sqlSession, int hno) {
		return sqlSession.update("roomMapper.increaseCount", hno);
	}
	public String checkHeart(SqlSessionTemplate sqlSession, HashMap<String, Integer> hm) {
		return sqlSession.selectOne("roomMapper.houseChangeHeart", hm);
	}
	public int changeHeart(SqlSessionTemplate sqlSession, HashMap<String, Integer> hm) {

		String check = sqlSession.selectOne("roomMapper.houseChangeHeart", hm);
		
		//N이 나왔으면 이제 Y로 바꾸어주어야 함
		
		int result = 0;
		
		if(check == null) {
			//처음으로 하트 누름
			sqlSession.insert("roomMapper.changeHeartY", hm);
			result = 1;
		}else if(check.equals("N")) {
			//하트를 전에 누른 적이 있을 경우
			sqlSession.update("roomMapper.changeHeartYY", hm);
			//Y로 바꿔줌
			result = 1;
		}else {
			//하트 취소
			sqlSession.update("roomMapper.changeHeartN", hm);	
			result = 2;
		}
		
		return result;
	}

}
