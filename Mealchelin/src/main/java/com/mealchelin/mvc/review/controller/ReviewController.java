package com.mealchelin.mvc.review.controller;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/review")
public class ReviewController {

	@GetMapping("/Main")
	public String main() {
		
		
        return "/review/Main";
    }
	
	@GetMapping("/FootSearchBox")
	public String footSearchBox() {
		
		
        return "/review/FootSearchBox";
    }

	@GetMapping("/MypageProductReview")
	public String mypageProductReview() {
		
		
        return "/review/MypageProductReview";
    }

	
	
	@GetMapping("/MypageWritableReview")
	public String mypageWritableReview() {
		
		
        return "/review/MypageWritableReview";
    }
	
	
	@GetMapping("/MypageWritableReviewEmpty")
	public String mypageWritableReviewEmpty() {
		
		
        return "/review/MypageWritableReviewEmpty";
    }
	
	@GetMapping("/MypageWrittenReviewEmpty")
	public String mypageWrittenReviewEmpty() {
		
		
        return "/review/MypageWrittenReviewEmpty";
    }
	
	@GetMapping("/reviewDetail")
	public String reviewDetail() {
		
		
        return "/review/reviewDetail";
    }
	
	
	@GetMapping("/reviewEdit")
	public String reviewEdit() {
		
		
        return "/review/reviewEdit";
    }
	
	@GetMapping("/reviewEmpty")
	public String reviewEmpty() {
		
		
        return "/review/reviewEmpty";
    }
	
	@GetMapping("/reviewWrite")
	public String reviewWrite() {
		
		
        return "/review/reviewWrite";
    }
}








































