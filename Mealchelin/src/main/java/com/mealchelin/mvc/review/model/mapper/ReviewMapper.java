package com.mealchelin.mvc.review.model.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.mealchelin.mvc.review.model.vo.Review;

@Mapper
public interface ReviewMapper {

	int insertReview(Review review);

}
