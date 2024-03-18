package com.mealchelin.mvc.review.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.common.util.MultipartFileUtil;
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
	
	private final ResourceLoader resourceLoader;
	
//	리뷰 등록하는 코드
	@PostMapping("/reviewAddComplete")
	public ModelAndView reviewWrite(ModelAndView modelAndView, Review review, @SessionAttribute("loginMember") Member loginMember, @RequestParam("upfile") MultipartFile upfile
			,@RequestParam("orderNo") int orderNo) {
		int result = 0;
		int hasReview = 0;
		
		if (upfile != null && !upfile.isEmpty()) {
			String location = null;
			String renamedFileName = null;

			try {
				location = resourceLoader.getResource("resources/img/review").getFile().getPath();

				renamedFileName = MultipartFileUtil.save(upfile, location);

				if (renamedFileName != null) {
					review.setOriginalFilename(upfile.getOriginalFilename());
					review.setRenamedFilename(renamedFileName);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		review.setUserNo(loginMember.getMemberNo());
		result = service.save(review);
		
		// 리뷰 등록시 작성 가능한 리뷰에서 보이지 않게 만드는 코드
		hasReview = service.hasReview(orderNo);
		
		if (result > 0) {
			modelAndView.addObject("msg", "게시글 등록 성공");
			modelAndView.addObject("location", "/review/reviewAddComplete");
		} else {
			modelAndView.addObject("msg", "게시글 등록 실패");
			modelAndView.addObject("location", "mypage/writableReview");
		}

		modelAndView.setViewName("common/msg");
		
		return modelAndView;
    }
	
	@PostMapping("/reviewEditComplete")
	public ModelAndView reviewEditComplete(ModelAndView modelAndView, Review review, @SessionAttribute("loginMember") Member loginMember, @RequestParam("upfile") MultipartFile upfile) {
		int result = 0;
		
		if (upfile != null && !upfile.isEmpty()) {
			String location = null;
			String renamedFileName = null;

			try {
				location = resourceLoader.getResource("resources/img/review").getFile().getPath();

				renamedFileName = MultipartFileUtil.save(upfile, location);

				if (renamedFileName != null) {
					review.setOriginalFilename(upfile.getOriginalFilename());
					review.setRenamedFilename(renamedFileName);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		review.setUserNo(loginMember.getMemberNo());
		result = service.updateReview(review);
		
		if (result > 0) {
			modelAndView.addObject("msg", "게시글 수정 성공");
			modelAndView.addObject("location", "/review/reviewEditComplete");
		} else {
			modelAndView.addObject("msg", "게시글 수정 실패");
			modelAndView.addObject("location", "mypage/writableReview");
		}

		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	@GetMapping("reviewEditComplete")
	public String reviewEditComplete() {
		
		return "/review/reviewEditComplete";
	}
	
	@GetMapping("reviewAddComplete")
	public String reviewAddComplete() {
		
		return "/review/reviewAddComplete";
	}
	
	@GetMapping("/main")
	public ModelAndView home(ModelAndView modelAndView, 
							 @RequestParam(defaultValue = "1") int page,
							 @RequestParam(defaultValue = "", name = "searchType") String searchType,
							 @RequestParam(defaultValue = "", name = "searchText") String searchText
							) {
		int reviewCount = 0;
		PageInfo pageInfo = null;
		List<Review> list = null;
		
		System.out.println("캍에고리 : " + searchType);
		System.out.println("텍으트 : " + searchText);
		
		log.info(modelAndView.toString());

		reviewCount = service.getReviewCount(searchType, searchText);
		pageInfo = new PageInfo(page, 5, reviewCount, 12);
		list = service.getReviewList(pageInfo, searchType, searchText);

		
		log.info("page Number : {}", page);
		log.info("List Count : {}", reviewCount);
		log.info("============================");

		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("review/main");
		
		return modelAndView;
	}
	
	@GetMapping("/reviewWrite")
	public ModelAndView reviewWrite(ModelAndView modelAndView, @SessionAttribute("loginMember") Member loginMember, @RequestParam int orderNo, @RequestParam int prdNo) {
		MemberProdutOrderList memberProdutOrderList = null; 
		
		int memberNo = loginMember.getMemberNo();
		
		memberProdutOrderList = service.getOrderInfo(memberNo, orderNo, prdNo);
		
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
	
	
	@GetMapping("/footSearchBox")
	public String footSearchBox() {
		
		
        return "/review/FootSearchBox";
    }

	@GetMapping("/reviewEmpty")
	public String reviewEmpty() {
		
		
        return "/review/reviewEmpty";
    }
	
	
	
	
	
	
	

}








































