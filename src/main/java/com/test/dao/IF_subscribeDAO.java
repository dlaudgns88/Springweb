package com.test.dao;

import java.util.List;

import com.test.VO.subscribeVO;

public interface IF_subscribeDAO {

	public void insert(subscribeVO svo) throws Exception;

	public List<subscribeVO> subscribeList() throws Exception;

}
