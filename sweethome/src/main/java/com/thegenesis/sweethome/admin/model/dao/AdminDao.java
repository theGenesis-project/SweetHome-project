package com.thegenesis.sweethome.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.thegenesis.sweethome.common.vo.PageInfo;
import com.thegenesis.sweethome.common.vo.Report;
import com.thegenesis.sweethome.interior.model.vo.OrderInfo;
import com.thegenesis.sweethome.member.model.vo.Member;

@Repository
public class AdminDao {

	public int selectMemberCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectMemberCount");
	}

	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("adminMapper.selectMemberList", null, rowBounds);
	}
	//리스트 카운트~
	public int adminOrderListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.adminOrderListCount");
	}
	//주문 내역 리스트~
	
	public ArrayList<OrderInfo> selectOrderList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectOrderList",null, rowBounds);
	}
	
	//신고 리스트 카운트
	public int boardReportCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.boardReportCount");
	}

	public int replyReportCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.replyReportCount");
	}

	public int houseReportCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.houseOrderListCount");
	
	}

	//신고 내역 리스트~
	public ArrayList<Report> selectboardReportList(SqlSessionTemplate sqlSession, PageInfo bpi) {
		int offset = (bpi.getCurrentPage() - 1) * bpi.getBoardLimit();
		int limit = bpi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectboardReportList",null, rowBounds);
	}

	public ArrayList<Report> selectreplyReportList(SqlSessionTemplate sqlSession, PageInfo rpi) {
		int offset = (rpi.getCurrentPage() - 1) * rpi.getBoardLimit();
		int limit = rpi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectreplyReportList",null, rowBounds);
	}

	public ArrayList<Report> selecthouseReportList(SqlSessionTemplate sqlSession, PageInfo hpi) {
		int offset = (hpi.getCurrentPage() - 1) * hpi.getBoardLimit();
		int limit = hpi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.selecthouseReportList",null, rowBounds);
	}
}