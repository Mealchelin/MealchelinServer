package com.mealchelin.mvc.pay.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.member.model.service.MemberService;
import com.mealchelin.mvc.member.model.vo.Member;
import com.mealchelin.mvc.pay.model.service.PayInfoService;
import com.mealchelin.mvc.pay.model.service.UserOrderPayService;
import com.mealchelin.mvc.pay.model.vo.Payment;
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

	private final PayInfoService  payInfoService;
	private final ShippingLocationService slService;
	private final UserOrderPayService userOrderPayService;

	@GetMapping("/payment/pay")
	public ModelAndView payment(ModelAndView modelAndView,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		

		if (loginMember == null) {
			modelAndView.addObject("msg", "로그인 해주세요");
			modelAndView.addObject("location", "/");
			modelAndView.setViewName("common/msg");
		} else {

			System.out.println(loginMember.getMemberNo());
			
			List<Payment> payinfoList = payInfoService.selectByProductPay(loginMember.getMemberNo());
			
			ShippingLocation shippinginfo = slService.getShippinginfoByInfo(loginMember.getMemberNo());
			
			List<ShoppingBasketProduct> shippingProductList = userOrderPayService.getShippingList(loginMember.getMemberNo());

			log.info("shippinginfo = {}", shippinginfo);
			log.info("payinfoList = {}", payinfoList);

			modelAndView.addObject("location", "payment/pay");
			modelAndView.addObject("userinfo", loginMember); // 추가 정보를 모델에 추가
			modelAndView.addObject("shippingInfo", shippinginfo); // 배송 정보를 모델에 추가
			modelAndView.addObject("shippingBaketInfoList", shippingProductList); // 배송 정보를 모델에 추가
			modelAndView.addObject("payInfo", payinfoList); // 배송 정보를 모델에 추가

		}
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
