package com.thegenesis.sweethome.mypage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.thegenesis.sweethome.common.template.Pagination;
import com.thegenesis.sweethome.common.vo.PageInfo;
import com.thegenesis.sweethome.community.model.vo.Community;
import com.thegenesis.sweethome.member.model.vo.Member;
import com.thegenesis.sweethome.mypage.model.service.MypageService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@RequestMapping("myBoard.my")
	public ModelAndView MyBoardView(@RequestParam(value="bpage", defaultValue="1")int BcurrentPage, @RequestParam(value="cpage", defaultValue="1")int CcurrentPage, HttpSession session, ModelAndView mv) {
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		int BlistCount = mypageService.myBoardListCount(userNo);
		int ClistCount = mypageService.myCommentListCount(userNo);
		
		PageInfo Bpi = Pagination.getPageInfo(BlistCount, BcurrentPage, 10, 10);
		PageInfo Cpi = Pagination.getPageInfo(ClistCount, CcurrentPage, 10, 10);
		
		ArrayList<Community> Blist = mypageService.selectMyBoardList(Bpi, userNo);
		ArrayList<Community> Clist = mypageService.selectMyCommentList(Cpi, userNo);		
		
		mv.addObject("Blist", Blist).addObject("Bpi", Bpi).addObject("Clist", Clist).addObject("Cpi", Cpi).setViewName("mypage/myBoardList");
		
		return mv;
	}
}
