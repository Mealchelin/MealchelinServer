package com.mealchelin.mvc.member.model.service;

import com.mealchelin.mvc.member.model.vo.Member;

public interface MemberService {

	Member findMemberById(String userId);
	
	Member login(String userId, String userPwd);


}
