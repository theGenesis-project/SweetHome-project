package com.thegenesis.sweethome.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thegenesis.sweethome.member.model.dao.MemberDao;
import com.thegenesis.sweethome.member.model.vo.Member;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession, m);
	}

}
