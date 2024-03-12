package com.mealchelin.mvc.review.model.service;

import java.util.List;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.cscenter.model.vo.Support;
import com.mealchelin.mvc.member.model.vo.Member;
import com.mealchelin.mvc.review.model.vo.Review;

public interface ReviewService {
	
	int save(Review review);

	int getReviewCount();
	
	int getAdminReviewCount();

	List<Review> getReviewList(PageInfo pageInfo);
	
	List<Review> getAdminReviewList(PageInfo pageInfo);

	Review getReviewByNo(int reviewNo);

	int getReviewCountByuserNo(int userNo);

	List<Review> getReviewListByuserNo(PageInfo pageInfo, int userNo);

	int delete(int no);

	int updateReview(Review review);

	int updateReviewNoImgChage(Review review);

	int updateStatus(String[] checkedReviewNoList);

	int adSave(Review review);

	List<Review> getReviewListForHome();

}
