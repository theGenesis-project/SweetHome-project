package com.thegenesis.sweethome.interior.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.thegenesis.sweethome.common.template.Pagination;
import com.thegenesis.sweethome.common.template.saveFile;
import com.thegenesis.sweethome.common.vo.PageInfo;
import com.thegenesis.sweethome.community.model.vo.Community;
import com.thegenesis.sweethome.community.model.vo.CommunityFile;
import com.thegenesis.sweethome.interior.model.service.InteriorService;
import com.thegenesis.sweethome.interior.model.vo.Interior;
import com.thegenesis.sweethome.interior.model.vo.InteriorFile;
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
	
	@RequestMapping("detailInterior.in")
	public ModelAndView detailInterior(ModelAndView mv, int ino) {
		
		int result = interiorService.increaseCount(ino);
		
		if(result > 0) {
			
			Community cm = interiorService.boardDetail(ino);
			CommunityFile cf = interiorService.boardDetailFile(ino);
			
			mv.addObject("cm", cm);
			mv.addObject("cf", cf);
			mv.setViewName("community/boardDetail");
				
						
		}else {
			
			mv.setViewName("Redirect:/");
			//나중에 alertMsg로 바꿔주기~
		}		
		return mv;
		
	}
		
		
		 
		
	
		

}
