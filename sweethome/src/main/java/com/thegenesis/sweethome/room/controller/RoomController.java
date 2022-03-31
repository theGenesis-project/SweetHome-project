package com.thegenesis.sweethome.room.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.thegenesis.sweethome.common.vo.Report;
import com.thegenesis.sweethome.house.model.vo.House;
import com.thegenesis.sweethome.member.model.vo.Member;
import com.thegenesis.sweethome.room.model.service.RoomService;
import com.thegenesis.sweethome.room.model.vo.Room;



@Controller
public class RoomController {
	
	@Autowired
	private RoomService roomService;
	

	@RequestMapping("house.de")
	public ModelAndView houseDetail(ModelAndView mv, int hno,HttpSession session) {
	
		ArrayList<Room> room = roomService.houseDetail(hno);
		
		Room room1 = roomService.houseDetailOne(hno);
		
		int result = roomService.increaseCount(hno);	
		
		int userNo = 0;
		if(((Member)session.getAttribute("loginUser")) != null) {
			
			userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		}
			
		if(result > 0) {
		

		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("houseNo", hno);
		hm.put("userNo", userNo);
		
		String idCheckHeart = roomService.checkHeart(hm);//null/N/Y

		
		mv.addObject("room" ,room).addObject("room1", room1).addObject("idCheckHeart",idCheckHeart).setViewName("house/houseDetail");
				
		
		}
		
		return mv;
		
	}	
	
	@RequestMapping("tour.re")
	public String tourRequest(@RequestParam(value = "hno")int hno,@RequestParam(value = "rno")int rno,Model model) {
		

			model.addAttribute(hno);
			model.addAttribute(rno);
		
		return "house/tour";
	}
	
	@RequestMapping(value = "insertTour.to", method = RequestMethod.POST)
	public String insertTour(int hno,int rno){
		
		return "house/houseList";
	}
	
	//게시글 신고
		@RequestMapping("reportRoom.ho")
		public String reportRoom(int houseNo, int reportCate, int userNo, HttpSession session) {		
			
			HashMap<String, String> map = new HashMap<>(); 
			map.put("houseNo", Integer.toString(houseNo));
			map.put("userNo", Integer.toString(userNo));
			
			int check = roomService.reportCheck(map);//신고여부체크
				
			if(check == 0) {
				Report r = new Report();
				r = Report.builder()
						.houseNo(houseNo)
						.reportCate(reportCate)
						.userNo(userNo)
						.build();
			
				
				int result = roomService.reportRoom(r);
				
				if(result>0) {
					session.setAttribute("alertMsg", "신고완료");
					return "redirect:house.de?hno=" + houseNo;
				}else {
					session.setAttribute("alertMsg", "신고 실패");
					return "redirect:house.de?hno=" + houseNo;
				}
				
			}else {
				session.setAttribute("alertMsg", "이미 신고하셨습니다.");
				return "redirect:house.de?hno=" + houseNo;
			}
					
		}
   
	@ResponseBody
	@RequestMapping("changeHeart.ho")
	public String changeHeart(int houseNo, int userNo) {
				
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("houseNo", houseNo);
		hm.put("userNo", userNo);
			
		int checkHeart = roomService.changeHeart(hm);
		//1: 하트 등록  2: 하트 해제
			
		return checkHeart == 1 ? "YY" : "NN";
			
		}
}
