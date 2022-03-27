package com.thegenesis.sweethome.mypage.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.thegenesis.sweethome.common.vo.MoreVO;
import com.thegenesis.sweethome.common.vo.PageInfo;
import com.thegenesis.sweethome.community.model.vo.Community;
import com.thegenesis.sweethome.house.model.vo.House;

@Repository
public class MypageDao {

	public int myBoardListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("communityMapper.myBoardListCount", userNo);
	}

	public ArrayList<Community> selectMyBoardList(SqlSessionTemplate sqlSession, PageInfo pi, int userNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("communityMapper.selectMyBoardList", userNo, rowBounds);
	}

	public int myCommentListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("communityMapper.myCommunityListCount", userNo);
	}

	public ArrayList<Community> selectMyCommentList(SqlSessionTemplate sqlSession, PageInfo cpi, int userNo) {
		int offset = (cpi.getCurrentPage() - 1) * cpi.getBoardLimit();
		int limit = cpi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("communityMapper.selectMyCommentList", userNo, rowBounds);
	}
	
	public int deleteMyBoard(SqlSessionTemplate sqlSession, int[] boardList) {
		return sqlSession.update("communityMapper.deleteMyBoard", boardList);
	}

	public int myTourListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("tourMapper.userTourListCount", userNo);
	}

	public int myDibsHouseCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("houseMapper.myDibsHouseCount", userNo);
	}

	public ArrayList<House> selectMyHouseList(SqlSessionTemplate sqlSession, MoreVO m, int userNo) {
		RowBounds rowBounds = new RowBounds(m.getCallLength(), m.getLimit());
		
		return (ArrayList)sqlSession.selectList("houseMapper.selectDibsHouses", userNo, rowBounds);
	}

}
