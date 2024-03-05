package com.mealchelin.mvc.member.model.service;

import com.mealchelin.mvc.member.model.vo.Member;

public interface MemberService {

	Member findMemberById(String id);
	
	Member login(String id, String password);

	int save(Member member);

	Member getMemberByNo(int i);
	
	Member MemberByOrderInfo(String id);

	Boolean isDuplicateId(String userId);

	Member updateBefore(String id, String password);


	


}
