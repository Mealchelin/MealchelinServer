package com.mealchelin.mvc.shippingLocation.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.member.model.vo.Member;
import com.mealchelin.mvc.shippingLocation.model.service.ShippingLocationService;
import com.mealchelin.mvc.shippingLocation.model.vo.ShippingLocation;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class ShippingLocationController {

	private final ShippingLocationService sLService;
	
	@GetMapping("/mypage/shippingLocation")
	public ModelAndView shippingLocation(
			ModelAndView modelAndView,
			@SessionAttribute Member loginMember) {
		
		log.info(loginMember.toString());
		List<ShippingLocation> list = null;
		list = sLService.getShippingLocationListByLoginMember(loginMember.getMemberNo());
		log.info(list.toString());
		modelAndView.addObject("list", list);
		modelAndView.setViewName("mypage/shippingLocation");
		
		return modelAndView;
	}
	
	@PostMapping("/mypage/shippingLocation")
	public ModelAndView ShippingLocation(
			ModelAndView modelAndView,
			ShippingLocation sl,
			@SessionAttribute Member loginMember) {
		
		sl.setMemberNo(loginMember.getMemberNo());
		int result = 0;
		result = sLService.save(sl);
		// 배송지 등록
		if (result == 1) {
			modelAndView.addObject("msg", "배송지가 추가되었습니다.");
			modelAndView.addObject("location", "/mypage/shippingLocation");
		} else if (result == 2) {
			modelAndView.addObject("msg", "배송지는 최대 5개까지만 저장 가능합니다.");
			modelAndView.addObject("location", "/mypage/shippingLocation");
		} else {
			modelAndView.addObject("msg", "배송지 추가에 실패하였습니다.");
			modelAndView.addObject("location", "/mypage/shippingLocation");
		}
		
		modelAndView.setViewName("common/msg");
		return modelAndView;
	}
	
	@PostMapping("/mypage/shippingLocation/delete")
	public ModelAndView delete(
			ModelAndView modelAndView,
			@RequestParam int shipNo,
			@SessionAttribute Member loginMember) {
		
		log.info("{}", shipNo);
		
		int result = 0;
		result = sLService.delete(loginMember, shipNo);
		
		if (result == 1) {
			modelAndView.addObject("msg", "배송지가 삭제되었습니다.");
			modelAndView.addObject("location", "/mypage/shippingLocation");
		} else if (result == 2) {
			modelAndView.addObject("msg", "배송지는 최소 1개는 존재해야 합니다.");
			modelAndView.addObject("location", "/mypage/shippingLocation");
		} else {
			modelAndView.addObject("msg", "배송지 삭제에 실패하였습니다.");
			modelAndView.addObject("location", "/mypage/shippingLocation");
		}
		modelAndView.setViewName("common/msg");
		return modelAndView;
	}
	
	
}
