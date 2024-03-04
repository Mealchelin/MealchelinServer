package com.mealchelin.mvc.pay.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.member.model.service.MemberService;
import com.mealchelin.mvc.member.model.vo.Member;
import com.mealchelin.mvc.shippingLocation.model.service.ShippingLocationService;
import com.mealchelin.mvc.shippingLocation.model.vo.ShippingLocation;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@SessionAttributes("loginMember")
public class PayController {

	private final MemberService service;
	private final ShippingLocationService SLService;

	@GetMapping("/payment/pay")
	public ModelAndView payment(ModelAndView modelAndView,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		

		if (loginMember == null) {
			modelAndView.addObject("msg", "로그인 해주세요");
			modelAndView.addObject("location", "/");
			modelAndView.setViewName("common/msg");
		} else {

			System.out.println(loginMember.getMemberNo());
			
			ShippingLocation shippinginfo = SLService.getShippinginfoByInfo(loginMember.getMemberNo());

			log.info("shippinginfo = {}", shippinginfo);

			modelAndView.addObject("location", "payment/pay");
			modelAndView.addObject("userinfo", loginMember); // 추가 정보를 모델에 추가
			modelAndView.addObject("shippingInfo", shippinginfo); // 배송 정보를 모델에 추가

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
