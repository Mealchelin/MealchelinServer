package com.mealchelin.mvc.shippingLocation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.shippingLocation.model.service.ShippingLocationService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ShippingLocationController {

	private final ShippingLocationService Service;
	
	@GetMapping("/mypage/shippingLocation")
	public ModelAndView shippingLocation(ModelAndView modelAndView) {
		
		modelAndView.setViewName("mypage/shippingLocation");
		
		return modelAndView;
	}
	
}
