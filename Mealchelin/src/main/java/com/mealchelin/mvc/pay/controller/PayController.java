package com.mealchelin.mvc.pay.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.member.model.vo.Member;
import com.mealchelin.mvc.order.model.service.OrderService;
import com.mealchelin.mvc.pay.model.service.PayInfoService;
import com.mealchelin.mvc.pay.model.service.UserOrderPayService;
import com.mealchelin.mvc.pay.model.vo.Payment;
import com.mealchelin.mvc.product.model.service.ProductService;
import com.mealchelin.mvc.product.model.vo.Product;
import com.mealchelin.mvc.shippingLocation.model.service.ShippingLocationService;
import com.mealchelin.mvc.shippingLocation.model.vo.ShippingLocation;
import com.mealchelin.mvc.shoppingBasket.model.vo.ShoppingBasketProduct;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@SessionAttributes("loginMember")
public class PayController {

	private final PayInfoService payInfoService;
	private final ShippingLocationService shippingService;
	private final UserOrderPayService payService;
	private final ProductService productService;
	private final OrderService orderService;
	

	@GetMapping("/payment/directpay")
	public ModelAndView directment(ModelAndView modelAndView,
			@SessionAttribute("loginMember") Member loginMember,
			@RequestParam int no,
			@RequestParam int quantity
			){
		Product product = null;
		product = productService.getProductByNo(no);
		ShippingLocation shippingInfo = null;
		List<Payment> payInfoList = null;
		
		int price = 0;
		price = product.getPrice()*quantity;
		System.out.println(price);
		int shipPrice = 0;
		log.info("price {}",price);
		
		

		//주문 상품	    	
		product = productService.getProductByNo(no);
		// 배송정보
		shippingInfo = shippingService.getShippingInfoByInfo(loginMember.getMemberNo());
		
	
		if (price > 50000) {
		    shipPrice = 0;
		}else {
			
			if (shippingInfo.getMountain() == "N") {
				shipPrice = 3000;
			}
			else {
				shipPrice = 5000;
			}
		}
		// 결제수단 표시
		payInfoList= payInfoService.selectByProductPay(loginMember.getMemberNo());

		log.info("shippinginfo = {}", shippingInfo);
		log.info("payInfoList = {}", payInfoList);

		modelAndView.addObject("userInfo", loginMember); // 추가 정보를 모델에 추가
		modelAndView.addObject("shippingInfo", shippingInfo); // 배송 정보를 모델에 추가
		modelAndView.addObject("product", product);
		modelAndView.addObject("no", no);
		modelAndView.addObject("quantity", quantity);
		modelAndView.addObject("price", price);		
		modelAndView.addObject("shipPrice", shipPrice);		
	    modelAndView.setViewName("payment/directpay");
	    
	    System.out.println("price : " + price);
	    
		return modelAndView;
	}
	

	@GetMapping("/payment/pay")
	public ModelAndView cartpayment(ModelAndView modelAndView,
			@SessionAttribute("loginMember") Member loginMember
			){
		List<ShoppingBasketProduct> shippingProductList = null;
		ShippingLocation shippingInfo = null;
		List<Payment> payInfoList = null;

		//주문 상품
		shippingProductList = payService.getShippingList(loginMember.getMemberNo());	    	
		
		// 배송정보
		shippingInfo = shippingService.getShippingInfoByInfo(loginMember.getMemberNo());
		
		// 결제수단 표시
		payInfoList= payInfoService.selectByProductPay(loginMember.getMemberNo());

		log.info("shippinginfo = {}", shippingInfo);
		log.info("payInfoList = {}", payInfoList);

		modelAndView.addObject("userInfo", loginMember); // 추가 정보를 모델에 추가
		modelAndView.addObject("shippingInfo", shippingInfo); // 배송 정보를 모델에 추가
		modelAndView.addObject("shippingBaketInfoList", shippingProductList); // 배송 정보를 모델에 추가
	    modelAndView.setViewName("payment/pay");
	    
		return modelAndView;
	}
	
	
	
	@PostMapping("payment/paysucces")
	public ModelAndView paysucces(ModelAndView modelAndView) {
		

		modelAndView.setViewName("redirect:payment/paysucces");
		
		return modelAndView;
	}
	

	@GetMapping("payment/paysucces")
	public ModelAndView payresult(ModelAndView modelAndView) {
		
		
		modelAndView.setViewName("payment/paysucces");
	
		return modelAndView;	
	}
	
	

	@GetMapping("/mypage/payInquiry")
	public ModelAndView paylnquiry(ModelAndView modelAndView) {

		modelAndView.setViewName("mypage/payInquiry");

		return modelAndView;

	}

	@GetMapping("/mypage/payDetails")
	public ModelAndView payDetails(ModelAndView modelAndView) {

		modelAndView.setViewName("mypage/payDetails");

		return modelAndView;
	}

	@GetMapping("/mypage/payDelete")
	public ModelAndView payDelete(ModelAndView modelAndView) {

		modelAndView.setViewName("mypage/payDelete");

		return modelAndView;
	}

}
