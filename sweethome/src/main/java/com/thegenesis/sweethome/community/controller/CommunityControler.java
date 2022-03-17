package com.thegenesis.sweethome.community.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.thegenesis.sweethome.common.template.Pagination;
import com.thegenesis.sweethome.common.vo.PageInfo;
import com.thegenesis.sweethome.community.model.service.CommunityService;
import com.thegenesis.sweethome.community.model.vo.Community;

@Controller
public class CommunityControler {
	
	@Autowired
	private CommunityService communityService;
	
	public int listCount() {
		
		int boardType = 0;
		int count = communityService.listCount(boardType);
		
		return count;
	}
	
	//공지사항 리스트
	@RequestMapping("notice.co")
	public ModelAndView noticeList(@RequestParam(value="npage", defaultValue="1") int currentPage, ModelAndView mv){
		
		int boardType = 0;
		
		int listCount = communityService.listCount(boardType);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Community> list = communityService.boardList(pi, boardType);
		System.out.println(list);
		
		mv.addObject("list", list).addObject("pi",pi).addObject("boardType", boardType).setViewName("community/noticeList");
		
		return mv;
	}
	//공지사항 검색기능
	@RequestMapping("searchNotice.co")
	public ModelAndView noticeSearch(@RequestParam(value="npage", defaultValue="1") int currentPage, ModelAndView mv, String keyword, String condition) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int listCount = communityService.searchNoticeCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Community> list = communityService.searchNoticeList(pi, map);
		
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		
		mv.addObject("condition", condition);
		mv.addObject("keyword", keyword);
		
		mv.setViewName("community/noticeList");
		
		return mv;
			
	}

	//공지사항 글 상세보기
	@RequestMapping("detail.co")
	public ModelAndView boardDetail(ModelAndView mv, int bno) {
		
		int result = communityService.increaseCount(bno);		
		
		if(result > 0) {
			
			Community cm = communityService.boardDetail(bno);
			
			mv.addObject("cm", cm);
			mv.setViewName("community/boardDetail");
			
					
		}else {
			mv.setViewName("Redirect:/");
			//나중에 alertMsg로 바꿔주기~
		}		
		return mv;
	}
	
	//정보게시판 리스트
	@RequestMapping("info.co")
	public ModelAndView infoList(@RequestParam(value="ipage", defaultValue="1") int currentPage, ModelAndView mv){
		
		int boardType = 1;
		
		int listCount = communityService.listCount(boardType);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Community> list = communityService.boardList(pi, boardType);
		
		mv.addObject("list", list).addObject("pi",pi).addObject("boardType", boardType).setViewName("community/noticeList");
		
		return mv;
	}
	
	//정보게시판 검색기능
	@RequestMapping("searchInfo.co")
	public ModelAndView infoSearch(@RequestParam(value="ipage", defaultValue="1") int currentPage, ModelAndView mv, String keyword, String condition) {
			
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
			
		int listCount = communityService.searchNoticeCount(map);
			
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			
		ArrayList<Community> list = communityService.searchNoticeList(pi, map);
			
		mv.addObject("pi", pi);
		mv.addObject("list", list);
			
		mv.addObject("condition", condition);
		mv.addObject("keyword", keyword);
			
		mv.setViewName("community/noticeList");
			
		return mv;
				
	}


}
