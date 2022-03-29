package com.thegenesis.sweethome.room.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.thegenesis.sweethome.room.model.vo.Room;

@Repository
public class RoomDao {

	public ArrayList<Room> houseDetail(SqlSessionTemplate sqlSession, int hno) {
		return (ArrayList)sqlSession.selectList("roomMapper.houseDetail", hno);
	}

}
