package com.thegenesis.sweethome.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.thegenesis.sweethome.member.model.vo.Cert;
import com.thegenesis.sweethome.member.model.vo.Member;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int insertEmailCheck(SqlSessionTemplate sqlSession, Cert cert) {
		return sqlSession.insert("memberMapper.insertEmailCheck", cert);
	}

	public boolean validate(SqlSessionTemplate sqlSession, Cert cert) {
		
		Cert result = sqlSession.selectOne("memberMapper.validate", cert);
		
		if(result != null) {
			sqlSession.delete("memberMapper.removeCert", cert);
		}
		
		return result != null;
	}

	public int updateMemberPwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMemberPwd", m);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("memberMapper.deleteMember", userId);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}
	
	public String idFind(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.idFind", email);
	}
}

