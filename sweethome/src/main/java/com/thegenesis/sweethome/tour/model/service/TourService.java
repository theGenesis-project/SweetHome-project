package com.thegenesis.sweethome.tour.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thegenesis.sweethome.tour.model.dao.TourDao;
import com.thegenesis.sweethome.tour.model.vo.Tour;

@Service
public class TourService {

	@Autowired
	private TourDao tourDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertTour(Tour to) {
		return tourDao.insertTour(sqlSession,to); 
	}

}
