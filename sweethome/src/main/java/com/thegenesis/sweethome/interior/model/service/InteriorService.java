package com.thegenesis.sweethome.interior.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thegenesis.sweethome.common.vo.PageInfo;
import com.thegenesis.sweethome.community.model.vo.Community;
import com.thegenesis.sweethome.interior.model.dao.InteriorDao;
import com.thegenesis.sweethome.interior.model.vo.Interior;
import com.thegenesis.sweethome.interior.model.vo.InteriorFile;
import com.thegenesis.sweethome.interior.model.vo.OrderInfo;
import com.thegenesis.sweethome.interior.model.vo.Payment;
import com.thegenesis.sweethome.interior.model.vo.Review;

@Service
public class InteriorService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private InteriorDao interiorDao;
	//게시글 개수
	public int listCount(int inteCate) {
		
		return interiorDao.listCount(sqlSession, inteCate);
	}
	//게시글 리스트
	public ArrayList<Interior> selectInteriorList(PageInfo pi, int inteCate) {
		
		return interiorDao.selectInteriorList(sqlSession, pi, inteCate);
	}
	//게시글 등록
	public int insertInterior(Interior in, ArrayList<InteriorFile> list) {
		
		return interiorDao.insertInterior(sqlSession, in, list);
	}
	//게시글 삭제
	public int deleteInterior(HashMap<String, Object> map) {
	
		return interiorDao.deleteInterior(sqlSession, map);
	}
	//게시글 조회수 증가
	public int increaseCount(int ino) {
		return interiorDao.increaseCount(sqlSession, ino);
	}
	//게시글 상세보기
	public Interior interiorDetail(int ino) {
		return interiorDao.interiorDetail(sqlSession, ino);
	}
	//게시글 상세보기(첨부파일)
	public ArrayList<InteriorFile> interiorDetailFile(int ino) {
		
		return interiorDao.interiorFileDatail(sqlSession, ino);
	}
	//게시글 상세보기(찜)
	public String checkHeart(HashMap<String, Integer> hm) {
		
		return interiorDao.checkHeart(sqlSession, hm);
	}
	//인테리어 역대 베스트
	public ArrayList<Interior> selectInteriorBestList() {
		
		return interiorDao.selectInteriorBestList(sqlSession);
	}
	//찜기능
	public int changeHeart(HashMap<String, Integer> hm) {
		
		return interiorDao.changeHeart(sqlSession, hm);
	}
	//인테리어 검색 기능(카운트)
	public int searchInteriorCount(HashMap<String, String> map) {
		
		return interiorDao.searchInteriorCount(sqlSession, map);
	}
	//인테리어 검색 기능
	public ArrayList<Interior> searchInterior(PageInfo pi, HashMap<String, String> map) {
		
		return interiorDao.searchInterior(sqlSession, map, pi);
	}
	//인테리어 글 수정하기
	public int updateInterior(Interior in, ArrayList<InteriorFile> list) {
		return interiorDao.updateInterior(sqlSession, in, list);
	}
	//인테리어 사진 목록 불러오기(인테리어 파일 삭제용)
	public ArrayList<InteriorFile> selectInteriorFile(int interiorNo) {
		return interiorDao.selectInteriorFile(sqlSession, interiorNo);
	}
	//오라클 내 사진 정보 삭제
	public int deleteInteriorFileInfo(int interiorNo) {
		return interiorDao.deleteInteriorFileInfo(sqlSession, interiorNo);
	}
	//주문 내역 등록
	public int insertOrderInfo(OrderInfo orderInfo, Payment payment) {
		return interiorDao.insertOrderInfo(sqlSession, orderInfo, payment);
	}
	//주문 내역 상세 보기
	public OrderInfo orderInfoDetail(int orderNo) {
		return interiorDao.orderInfoDetail(sqlSession, orderNo);
	}
	//주문 상태 변경
	public int orderStatusUpdate(HashMap<String, Integer> map) {
		return interiorDao.orderStatusUpdate(sqlSession, map);
	}
	//주문페이지 수정
	public int orderPageUpdate(OrderInfo oi) {
		return interiorDao.orderPageUpdate(sqlSession, oi);
	}
	//리뷰 작성
	public int insertReview(Review rv) {
		return interiorDao.insertReview(sqlSession, rv);
	}
	//리뷰 리스트 불러오기
	public ArrayList<Review> selectReviewList(int interiorNo) {
		return interiorDao.selectReviewList(sqlSession, interiorNo);
	}
	//리뷰 수정
	public int updateReview(Review rv) {
		return interiorDao.updateReview(sqlSession, rv);
	}
	//리뷰 삭제
	public int deleteReview(int reviewNo) {
		return interiorDao.deleteReview(sqlSession, reviewNo);
	}
	
	


}
