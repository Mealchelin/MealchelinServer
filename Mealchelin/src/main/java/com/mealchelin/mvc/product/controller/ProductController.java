package com.mealchelin.mvc.product.controller;

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
import com.mealchelin.mvc.shoppingBasket.model.service.ShoppingBasketProductService;
<<<<<<< HEAD
import com.mealchelin.mvc.shoppingBasket.model.vo.ShoppingBasketProduct;
=======
<<<<<<< HEAD
import com.mealchelin.mvc.shoppingBasket.model.vo.ShoppingBasketProduct;
=======
import com.mealchelin.mvc.shoppingBasketProduct.model.vo.ShoppingBasketProduct;
>>>>>>> origin/feature/pay_sy
>>>>>>> parent of ff83659 (성연 240304)

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/product")
@RequiredArgsConstructor
public class ProductController {
	
	private final ProductService productService;
	private final ShoppingBasketProductService sbpService;

	// 주소와 화면 연결
	// + 카테고리 선택
	@GetMapping("/list")
	public ModelAndView list(
			ModelAndView modelAndView,
			@RequestParam(defaultValue="") String category,
			@RequestParam(defaultValue="") String sort,
			@RequestParam(defaultValue="1") int page) {
		
		List<Product> list = null;
		int listCount = 0;
		PageInfo pageInfo = null; 
		
		if (category.equals("")) {
			listCount = productService.getProductCount();
		} else {
			listCount = productService.getProductCountByCategory(category);
		}
		
		pageInfo = new PageInfo(page, 5, listCount, 16);
		
		// 리스트는 카테고리 + 분류 방식에 영향
		// 1. 전부 없을 때
		// 2. 카테고리만 있을 때
		// 3. 분류만 있을 때
		// 4. 카테고리 + 분류일 때
		
		if (category.equals("") && sort.equals("")) {
			list = productService.getProductList(pageInfo);
		} else if (!category.equals("") && sort.equals("")) {
			list = productService.getProductListByCategory(category,pageInfo);
		} else if (category.equals("") && !sort.equals("")) {
			list = productService.getProductList(sort, pageInfo);
		} else if (!category.equals("") && !sort.equals("")) {
			list = productService.getProductListByCategory(category, sort, pageInfo);
		}
		
//		log.info("List: {}", list);
		
		modelAndView.addObject("listCount", listCount);   
		modelAndView.addObject("list", list);   
		modelAndView.addObject("pageInfo", pageInfo);   
		
//		modelAndView.setViewName("redirect:/product/list");
		modelAndView.setViewName("product/list");
		return modelAndView;
	}
	
	@GetMapping("/view")
	public ModelAndView view(
			ModelAndView modelAndView,
			@RequestParam int no) {
		
		Product product = null;
		product = productService.getProductByNo(no);
		// no에 맞는 상품 조회해서 add 
		modelAndView.addObject("product", product);
		modelAndView.setViewName("product/view");
		
		return modelAndView; 
	}
	
	// 장바구니에 추가
	@PostMapping("/shoppingBasket")
	public String shop(
			@RequestParam int no,
			@RequestParam int quantity) {
		
		int result = 0;
		Product product = null;
		ShoppingBasketProduct sbp = new ShoppingBasketProduct();
		
		product = productService.getProductByNo(no);
		int totalPrice = product.getPrice() * quantity;
		
		sbp.setPrdNo(product.getNo());
<<<<<<< HEAD
		sbp.setMemNo(1);
=======
		sbp.setPrdNo(1);
>>>>>>> origin/feature/pay_sy
		sbp.setQuantity(quantity);
		sbp.setTotalPrice(totalPrice);
		
		result = sbpService.save(sbp);
		
		return "redirect:/mypage/shoppingBasket";
	}
	
	// 구매하기
	@PostMapping("/purchase")
	public ModelAndView purchase(
			ModelAndView modelAndView,
			@RequestParam int no,
			@RequestParam int quantity) {
		
		Product product = null;
		product = productService.getProductByNo(no);
		
		log.info("{}", product);
		
		modelAndView.addObject("product", product);
		modelAndView.setViewName("redirect:/product/purchase2");
		
		return modelAndView;
	}
	
	@GetMapping("/purchase2")
	public ModelAndView	purchase2(
			ModelAndView modelAndView,
			Product product) {
		
		log.info("{}", product);
		modelAndView.addObject("product", product);
		
		return modelAndView;
	}
	
}
