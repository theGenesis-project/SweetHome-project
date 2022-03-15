package com.thegenesis.sweethome.ask.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.thegenesis.sweethome.ask.model.vo.Ask;
import com.thegenesis.sweethome.ask.model.vo.AskFile;
import com.thegenesis.sweethome.common.vo.PageInfo;

@Repository
public class AskDao {

	public int insertAsk(SqlSessionTemplate sqlSession, Ask a) {
		return sqlSession.insert("askMapper.insertAsk", a);
	}
	
	public int insertAskFile(SqlSessionTemplate sqlSession, AskFile file) {
		return sqlSession.insert("askMapper.insertAskFile", file);
	}

	@Transactional(rollbackFor = {Exception.class})
	public int insertAsk(SqlSessionTemplate sqlSession, Ask a, AskFile file) {
		int result = sqlSession.insert("askMapper.insertAsk", a);
		
		// 글 등록 성공 && 사진파일 존재하는 경우 사진 등록
		if(result > 0 && file != null) {
			return result = sqlSession.insert("askMapper.insertAskFile", file);
		}
		
		return result;
	}

	public int selectAskCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("askMapper.selectAskCount", userNo);
	}

	public ArrayList<Ask> selectList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("askMapper.selectList", userNo, rowBounds);
	}

	@Transactional
	public ArrayList<Object> selectAskOne(SqlSessionTemplate sqlSession, Ask ref) {
		
		// 글 && 사진 저장할 배열
		ArrayList<Object> a = new ArrayList();
		// 글 불러오기
		a.add(sqlSession.selectOne("askMapper.selectAskOne", ref));
		// 사진 불러오기
		if(a.get(0) != null) {
			a.add(sqlSession.selectOne("askMapper.selectAskFile", ref));
		}
		return a;
	}

}
