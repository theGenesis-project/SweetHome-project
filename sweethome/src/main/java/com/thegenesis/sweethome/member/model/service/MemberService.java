package com.thegenesis.sweethome.member.model.service;

import com.thegenesis.sweethome.member.model.vo.Cert;
import com.thegenesis.sweethome.member.model.vo.Member;

public interface MemberService {

	// 로그인 서비스
	Member loginMember(Member m);
	
	// 회원가입 서비스
	int insertMember(Member m);
	
	// 아이디 중복체크
	int idCheck(String checkId);

	// 회원정보 수정
	int updateMember(Member m);

	// 메일 인증번호 추가
	int insertEmailCheck(Cert cert);

	// 인증번호 확인
	boolean validate(Cert cert);

	// 비밀번호 변경
	int updateMemberPwd(Member m);

	// 회원 탈퇴
	int deleteMember(String userId);
	
}
