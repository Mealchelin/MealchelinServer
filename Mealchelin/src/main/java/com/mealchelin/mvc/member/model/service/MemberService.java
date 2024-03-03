package com.mealchelin.mvc.member.model.service;

import com.mealchelin.mvc.member.model.vo.Member;

public interface MemberService {

	Member findMemberById(String id);
	
	Member login(String id, String password);

	int save(Member member);

	// 주문정보
	Member getMemberByNo(int i);

	


}
