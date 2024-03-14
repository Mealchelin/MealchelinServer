package com.mealchelin.mvc.review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
@RequestMapping("/review")
public class ReviewController {
	private ReviewMapper reviewMapper;
	
	private final ReviewService service;
	
//	리뷰 등록하는 코드
	@PostMapping("/reviewAddComplete")
	public String reviewWrite(Review review, @SessionAttribute("loginMember") Member loginMember) {
		int result = 0;
		log.info(review.toString());
		log.info(loginMember.toString());
		
		review.setUserNo(loginMember.getMemberNo());
		result = service.save(review);
		
		
		return "review/reviewAddComplete";
    }
	
	@GetMapping("/main")
	public ModelAndView home(ModelAndView modelAndView, 
							 @RequestParam(defaultValue = "1") int page,
							 @RequestParam(defaultValue = "", name = "searchType") String type,
							 @RequestParam(defaultValue = "", name = "searchText") String text
							) {
		int reviewCount = 0;
		PageInfo pageInfo = null;
		List<Review> list = null;
		
		log.info(modelAndView.toString());

		reviewCount = service.getReviewCount(type, text);
		pageInfo = new PageInfo(page, 5, reviewCount, 12);
		list = service.getReviewList(pageInfo, type, text);

		
		log.info("page Number : {}", page);
		log.info("List Count : {}", reviewCount);
		log.info("============================");

		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("review/main");
		
		return modelAndView;
	}
	
	@GetMapping("/reviewWrite")
	public ModelAndView reviewWrite(ModelAndView modelAndView, @SessionAttribute("loginMember") Member loginMember, @RequestParam int orderNo) {
		int userNo = loginMember.getMemberNo();
		MemberProdutOrderList memberProdutOrderList = null;
		
		memberProdutOrderList = service.getOrderInfo(orderNo);
		
		modelAndView.addObject("memberProdutOrderList", memberProdutOrderList);
		modelAndView.setViewName("review/reviewWrite");
		
        return modelAndView;
    }
	
	@GetMapping("/reviewDetail")
	public ModelAndView reviewDetail(ModelAndView modelAndView, @RequestParam int reviewNo) {
		Review review = null;

		review = service.getReviewByNo(reviewNo);

		modelAndView.addObject("review", review);
		modelAndView.setViewName("review/reviewDetail");

		return modelAndView;
    }
	
	@GetMapping("/reviewEdit")
	public ModelAndView reviewEdit(ModelAndView modelAndView, @RequestParam int reviewNo) {
		Review review = null;
		
		review = service.getReviewByNo(reviewNo);
		
		log.info(review.toString());
		
		modelAndView.addObject("review", review);
		modelAndView.setViewName("review/reviewEdit");
		
        return modelAndView;
    }
	
	
	@PostMapping("/reviewEditComplete")
	public String reviewEditComplete(Review review, @SessionAttribute("loginMember") Member loginMember) {
		int result = 0;
		
		log.info(review.getImage());
		
		if(review.getImage() == null || review.getImage().isEmpty()) {
			result = service.updateReviewNoImgChage(review);
		} else {
			result = service.updateReview(review);
		}
		
		log.info(review.getImage());
		
	    return "/review/reviewEditComplete";
	}
	
	
	
	@GetMapping("/footSearchBox")
	public String footSearchBox() {
		
		
        return "/review/FootSearchBox";
    }

	@GetMapping("/reviewEmpty")
	public String reviewEmpty() {
		
		
        return "/review/reviewEmpty";
    }
	
	
	
	@GetMapping("/reviewAddComplete")
	public String reviewAddComplete() {
		
		
        return "/review/reviewAddComplete";
    }
	
	
	

}








































