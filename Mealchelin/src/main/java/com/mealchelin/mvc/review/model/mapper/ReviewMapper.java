package com.mealchelin.mvc.review.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.mealchelin.mvc.member.model.vo.Member;
import com.mealchelin.mvc.review.model.vo.Review;

@Mapper
public interface ReviewMapper {

	int insertReview(Review review);
	
	int getReviewCount();
	
	List<Review> selectAll(RowBounds rowBounds);

	Review selectReviewByNo(int reviewNo);

	int getReviewCountByuserNo(int userNo);

	List<Review> selectAllByuserNo(RowBounds rowBounds, int userNo);

	int delete(@Param("reviewNo") int no, @Param("status") String status);

}
