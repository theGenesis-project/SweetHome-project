package com.thegenesis.sweethome.tour.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thegenesis.sweethome.tour.model.service.TourService;
import com.thegenesis.sweethome.tour.model.vo.Tour;

@Controller
public class TourController {

	
	@Autowired
	private TourService tourService;
	
	@RequestMapping("insertTour.to")
	public String insertTour(Tour to,HttpSession session) {
		
		to.setAskContent(to.getAskContent().replace(System.lineSeparator(), "<br>"));
		
		int result = tourService.insertTour(to);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "투어신청 완료!");
			return "redirect:house.se";
		}else {
			session.setAttribute("alertMsg", "투어신청 실패! 다시 시도해주세요!");
			return "redirect:house.se";
		}
			
		

		
	}
	
}
