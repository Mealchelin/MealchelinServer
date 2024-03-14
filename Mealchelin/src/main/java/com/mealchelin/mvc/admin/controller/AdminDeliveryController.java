package com.mealchelin.mvc.admin.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.common.util.MultipartFileUtil;
import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.cscenter.model.vo.Support;
import com.mealchelin.mvc.member.model.vo.Member;
import com.mealchelin.mvc.order.model.service.OrderService;
import com.mealchelin.mvc.order.model.vo.Orders;
import com.mealchelin.mvc.product.model.vo.Product;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/delivery")
public class AdminDeliveryController {
	private final OrderService service;
	
	@GetMapping("/adDelivery")
	public ModelAndView adDelivery(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page) {
		int listCount = 0;
		PageInfo pageInfo = null;
		List<Orders> list = null;
		
		listCount = service.getadOrderCount();
		pageInfo = new PageInfo(page, 5, listCount, 10);
		list = service.getadOrderList(pageInfo);
		
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("admin/delivery/adDelivery");
		
		return modelAndView;
	}
	
	@GetMapping("/edit")
	public ModelAndView adDeliveryEdit(ModelAndView modelAndView, @RequestParam int no, @SessionAttribute Member loginMember) {
		
		Orders orders = service.getAdOrderByNo(no);
		
		modelAndView.addObject("orders", orders);
		modelAndView.setViewName("admin/delivery/edit");
		
		return modelAndView;
		
	}
	
	@PostMapping("/edit")
	public ModelAndView adProductEdit(
			ModelAndView modelAndView,
			@RequestParam int no,
			@RequestParam String shipStatus) {
		
		Orders orders = null;
		orders = service.getAdOrderByNo(no);
		
		int result = 0;
		
		orders.setShipStatus(shipStatus);
		result = service.adOrderSave(orders);
		
		if (result > 0) {
			modelAndView.addObject("msg", "상품 수정 완료");
			modelAndView.addObject("script", "opener.parent.location.reload(); setTimeout(() => {window.close();}, 100);");
		} else {
			modelAndView.addObject("msg", "상품 수정 실패");
			modelAndView.addObject("location", "/admin/product/edit?no="+orders.getOrderNo());
		}
			modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
}
