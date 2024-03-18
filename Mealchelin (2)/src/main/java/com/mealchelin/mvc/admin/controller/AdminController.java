package com.mealchelin.mvc.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@GetMapping("/main")
	public ModelAndView admain(ModelAndView modelAndView) {
		
		modelAndView.setViewName("admin/main");
		
		return modelAndView;
	}
	

}
