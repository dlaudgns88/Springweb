package com.test.services;

import java.util.List;

import com.test.VO.PageVO;
import com.test.VO.boardVO;
import com.test.VO.likeVO;
import com.test.VO.replyVO;

public interface IF_boardService {

	public void insert(boardVO bvo) throws Exception;

	public List<boardVO> boardlist() throws Exception;

	public boardVO detail(int no) throws Exception;

	public void addreply(replyVO rvo) throws Exception;

	public List<replyVO> replylist(int no) throws Exception;

	public void delete(int no) throws Exception;

	public void like(likeVO lvo) throws Exception;

	public List<likeVO> selectboard(int no) throws Exception;

	public likeVO selectone(likeVO lvo) throws Exception;

	public void updatereply(replyVO rvo) throws Exception;

	public void deletereply(replyVO rvo) throws Exception;

	public void updateboard(boardVO bvo) throws Exception;

	public int boardcnt() throws Exception;

	public List<boardVO> boardlist2(PageVO pagevo) throws Exception;

	

	

	

}
