package com.test.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.VO.memberVO;

@Repository
public class IF_MemberDAO_impl implements IF_MemberDAO{
	private static String mapperQuery = "com.test.dao.IF_MemberDAO";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void insert(memberVO mvo) throws Exception{
		// TODO Auto-generated method stub
		sqlSession.insert(mapperQuery+".insert",mvo);
	}

	@Override
	public memberVO selectone(memberVO mvo) throws Exception {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne(mapperQuery+".logincheck", mvo);
	}

}
