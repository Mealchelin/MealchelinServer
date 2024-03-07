package com.mealchelin.mvc.review.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.member.model.vo.Member;
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

	@Override
	public int getReviewCount() {
		
		
		return mapper.getReviewCount();
	}

	@Override
	public List<Review> getReviewList(PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		return mapper.selectAll(rowBounds);
	}

	@Override
	public Review getReviewByNo(int reviewNo) {
		
		
		return mapper.selectReviewByNo(reviewNo);
	}

	@Override
	public int getReviewCountByuserNo(int userNo) {
		
		
		return mapper.getReviewCountByuserNo(userNo);
	}

	@Override
	public List<Review> getReviewListByuserNo(PageInfo pageInfo, int userNo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		return mapper.selectAllByuserNo(rowBounds, userNo);
	}

	@Override
	public int delete(int no) {
		
		return mapper.delete(no, "N");
	}

}
