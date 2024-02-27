package com.mealchelin.mvc.cscenter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/cscenter")
public class CscenterController {
	@GetMapping("/faq")
	public ModelAndView csFaq(ModelAndView modelAndView) {
		
		modelAndView.setViewName("cscenter/faq");
		
		return modelAndView;
	}
	
	@GetMapping("/notice")
	public ModelAndView csNotice(ModelAndView modelAndView) {
		
		modelAndView.setViewName("cscenter/notice");
		
		return modelAndView;
	}
	
	@GetMapping("/noticeView")
	public ModelAndView csNoticeView(ModelAndView modelAndView) {
		
		modelAndView.setViewName("cscenter/noticeView");
		
		return modelAndView;
	}
}
