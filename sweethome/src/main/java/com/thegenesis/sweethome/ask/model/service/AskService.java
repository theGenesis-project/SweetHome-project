package com.thegenesis.sweethome.ask.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thegenesis.sweethome.ask.model.dao.AskDao;
import com.thegenesis.sweethome.ask.model.vo.Ask;
import com.thegenesis.sweethome.ask.model.vo.AskFile;
import com.thegenesis.sweethome.common.vo.PageInfo;

@Service
public class AskService {
	
	@Autowired
	private AskDao askDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertAsk(Ask a, AskFile file) {		
		return askDao.insertAsk(sqlSession, a, file);
	}

	public int selectAskCount(int userNo) {
		return askDao.selectAskCount(sqlSession, userNo);
	}

	public ArrayList<Ask> selectList(int userNo, PageInfo pi) {
		return askDao.selectList(sqlSession, userNo,  pi);
	}

	public ArrayList<Object> selectAskOne(Ask ref) {
		return askDao.selectAskOne(sqlSession, ref);
	}
	
	
}
