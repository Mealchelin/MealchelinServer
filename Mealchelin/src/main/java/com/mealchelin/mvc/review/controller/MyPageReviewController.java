package com.mealchelin.mvc.review.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.member.model.vo.Member;
import com.mealchelin.mvc.review.model.mapper.ReviewMapper;
import com.mealchelin.mvc.review.model.service.ReviewService;
import com.mealchelin.mvc.review.model.vo.MemberProdutOrderList;
import com.mealchelin.mvc.review.model.vo.Review;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/mypage")
public class MyPageReviewController {
	private ReviewMapper reviewMapper;

	private final ReviewService service;

	@GetMapping("/mypageProductReview")
	public ModelAndView list(ModelAndView modelAndView, @SessionAttribute("loginMember") Member loginMember, Review review, @RequestParam(defaultValue = "1") int page) {

		review.setUserNo(loginMember.getMemberNo());

		int userNo = review.getUserNo();
		int reviewCount = 0;
		PageInfo pageInfo = null;
		List<Review> list = null;

		reviewCount = service.getReviewCountByuserNo(userNo);
		pageInfo = new PageInfo(page, 5, reviewCount, 5);
		list = service.getReviewListByuserNo(pageInfo, userNo);

		log.info("page Number : {}", page);
		log.info("List Count : {}", reviewCount);

		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("mypage/productReview");

		return modelAndView;
	}
	
	@GetMapping("/writableReview")
	public ModelAndView mypageWritableReview(ModelAndView modelAndView, @SessionAttribute("loginMember") Member loginMember, MemberProdutOrderList memberProdutOrderList, @RequestParam(defaultValue = "1") int page) {

		int userNo = loginMember.getMemberNo();
		int reviewCount = 0;
		PageInfo pageInfo = null;
		List<MemberProdutOrderList> list = null;

		reviewCount = service.getOrderListCountByUserNo(userNo);
		pageInfo = new PageInfo(page, 5, reviewCount, 5);
		list = service.getOrderListByUserNo(pageInfo, userNo);
		
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("mypage/writableReview");

		return modelAndView;
	}

	@GetMapping("/delete")
	public ModelAndView delete(ModelAndView modelAndView, @RequestParam("no") int no) {
		int result = 0;
		int noHasReview = 0;
		
		result = service.delete(no);
		noHasReview = service.noHasReview(no);
		
		if (result > 0) {
			modelAndView.addObject("msg", "삭제 성공");
			modelAndView.addObject("location", "/mypage/mypageProductReview");
		} else {
			modelAndView.addObject("msg", "게시글 삭제 실패");
			modelAndView.addObject("location", "/mypage/mypageProductReview");
		}

		modelAndView.setViewName("common/msg");

		return modelAndView;
	}

	@GetMapping("/writableReviewEmpty")
	public String mypageWritableReviewEmpty() {

		return "mypage/writableReviewEmpty";
	}

	@GetMapping("/writtenReviewEmpty")
	public String mypageWrittenReviewEmpty() {

		return "mypage/writtenReviewEmpty";
	}
}
