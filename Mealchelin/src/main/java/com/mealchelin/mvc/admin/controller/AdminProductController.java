package com.mealchelin.mvc.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/product")
public class AdminProductController {
	@GetMapping("/adProduct")
	public ModelAndView adProduct(ModelAndView modelAndView) {
		
		modelAndView.setViewName("admin/product/adProduct");
		
		return modelAndView;
	}
	
	@GetMapping("/write")
	public ModelAndView adProductWrite(ModelAndView modelAndView) {
		
		modelAndView.setViewName("admin/product/write");
		
		return modelAndView;
	}
	
	@GetMapping("/edit")
	public ModelAndView adProductEdit(ModelAndView modelAndView) {
		
		modelAndView.setViewName("admin/product/edit");
		
		return modelAndView;
	}
}
