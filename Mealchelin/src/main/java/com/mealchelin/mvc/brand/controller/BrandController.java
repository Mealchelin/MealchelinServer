package com.mealchelin.mvc.brand.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/brand")
public class BrandController {
	@GetMapping("/information")
	public ModelAndView infomation(ModelAndView modelAndView) {
		
		modelAndView.setViewName("brand/information");
		
		return modelAndView;
	}
	
}
