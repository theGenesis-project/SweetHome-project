package com.thegenesis.sweethome.mypage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thegenesis.sweethome.common.vo.PageInfo;
import com.thegenesis.sweethome.community.model.vo.Community;
import com.thegenesis.sweethome.mypage.model.dao.MypageDao;

@Service
public class MypageService {
	
	@Autowired
	private MypageDao mypageDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int myBoardListCount(int userNo) {
		return mypageDao.myBoardListCount(sqlSession, userNo);
	}
	
	public int myCommentListCount(int userNo) {
		return mypageDao.myCommentListCount(sqlSession, userNo);
	}

	public ArrayList<Community> selectMyBoardList(PageInfo pi, int userNo) {
		return mypageDao.selectMyBoardList(sqlSession, pi,  userNo);
	}

	public ArrayList<Community> selectMyCommentList(PageInfo cpi, int userNo) {
		return mypageDao.selectMyCommentList(sqlSession, cpi, userNo);
	}
}
