package com.thegenesis.sweethome.interior.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.thegenesis.sweethome.common.vo.PageInfo;
import com.thegenesis.sweethome.community.model.vo.Community;
import com.thegenesis.sweethome.interior.model.vo.Interior;
import com.thegenesis.sweethome.interior.model.vo.InteriorFile;
import com.thegenesis.sweethome.interior.model.vo.OrderInfo;
import com.thegenesis.sweethome.interior.model.vo.Payment;
import com.thegenesis.sweethome.interior.model.vo.Review;
@Repository
public class InteriorDao {

	public int listCount(SqlSessionTemplate sqlSession, int inteCate) {
		return sqlSession.selectOne("interiorMapper.listCount", inteCate);
	}

	public ArrayList<Interior> selectInteriorList(SqlSessionTemplate sqlSession, PageInfo pi, int inteCate) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("interiorMapper.selectInteriorList", inteCate, rowBounds);
	}

	public int insertInterior(SqlSessionTemplate sqlSession, Interior in, ArrayList<InteriorFile> list) {
		
		//게시글 먼저 작성
		int result = sqlSession.insert("interiorMapper.insertInterior", in);
		
		//게시글 작성 후 파일(필수!!)
		if(result>0) {
			for(InteriorFile inf : list) {
				sqlSession.insert("interiorMapper.insertInteriorFile", inf);			
			}
				
		}
		return result;
	}
	//게시글 삭제
	public int deleteInterior(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		System.out.println("dao에 오는 map" + map);
		return sqlSession.update("interiorMapper.deleteInterior", map);
	}
	//게시글 조회수 증가
	public int increaseCount(SqlSessionTemplate sqlSession, int ino) {
		
		return sqlSession.update("interiorMapper.increaseCount", ino);
	}
	//게시글 상세보기
	public Interior interiorDetail(SqlSessionTemplate sqlSession, int ino) {
		
		return sqlSession.selectOne("interiorMapper.interiorDetail", ino);
	}
	//게시글 상세보기(첨부파일)
	public ArrayList interiorFileDatail(SqlSessionTemplate sqlSession, int ino) {
		
		return (ArrayList)sqlSession.selectList("interiorMapper.interiorFileDetail", ino);
	}
	//게시글 상세보기(찜)
	public String checkHeart(SqlSessionTemplate sqlSession, HashMap<String, Integer> hm) {
		
		return sqlSession.selectOne("interiorMapper.interiorChangeHeart", hm);
	}
	//인테리어 역대 베스트
	public ArrayList<Interior> selectInteriorBestList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("interiorMapper.interiorBestList");
	}
	//찜기능(찜 되어있나 확인)
	public int changeHeart(SqlSessionTemplate sqlSession, HashMap<String, Integer> hm) {
		
		String check = sqlSession.selectOne("interiorMapper.interiorChangeHeart", hm);
		
		//N이 나왔으면 이제 Y로 바꾸어주어야 함
		
		int result = 0;
		
		if(check == null) {
			//처음으로 하트 누름
			sqlSession.insert("interiorMapper.changeHeartY", hm);
			result = 1;
		}else if(check.equals("N")) {
			//하트를 전에 누른 적이 있을 경우
			sqlSession.update("interiorMapper.changeHeartYY", hm);
			//Y로 바꿔줌
			result = 1;
		}else {
			//하트 취소
			sqlSession.update("interiorMapper.changeHeartN", hm);	
			result = 2;
		}
		
		return result;
	}
	//인테리어 검색 기능(카운트)
	public int searchInteriorCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.selectOne("interiorMapper.searchInteriorCount", map);
	}
	//인테리어 검색 기능
	public ArrayList<Interior> searchInterior(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
			
		return (ArrayList)sqlSession.selectList("interiorMapper.searchInterior", map, rowBounds);
	}
	//인테리어 사진 목록 불러오기(인테리어 파일 삭제용)
	public ArrayList<InteriorFile> selectInteriorFile(SqlSessionTemplate sqlSession, int interiorNo) {
		
		ArrayList<InteriorFile> result = (ArrayList)sqlSession.selectList("interiorMapper.selectInteriorFile", interiorNo);
		
		return result;
	}
	//인테리어 파일 삭제용(오라클 내)
	public int deleteInteriorFileInfo(SqlSessionTemplate sqlSession, int interiorNo) {
		return sqlSession.delete("interiorMapper.deleteInteriorFileInfo", interiorNo) ;
	}

	//인테리어 게시글 수정
	public int updateInterior(SqlSessionTemplate sqlSession, Interior in, ArrayList<InteriorFile> list) {
		
		int result = sqlSession.insert("interiorMapper.updateInterior", in);
		
		//게시글 작성 후 파일(필수!!)
		if(result>0) {
			for(InteriorFile inf : list) {
				sqlSession.insert("interiorMapper.updateInteriorFile", inf);
				
			}			
		}
		return result;
	}
	//주문 내역 등록
	public int insertOrderInfo(SqlSessionTemplate sqlSession, OrderInfo orderInfo, Payment payment) {
	
		//주문 내역 등록
		int result = sqlSession.insert("interiorMapper.insertOrderInfo", orderInfo);
		//주문자 결제 내역
		if(result > 0) {
			result = sqlSession.insert("interiorMapper.insertPayment", payment);
		}
		
		return result;
	}
	//주문 내역 상세 보기
	public OrderInfo orderInfoDetail(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.selectOne("interiorMapper.orderInfoDetail", orderNo);
	}
	//주문 상태 변경
	public int orderStatusUpdate(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.update("interiorMapper.orderStatusUpdate", map);
	}
	//주문 페이지 수정
	public int orderPageUpdate(SqlSessionTemplate sqlSession, OrderInfo oi) {
		return sqlSession.update("interiorMapper.orderPageUpdate", oi);
	}
	//리뷰작성
	public int insertReview(SqlSessionTemplate sqlSession, Review rv) {
		return sqlSession.insert("interiorMapper.insertReview", rv);
	}
	//리뷰 리스트 불러오기
	public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession, int interiorNo) {
		return (ArrayList)sqlSession.selectList("interiorMapper.selectReviewList", interiorNo);
	}

	

	
	



	
}
