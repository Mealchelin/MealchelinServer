package com.mealchelin.mvc.review.model.service;

import java.util.List;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.cscenter.model.vo.Support;
import com.mealchelin.mvc.member.model.vo.Member;
import com.mealchelin.mvc.review.model.vo.MemberProdutOrderList;
import com.mealchelin.mvc.review.model.vo.Review;

public interface ReviewService {
	
	int save(Review review);

	
	int getReviewCount(String category, String text);
	
	int getAdminReviewCount();

	List<Review> getReviewList(PageInfo pageInfo, String category, String text);
	
	List<Review> getAdminReviewList(PageInfo pageInfo);

	Review getReviewByNo(int reviewNo);
	
	MemberProdutOrderList getOrderInfo(int memberNo, int orderNo, int prdNo);

	int getReviewCountByuserNo(int userNo);

	List<Review> getReviewListByuserNo(PageInfo pageInfo, int userNo);

	int delete(int no);

	int updateReview(Review review);

	int updateReviewNoImgChage(Review review);

	int updateStatus(String[] checkedReviewNoList);

	int adSave(Review review);

	List<Review> getReviewListForHome();

	int updateStatusAdmin(int reviewNo, String rstatus);

	int getOrderListCountByUserNo(int userNo);

	List<MemberProdutOrderList> getOrderListByUserNo(PageInfo pageInfo, int userNo);

	

}
