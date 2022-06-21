package com.test.services;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.test.VO.subscribeVO;
import com.test.dao.IF_subscribeDAO;

@Service
public class IF_subscribeService_impl implements IF_subscribeService{
	@Inject
	IF_subscribeDAO sdao;

	@Override
	public void insert(subscribeVO svo) throws Exception {
		// TODO Auto-generated method stub
		sdao.insert(svo);
	}

	@Override
	public List<subscribeVO> subscribeList() throws Exception {
		// TODO Auto-generated method stub
		return sdao.subscribeList();
	}

}
