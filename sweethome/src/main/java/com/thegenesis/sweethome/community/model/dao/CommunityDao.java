package com.thegenesis.sweethome.community.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.thegenesis.sweethome.common.vo.PageInfo;
import com.thegenesis.sweethome.community.model.vo.Community;
import com.thegenesis.sweethome.community.model.vo.CommunityFile;

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
	public int searchInfoCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("communityMapper.searchInfoCount");
	}
	//게시글 검색 기능
	public ArrayList<Community> searchNoticeList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("communityMapper.searchNoticeList", map, rowBounds);
	}
	public ArrayList<Community> searchInfoList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("communityMapper.searchInfoList", map, rowBounds);
	}
	//게시글 상세보기(조회수 증가)
	public int increaseCount(SqlSessionTemplate sqlSession, int bno) {
		
		return sqlSession.update("communityMapper.increaseCount", bno);
	}
	//게시글 상세보기
	public Community boardDetail(SqlSessionTemplate sqlSession, int bno) {
			
		return sqlSession.selectOne("communityMapper.boardDetail", bno);
	}
	//게시글 상세보기(첨부파일)
	public CommunityFile boardDetailFile(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("communityMapper.boardDetailFile", bno);
	}
	//게시글 작성하기
	public int insertBoard(SqlSessionTemplate sqlSession, Community cm, CommunityFile coFile) {
		//게시글 먼저 작성 후
		int result = sqlSession.insert("communityMapper.insertBoard", cm);
		//게시글 작성 후 파일 있을 경우에만
		if(result > 0 && coFile != null) {
			System.out.println("dao까지");
			return result = sqlSession.insert("communityMapper.insertCoFile", coFile);
		}
		
		return result;
			
	}

	

}
