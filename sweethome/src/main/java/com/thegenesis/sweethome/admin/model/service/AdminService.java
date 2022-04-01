package com.thegenesis.sweethome.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thegenesis.sweethome.admin.model.dao.AdminDao;
import com.thegenesis.sweethome.common.vo.PageInfo;
import com.thegenesis.sweethome.common.vo.Report;
import com.thegenesis.sweethome.interior.model.vo.OrderInfo;
import com.thegenesis.sweethome.member.model.vo.Member;

@Service
public class AdminService {
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int selectMemberCount() { // 회원 수
		return adminDao.selectMemberCount(sqlSession);
	}

	public ArrayList<Member> selectMemberList(PageInfo pi) { // 멤버 리스트 조회
		return adminDao.selectMemberList(sqlSession, pi);
	}
	//리스트 카운트~
	public int adminOrderListCount() {
		return adminDao.adminOrderListCount(sqlSession);
	}
	//주문 내역 리스트~
	public ArrayList<OrderInfo> selectOrderList(PageInfo pi) {
		return adminDao.selectOrderList(sqlSession, pi);
	}
	//신고 리스트 카운트
	/*
	public int boardReportCount() {
		return adminDao.boardReportCount(sqlSession);
	}
	public int replyReportCount() {
		return adminDao.replyReportCount(sqlSession);
	}
	public int houseReportCount() {
		return adminDao.houseReportCount(sqlSession);
	}
	//신고 리스트
	public ArrayList<Report> selectboardReportList(PageInfo bpi) {
		return adminDao.selectboardReportList(sqlSession, bpi);
	}

	public ArrayList<Report> selectreplyReportList(PageInfo rpi) {
		return adminDao.selectreplyReportList(sqlSession, rpi);
	}

	public ArrayList<Report> selecthouseReportList(PageInfo hpi) {
		return adminDao.selecthouseReportList(sqlSession, hpi);
	}
	*/
	
	
	

}