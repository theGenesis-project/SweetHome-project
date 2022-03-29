package com.thegenesis.sweethome.house.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.thegenesis.sweethome.common.template.Pagination;
import com.thegenesis.sweethome.common.vo.PageInfo;
import com.thegenesis.sweethome.house.model.service.HouseService;
import com.thegenesis.sweethome.house.model.vo.House;
import com.thegenesis.sweethome.house.model.vo.HouseFile;
import com.thegenesis.sweethome.room.model.service.RoomService;
import com.thegenesis.sweethome.room.model.vo.Room;

@Controller
public class HouseController {
	
	@Autowired
	private HouseService houseService;
	

	
	// 테스트용
	@RequestMapping("houseInsert")
	public String houseInsert() {
		return "house/houseInsert";
	}
	
	@RequestMapping("test")
	public String test() {
		return "house/test";
	}
	
	/**
	 * 하우스 등록
	 */
	@RequestMapping("insertHouse.ho")
	public ModelAndView insertHouse(House h, HouseFile hf, Room r, MultipartFile[] upfile, HttpSession session, ModelAndView mv, HashMap<Object, Object> fileObj) {
		
		System.out.println("찍힘?");
		System.out.println(fileObj);
		System.out.println("ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ");

		
		
		
		// textarea 줄바꿈 => <br> 처리
		h.setHouseTitle(h.getHouseTitle().replace(System.lineSeparator(), "<br>"));
		h.setHouseIntroduce(h.getHouseIntroduce().replace(System.lineSeparator(), "<br>"));
		h.setShareSpace(h.getShareSpace().replace(System.lineSeparator(), "<br>"));
		h.setPersonalSpace(h.getPersonalSpace().replace(System.lineSeparator(), "<br>"));
		h.setTraffic(h.getTraffic().replace(System.lineSeparator(), "<br>"));
		h.setConvenience(h.getConvenience().replace(System.lineSeparator(), "<br>"));
		
		int result = houseService.insertHouse(h);
		
		
		House h2 = houseService.selectHouse(h.getHouseName());
		

		
		
		mv.addObject("h2", h2).setViewName("main");
		
		
		
		return mv;
		
	}
	
	@RequestMapping("house.se")
	public ModelAndView houseSearch(ModelAndView mv) {
		
	
		ArrayList<House> list = houseService.houseSearch();

	
		mv.addObject("list", list).setViewName("house/houseList");
		
		
		return mv;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "keyword.se", produces="application/json; charset=utf-8")
	public String keywordSearch(String keyword) {
		
		ArrayList<House> list1 = houseService.keywordSearch(keyword);

		return new Gson().toJson(list1);
	}
	/**
	 * 하우스 이미지 파일 처리
	 * @param hf
	 * @param session
	 * @return
	 */
	public String setFile(HouseFile hf, MultipartFile[] upfile, HttpSession session) {
		
		
		if(!upfile[0].getOriginalFilename().equals("")) { // getOriginalFilename() == filename 필드의 값을 반환함
			/*
			// 파일명 수정 작업 후 서버에 업로드 시키기 ("bono.png" => "2022022115374012135.png")
			String originName = upfile.getOriginalFilename(); // 첨부파일의 원본명("bono.png")
			
			// "20220221153740" (연월일시분초)
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			// 13232(5자리 랜덤값)
			int ranNum = (int)(Math.random() * 90000 + 10000);
			// 확장자
			String ext = originName.substring(originName.lastIndexOf("."));
			
			String changeName = currentTime + ranNum + ext;
			
			// 업로드 시키고자 하는 폴더의 물리적인 경로 알아내기
			String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
			
			try {
				upfile.transferTo(new File(savePath + changeName));
			} catch (IOException e) {
				e.printStackTrace();
			}
			*/
			String changeName = saveFile(upfile, session);
			
			b.setOriginName(upfile[0].getOriginalFilename()); // 원본명
			b.setChangeName("resources/uploadFiles/" + changeName);
			
		}
		
		
		return null;
	}
	
	/**
	 * 이미지 파일 이름 변경 후 업로드
	 * @param upfile
	 * @param session
	 * @return
	 */
	public String saveFile(MultipartFile[] upfile, HttpSession session) { // 실제 넘어온 파일을 이름을 변경해서 서버에 업로드하는 역할 밖에 하지 않음
		
		// 파일명 수정 작업 후 서버에 업로드 시키기 ("bono.png" => "2022022115374012135.png")
		String originName = upfile.getOriginalFilename(); // 첨부파일의 원본명("bono.png")
		
		// "20220221153740" (연월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		// 13232(5자리 랜덤값)
		int ranNum = (int)(Math.random() * 90000 + 10000);
		// 확장자
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		// 업로드 시키고자 하는 폴더의 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;

	}
	
	
}
