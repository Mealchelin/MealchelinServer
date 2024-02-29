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
		
		if (category.equals("")) {
			listCount = productService.getProductCount();
		} else {
			listCount = productService.getProductCountByCategory(category);
		}
		
		
		// 리스트는 카테고리 + 분류 방식에 영향
		list = productService.getProductList();
		// 1. 전부 없을 때 order by 인기
		// 2. 카테고리만 있을 때 = where 카테고리 order by 인기
		// 3. 분류만 있을 때
		// 4. 카테고리 + 분류일 때
		
		if (category.equals("") && sort.equals("")) {
			list = productService.getProductList();
		} else if (!category.equals("") && sort.equals("")) {
			list = productService.getProductListByCategory(category);
		} else if (category.equals("") && !sort.equals("")) {
			list = productService.getProductList(sort);
		} else if (!category.equals("") && !sort.equals("")) {
			list = productService.getProductListByCategory(category, sort);
		}
		 
		
//		log.info("List: {}", list);
		
		modelAndView.addObject("listCount", listCount);   
		modelAndView.addObject("list", list);   
		
//		modelAndView.setViewName("redirect:/product/list");
		modelAndView.setViewName("product/list");
		return modelAndView;
	}
	
	@GetMapping("/view")
	public ModelAndView view(
			ModelAndView modelAndView,
			@RequestParam int no) {
		
		// no에 맞는 상품 조회해서 add 
//		modelAndView.addObject("product", product);
		modelAndView.setViewName("product/view");
		
		return modelAndView; 
	}
	
	
}
