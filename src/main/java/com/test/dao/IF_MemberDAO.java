package com.test.dao;

import com.test.VO.memberVO;

public interface IF_MemberDAO {

	public void insert(memberVO mvo) throws Exception;

	public memberVO selectone(memberVO mvo) throws Exception;

}
