package com.mealchelin.mvc.review.model.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mealchelin.mvc.review.model.mapper.ReviewMapper;
import com.mealchelin.mvc.review.model.vo.Review;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {
	private final ReviewMapper mapper;
	
	@Override
	@Transactional
	public int save(Review review) {
		int result = 0;
		
		result = mapper.insertReview(review);
		
		return result;
	}

}
