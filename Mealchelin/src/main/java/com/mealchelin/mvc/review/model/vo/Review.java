package com.mealchelin.mvc.review.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Review {
	    private int reviewNo; // 리뷰 번호
	    
	    private Double rated; // 별점
	    
	    private String name; // 리뷰 제목
	    
	    private String content; // 리뷰 내용
	    
	    private String image; // 첨부 이미지
	    
	    private Date rgstrDate; // 등록 날짜
	    
	    private Long views; // 조회수
	    
	    private String status; // 상태 (Y/N)
	    
	    private int userNo; // 회원 번호
	    
	    private Long prdNo; // 상품 번호

	}

