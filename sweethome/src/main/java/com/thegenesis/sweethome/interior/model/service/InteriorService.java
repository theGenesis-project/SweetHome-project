package com.thegenesis.sweethome.interior.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thegenesis.sweethome.common.vo.PageInfo;
import com.thegenesis.sweethome.community.model.vo.Community;
import com.thegenesis.sweethome.interior.model.dao.InteriorDao;
import com.thegenesis.sweethome.interior.model.vo.Interior;
import com.thegenesis.sweethome.interior.model.vo.InteriorFile;

@Service
public class InteriorService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private InteriorDao interiorDao;
	//게시글 개수
	public int listCount(int inteCate) {
		
		return interiorDao.listCount(sqlSession, inteCate);
	}
	//게시글 리스트
	public ArrayList<Interior> selectInteriorList(PageInfo pi, int inteCate) {
		
		return interiorDao.selectInteriorList(sqlSession, pi, inteCate);
	}
	//게시글 등록
	public int insertInterior(Interior in, ArrayList<InteriorFile> list) {
		
		return interiorDao.insertInterior(sqlSession, in, list);
	}
	//게시글 삭제(보류)
	public int deleteInterior(ArrayList<Integer> checkNumbers) {
		return interiorDao.deleteInterior(sqlSession, checkNumbers);
	}
	//게시글 상세페이지
	

}
