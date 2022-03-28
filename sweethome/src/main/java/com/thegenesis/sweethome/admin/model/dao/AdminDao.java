package com.thegenesis.sweethome.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.thegenesis.sweethome.common.vo.PageInfo;
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
		return (ArrayList)sqlSession.selectList("adminMapper.selectMemberList",null,rowBounds);
	}

}