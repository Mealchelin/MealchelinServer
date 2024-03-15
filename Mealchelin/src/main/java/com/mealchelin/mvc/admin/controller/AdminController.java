package com.mealchelin.mvc.admin.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.order.model.service.OrderService;
import com.mealchelin.mvc.order.model.vo.Orders;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminController {
	private final OrderService Orderservice;
	@GetMapping("/main")
	public ModelAndView admain(ModelAndView modelAndView) {
		
		List<Orders> list = null;
		list = Orderservice.getadMainOrderList();
		
		modelAndView.addObject("list", list);
		modelAndView.setViewName("admin/main");
		
		return modelAndView;
	}
	
	

}
