package com.thegenesis.sweethome.community.controller;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.thegenesis.sweethome.common.template.Pagination;
import com.thegenesis.sweethome.common.template.saveFile;
import com.thegenesis.sweethome.common.vo.PageInfo;
import com.thegenesis.sweethome.common.vo.Report;
import com.thegenesis.sweethome.community.model.service.CommunityService;
import com.thegenesis.sweethome.community.model.vo.Community;
import com.thegenesis.sweethome.community.model.vo.CommunityFile;
import com.thegenesis.sweethome.community.model.vo.Reply;


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
	public ModelAndView boardDetail(ModelAndView mv, int bno, HttpSession session) {
			
		int result = communityService.increaseCount(bno);		
			
		if(result > 0) {
				
			Community cm = communityService.boardDetail(bno);
			CommunityFile cf = communityService.boardDetailFile(bno);
			
			mv.addObject("cm", cm);
			mv.addObject("cf", cf);
			mv.setViewName("community/boardDetail");
				
						
		}else {
			
			session.setAttribute("alertMsg", "상세조회 실패");
			mv.setViewName("community/noticeList");
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
		
		mv.addObject("list", list).addObject("pi",pi).addObject("boardType", boardType).setViewName("community/noticeList");
		
		return mv;
	}
	//공지사항 검색기능
	@RequestMapping("searchNotice.co")
	public ModelAndView noticeSearch(@RequestParam(value="npage", defaultValue="1") int currentPage, ModelAndView mv, String keyword, String condition) {
		
		String boardType = "0";//여기바꿈
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("bType", boardType);//여기바꿈
		
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
				
		String boardType = "1";
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("bType", boardType);
			
				
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
	//중고장터
	@RequestMapping("flea.co")
	public ModelAndView fleaList(@RequestParam(value="fpage", defaultValue="1") int currentPage, ModelAndView mv){
			
		int boardType = 2;
			
		int listCount = communityService.listCount(boardType);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			
		ArrayList<Community> list = communityService.boardList(pi, boardType);
			
		mv.addObject("list", list).addObject("pi",pi).addObject("boardType", boardType).setViewName("community/noticeList");
			
		return mv;
	}
		
	//중고장터 검색기능
	@RequestMapping("searchflea.co")
	public ModelAndView fleaSearch(@RequestParam(value="mpage", defaultValue="1") int currentPage, ModelAndView mv, String keyword, String condition) {
				
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("boardType", "2");
			
				
		int listCount = communityService.searchNoticeCount(map);
				
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
				
		ArrayList<Community> list = communityService.searchNoticeList(pi, map);
				
		mv.addObject("pi", pi);
		mv.addObject("list", list);
				
		mv.addObject("condition", condition);
		mv.addObject("keyword", keyword);
		mv.addObject("boardType", 2);
				
		mv.setViewName("community/noticeList");
				
		return mv;
					
	}
	//메이트찾기
	@RequestMapping("mate.co")
	public ModelAndView mateList(@RequestParam(value="mpage", defaultValue="1") int currentPage, ModelAndView mv){
			
		int boardType = 3;
			
		int listCount = communityService.listCount(boardType);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			
		ArrayList<Community> list = communityService.boardList(pi, boardType);
			
		mv.addObject("list", list).addObject("pi",pi).addObject("boardType", boardType).setViewName("community/noticeList");
			
		return mv;
	}
		
	//메이트찾기 검색기능
	@RequestMapping("searchmate.co")
	public ModelAndView mateSearch(@RequestParam(value="mpage", defaultValue="1") int currentPage, ModelAndView mv, String keyword, String condition) {
				
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("boardType", "3");
			
				
		int listCount = communityService.searchNoticeCount(map);
				
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
				
		ArrayList<Community> list = communityService.searchNoticeList(pi, map);
				
		mv.addObject("pi", pi);
		mv.addObject("list", list);
				
		mv.addObject("condition", condition);
		mv.addObject("keyword", keyword);
		mv.addObject("boardType", 3);
				
		mv.setViewName("community/noticeList");
				
		return mv;
					
	}
	
	
	
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
	public String insertBoard(Model model, Community cm, MultipartFile upfile, HttpSession session) {
		
		CommunityFile cf = null;//파일 테이블 따로 씀
	
		//전달된 파일있을 경우 파일명 수정 후 서버에 업로드
		if(!upfile.getOriginalFilename().equals("")) {//선택된 파일이 있을 경우
						
			String changeName = saveFile.changeFileName(upfile, session);//파일명 수정
			
			cf = CommunityFile.builder()
								.originName(upfile.getOriginalFilename())
								.changeName(changeName)
								.filePath("resources/uploadFiles/" + changeName)
								.build();
						
		}
			
		int result = communityService.insertBoard(cm, cf);
		
		if(result > 0) {//성공
			session.setAttribute("alertMsg", "게시글 작성 성공");
			if(cm.getBoardType() == 0) {//각자의 페이지로
				return "redirect:notice.co";
			}else if(cm.getBoardType() == 1) {
				return "redirect:info.co";
			}else if(cm.getBoardType() == 2) {
				return "redirect:flea.co";
			}else {
				return "redirect:mate.co";
			}
			
			
		}else {//실패
			session.setAttribute("alertMsg", "게시글 작성 실패");
			return "redirect:notice.co";
		}
		
		
	}
	//게시글 수정(불러오기)
	@RequestMapping("updateBoardView.co")
	public String updateBoardView(int bno, Model model) {
	
		//글 내용 가져오기
		Community cm = communityService.boardDetail(bno);
		CommunityFile cf = communityService.boardDetailFile(bno);
	
		//updateForm으로
		model.addAttribute("cm", cm);
		model.addAttribute("cf", cf);
		return "community/boardUpdate";
		
	}
	//게시글 수정
	@RequestMapping("update.co")
	public String updateBoard(Community cm, CommunityFile cf, Model model, HttpSession session, MultipartFile reupfile ) {
		
		//새로 첨부파일이 넘어온 경우
		if(!reupfile.getOriginalFilename().equals("")) {
			if(cf.getOriginName() !=null) {
				//기존 첨부파일이 있는 경우--> 첨부 파일 삭제				
				new File(session.getServletContext().getRealPath(cf.getFilePath())).delete();
			}
			
			//새로운 첨부파일 등록
			String changeName = saveFile.changeFileName(reupfile, session);
			
			cf = CommunityFile.builder().originName(reupfile.getOriginalFilename())
						.fileNo(cf.getFileNo())
						.boardNo(cm.getBoardNo())
						.originName(reupfile.getOriginalFilename())
						.changeName(changeName)
						.filePath("resources/uploadFiles/" + changeName)
						.build();
		}
		
		//글 수정하기
		int result = communityService.updateBoard(cm, cf);
		
		if(result > 0) {//성공
			session.setAttribute("alertMsg", "게시글 수정 성공");
			return "redirect:detail.co?bno=" + cm.getBoardNo();
			
			
		}else {//실패
			session.setAttribute("alertMsg", "게시글 수정 실패");
			return "redirect:detail.co?bno=" + cm.getBoardNo();
		}

	}
	
	@RequestMapping("deleteBoard.co")
	public String deleteBoard(int bno, String filePath, int boardType, HttpSession session, Model model) {
		
		int result = communityService.deleteBoard(bno);
		
		if(result > 0) {//삭제 성공				
				//첨부파일이 있을 삭제
				if(!filePath.equals("")) {		
					new File(session.getServletContext().getRealPath(filePath)).delete();				
				}				
				session.setAttribute("alertMsg", "게시글 삭제 성공");
				if(boardType == 0) {//각자의 페이지로
					return "redirect:notice.co";
				}else if(boardType == 1) {
					return "redirect:info.co";
				}else if(boardType == 2) {
					return "redirect:flea.co";
				}else {
					return "redirect:mate.co";
				}
				
		}else {//삭제 실패
				model.addAttribute("alertMsg", "게시글 삭제 실패");
				return "redirect:notice.co";
		}
	
	}
	//게시글 신고
	@RequestMapping("reportBoard.co")
	public String reportBoard(int boardNo, int reportCate, int userNo, HttpSession session) {		
		
		HashMap<String, String> map = new HashMap<>(); 
		map.put("boardNo", Integer.toString(boardNo));
		map.put("UserNo", Integer.toString(userNo));
		
		int check = communityService.reportCheck(map);//신고여부체크
			
		if(check == 0) {
			Report r = new Report();
			r = Report.builder()
					.boardNo(boardNo)
					.reportCate(reportCate)
					.userNo(userNo)
					.build();
		
			
			int result = communityService.reportBoard(r);
			
			if(result>0) {
				session.setAttribute("alertMsg", "신고완료");
				return "redirect:detail.co?bno=" + boardNo;
			}else {
				session.setAttribute("alertMsg", "신고 실패");
				return "redirect:detail.co?bno=" + boardNo;
			}
			
		}else {
			session.setAttribute("alertMsg", "이미 신고하셨습니다.");
			return "redirect:detail.co?bno=" + boardNo;
		}
				
	}
	
		//댓글 리스트
		@ResponseBody
		@RequestMapping(value="replyList.co", produces="application/json; charset=UTF-8")
		public String ajaxSelectReplyList(int boardNo) {
		
			ArrayList<Reply> replyList = communityService.selectReplyList(boardNo);
					
			return new Gson().toJson(replyList);
		}
			
		//댓글 작성
		@ResponseBody
		@RequestMapping(value="replyInsert.co")
		public String ajaxInsertReply(Reply rp) {
			
			int result = communityService.insertReply(rp);		
			
			return (result > 0 ? "YY" : "NN");
		}
		
		//댓글 수정
		@RequestMapping("updateReply.co")
		public String updateReply(Reply rp, HttpSession session) {
			System.out.println(rp);
			
			int boardNo = rp.getBoardNo();
			
			int result = communityService.updateReply(rp);
			
			if(result>0) {
				session.setAttribute("alertMsg", "댓글 수정 성공");
				return "redirect:detail.co?bno=" + boardNo;
			}else {
				session.setAttribute("alertMsg", "댓글 수정 실패");
				return "redirect:detail.co?bno=" + boardNo;
			}
			
		}
		
		//댓글 삭제
		@RequestMapping(value="deleteReply.co",  method = RequestMethod.GET)
		public String deleteReply(@RequestParam(value="replyNo") int replyNo, @RequestParam(value="boardNo")int boardNo, HttpSession session) {
			
			int result = communityService.deleteReply(replyNo);
			
			if(result>0) {
				session.setAttribute("alertMsg", "댓글 삭제 성공");
				return "redirect:detail.co?bno=" + boardNo;
			}else {
				session.setAttribute("alertMsg", "댓글 삭제 실패");
				return "redirect:detail.co?bno=" + boardNo;
			}

		}
		//댓글 신고
		@RequestMapping("reportReply.co")
		public String reportReply(int boardNo, int replyNo, int reportCate, int userNo, HttpSession session) {
			
			System.out.println(boardNo);
			
			HashMap<String, String> map = new HashMap<>(); 
			map.put("replyNo", Integer.toString(replyNo));
			map.put("UserNo", Integer.toString(userNo));
			
			int check = communityService.reportCheckReply(map);//신고여부체크
				
			if(check == 0) {
				Report r = new Report();
				
				r = Report.builder()
						.replyNo(replyNo)
						.reportCate(reportCate)
						.userNo(userNo)
						.build();
			
				
				int result = communityService.reportReply(r);
				
				System.out.println(result);
				
				if(result>0) {
					session.setAttribute("alertMsg", "신고완료");
					return "redirect:detail.co?bno=" + boardNo;
				}else {
					session.setAttribute("alertMsg", "신고 실패");
					return "redirect:detail.co?bno=" + boardNo;
				}
				
			}else {
				session.setAttribute("alertMsg", "이미 신고하셨습니다.");
				return "redirect:detail.co?bno=" + boardNo;
			}
					
		}
		
		
		
	
	
	


}
