package com.thegenesis.sweethome.interior.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.thegenesis.sweethome.common.template.Pagination;
import com.thegenesis.sweethome.common.template.saveFile;
import com.thegenesis.sweethome.common.vo.PageInfo;
import com.thegenesis.sweethome.interior.model.service.InteriorService;
import com.thegenesis.sweethome.interior.model.vo.Interior;
import com.thegenesis.sweethome.interior.model.vo.InteriorFile;
import com.thegenesis.sweethome.member.model.vo.Member;
@Controller
public class InteriorController {
	
	
	@Autowired
	private InteriorService interiorService;
	
	@RequestMapping("interior.in")
	public String interiorList() {
		
		return "interior/interiorList";
	}
	//게시글 개수
	public int listCount() {
		
		int inteCate = 0;
		int count = interiorService.listCount(inteCate);
		
		return count;
		
	}
	//인테리어 게시글 리스트
	@RequestMapping("interiorList.in")
	public ModelAndView selectInteriorList(@RequestParam(value="inpage", defaultValue="1")int currentPage,@RequestParam(value="intCate") int inteCate, ModelAndView mv ) {
				
		int listCount = interiorService.listCount(inteCate);
				
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 6);
		
		ArrayList<Interior> list = interiorService.selectInteriorList(pi, inteCate);	
		
		mv.addObject("list", list).addObject("pi", pi).addObject("inteCate",inteCate).setViewName("interior/interiorList");
		return mv;
		
	}
	//인테리어 등록 폼으로 
	@RequestMapping("insertInteriorView.in")
	public String insertInteriorView() {
		
		return "interior/interiorEnrollForm";
	}
	//인테리어 등록
	@RequestMapping("insertInterior.in")
	public String insertInterior(Model model, Interior in, MultipartFile[] file, HttpSession session) {
		
		InteriorFile inf = null;//파일 테이블
		
		ArrayList<InteriorFile> list = new ArrayList<>();//사진 담을 공간
			
	for(int i = 0; i<file.length; i++) {
		//전달된 파일 있을 경우 파일명 수정 후 서버에 업로드
	
		if(!file[i].getOriginalFilename().equals("")) {//선택한 파일이 있을 경우
		
							
				String changeName = saveFile.changeFileName(file[i], session);
												
					if(i == 0) {
						inf = InteriorFile.builder()
								.originName(file[i].getOriginalFilename())
								.changeName(changeName)
								.filePath("resources/uploadFiles/" + changeName)
								.fileLevel(1)
								.build();
						
					}else {
						inf = InteriorFile.builder()
								.originName(file[i].getOriginalFilename())
								.changeName(changeName)
								.filePath("resources/uploadFiles/" + changeName)
								.fileLevel(2)
								.build();				
					}							
					list.add(inf);	
				}				
		}
		int result = interiorService.insertInterior(in, list);
		
		if(result>0) {
			session.setAttribute("alertMsg","인테리어 등록 성공");
			return "interior/interiorList";
			
		}else {
			session.setAttribute("alertMsg", "인테리어 등록 실패");
			return "interior/interiorList";
		}
		
		
		
	}
	//인테리어 삭제
	@RequestMapping("deleteInterior.in")
	public String deleteInterior(@RequestParam(value = "valueArrTest[]") List<String> valueArrTest) {
		
		System.out.println(valueArrTest);
		 //ArrayList<Integer> checkNumbers = new ArrayList<Integer>();
		  
		/*  for(int i = 0; i < checkList.length; i++) { 
			  
			  checkNumbers.add(checkList[i]); 
		  }
		  System.out.println(checkNumbers);
	
		  int result = interiorService.deleteInterior(checkNumbers);*/
		return "interior/interiorList";
	}
	//게시판 상세보기
	@RequestMapping("detail.in")
	public ModelAndView detailInterior(ModelAndView mv, int ino, HttpSession session) {
		
		int result = interiorService.increaseCount(ino);	
		
		int userNo = 0;
		if(((Member)session.getAttribute("loginUser")) != null) {
			
			userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		}
			
		if(result > 0) {
			
			Interior in = interiorService.interiorDetail(ino);
			ArrayList<InteriorFile> inf = interiorService.interiorDetailFile(ino);
			
			int infLength = (inf.size() - 1);//Carousel를 위한 forEach문 때문에 따로 만들어줘서 넘김
			
			//찜 확인
			HashMap<String, Integer> hm = new HashMap<>();
			hm.put("interiorNo", ino);
			hm.put("userNo", userNo);
			
			String idCheckHeart = interiorService.checkHeart(hm);//null/N/Y
			
			mv.addObject("in", in).addObject("inf", inf).addObject("infLength", infLength).addObject("idCheckHeart", idCheckHeart).setViewName("interior/interiorDetail");
			System.out.println(inf);
		}else {		
			mv.setViewName("Redirect:/");
			session.setAttribute("alertMsg", "게시글 불러오기 실패");
		}		
		return mv;	
	}
	/*
	//인테리어 역대 베스트
	@RequestMapping("interiorBestList.in")
	public ModelAndView selectInteriorList(ModelAndView mv ) {

		ArrayList<Interior> list = interiorService.selectInteriorBestList();	
		
		
		return mv;
		
	}*/
	
	//찜기능
	@ResponseBody
	@RequestMapping("changeHeart.in")
	public String changeHeart(int interiorNo, int userNo) {
			
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("interiorNo", interiorNo);
		hm.put("userNo", userNo);
		
		int checkHeart = interiorService.changeHeart(hm);
		//1: 하트 등록  2: 하트 해제
		
		System.out.println("ajax : " + checkHeart);
		return checkHeart == 1 ? "YY" : "NN";
		
	}
	
	//인테리어 검색기능
	@RequestMapping("searchInterior.in")
	public ModelAndView searchInterior(@RequestParam(value="siPage", defaultValue="1") int currentPage, ModelAndView mv, String keyword, String condition){
		
		
		HashMap<String, String> map = new HashMap<>();
		
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int listCount = interiorService.searchInteriorCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 6);
		
		ArrayList<Interior> list = interiorService.searchInterior(pi, map);
		
		mv.addObject("pi", pi);
		mv.addObject("list",list);
		mv.addObject("conditon", condition);
		mv.addObject("keyword", keyword);
		
		mv.setViewName("interior/interiorSearchList");
		
		return mv;
		
	}
	//인테리어 게시글 수정(불러오기)
	@RequestMapping("updateInteriorDetail.in")
	public String updateInteriorDetail(Model model, int interiorNo ) {
		
		//글내용 가져오기
		Interior in = interiorService.interiorDetail(interiorNo);
		ArrayList<InteriorFile> inf = interiorService.interiorDetailFile(interiorNo);
		
		int infLength = (inf.size() - 1);
		
		model.addAttribute("in", in);
		model.addAttribute("inf",inf);
		model.addAttribute("infLength", infLength);
		
		System.out.println(inf);
		System.out.println(infLength);
		return "interior/interiorUpdate";

	}
		
		 
		
	
		

}
