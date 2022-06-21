package com.test.services;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.test.VO.memberVO;
import com.test.dao.IF_MemberDAO;

@Service
public class IF_MemberService_impl implements IF_MemberService{
	@Inject
	IF_MemberDAO mdao;
	@Override
	public void insert(memberVO mvo) throws Exception{
		// TODO Auto-generated method stub
		;
		mdao.insert(mvo);
	}
	@Override
	public memberVO selectone(memberVO mvo) throws Exception {
		return mdao.selectone(mvo);
		
	}

}
