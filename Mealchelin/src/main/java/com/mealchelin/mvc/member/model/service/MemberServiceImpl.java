package com.mealchelin.mvc.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealchelin.mvc.member.model.mapper.MemberMapper;
import com.mealchelin.mvc.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public Member findMemberById(String userId) {
		
		return mapper.selectMemberById(userId);
	}
	
	@Override
	public Member login(String userId, String userPwd) {
		Member member = this.findMemberById(userId);
		
		member =mapper.selectMemberById(userId);
		
		if (member == null) {
			return null;
		}
		
		return member;
		
	}

}
