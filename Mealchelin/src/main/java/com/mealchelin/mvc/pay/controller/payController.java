package com.mealchelin.mvc.pay.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
<<<<<<< HEAD
=======
import org.springframework.web.bind.annotation.SessionAttribute;
>>>>>>> origin/feature/pay_sy
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.member.model.service.MemberService;
import com.mealchelin.mvc.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequiredArgsConstructor
public class payController {
<<<<<<< HEAD
	
	private final MemberService service;

	@GetMapping("/pay/pay")
	public ModelAndView payment(ModelAndView modelAndView
	) {

		Member member = service.getMemberByNo(1);
		
		
		
		log.info("member() 호출 - {}",member);
		
		System.out.println(member);
		
		
		modelAndView.addObject("member", member);	
		modelAndView.setViewName("pay/pay");

		return modelAndView;
	}
	
	
	
	
	
	
	
=======
	private final MemberService service;
	
	

	@GetMapping("/pay/pay")
	public ModelAndView payment(
	        ModelAndView modelAndView,
	        @SessionAttribute("loginMember") Member loginMember
	        ) {
		Member member = service.findMemberById(loginMember.getId());
		
		Member userinfo = service.MemberByOrderInfo(loginMember.getId());
		
		
		
		log.info("userinfo = {}",userinfo);
		
	    if ( member.getId() != null) {
	    	 	modelAndView.addObject("location", "pay/pay");
		        modelAndView.addObject("loginMember", loginMember);
		        modelAndView.addObject("userinfo", userinfo); // 추가 정보를 모델에 추가
	    } else {
	    	modelAndView.addObject("msg", "아이디나 비밀번호가 일치하지 않습니다.");
			modelAndView.addObject("location", "/");
			modelAndView.setViewName("common/msg");
	    }

	    return modelAndView;
	}
	
>>>>>>> origin/feature/pay_sy
	

	@GetMapping("/pay/lnquiry")
	public ModelAndView paylnquiry(ModelAndView modelAndView) {

		modelAndView.setViewName("pay/lnquiry");

		return modelAndView;

	}

	@GetMapping("/pay/Details")
	public ModelAndView payDetails(ModelAndView modelAndView) {

		modelAndView.setViewName("pay/Details");

		return modelAndView;
	}

	@GetMapping("/pay/Delete")
	public ModelAndView payDelete(ModelAndView modelAndView) {

		modelAndView.setViewName("pay/Delete");

		return modelAndView;
	}

}
