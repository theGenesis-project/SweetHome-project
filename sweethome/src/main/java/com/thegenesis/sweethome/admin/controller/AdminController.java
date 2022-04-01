package com.thegenesis.sweethome.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.thegenesis.sweethome.admin.model.service.AdminService;
import com.thegenesis.sweethome.common.template.Pagination;
import com.thegenesis.sweethome.common.vo.PageInfo;
import com.thegenesis.sweethome.common.vo.Report;
import com.thegenesis.sweethome.interior.model.vo.OrderInfo;
import com.thegenesis.sweethome.member.model.vo.Member;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("admin.me")
	public String adminMainView() {
		return "admin/adminMain";
	}
	
	@RequestMapping("memberList.me")
	public ModelAndView selectList(@RequestParam(value="mpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = adminService.selectMemberCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Member> Mlist = adminService.selectMemberList(pi);
	
		mv.addObject("Mlist",Mlist).addObject("pi", pi).setViewName("admin/adminMember");
		
		return mv;
	}
	
	@RequestMapping("orderList.ad")
	public ModelAndView adminOrderList(@RequestParam(value="npage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = adminService.adminOrderListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<OrderInfo> orderinfo = adminService.selectOrderList(pi);
	
		mv.addObject("list",orderinfo).addObject("pi", pi).setViewName("admin/adminOrderList");
		
		return mv;
	}
	
	//주문 내역 확인
	/*
	@RequestMapping("orderInfoDetail.ad")
	public ModelAndView adminOrderInfoDetail(ModelAndView mv, HttpSession session/*, int orderNo*//*) {
			
		//Member m = (Member)session.getAttribute("loginUser");
		
		//int userNo = m.getUserNo();
		int orderNo = 3;//임시
			
		//HashMap<String, Integer> map = new HashMap<String, Integer>();
		//map.put("userNo", userNo);
		//map.put("orderNo", orderNo);
			
		//OrderInfo orderInfo =  interiorService.orderInfoDetail(map);
		OrderInfo orderInfo =  adminService.adminOrderInfoDetail(orderNo);
			
		mv.addObject("oi", orderInfo);
		mv.setViewName("interior/orderPageDetail");
			
		return mv;
			
	}*/
	/*
	//신고내역
	@RequestMapping("reportList.ad")
	public ModelAndView adminReportList(@RequestParam(value="npage", defaultValue="1") int currentPage) {
		
		//listCount 
		int boardReportCount = adminService.boardReportCount();
		int replyReportCount = adminService.replyReportCount();
		int houseReportCount = adminService.houseReportCount();
		
		PageInfo Bpi = Pagination.getPageInfo(boardReportCount, currentPage, 10, 10);
		PageInfo Rpi = Pagination.getPageInfo(replyReportCount, currentPage, 10, 10);
		PageInfo Hpi = Pagination.getPageInfo(houseReportCount, currentPage, 10, 10);
		
		ArrayList<Report> boardReport = adminService.selectboardReportList(Bpi);
		ArrayList<Report> replyReport = adminService.selectreplyReportList(Rpi);
		ArrayList<Report> houseReport = adminService.selecthouseReportList(Hpi);
		
		mv.addObject("list",orderinfo).addObject("pi", pi).setViewName("admin/adminOrderList");
		
		
	}*/
	
	
	
	
	
	
}
