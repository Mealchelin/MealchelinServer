package com.mealchelin.mvc.pay.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.member.model.service.MemberService;
import com.mealchelin.mvc.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequiredArgsConstructor
public class payController {
	
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
