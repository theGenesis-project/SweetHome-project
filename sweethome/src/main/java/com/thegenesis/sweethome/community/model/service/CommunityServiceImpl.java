package com.thegenesis.sweethome.community.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thegenesis.sweethome.common.vo.PageInfo;
import com.thegenesis.sweethome.community.model.dao.CommunityDao;
import com.thegenesis.sweethome.community.model.vo.Community;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CommunityDao communityDao;
	
	//게시글 조회수
	@Override
	public int listCount(int boardType) {
		
		return communityDao.listCount(sqlSession, boardType);
	}
	//공지사항 글 리스트 
	@Override
	public ArrayList<Community> boardList(PageInfo pi, int boardType) {
		
		return communityDao.boardList(sqlSession, pi, boardType);
	}
	//공지사항 검색 기능(게시글 개수 조회)
	@Override
	public int searchNoticeCount(HashMap<String, String> map) {
		
		return communityDao.searchNoticeCount(sqlSession);
	}
	//공지사항 검색 기능(게시글 리스트 조회)
	@Override
	public ArrayList<Community> searchNoticeList(PageInfo pi, HashMap<String, String> map) {
		
		return communityDao.searchNoticeList(sqlSession, pi, map);
	}
	//게시글 상세보기(조회수 증가)
	@Override
	public int increaseCount(int bno) {
		
		return communityDao.increaseCount(sqlSession, bno);
	}
	//게시글 상세보기
	@Override
	public Community boardDetail(int bno) {
		
		return communityDao.boardDetail(sqlSession, bno) ;
	}
	
}
