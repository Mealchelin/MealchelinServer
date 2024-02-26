package com.mealchelin.mvc.pay.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class payController {

	
	@GetMapping("/pay/pay")
	public ModelAndView payment(ModelAndView modelAndView) {
		
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
