package com.mealchelin.mvc.review.model.service;

import java.util.List;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.review.model.vo.Review;

public interface ReviewService {
	
	int save(Review review);

	int getReviewCount();

	List<Review> getReviewList(PageInfo pageInfo);
}
