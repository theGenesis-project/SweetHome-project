package com.thegenesis.sweethome.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thegenesis.sweethome.member.model.service.MemberService;
import com.thegenesis.sweethome.member.model.vo.Member;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MemberController {
	
	@Autowired
	private MemberService memberService;	
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@RequestMapping("loginform.me")
	public String loginFormView() {
		return "member/loginForm";
	}
	
	@RequestMapping("login.me")
	public String loginMember(Member m, HttpSession session) {
		
		Member loginUser = memberService.loginMember(m);
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		log.info("========================");
		log.info(loginUser);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			session.setAttribute("loginUser", loginUser);
			return"redirect:/";
		} else {
			session.setAttribute("errorMsg", "아이디 혹은 비밀번호가 일치하지 않습니다.");
			return"redirect:/loginform.me";
		}
		
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping("myPage.me")
	public String memberInfoView() {
		return "mypage/memberInfo";
	}
	
	@RequestMapping("enrollForm.me")
	public String memberChoose() {
		return "member/memberChoose";
	}
	
	@RequestMapping("mateEnrollForm.me")
	public String mateMember() {
		return "member/memberEnrollForm";
	}
	
	@RequestMapping("ownerEnrollForm.me")
	public String ownerMember() {
		return "member/memberEnrollFormOwner";
	}
	
	@RequestMapping("insert.me")
	public String insertMember(Member m) {
		
		//System.out.println(m);
		
		return "main";
	}
	
}
