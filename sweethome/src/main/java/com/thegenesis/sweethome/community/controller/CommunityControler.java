package com.thegenesis.sweethome.community.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.thegenesis.sweethome.common.template.Pagination;
import com.thegenesis.sweethome.common.template.saveFile;
import com.thegenesis.sweethome.common.vo.PageInfo;
import com.thegenesis.sweethome.community.model.service.CommunityService;
import com.thegenesis.sweethome.community.model.vo.Community;
import com.thegenesis.sweethome.community.model.vo.CommunityFile;

@Controller
public class CommunityControler {
	
	@Autowired
	private CommunityService communityService;
	//게시글 개수
	public int listCount() {
		
		int boardType = 0;
		int count = communityService.listCount(boardType);
		
		return count;
	}
	//글 상세보기
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
		
		int boardType = 0;
		
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
		mv.addObject("boardType", boardType);
		
		mv.setViewName("community/noticeList");
		
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
			
		int boardType = 1;
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
			
		int listCount = communityService.searchInfoCount(map);
			
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			
		ArrayList<Community> list = communityService.searchInfoList(pi, map);
			
		mv.addObject("pi", pi);
		mv.addObject("list", list);
			
		mv.addObject("condition", condition);
		mv.addObject("keyword", keyword);
		mv.addObject("boardType", boardType);
			
		mv.setViewName("community/noticeList");
			
		return mv;
				
	}
	//중고장터
	//메이트찾기
	
	
	
	
	
	
	
	
	
	//게시글 쓰기(글작성 폼 띄워줌)
	@RequestMapping("insertBoardView.co")
	public ModelAndView insertBoardView(ModelAndView mv, int bType) {
		
		if(bType == 2) {		
			mv.addObject("boardType", 2);
			mv.setViewName("community/boardEnrollForm");//중고장터 	
		}else if(bType == 0) {
			mv.addObject("boardType", 0);
			mv.setViewName("community/boardEnrollForm");//공지사항
		}else if(bType == 1) {
			mv.addObject("boardType", 1);
			mv.setViewName("community/boardEnrollForm");//정보
		}else if(bType == 3){
			mv.addObject("boardType", 3);
			mv.setViewName("community/boardEnrollForm");//메이트찾기
		}
		return mv;
	}
	//게시글 쓰기
	@RequestMapping("insert.co")
	public String insertBoard(Model model, Community cm, MultipartFile upfile, HttpSession session, int boardType) {
		
		CommunityFile CoFile = null;//파일 테이블 따로 씀
		System.out.println(boardType);
	 	
		//전달된 파일있을 경우 파일명 수정 후 서버에 업로드
		if(!upfile.getOriginalFilename().equals("")) {//선택된 파일이 있을 경우
						
			String changeName = saveFile.changeFileName(upfile, session);//파일명 수정
			
			CoFile = CommunityFile.builder()
								.originName(upfile.getOriginalFilename())
								.changeName(changeName)
								.filePath("resources/uploadFiles/" + changeName)
								.build();
						
		}
			
		int result = communityService.insertBoard(cm, CoFile);
		
		if(result > 0) {//성공
			//session.setAttribute("alertMsg", "게시글 작성 성공");
			return "community/noticeList";
		}else {//실패
			return "community/noticeList";
		}
		
		
	}


}
