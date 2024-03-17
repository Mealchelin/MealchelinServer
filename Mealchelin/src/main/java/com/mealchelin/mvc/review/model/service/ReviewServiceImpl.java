package com.mealchelin.mvc.review.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.cscenter.model.vo.Support;
import com.mealchelin.mvc.member.model.vo.Member;
import com.mealchelin.mvc.review.model.mapper.ReviewMapper;
import com.mealchelin.mvc.review.model.vo.MemberProdutOrderList;
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

	@Override
	public int getReviewCount(String category, String text) {
		
		
		return mapper.getReviewCount(category, text);
	}
	
	@Override
	public int getAdminReviewCount() {
		
		
		return mapper.getAdminReviewCount();
	}
	
	@Override
	public List<Review> getAdminReviewList(PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		return mapper.adminSelectAll(rowBounds);
	}

	@Override
	public List<Review> getReviewList(PageInfo pageInfo, String category, String text) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		return mapper.selectAll(rowBounds, category, text);
	}

	@Override
	public Review getReviewByNo(int reviewNo) {
		
		
		return mapper.selectReviewByNo(reviewNo);
	}
	
	@Override
	public MemberProdutOrderList getOrderInfo(int memberNo, int orderNo, int prdNo) {
		
		return mapper.getOrderInfo(memberNo, orderNo, prdNo);
	}

	@Override
	public int getReviewCountByuserNo(int userNo) {
		
		
		return mapper.getReviewCountByuserNo(userNo);
	}
	
	@Override
	public int getOrderListCountByUserNo(int userNo) {
		
		return mapper.getOrderListCountByUserNo(userNo);
	}

	@Override
	public List<Review> getReviewListByuserNo(PageInfo pageInfo, int userNo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		return mapper.selectAllByuserNo(rowBounds, userNo);
	}
	
	@Override
	public List<MemberProdutOrderList> getOrderListByUserNo(PageInfo pageInfo, int userNo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.getOrderListByUserNo(rowBounds, userNo);
	}

	
	@Override
	public int delete(int no) {
		
		return mapper.delete(no, "N");
	}

	@Override
	public int updateReview(Review review) {
		
		
		return mapper.updateReview(review);
	}

	@Override
	public int updateReviewNoImgChage(Review review) {
		
		return mapper.updateReviewNoImgChage(review);
	}

	@Override
	public int updateStatus(String[] checkedReviewNoList) {
	    // reviewNoList와 status를 사용하여 DB 업데이트
		return mapper.updateStatus(checkedReviewNoList);
		
	  }

	@Override
	public int adSave(Review review) {
		return mapper.updateAdReview(review);
	}

	@Override
	public List<Review> getReviewListForHome() {
		
		return mapper.getReviewListForHome();
	}

	@Override
	public int updateStatusAdmin(int reviewNo, String rstatus) {
		
		
		return mapper.updateStatusAdmin(reviewNo, rstatus);
	}

	

	

	




	

	

}
