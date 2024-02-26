package com.mealchelin.mvc.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/review")
public class AdminReviewController {
	@GetMapping("/adReview")
	public ModelAndView adReview(ModelAndView modelAndView) {
		
		modelAndView.setViewName("admin/review/adReview");
		
		return modelAndView;
	}
	
	@GetMapping("/edit")
	public ModelAndView adReviewEdit(ModelAndView modelAndView) {
		
		modelAndView.setViewName("admin/review/edit");
		
		return modelAndView;
	}
}
