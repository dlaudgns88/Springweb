package com.test.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.VO.PageVO;
import com.test.VO.boardVO;
import com.test.VO.likeVO;
import com.test.VO.replyVO;

@Repository
public class IF_boardDAO_impl implements IF_boardDAO{
	private static String mapperQuery="com.test.dao.IF_boardDAO";
	@Inject
	private SqlSession sqlSession;
	@Override
	public void insert(boardVO bvo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(mapperQuery+".insert", bvo);
	}
	@Override
	public List<boardVO> boardlist() throws Exception{
		// TODO Auto-generated method stub
		
		return sqlSession.selectList(mapperQuery+".boardlist");
	}
	@Override
	public boardVO detail(int no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery+".boardselect", no);
	}
	@Override
	public void addreply(replyVO rvo) throws Exception{
		// TODO Auto-generated method stub
		sqlSession.insert(mapperQuery+".replyinsert", rvo);
	}

	@Override
	public List<replyVO> replylist(int no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".replylist", no);
	}
	@Override
	public void delete(int no) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(mapperQuery+".delete", no);
	}
	@Override
	public void cntplus(int no) throws Exception {
		sqlSession.update(mapperQuery+".cntplus", no);
		
	}
	
	@Override
	public void insert(likeVO lvo) throws Exception {
		sqlSession.insert(mapperQuery+".likeinsert", lvo);
		
	}
	@Override
	public List<likeVO> selectlike(int b_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".likelist",b_no);
	}
	@Override
	public void delete(likeVO lvo) throws Exception{
		// TODO Auto-generated method stub
		sqlSession.delete(mapperQuery+".likedelete", lvo);
	}
	@Override
	public likeVO selectone(likeVO lvo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery+".likeselectOne", lvo);
	}
	@Override
	public void updatereply(replyVO rvo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(mapperQuery+".updatereply", rvo);
	}
	@Override
	public void deletereply(replyVO rvo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(mapperQuery+".deletereply", rvo);
	}
	@Override
	public void updateboard(boardVO bvo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(mapperQuery+".updateboard", bvo);
	}
	@Override
	public int boardcnt() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery+".boardlist_cnt") ;
	}
	@Override
	public List<boardVO> boardlist2(PageVO pagevo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".boardlistpaging", pagevo);
	}
	
	

}
