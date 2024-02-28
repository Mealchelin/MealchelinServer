package com.mealchelin.mvc.shoppingBasket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ShoppingBasketController {

	@GetMapping("/mypage/shoppingBasket")
	public ModelAndView shoppingBasket(ModelAndView modelAndView) {
		
		modelAndView.setViewName("mypage/shoppingBasket");
		
		return modelAndView;
	}
	
	
}
