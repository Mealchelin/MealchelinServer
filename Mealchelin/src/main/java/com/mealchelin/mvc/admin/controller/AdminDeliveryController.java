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
	public ModelAndView adDelivery(ModelAndView modelAndView,
								@RequestParam(defaultValue = "1") int page,
								@RequestParam(defaultValue="", name = "ad_buy_se") String shipStatus,
								@RequestParam(defaultValue="", name = "ad_deliverySearch") String memId) {
		int listCount = 0;
		PageInfo pageInfo = null;
		List<Orders> list = null;
		
		listCount = service.getadOrderCount(shipStatus, memId);
		pageInfo = new PageInfo(page, 5, listCount, 10);
		list = service.getadOrderList(pageInfo, shipStatus, memId);
		
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
	
	@PostMapping("/packing")
	public ModelAndView adPacking(ModelAndView modelAndView,
			@RequestParam(value="ad_buy_chk", required=false) List<Integer> orderList) {
		if(orderList == null) {
			modelAndView.addObject("msg", "변경을 실패하였습니다.");
			modelAndView.addObject("location", "/admin/delivery/adDelivery");			
		} else {
			for(Integer no : orderList) {
				if(no != null) {
					Orders order = service.getAdOrderByNo(no);
					if (order != null) {
						order.setShipStatus("배송준비중");
						service.adOrderSave(order);
					}
				}
			}
			modelAndView.addObject("msg", "선택한 데이터를 변경하였습니다.");
			modelAndView.addObject("location", "/admin/delivery/adDelivery");			
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	@PostMapping("/deliveryIng")
	public ModelAndView adDeliveryIng(ModelAndView modelAndView,
			@RequestParam(value="ad_buy_chk", required=false) List<Integer> orderList) {
		if(orderList == null) {
			modelAndView.addObject("msg", "변경을 실패하였습니다.");
			modelAndView.addObject("location", "/admin/delivery/adDelivery");			
		} else {
			for(Integer no : orderList) {
				if(no != null) {
					Orders order = service.getAdOrderByNo(no);
					if (order != null) {
						order.setShipStatus("배송중");
						service.adOrderSave(order);
					}
				}
			}
			modelAndView.addObject("msg", "선택한 데이터를 변경하였습니다.");
			modelAndView.addObject("location", "/admin/delivery/adDelivery");			
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	@PostMapping("/deliveryCom")
	public ModelAndView adDeliveryCom(ModelAndView modelAndView,
			@RequestParam(value="ad_buy_chk", required=false) List<Integer> orderList) {
		if(orderList == null) {
			modelAndView.addObject("msg", "변경을 실패하였습니다.");
			modelAndView.addObject("location", "/admin/delivery/adDelivery");			
		} else {
			for(Integer no : orderList) {
				if(no != null) {
					Orders order = service.getAdOrderByNo(no);
					if (order != null) {
						order.setShipStatus("배송완료");
						service.adOrderSave(order);
					}
				}
			}
			modelAndView.addObject("msg", "선택한 데이터를 변경하였습니다.");
			modelAndView.addObject("location", "/admin/delivery/adDelivery");			
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
}
