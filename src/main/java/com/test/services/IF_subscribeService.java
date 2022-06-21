package com.test.services;

import java.util.List;

import com.test.VO.subscribeVO;

public interface IF_subscribeService {

	public void insert(subscribeVO svo) throws Exception;

	public List<subscribeVO> subscribeList() throws Exception;

}
