package com.mealchelin.mvc.review.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.cscenter.model.vo.Support;
import com.mealchelin.mvc.member.model.vo.Member;
import com.mealchelin.mvc.review.model.vo.MemberProdutOrderList;
import com.mealchelin.mvc.review.model.vo.Review;

@Mapper
public interface ReviewMapper {

	int insertReview(Review review);
	// 검색 
	int getReviewCount(String category, String title);
	
	int getAdminReviewCount();
	
	List<Review> adminSelectAll(RowBounds rowBounds);
	
	// 검색
	List<Review> selectAll(RowBounds rowBounds, String category, String title);

	Review selectReviewByNo(int reviewNo);
	
	MemberProdutOrderList getOrderInfo(int orderNo);

	int getReviewCountByuserNo(int userNo);
	
	int getOrderListCountByUserNo(int userNo);

	List<Review> selectAllByuserNo(RowBounds rowBounds, int userNo);
	
	List<MemberProdutOrderList> getOrderListByUserNo(RowBounds rowBounds, int userNo);

	int delete(@Param("reviewNo") int no, @Param("rstatus") String status);

	int updateReview(Review review);

	int updateReviewNoImgChage(Review review);

	int updateStatus(String[] checkedReviewNoList);

	int insertAdReview(Review review);

	int updateAdReview(Review review);

	List<Review> getReviewListForHome();

	int updateStatusAdmin(@Param("reviewNo") int reviewNo, @Param("rstatus") String rstatus);

	

	


	
}
