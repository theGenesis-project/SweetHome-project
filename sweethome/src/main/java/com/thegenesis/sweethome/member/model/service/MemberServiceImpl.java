package com.thegenesis.sweethome.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thegenesis.sweethome.member.model.dao.MemberDao;
import com.thegenesis.sweethome.member.model.vo.Cert;
import com.thegenesis.sweethome.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		return memberDao.insertMember(sqlSession, m);
	}

	@Override
	public int idCheck(String checkId) {
		return memberDao.idCheck(sqlSession, checkId);
	}

	@Override
	public int updateMember(Member m) {
		return memberDao.updateMember(sqlSession, m);
	}

	@Override
	public int insertEmailCheck(Cert cert) {
		return memberDao.insertEmailCheck(sqlSession, cert);
	}
	
	 @Override
	 public boolean validate(Cert cert) {
		 return memberDao.validate(sqlSession, cert);
	 }
	 
	 @Override
	 public int updateMemberPwd(Member m) {
		 return memberDao.updateMemberPwd(sqlSession, m);
	 }

	@Override
	public int deleteMember(String userId) {
		return memberDao.deleteMember(sqlSession, userId);
	}
	
	@Override
	public String idFind(String email) {
		return memberDao.idFind(sqlSession, email);
	}
	
	

}
