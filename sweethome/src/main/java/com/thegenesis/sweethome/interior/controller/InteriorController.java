package com.thegenesis.sweethome.interior.controller;

import java.io.File;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
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
import com.thegenesis.sweethome.interior.model.service.InteriorService;
import com.thegenesis.sweethome.interior.model.vo.Interior;
import com.thegenesis.sweethome.interior.model.vo.InteriorFile;
import com.thegenesis.sweethome.interior.model.vo.OrderInfo;
import com.thegenesis.sweethome.interior.model.vo.PayList;
import com.thegenesis.sweethome.interior.model.vo.Payment;
import com.thegenesis.sweethome.interior.model.vo.Review;
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
			return "redirect:interiorList.in?intCate=1&inpage=1";
			
		}else {
			session.setAttribute("alertMsg", "인테리어 등록 실패");
			return "redirect:interiorList.in?intCate=1&inpage=1";
		}	
		
	}
	//인테리어 삭제
	@RequestMapping("deleteInterior.in")
	public String deleteInterior(@RequestParam HashMap<String, Object> checkBoxList, HttpSession session) {
		
		
		String interiorNoArr = (String) checkBoxList.get("checkBoxList");
		
		String[] checkListArr = null;		
		checkListArr = interiorNoArr.split(",");//가져온 배열 나열
		
		int[] interiorNo_array = new int[checkListArr.length];
		
		for(int i = 0; i< checkListArr.length; i++) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("interiorNo", checkListArr[i]);
			
			int result = interiorService.deleteInterior(map);
			
			if(result>0) {//삭제 했을 경우 사진 삭제 진행		
				
					ArrayList<InteriorFile> InteriorFileList = interiorService.selectInteriorFile(Integer.parseInt(checkListArr[i]));
					
					for(int j = 0; j< InteriorFileList.size(); j++) {
						//기존 첨부파일 삭제(파일 자체)			
						new File(session.getServletContext().getRealPath(InteriorFileList.get(j).getFilePath())).delete();
						//기존 첨부파일 삭제(오라클 내의 정보 삭제)
						interiorService.deleteInteriorFileInfo(Integer.parseInt(checkListArr[j]));
					}
			}
		}
		session.setAttribute("alertMsg", "게시글 삭제 완료");
		return "interiorList.in?intCate=1&inpage=1";
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
	
	//인테리어 역대 베스트
	@RequestMapping("interiorBestList.in")
	public String selectInteriorList() {
			
		return "interior/interiorBest";
		
	}
	//역대 베스트
	@ResponseBody
	@RequestMapping(value="bestList.in", produces="application/json; charset-UTF-8")
	public String ajaxBestInteriorList() {
		
		ArrayList<Interior> list = interiorService.selectInteriorBestList();	
		
		return new Gson().toJson(list);
	}
	
	//찜기능
	@ResponseBody
	@RequestMapping("changeHeart.in")
	public String changeHeart(int interiorNo, int userNo) {
			
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("interiorNo", interiorNo);
		hm.put("userNo", userNo);
		
		int checkHeart = interiorService.changeHeart(hm);
		//1: 하트 등록  2: 하트 해제
		
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
		mv.addObject("condition", condition);
		mv.addObject("keyword", keyword);
		
		mv.setViewName("interior/interiorSearchList");
		
		return mv;
		
	}
	//인테리어 게시글 수정(불러오기)//미완
	@RequestMapping("updateInteriorDetail.in")
	public String updateInteriorDetail(Model model, int interiorNo ) {
		
		//글내용 가져오기
		Interior in = interiorService.interiorDetail(interiorNo);
		ArrayList<InteriorFile> inf = interiorService.interiorDetailFile(interiorNo);
		
		int infLength = (inf.size() - 1);
		
		model.addAttribute("in", in);
		model.addAttribute("inf",inf);
		model.addAttribute("infLength", infLength);
		
		return "interior/interiorUpdate";

	}
	//인테리어 게시글 수정
	@RequestMapping("updateInterior.in")
	public String updateInterior(Interior in, Model model, HttpSession session, MultipartFile[] reupfile) {
			
		ArrayList<InteriorFile> list = new ArrayList<>();////새로 첨부파일이 날아온 경우 사진 담을 공간
		
		InteriorFile inf = null;	
		
		//기존 첨부파일 불러오기
		int interiorNo = in.getInteriorNo();
	
		
		ArrayList<InteriorFile> InteriorFileList = interiorService.selectInteriorFile(interiorNo);
		System.out.println("가져온 인테리어 사진 리스트" + InteriorFileList);
		System.out.println("가져온 인테리어 사이즈 : " + InteriorFileList.size());
		System.out.println("가져온 인테리어 filePath:" + InteriorFileList.get(0).getFilePath());
		
		for(int i = 0; i< InteriorFileList.size(); i++) {
			//기존 첨부파일 삭제(파일 자체)			
			new File(session.getServletContext().getRealPath(InteriorFileList.get(i).getFilePath())).delete();
			//기존 첨부파일 삭제(오라클 내의 정보 삭제)
			interiorService.deleteInteriorFileInfo(interiorNo);
		}
		//새로운 첨부파일 등록
		for(int i=0; i<reupfile.length; i++) {
			
			if(!reupfile[i].getOriginalFilename().equals("")) {//선택한 파일이 있을 경우
			
								
					String changeName = saveFile.changeFileName(reupfile[i], session);
													
						if(i == 0) {
							inf = InteriorFile.builder()
									.interiorNo(interiorNo)
									.originName(reupfile[i].getOriginalFilename())
									.changeName(changeName)
									.filePath("resources/uploadFiles/" + changeName)
									.fileLevel(1)
									.build();
							
						}else {
							inf = InteriorFile.builder()
									.interiorNo(interiorNo)
									.originName(reupfile[i].getOriginalFilename())
									.changeName(changeName)
									.filePath("resources/uploadFiles/" + changeName)
									.fileLevel(2)
									.build();				
						}							
						list.add(inf);	
				}				
			}
			//글 수정하기
			int result = interiorService.updateInterior(in, list);
			
			if(result > 0) {
				session.setAttribute("alertMsg", "게시글 수정 성공");
				return "redirect:detail.in?ino=" + in.getInteriorNo();
			}else {
				session.setAttribute("alertMsg", "게시글 수정 실패");
				return "redirect:detail.in?ino=" + in.getInteriorNo();
			}

	}
	
	//주문페이지
	@RequestMapping("orderForm.in")
	public String orderForm(Model model, Interior in, int interiorNo, int interiorPrice, String interiorTitle, String interiorPost, int inteCate) {		
		
		in = Interior.builder()
			.interiorNo(interiorNo)
			.interiorTitle(interiorTitle)
			.interiorPrice(interiorPrice)
			.interiorPost(interiorPost)
			.inteCate(inteCate)
			.build();
		
	
		model.addAttribute("in", in);
			
		return "interior/orderPage";
		
	}
	
	@RequestMapping("test.in")
	public String test() {
		
		return "interior/orderPagePasser";
	}

	//주문 내역 등록
	@ResponseBody
	@RequestMapping(value= "payment.in",  method = RequestMethod.POST)
	public String payment(@RequestBody PayList pList, ModelAndView mv, HttpSession session) {	
		
		OrderInfo orderInfo = null;
		
		orderInfo = OrderInfo.builder()
							.userNo(pList.getUserNo())
							.orderRe(pList.getOrderRe())
							.orderPhone(pList.getOrderPhone())
							.roadAddress(pList.getRoadAddress())
							.detailAddress(pList.getDetailAddress())
							.orderReQ(pList.getOrderReQ())
							.interiorNo(pList.getInteriorNo())
							.orderNumber(pList.getMerchant_uid())
							.postcode(pList.getPostcode())
							.sumPrice(pList.getSumPrice())
							.senderName(pList.getSenderName())
							.senderPhone(pList.getSenderPhone())
							.senderEmail(pList.getSenderEmail())
							.build();
		//orderNo : seq, orderstatus : default,  					

		Payment payment = null;
		
		payment = Payment.builder()						
						.interiorNo(pList.getInteriorNo())
						.orderQuantity(pList.getOrderQuantity())
						.build();
		//paymentNo : seq, orderNo : seq currval, orderDate : sysdate
		
		//ArrayList<Payment> list = null; 여러개 오면 
		
		int result = interiorService.insertOrderInfo(orderInfo, payment);
		int orderNo = orderInfo.getOrderNo();
		
		if(result > 0) {	
			
			return "dibsList.my";//나중에 주문 페이지로 바꿔주기
		}else {
			session.setAttribute("alertMsg", "주문 실패");
			return "dibsList.my";
		}
		
		
	}
	
	//주문 내역 확인
	@RequestMapping("orderInfoDetail.in")
	public ModelAndView orderInfoDetail(ModelAndView mv, HttpSession session/*, int orderNo*/) {
		
		//Member m = (Member)session.getAttribute("loginUser");
		
		//int userNo = m.getUserNo();
		int orderNo = 3;//임시
		
		//HashMap<String, Integer> map = new HashMap<String, Integer>();
		//map.put("userNo", userNo);
		//map.put("orderNo", orderNo);
		
		//OrderInfo orderInfo =  interiorService.orderInfoDetail(map);
		OrderInfo orderInfo =  interiorService.orderInfoDetail(orderNo);
		
		mv.addObject("oi", orderInfo);
		mv.setViewName("interior/orderPageDetail");
		
		return mv;
		
	}
	//주문 상태 변경
	@RequestMapping("orderStatusUpdate.in")
	public String orderStatusUpdate(int orderStatus, int orderNo, HttpSession session) {
					
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("orderStatus", orderStatus);
		map.put("orderNo", orderNo);
		
		int result = interiorService.orderStatusUpdate(map);
		
		if(result>0) {
			session.setAttribute("alertMsg", "변경 선공");
			return "redirect:/orderInfoDetail.in";
		}else {
			session.setAttribute("alertMsg", "변경 실패");
			return "interior/orderPageDetail";
		}
		
	}
	//주문 페이지 정보 수정
	@RequestMapping("orderPageUpdate.in")
	public String orderPageUpdate(OrderInfo oi, HttpSession session){
		
		int result = interiorService.orderPageUpdate(oi);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "수정 완료");
			return "interior/orderPageDetail";/*?ono=oi.getOrderNo()*/
		}else {
			session.setAttribute("alertMsg", "수정 실패");
			return "interior/orderPageDetail";
		}
		
		
	}
	//환불
	/*@ResponseBody
	@RequestMapping("cancelPay.in")
	public String cancelPay(String merchan_in, int cancel_request_amount ) {
		
		
		return
		
	}*/
	//리뷰 리스트
	@ResponseBody
	@RequestMapping(value="reviewList.in", produces="application/json; charset=UTF-8")
	public String ajaxSelectReviewList(int interiorNo) {
	
		ArrayList<Review> reviewList = interiorService.selectReviewList(interiorNo);
				
		return new Gson().toJson(reviewList);
	}
		
	//리뷰 작성
	@ResponseBody
	@RequestMapping(value="reviewInsert.in")
	public String ajaxInsertReview(Review rv) {
		
		int result = interiorService.insertReview(rv);		
		
		return (result > 0 ? "YY" : "NN");
	}
	//리뷰 수정
	@RequestMapping("updateReview.in")
	public String updateReview(Review rv, HttpSession session) {
		
		int interiorNo = rv.getInteriorNo();
	
		int result = interiorService.updateReview(rv);
		
		if(result>0) {
			session.setAttribute("alertMsg", "리뷰 수정 성공");
			return "redirect:detail.in?ino=" + interiorNo;
		}else {
			session.setAttribute("alertMsg", "리뷰 수정 실패");
			return "redirect:detail.in?ino=" + interiorNo;
		}

	}
	//리뷰 삭제
	@RequestMapping(value="deleteReview.in",  method = RequestMethod.GET)
	public String deleteReview(@RequestParam(value="reviewNo") int reviewNo, @RequestParam(value="interiorNo")int interiorNo, HttpSession session) {
		
		int result = interiorService.deleteReview(reviewNo);
		
		if(result>0) {
			session.setAttribute("alertMsg", "리뷰 삭제 성공");
			return "redirect:detail.in?ino=" + interiorNo;
		}else {
			session.setAttribute("alertMsg", "리뷰 삭제 실패");
			return "redirect:detail.in?ino=" + interiorNo;
		}

	}
	
	
	


}
