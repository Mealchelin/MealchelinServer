package com.mealchelin.mvc.admin.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.product.model.service.ProductService;
import com.mealchelin.mvc.product.model.vo.Product;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/product")
public class AdminProductController {
	private final ProductService productService;
	
	@GetMapping("/adProduct")
	public ModelAndView adProduct(
			ModelAndView modelAndView,
			@RequestParam(defaultValue="1") int page,
			@RequestParam(defaultValue="", name = "ad_product_se") String category,
			@RequestParam(defaultValue="", name = "ad_memberSearch") String name) {
		
		List<Product> list = null;
		int listCount = 0;
		PageInfo pageInfo = null; 
		
		// 1. 전체 검색
		// 2. 카테고리 선택 후 검색
		// 3. 상품명 검색
		// 4. 카테고리 + 상품명 검색
		
		
		listCount = productService.getProductSearchCount(category, name);
		
		pageInfo = new PageInfo(page, 5, listCount, 10);
		list = productService.getProductListOrderByNo(pageInfo, category, name);
		
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("pageInfo", pageInfo);
		
		modelAndView.setViewName("admin/product/adProduct");
		return modelAndView;
	}
	
	@GetMapping("/write")
	public ModelAndView adProductWrite(ModelAndView modelAndView) {
		
		modelAndView.setViewName("admin/product/write");
		
		return modelAndView;
	}
	
	@PostMapping("/write")
	public ModelAndView add(
			ModelAndView modelAndView,
			Product product) {
		
		return modelAndView;
	}
	
	@GetMapping("/edit")
	public ModelAndView adProductEdit(ModelAndView modelAndView) {
		
		modelAndView.setViewName("admin/product/edit");
		
		return modelAndView;
	}
}
