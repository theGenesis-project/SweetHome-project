package com.thegenesis.sweethome.community.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.thegenesis.sweethome.common.vo.PageInfo;
import com.thegenesis.sweethome.common.vo.Report;
import com.thegenesis.sweethome.community.model.vo.Community;
import com.thegenesis.sweethome.community.model.vo.CommunityFile;
import com.thegenesis.sweethome.community.model.vo.Reply;

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
	public int searchNoticeCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.selectOne("communityMapper.searchNoticeCount", map);
	}
	public int searchInfoCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.selectOne("communityMapper.searchInfoCount", map);
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
	public int insertBoard(SqlSessionTemplate sqlSession, Community cm, CommunityFile cf) {
		//게시글 먼저 작성 후
		int result = sqlSession.insert("communityMapper.insertBoard", cm);
		//게시글 작성 후 파일 있을 경우에만
		if(result > 0 && cf != null) {
		
			return result = sqlSession.insert("communityMapper.insertCoFile", cf);
		}
		
		return result;
			
	}
	//게시글 수정하기
	public int updateBoard(SqlSessionTemplate sqlSession, Community cm, CommunityFile cf) {
		//게시글 수정
		int result = sqlSession.update("communityMapper.updateBoard", cm);
			
		if(result > 0 && cf.getOriginName() != null) {
			//게시글 수정 후 파일 있을 경우
			if(cf.getFileNo() != 0) {
				//기존 파일 있을 경우(첨부파일 update문)
				return result = sqlSession.update("communityMapper.updateCoFile", cf);
			}else {
				//기존 파일 없을 경우(첨부파일 insert문)
				return result = sqlSession.update("communityMapper.insertNewCoFile",cf);
			}
		}
				
		return result;
		
	}
	//게시글 삭제
	public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.update("communityMapper.deleteBoard", boardNo);
	}
	//게시글 신고
	public int reportBoard(SqlSessionTemplate sqlSession, Report r) {
		
		return sqlSession.insert("communityMapper.reportBoard", r);
	}
	//게시글 신고 선행
	public int reportCheck(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.selectOne("communityMapper.reportCheck", map);
	}
	//댓글 불러오기
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("communityMapper.selectReplyList", boardNo);
	}
	//댓글 작성
	public int insertReply(SqlSessionTemplate sqlSession, Reply rp) {
		return sqlSession.insert("communityMapper.insertReply", rp);
	}
	//댓글 수정
	public int updatetReply(SqlSessionTemplate sqlSession, Reply rp) {
		return sqlSession.update("communityMapper.updateReply", rp);
	}
	//댓글 삭제
	public int updatetReply(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("communityMapper.deleteReply", boardNo);
	}
	//댓글 신고 선행
	public int reportCheckReply(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("communityMapper.reportCheckReply", map);
	}
	//댓글 신고
	public int reportReply(SqlSessionTemplate sqlSession, Report r) {
		int result = sqlSession.insert("communityMapper.reportReply", r);
		System.out.println(result);
		return result;
	}

	

}
