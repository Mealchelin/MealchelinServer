package com.mealchelin.mvc.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.member.model.service.MemberService;
import com.mealchelin.mvc.member.model.vo.Member;

@Controller
@SessionAttributes("loginMember")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@GetMapping("/member/enroll")
	public ModelAndView enroll(ModelAndView modelAndView) {
		
		modelAndView.setViewName("member/enroll");
		
		return modelAndView;
	}
	
	@PostMapping("/member/login")
	public ModelAndView login(ModelAndView modelAndView,
							  @RequestParam String userId,
							  @RequestParam String userPwd) {
		
		Member loginMember = service.login(userId,userPwd);
		
		if (loginMember != null) {
			modelAndView.addObject("loginMember",loginMember);
			modelAndView.setViewName("redirect:/");	
		} else {
			modelAndView.addObject("msg", "아이디나 비밀번호가 일치하지 않습니다.");
			modelAndView.addObject("location", "/");
			modelAndView.setViewName("common/msg");
		}
		
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
