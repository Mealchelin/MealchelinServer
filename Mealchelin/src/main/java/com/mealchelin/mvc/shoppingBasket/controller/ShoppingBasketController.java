package com.mealchelin.mvc.shoppingBasket.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.member.model.vo.Member;
import com.mealchelin.mvc.shoppingBasket.model.service.ShoppingBasketProductService;
import com.mealchelin.mvc.shoppingBasket.model.vo.ShoppingBasket;
import com.mealchelin.mvc.shoppingBasket.model.vo.ShoppingBasketProduct;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class ShoppingBasketController {
	private final ShoppingBasketProductService service;

	@GetMapping("/mypage/shoppingBasket")
	public ModelAndView shoppingBasket(ModelAndView modelAndView, ShoppingBasketProduct shoppingBasketProduct, ShoppingBasket shoppingBasket , @SessionAttribute("loginMember") Member loginMember) {
		shoppingBasketProduct.setMemberNo(loginMember.getMemberNo());
		shoppingBasket.setMemberNo(loginMember.getMemberNo());
		
		Map<String, Object> map = new HashMap<>();
		List<ShoppingBasketProduct> list = null;
		
		list = service.getBasketlist(shoppingBasketProduct);
		
		int payment = service.getPayment(shoppingBasket);
		
		map.put("list", list);
		map.put("payment", payment);
		
		modelAndView.addObject("list", list);
		modelAndView.setViewName("mypage/shoppingBasket");
		
		return modelAndView;
	}
	
	
}
