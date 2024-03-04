package com.mealchelin.mvc.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.review.model.mapper.ReviewMapper;
import com.mealchelin.mvc.review.model.service.ReviewService;
import com.mealchelin.mvc.review.model.vo.Review;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/review")
public class ReviewController {
	private ReviewMapper reviewMapper;
	
	private final ReviewService service;
	
//	리뷰 등록하는 코드
	@PostMapping("/reviewAddComplete")
	public String reviewWrite(Review review) {
		int result = 0;
		log.info(review.toString());
		
		result = service.save(review);
		
		return "review/reviewAddComplete";
    }
	
	@GetMapping("/main")
	public String home() {
		
		
		return "/review/main";
	}
	
	@GetMapping("/reviewWrite")
	public String reviewWrite() {
		
        return "review/reviewWrite";
    }
	
	
	
	@GetMapping("/footSearchBox")
	public String footSearchBox() {
		
		
        return "review/FootSearchBox";
    }

	
	@GetMapping("/reviewDetail")
	public String reviewDetail() {
		
		
        return "review/reviewDetail";
    }
	
	
	@GetMapping("/reviewEdit")
	public String reviewEdit() {
		
		
        return "review/reviewEdit";
    }
	
	@GetMapping("/reviewEmpty")
	public String reviewEmpty() {
		
		
        return "review/reviewEmpty";
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








































