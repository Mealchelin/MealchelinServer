package com.mealchelin.mvc.review.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mealchelin.mvc.review.model.service.ReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/mypage")
public class myPageReviewController {
	@GetMapping("/productReview")
	public String mypageProductReview() {
		
		
        return "mypage/productReview";
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
