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
	
	
	
	
	
}
