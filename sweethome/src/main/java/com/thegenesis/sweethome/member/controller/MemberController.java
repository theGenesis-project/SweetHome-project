package com.thegenesis.sweethome.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thegenesis.sweethome.member.model.service.MemberService;
import com.thegenesis.sweethome.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("login.me")
	public String loginMember(Member m) {
		
		 Member loginUser = memberService.loginMember(m);
		 
		
		return "main";
	}
	 
	

}
