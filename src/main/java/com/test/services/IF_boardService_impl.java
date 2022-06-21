package com.test.services;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.test.VO.PageVO;
import com.test.VO.boardVO;
import com.test.VO.likeVO;
import com.test.VO.replyVO;
import com.test.dao.IF_boardDAO;

@Service
public class IF_boardService_impl implements IF_boardService{
	@Inject
	IF_boardDAO bdao;

	@Override
	public void insert(boardVO bvo) throws Exception{
		// TODO Auto-generated method stub
		bdao.insert(bvo);
	}

	@Override
	public List<boardVO> boardlist() throws Exception{
		// TODO Auto-generated method stub
		return bdao.boardlist();
	}

	@Override
	public boardVO detail(int no) throws Exception {
		bdao.cntplus(no);
		return bdao.detail(no);
	}

	@Override
	public void addreply(replyVO rvo) throws Exception {
		// TODO Auto-generated method stub
		bdao.addreply(rvo);
		
	}

	@Override
	public List<replyVO> replylist(int no) throws Exception {
		// TODO Auto-generated method stub
		return bdao.replylist(no);
	}

	@Override
	public void delete(int no) throws Exception {
		// TODO Auto-generated method stub
		bdao.delete(no);
	}

	@Override
	public void like(likeVO lvo) throws Exception {
		// TODO Auto-generated method stub
		if(lvo.getOnoffcheck().equals("on")) {
			bdao.insert(lvo);
			
		}else {
			bdao.delete(lvo);
			
		}
	}

	@Override
	public List<likeVO> selectboard(int no) throws Exception {
		// TODO Auto-generated method stub
		return bdao.selectlike(no);
	}

	@Override
	public likeVO selectone(likeVO lvo) throws Exception {
		// TODO Auto-generated method stub
		return bdao.selectone(lvo);
	}

	@Override
	public void updatereply(replyVO rvo) throws Exception {
		// TODO Auto-generated method stub
		bdao.updatereply(rvo);
		
	}

	@Override
	public void deletereply(replyVO rvo) throws Exception {
		// TODO Auto-generated method stub
		bdao.deletereply(rvo);
	}

	@Override
	public void updateboard(boardVO bvo) throws Exception {
		// TODO Auto-generated method stub
		bdao.updateboard(bvo);
	}

	@Override
	public int boardcnt() throws Exception {
		// TODO Auto-generated method stub
		return bdao.boardcnt();
	}

	@Override
	public List<boardVO> boardlist2(PageVO pagevo) throws Exception {
		// TODO Auto-generated method stub
		return bdao.boardlist2(pagevo);
	}

	
	
	
}
