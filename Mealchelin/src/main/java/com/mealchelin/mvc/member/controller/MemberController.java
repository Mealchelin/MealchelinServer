package com.mealchelin.mvc.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

	@GetMapping("/member/enroll")
	public ModelAndView enroll(ModelAndView modelAndView) {
		
		modelAndView.setViewName("member/enroll");
		
		return modelAndView;
	}
	
	@GetMapping("/member/login")
	public ModelAndView login(ModelAndView modelAndView) {
		
		
		modelAndView.setViewName("member/login");
		
		return modelAndView;
	}

	@GetMapping("/mypage/updateMember")
	public ModelAndView updateMember(ModelAndView modelAndView) {
		
		modelAndView.setViewName("mypage/updateMember");
		
		return modelAndView;
		
	}
	
	@GetMapping("/mypage/updateMember2")
	public ModelAndView updateMember2(ModelAndView modelAndView) {
		
		modelAndView.setViewName("mypage/updateMember2");
		
		return modelAndView;
		
	}
}
