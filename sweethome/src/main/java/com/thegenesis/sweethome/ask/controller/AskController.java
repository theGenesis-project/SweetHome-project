package com.thegenesis.sweethome.ask.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.thegenesis.sweethome.ask.model.service.AskService;
import com.thegenesis.sweethome.ask.model.vo.Ask;
import com.thegenesis.sweethome.ask.model.vo.AskFile;
import com.thegenesis.sweethome.common.template.Pagination;
import com.thegenesis.sweethome.common.template.saveFile;
import com.thegenesis.sweethome.common.vo.PageInfo;
import com.thegenesis.sweethome.member.model.vo.Member;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class AskController {
	
	@Autowired
	private AskService askService;
	
	@RequestMapping("askForm")
	public String askFormView() {
		return "ask/askEnrollForm";
	}
	
	@RequestMapping("insert.ask")
	public ModelAndView insertAsk(Ask a, MultipartFile upfile, ModelAndView mv, HttpSession session) {
		AskFile file = null;
		
		// 들어온 사진이 있는 경우
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile.changeFileName(upfile, session);
			
			file = AskFile.builder()
						.originName(upfile.getOriginalFilename())
						.changeName(changeName)
						.filePath("resources/uploadFiles/" + changeName)
						.build();
		}
		
		// 글 등록
		int result = askService.insertAsk(a, file);
		
		if(result > 0) {
			mv.addObject("alertMsg", "문의 등록 성공!").setViewName("redirect:/list.ask");//마이페이지 1:1문의 항목으로
		} else {
			mv.addObject("errorMsg", "문의 등록 실패!").setViewName("ask/askEnrollForm");
		}
	
		return mv;
	}
	
	@RequestMapping("list.ask")
	public ModelAndView askListView(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, ModelAndView mv) {
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		PageInfo pi = null;
		
		int listCount = askService.selectAskCount(userNo);

		pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Ask> list = askService.selectList(userNo, pi);
		
		mv.addObject("list", list).addObject("pi",  pi).setViewName("ask/askList");
		
		return mv;
	}
	
	@RequestMapping("detail.ask")
	public ModelAndView askDetailView(int ano, ModelAndView mv, HttpSession session) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		Ask ref = Ask.builder()
					.askNo(ano)
					.userNo(userNo)
					.build();
		
		ArrayList<Object> a = askService.selectAskOne(ref);
		
		log.info("===================");
		log.info(a.get(0));
		log.info(a.get(1));
		
		mv.addObject("a", a.get(0)).addObject("aFile", a.get(1)).setViewName("ask/askDetailView");
		return mv;
	}
}
