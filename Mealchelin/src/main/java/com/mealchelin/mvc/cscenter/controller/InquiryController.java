package com.mealchelin.mvc.cscenter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/cscenter")
public class InquiryController {
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
