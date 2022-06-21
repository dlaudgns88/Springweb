package com.test.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.VO.subscribeVO;

@Repository	
public class IF_subscribeDAO_impl implements IF_subscribeDAO{
	private static String mapperQuery="com.test.dao.IF_subscribeDAO";
	@Inject
	private SqlSession sqlSession;
	@Override
	public void insert(subscribeVO svo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(mapperQuery+".insert", svo);
		
	}
	@Override
	public List<subscribeVO> subscribeList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".listAll");
	}
}
