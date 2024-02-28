package com.mealchelin.mvc.cscenter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.cscenter.model.service.InquiryService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/cscenter")
public class InquiryController {
//	private final InquiryService service;
	
	@GetMapping("/inquiry")
	public ModelAndView csinquiry(ModelAndView modelAndView) {
		
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
