package com.thegenesis.sweethome.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thegenesis.sweethome.admin.model.dao.AdminDao;
import com.thegenesis.sweethome.common.vo.PageInfo;
import com.thegenesis.sweethome.member.model.vo.Member;

@Service
public class AdminService {
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int selectMemberCount() { // 회원 수
		return adminDao.selectMemberCount(sqlSession);
	}

	public ArrayList<Member> selectMemberList(PageInfo pi) { // 멤버 리스트 조회
		return adminDao.selectMemberList(sqlSession, pi);
	}
	
	

}