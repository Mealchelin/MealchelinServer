package com.mealchelin.mvc.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/delivery")
public class AdminDeliveryController {
	@GetMapping("/adDelivery")
	public ModelAndView adDelivery(ModelAndView modelAndView) {
		
		modelAndView.setViewName("admin/delivery/adDelivery");
		
		return modelAndView;
	}
	
	@GetMapping("/edit")
	public ModelAndView adDeliveryEdit(ModelAndView modelAndView) {
		
		modelAndView.setViewName("admin/delivery/edit");
		
		return modelAndView;
	}
}
