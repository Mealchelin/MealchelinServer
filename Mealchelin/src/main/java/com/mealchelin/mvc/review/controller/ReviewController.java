package com.mealchelin.mvc.review.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
//@RequiredArgsConstructor
@RequestMapping("/review")
public class ReviewController {

	@GetMapping("/main")
	public String home() {
		
		
        return "/review/Main";
    }
	
	@GetMapping("/footSearchBox")
	public String footSearchBox() {
		
		
        return "/review/FootSearchBox";
    }

	@GetMapping("/mypageProductReview")
	public String mypageProductReview() {
		
		
        return "/review/MypageProductReview";
    }

	
	
	@GetMapping("/mypageWritableReview")
	public String mypageWritableReview() {
		
		
        return "/review/MypageWritableReview";
    }
	
	
	@GetMapping("/mypageWritableReviewEmpty")
	public String mypageWritableReviewEmpty() {
		
		
        return "/review/MypageWritableReviewEmpty";
    }
	
	@GetMapping("/mypageWrittenReviewEmpty")
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
	
	@GetMapping("/reviewAddComplete")
	public String reviewAddComplete() {
		
		
        return "/review/reviewAddComplete";
    }
	
	@GetMapping("/reviewEditComplete")
	public String reviewEditComplete() {
		
		
	    return "/review/reviewEditComplete";
	}
	

}








































