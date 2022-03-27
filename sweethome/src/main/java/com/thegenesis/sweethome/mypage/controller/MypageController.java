package com.thegenesis.sweethome.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.thegenesis.sweethome.common.template.Pagination;
import com.thegenesis.sweethome.common.vo.MoreVO;
import com.thegenesis.sweethome.common.vo.PageInfo;
import com.thegenesis.sweethome.community.model.vo.Community;
import com.thegenesis.sweethome.house.model.vo.House;
import com.thegenesis.sweethome.member.model.vo.Member;
import com.thegenesis.sweethome.mypage.model.service.MypageService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@RequestMapping("myBoard.my")
	public ModelAndView MyBoardView(@RequestParam(value="bpage", defaultValue="1")int BcurrentPage, 
			@RequestParam(value="cpage", defaultValue="1")int CcurrentPage, HttpSession session, ModelAndView mv) {
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		int BlistCount = mypageService.myBoardListCount(userNo);
		int ClistCount = mypageService.myCommentListCount(userNo);
		
		PageInfo Bpi = Pagination.getPageInfo(BlistCount, BcurrentPage, 10, 10);
		PageInfo Cpi = Pagination.getPageInfo(ClistCount, CcurrentPage, 10, 10);
		
		ArrayList<Community> Blist = mypageService.selectMyBoardList(Bpi, userNo);
		ArrayList<Community> Clist = mypageService.selectMyCommentList(Cpi, userNo);		
		
		mv.addObject("Blist", Blist).addObject("Bpi", Bpi).addObject("Clist", Clist).addObject("Cpi", Cpi).setViewName("mypage/myBoardList");
		
		return mv;
	}
	
	@RequestMapping("deleteBoard.my")
	public String deleteMyBoard(int[] boardList, HttpSession session) {
		int result = mypageService.deleteMyBoard(boardList);
		
		if(result <= 0) {
			session.setAttribute("errorMsg", "게시글 삭제에 실패했습니다. 다시 시도해주세요.");
		}
		
		return "redirect:/myBoard.my";

	}
	
	@RequestMapping("userTour.my")
	public void MyTourList(@RequestParam(value="tpage", defaultValue="1")int currentPage, HttpSession session) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		int listCount = mypageService.myTourListCount(userNo);
	}
	
	@RequestMapping("dibsList.my")
	public ModelAndView myDibsList(HttpSession session, ModelAndView mv) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		int listCount = mypageService.myDibsHouseCount(userNo); // 전체 게시글 수
		
		MoreVO m = new MoreVO(0, 6); // 처음 보여줄 게시글 수
		
		ArrayList<House> Hlist = mypageService.selectMyHouseList(m, userNo);
		
		listCount = listCount - Hlist.size();
		
		mv.addObject("Hlist", Hlist).addObject("listCount", listCount).setViewName("mypage/dibsList");
		
		return mv;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("getMoreHouse.my")
	public void AjaxGetMoreHouse(MoreVO m, HttpSession session, HttpServletResponse response) throws IOException {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		int listCount = mypageService.myDibsHouseCount(userNo); // 전체 게시글 수
		int remain = listCount - m.getCallLength(); // 남은 게시글 수
		if(remain < m.getLimit()) { // 남은 게시글 갯수가 불러올 게시글 수보다 적을 때
			m.setLimit(remain); 
		}
		
		ArrayList<House> morelist = mypageService.selectMyHouseList(m, userNo);
		
		JSONObject jObj = new JSONObject();
		jObj.put("remain", remain - morelist.size()); // 남은 listCount 수
		JSONArray jArr = new JSONArray(); // JSONObject 안에 들어갈 ArrayList를 담을 배열
		for(int i = 0; i < morelist.size(); i++) {
			JSONObject house = new JSONObject(); // 배열 안에 들어갈 JSONObject
			house.put("houseNo", morelist.get(i).getHouseNo());
			house.put("houseName", morelist.get(i).getHouseName());
			house.put("houseGender", morelist.get(i).getHouseGender());
			house.put("monthly", morelist.get(i).getMonthly());
			house.put("status", morelist.get(i).getStatus());
			jArr.add(house); // 배열에 house 넣기
		}
		jObj.put("data", jArr); // obj에 배열 넣기
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jObj);
	}
}
