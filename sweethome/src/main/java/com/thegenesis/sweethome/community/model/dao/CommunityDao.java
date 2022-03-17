package com.thegenesis.sweethome.community.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.thegenesis.sweethome.common.vo.PageInfo;
import com.thegenesis.sweethome.community.model.vo.Community;

@Repository
public class CommunityDao {

	public int listCount(SqlSessionTemplate sqlSession, int boardType) {
		
		return sqlSession.selectOne("communityMapper.listCount", boardType);
	}

	public ArrayList<Community> boardList(SqlSessionTemplate sqlSession, PageInfo pi, int boardType) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("communityMapper.boardList",boardType,rowBounds);
	}
	//게시글 검색 기능(게시글 개수)
	public int searchNoticeCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("communityMapper.searchNoticeCount");
	}
	//게시글 검색 기능
	public ArrayList<Community> searchNoticeList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("communityMapper.searchNoticeList", map, rowBounds);
	}
	//게시글 상세보기(조회수 증가)
	public int increaseCount(SqlSessionTemplate sqlSession, int bno) {
		
		return sqlSession.update("communityMapper.increaseCount", bno);
	}
	//게시글 상세보기
	public Community boardDetail(SqlSessionTemplate sqlSession, int bno) {
			
		return sqlSession.selectOne("communityMapper.boardDetail", bno);
	}

}
