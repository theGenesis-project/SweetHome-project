package com.thegenesis.sweethome.member.model.service;

import com.thegenesis.sweethome.member.model.vo.Member;

public interface MemberService {

	// 로그인 서비스
	Member loginMember(Member m);
	
	// 회원가입 서비스
	int insertMember(Member m);
	
	// 아이디 중복체크
	int idCheck(String checkId);
	
}
