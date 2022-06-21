package com.test.services;

import com.test.VO.memberVO;

public interface IF_MemberService {

	public void insert(memberVO mvo) throws Exception;

	public memberVO selectone(memberVO mvo) throws Exception;
	
}
