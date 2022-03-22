package com.thegenesis.sweethome.interior.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.thegenesis.sweethome.common.vo.PageInfo;
import com.thegenesis.sweethome.community.model.vo.Community;
import com.thegenesis.sweethome.interior.model.vo.Interior;
import com.thegenesis.sweethome.interior.model.vo.InteriorFile;
@Repository
public class InteriorDao {

	public int listCount(SqlSessionTemplate sqlSession, int inteCate) {
		return sqlSession.selectOne("interiorMapper.listCount", inteCate);
	}

	public ArrayList<Community> selectInteriorList(SqlSessionTemplate sqlSession, PageInfo pi, int inteCate) {
		
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

	public int deleteInterior(SqlSessionTemplate sqlSession, ArrayList<Integer> checkNumbers) {
		
		for(Integer arr : checkNumbers) {
			sqlSession.update("interiorMappers.deleteInterior", arr);
		}
		
		return 0;
	}

}
