package com.thegenesis.sweethome.member.controller;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thegenesis.sweethome.common.template.Certification;
import com.thegenesis.sweethome.member.model.service.MemberService;
import com.thegenesis.sweethome.member.model.vo.Cert;
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
	
	@RequestMapping("update.me")
	public String updateMember(Member m, HttpSession session) {
		
		int result = memberService.updateMember(m);
		
		if(result > 0) {
			Member loginUser = memberService.loginMember(m);
			session.setAttribute("loginUser", loginUser);
			return("redirect:/myPage.me");
		} else {
			session.setAttribute("errorMsg", "회원정보 수정에 실패하셨습니다.");
			return("mypage/memberInfo");
		}

	}
	
	@ResponseBody
	@PostMapping("sendEmail.me")
	public int ajaxsendEmail(String email, HttpServletRequest request) throws MessagingException {
		
		// 현재 사용자의 ip
		String ip = request.getRemoteAddr();
		// 6자리 인증번호
		int certNum = Certification.setCertNum();
		
		Cert cert = Cert.builder()
						.who(ip)
						.certNum(certNum)
						.build();
		
		int result = memberService.insertEmailCheck(cert);
		
		// 인증번호 DB에 저장한 뒤 메일 발송
		if(result > 0) {
			Certification.sendMessage(email, "스위트홈 인증번호가 도착했습니다.", "인증번호 : " + certNum);
		}
		
		return result;
	}
	
	
	@ResponseBody
	@RequestMapping("emailCheck.me")
	public boolean ajaxEmailCheck(int certNum, HttpServletRequest request) {
		boolean result = memberService.validate(Cert.builder()
													.who(request.getRemoteAddr())
													.certNum(certNum)
													.build());
		return result;
		
	}
	
	@RequestMapping("changePwd.me")
	public void updateMemberPwd(String prePwd, String newPwd) {
		
	}
}
