package com.mealchelin.mvc.review.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.review.model.mapper.ReviewMapper;
import com.mealchelin.mvc.review.model.service.ReviewService;
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
	public ModelAndView list(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page) {

		int reviewCount = 0;
		PageInfo pageInfo = null;
		List<Review> list = null;
		
		log.info("============================");
		log.info(modelAndView.toString());
		log.info("============================");

		reviewCount = service.getReviewCount();
		pageInfo = new PageInfo(page, 5, reviewCount, 5);
		list = service.getReviewList(pageInfo);

		
		log.info("============================");
		log.info("page Number : {}", page);
		log.info("List Count : {}", reviewCount);
		log.info("============================");

		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("mypage/productReview");

		return modelAndView;
	}
	
	@GetMapping("/writableReview")
	public String mypageWritableReview() {
		
		
        return "mypage/writableReview";
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
