package com.thegenesis.sweethome.tour.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.thegenesis.sweethome.tour.model.vo.Tour;

@Repository
public class TourDao {

	public int insertTour(SqlSessionTemplate sqlSession,Tour to) {
		return sqlSession.insert("tourMapper.insertTour",to);
	}

}
