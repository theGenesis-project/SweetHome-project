package com.thegenesis.sweethome.member.controller;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;

	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;
	
	
	
	@RequestMapping("loginform.me")
	public String loginFormView(Model model, HttpSession session) throws Exception {
		
		/* 구글code 발행 */
	  	OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		
	  	/* 로그인페이지 이동 url생성 */
	  	String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

	  	model.addAttribute("google_url", url);

	  	/* 생성한 인증 URL을 Model에 담아서 전달 */
		return "member/loginForm";
	}
	
	// 구글 Callback호출 메소드
	  @RequestMapping(value = "oauth2callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	  public String googleCallback(Model model, @RequestParam String code) throws IOException {

	    //System.out.println("Google login success");

	    return "redirect:/";
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
	public String insertMember(Member m, Model model, HttpSession session) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());	
		m.setUserPwd(encPwd);
		
		int result = memberService.insertMember(m);
		
		if(result > 0) {	
			session.setAttribute("alertMsg", "성공적으로 회원가입이 되었습니다.");
			return "member/loginForm";		
		}else {
			model.addAttribute("errorMsg", "회웝가입에 실패하셨습니다.");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String idCheck(String checkId) {
		return memberService.idCheck(checkId) > 0 ? "NNNNN" : "NNNNY";
		
	}
	
	@RequestMapping("idFind.me")
	public String idFind() {
		return "member/idFindForm";
	}
	
	@RequestMapping("idFindComplete.me")
	public String idFindComplete(String email, HttpSession session) {		
		String userId=memberService.idFind(email);
		//System.out.println(userId);
		session.setAttribute("userId", userId);
		
		return "member/idFindComplete";
	}

	@RequestMapping("pwdFind.me")
	public String pwdFind() {
		return "member/pwdFindForm";
	}
	
	@RequestMapping("pwdFindComplete.me")
	public String pwdFindComplete(String email) {
		
		return "member/pwdFindComplete";
	}

	@RequestMapping("update.me")
	public String updateMember(Member m, HttpSession session) {
		
		int result = memberService.updateMember(m);
		
		if(result > 0) {
			Member loginUser = memberService.loginMember(m);
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "회원정보 수정에 성공하셨습니다.");
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
	public String updateMemberPwd(Member m, HttpSession session) {
		// 현재 세션의 회원정보 받아오기
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		// 세션의 비밀번호와 사용자가 입력한 비밀번호 대조
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			// 새로 입력한 비밀번호 암호화
			String encPwd = bcryptPasswordEncoder.encode(m.getNewPwd());
			loginUser.setNewPwd(encPwd);
			// DB에 저장
			int result = memberService.updateMemberPwd(loginUser);
			
			if(result > 0) {
				// 회원정보 바꾸기
				session.setAttribute("loginUser", loginUser);
				session.setAttribute("alertMsg", "비밀번호 변경에 성공하였습니다.");
				return "redirect:/myPage.me";
			} else {
				session.setAttribute("errorMsg", "비밀번호 변경에 실패하였습니다.");
				return "mypage/memberInfo";
			}
		} else {
			session.setAttribute("errorMsg", "비밀번호가 일치하지 않습니다.");
			return "mypage/memberInfo";
		}
	}
	
	@RequestMapping("delete.me")
	public String deleteMember(Member m, HttpSession session) {
		String encPwd = ((Member)session.getAttribute("loginUser")).getUserPwd();
		
		if(bcryptPasswordEncoder.matches(m.getUserPwd(), encPwd)) {
			int result = memberService.deleteMember(m.getUserId());
			
			if(result > 0) {
				// 탈퇴처리 성공 => session에서 loginUser 지움, alert문구 담기 => 메인페이지 url 요청
				session.removeAttribute("loginUser");
				session.setAttribute("alertMsg", "탈퇴 성공");
				return "redirect:/";
			} else { // 탈퇴처리 실패
				session.setAttribute("errorMsg", "회원탈퇴실패");
				return "mypage/memberInfo";
			}
		} else { // 탈퇴처리 실패
			session.setAttribute("errorMsg", "회원탈퇴실패");
			return "mypage/memberInfo";
		}
	}
	
	
	

}
