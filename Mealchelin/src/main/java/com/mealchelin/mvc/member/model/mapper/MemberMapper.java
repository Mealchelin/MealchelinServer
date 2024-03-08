package com.mealchelin.mvc.member.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mealchelin.mvc.member.model.vo.Member;

@Mapper
public interface MemberMapper {
	
	Member selectMemberById(@Param("id") String id);

	Member selectMemberByNo(@Param("No") int memberNo);
	
	Member selectMemberByOrderInfo(@Param("id") String id);
	
	int insertMember(Member member);
	
	int updateMember(Member member);
	
	int updateStatus(@Param("memberNo") int memberNo, @Param("memStatus") String memberStatus);

}
