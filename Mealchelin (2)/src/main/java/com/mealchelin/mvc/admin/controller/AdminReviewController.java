package com.mealchelin.mvc.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.cscenter.model.vo.Support;
import com.mealchelin.mvc.member.model.vo.Member;
import com.mealchelin.mvc.review.model.mapper.ReviewMapper;
import com.mealchelin.mvc.review.model.service.ReviewService;
import com.mealchelin.mvc.review.model.vo.MemberDTO;
import com.mealchelin.mvc.review.model.vo.Review;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/review")
public class AdminReviewController {
	private ReviewMapper reviewMapper;
	
	private final ReviewService service;
	
	
	@GetMapping("/adReview")
	public ModelAndView adReview(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page) {
		int reviewCount = 0;
		PageInfo pageInfo = null;
		List<Review> list = null;
		List<MemberDTO> memberList = null;
		
		log.info(modelAndView.toString());

		reviewCount = service.getAdminReviewCount();
		pageInfo = new PageInfo(page, 5, reviewCount, 12);
		list = service.getAdminReviewList(pageInfo);
		

		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("list", list);
		modelAndView.addObject("memberList", memberList);
		
		modelAndView.setViewName("admin/review/adReview");
		
		return modelAndView;
	}
	
	@GetMapping("/edit")
	public ModelAndView adReviewEdit(ModelAndView modelAndView) {
		
		modelAndView.setViewName("admin/review/edit");
		
		return modelAndView;
	}
	
	@PostMapping("/updateReviewStatus")
	  public ResponseEntity<Map<String, Object>> updateStatus(@RequestBody String[] checkedReviewNoList) {
		log.info("=============================");
		log.info(checkedReviewNoList.toString());
		
		Map<String, Object> map = new HashMap<>();

	    int result = 0;
	    result = service.updateStatus(checkedReviewNoList);
	    log.info(checkedReviewNoList.toString());
	    
	    return ResponseEntity.ok(map);
	  }
	
	@PostMapping("/exposure")
	public ModelAndView adPostEx(ModelAndView modelAndView,
			@RequestParam(value="ad_review_chk", required=false) List<Integer> reviewList) {
		if(reviewList == null) {
			modelAndView.addObject("msg", "노출 여부가 실패하였습니다.");
			modelAndView.addObject("location", "/admin/review/adReview");			
		} else {
			for(Integer no : reviewList) {
				if(no != null) {
					Review review= service.getReviewByNo(no);
					if (review != null) {
						review.setStatus("Y");
						service.adSave(review);
					}
				}
			}
			modelAndView.addObject("msg", "선택한 데이터를 노출하였습니다.");
			modelAndView.addObject("location", "/admin/review/adReview");			
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}

	
	@PostMapping("/nonExposure")
	public ModelAndView adPostNonEx(ModelAndView modelAndView,
			@RequestParam(value="ad_review_chk", required=false) List<Integer> reviewList) {
		if(reviewList == null) {
			modelAndView.addObject("msg", "노출 여부가 실패하였습니다.");
			modelAndView.addObject("location", "/admin/review/adReview");			
		} else {
			for(Integer no : reviewList) {
				if(no != null) {
					Review review= service.getReviewByNo(no);
					if (review != null) {
						review.setStatus("N");
						service.adSave(review);
					}
				}
			}
			modelAndView.addObject("msg", "선택한 데이터를 비노출하였습니다.");
			modelAndView.addObject("location", "/admin/review/adReview");			
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
}
