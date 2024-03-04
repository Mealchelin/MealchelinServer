package com.mealchelin.mvc.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mealchelin.mvc.member.model.mapper.MemberMapper;
import com.mealchelin.mvc.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Override
	public Member findMemberById(String id) {
		
		return mapper.selectMemberById(id);
	}
	
	@Override
	public Member login(String id, String password) {
		Member member = this.findMemberById(id);
		
		member = mapper.selectMemberById(id);
		
		if (member == null || !encoder.matches(password, member.getPassword())) {
			return null;
		}
		
		return member;
		
	}

	@Override
<<<<<<< HEAD
	public Member getMemberByNo(int i) {
		
	return mapper.selectMemberByNo(i);
	}
		
=======
	public Member MemberByOrderInfo(String id) {
		

		return mapper.selectMemberByOrderInfo(id);
				
				
	}
				
>>>>>>> origin/feature/pay_sy
	@Transactional  //  자동 롤백& 커밋
	public int save(Member member) {
		int result = 0;
		
		if(member.getMemberNo() > 0) {
			//update
			
			
		} else {
			//insert
			member.setPassword(encoder.encode(member.getPassword()));
			
			result = mapper.insertMember(member);
					
		}
		
		
		return result;
	}

<<<<<<< HEAD
=======

>>>>>>> origin/feature/pay_sy
}











