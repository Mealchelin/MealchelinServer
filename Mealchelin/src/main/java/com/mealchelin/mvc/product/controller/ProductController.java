package com.mealchelin.mvc.product.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.product.model.service.ProductService;
import com.mealchelin.mvc.product.model.vo.Product;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/product")
@RequiredArgsConstructor
public class ProductController {
	
	private final ProductService productService;

	// 주소와 화면 연결
	// + 카테고리 선택
	@GetMapping("/list")
	public ModelAndView list(
			ModelAndView modelAndView,
			@RequestParam(defaultValue="") String category,
			@RequestParam(defaultValue="") String sort) {
		
		List<Product> list = null;
		int listCount = 0;
		
		listCount = productService.getProductCount();
		list = productService.getProductList();
		
		log.info("List: {}", list);
		
		modelAndView.addObject("listCount", listCount);   
		modelAndView.addObject("list", list);   
		
//		modelAndView.setViewName("redirect:/product/list");
		modelAndView.setViewName("product/list");
		return modelAndView;
	}
	
	
}
