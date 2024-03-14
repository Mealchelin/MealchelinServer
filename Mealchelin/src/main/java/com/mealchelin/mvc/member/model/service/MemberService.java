package com.mealchelin.mvc.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.member.model.vo.Member;

public interface MemberService {

	Member findMemberById(String id);
	
	Member login(String id, String password);

	int save(Member member);	

	Member getMemberByNo(int i);
	
	Member MemberByOrderInfo(String id);

	Boolean isDuplicateId(String userId);

	Member updateBefore(String id, String password);

	int dalete(int memberNo);

	String getAccessToken(String code);

	Member getUserInfo(String access_Token);

	int getMemberCount(String name);

	List<Member> getMemberList(PageInfo pageInfo, String name);

	Member getAdminMemberByNo(int no);

	int adminMemberUpdate(Member member);






	


}
