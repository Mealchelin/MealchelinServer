package com.mealchelin.mvc;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.product.model.service.ProductService;
import com.mealchelin.mvc.product.model.vo.Product;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequiredArgsConstructor
public class HomeController {
	
	private final ProductService productService;
	
	@GetMapping("/")
	public ModelAndView home(ModelAndView modelAndView) {
		
		List<Product> list = null;
		list = productService.getProductNewListByHome();
		
		modelAndView.addObject("list", list);
		modelAndView.setViewName("home");
		
		return modelAndView;
	}
	
}




