package com.mealchelin.mvc;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.product.model.service.ProductService;
import com.mealchelin.mvc.product.model.vo.Product;
import com.mealchelin.mvc.review.model.service.ReviewService;
import com.mealchelin.mvc.review.model.vo.Review;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequiredArgsConstructor
public class HomeController {
	
	private final ProductService productService;
	
	private final ReviewService reviewService;
	
	@GetMapping("/")
	public ModelAndView home(ModelAndView modelAndView) {
		
		List<Product> list = null;
		List<Review> review = null;
		
		list = productService.getProductNewListByHome();
		review = reviewService.getReviewListForHome();
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("review", review);
		modelAndView.setViewName("home");
		
		return modelAndView;
	}
	
}




