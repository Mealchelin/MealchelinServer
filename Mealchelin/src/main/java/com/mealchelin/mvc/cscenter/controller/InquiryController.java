package com.mealchelin.mvc.cscenter.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.cscenter.model.service.InquiryService;
import com.mealchelin.mvc.cscenter.model.vo.Support;
import com.mealchelin.mvc.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/cscenter")
public class InquiryController {
	private final InquiryService service;
	
	@GetMapping("/inquiry")
	public ModelAndView csinquiry(ModelAndView modelAndView, @SessionAttribute("loginMember") Member loginMember, @RequestParam(defaultValue = "1") int page) {
		
		int listCount = 0;
		PageInfo pageInfo = null;
		List<Support> list = null;
		
		listCount = service.getInquiryCount(loginMember);
		pageInfo = new PageInfo(page, 5, listCount, 10);
		list = service.getInquiryList(loginMember, pageInfo);
		
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("cscenter/inquiry");
		
		return modelAndView;
	}
	
	@GetMapping("/inquiryView")
	public ModelAndView csinquiryView(ModelAndView modelAndView) {
		
		modelAndView.setViewName("cscenter/inquiryView");
		
		return modelAndView;
	}
	
	@GetMapping("/inquiryWrite")
	public ModelAndView csinquiryWrite(ModelAndView modelAndView) {
		
		modelAndView.setViewName("cscenter/inquiryWrite");
		
		return modelAndView;
	}
}
