package com.mealchelin.mvc.member.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mealchelin.mvc.member.model.vo.Member;

@Mapper
public interface MemberMapper {
	
	Member selectMemberById(@Param("id") String id);

	int insertMember(Member member);
	
<<<<<<< HEAD

	Member selectMemberByNo(@Param("No") int memberNo);

=======
<<<<<<< HEAD
	Member selectMemberByNo(@Param("No") int memberNo);
=======
>>>>>>> parent of ff83659 (성연 240304)
	Member selectMemberByOrderInfo(
			@Param("id") String id);
>>>>>>> origin/feature/pay_sy


}
