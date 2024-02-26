package com.mealchelin.mvc.pay.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class payController {

	
	@GetMapping("/pay/payment")
	public ModelAndView payment(ModelAndView modelAndView) {
		
		modelAndView.setViewName("pay/payment");
		
		return modelAndView;
	}
	
	@GetMapping("/pay/orderInquiry")
	public ModelAndView paylnquiry(ModelAndView modelAndView) {
		
		modelAndView.setViewName("pay/orderInquiry");
		
		return modelAndView;
	}
	@GetMapping("/pay/orderDetails")
	public ModelAndView payDetails(ModelAndView modelAndView) {
		
		modelAndView.setViewName("pay/orderDetails");
		
		return modelAndView;
	}
	@GetMapping("/pay/orderDelete")
	public ModelAndView payDelete(ModelAndView modelAndView) {
		
		modelAndView.setViewName("pay/orderDelete");
		
		return modelAndView;
	}
	
}
