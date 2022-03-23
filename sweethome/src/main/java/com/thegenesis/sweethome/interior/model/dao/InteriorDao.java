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

	public int deleteInterior(SqlSessionTemplate sqlSession, ArrayList<Integer> checkNumbers) {
		
		for(Integer arr : checkNumbers) {
			sqlSession.update("interiorMapper.deleteInterior", arr);
		}
		
		return 0;
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
		System.out.println(check);
		int result = 0;
		
		if(check == null) {
			//처음으로 하트 누름
			sqlSession.insert("interiorMapper.changeHeartY", hm);
			result = 1;
		}else if(check == "Y") {
			//하트를 전에 누른 적이 있을 경우
			sqlSession.update("interiorMapper.changeHeartYY", hm);
			result = 1;
		}else {
			//하트 취소
			sqlSession.update("interiorMapper.changeHeartN", hm);	
			result = 2;
		}
		return result;
	}



	
}
