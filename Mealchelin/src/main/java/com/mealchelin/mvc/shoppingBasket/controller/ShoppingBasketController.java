package com.mealchelin.mvc.shoppingBasket.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		List<ShoppingBasketProduct> list = null;
		
		list = service.getBasketlist(shoppingBasketProduct);
		
		modelAndView.addObject("list", list);
		modelAndView.setViewName("mypage/shoppingBasket");
		
		return modelAndView;
	}
	
	
	@GetMapping("/mypage/updateQuantity")
	@ResponseBody
	public ResponseEntity<Map<String, ShoppingBasketProduct>> shoppingBasketProduct(@RequestParam int prdNo, @SessionAttribute("loginMember") Member loginMember) {
		Map<String, ShoppingBasketProduct> map = new HashMap<>();
		int memberNo = loginMember.getMemberNo();
		
		map.put("shoppingBasketProduct", service.getSbpByNo(prdNo, memberNo));
		
		return ResponseEntity.ok(map);
	}
	
	@PostMapping("/mypage/updateQuantity")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> shoppingBasketProductUpdate(@RequestParam int prdNo,
																		   @RequestParam int quantity,
																		   @RequestParam int totalPrice,
																		   @SessionAttribute("loginMember") Member loginMember) {
	    Map<String, Object> map = new HashMap<>();
	    int memberNo = loginMember.getMemberNo();
	    
	    ShoppingBasketProduct shoppingBasketProduct = null;
	    
	    shoppingBasketProduct = service.getSbpByNo(prdNo, memberNo);
	    shoppingBasketProduct.setQuantity(quantity);
	    shoppingBasketProduct.setTotalPrice(totalPrice);
	    
	    int result = service.updateSbpByNo(shoppingBasketProduct);
	    
	     map.put("success", result);
	    
	    return ResponseEntity.ok(map);
	}
	
	
	@GetMapping("/mypage/shoppingBasketDelete")
	@ResponseBody
	public ResponseEntity<Map<String, ShoppingBasketProduct>> getshoppingBasketProductDelete(@RequestParam int prdNo, @SessionAttribute("loginMember") Member loginMember) {
		Map<String, ShoppingBasketProduct> map = new HashMap<>();
		int memberNo = loginMember.getMemberNo();
		
		map.put("getshoppingBasketProductDelete", service.getSbpByNo(prdNo, memberNo));
		
		return ResponseEntity.ok(map);
	}
	
	@PostMapping("/mypage/shoppingBasketDelete")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> shoppingBasketProductDelete(@RequestParam int prdNo, @SessionAttribute("loginMember") Member loginMember) {
	    Map<String, Object> map = new HashMap<>();
	    int memberNo = loginMember.getMemberNo();
	    
	    // 삭제 로직 구현
	    int result = service.deleteSbpByNo(prdNo, memberNo);
	    
	     map.put("success", result);
	    
	    return ResponseEntity.ok(map);
	}
	
	
	
}
