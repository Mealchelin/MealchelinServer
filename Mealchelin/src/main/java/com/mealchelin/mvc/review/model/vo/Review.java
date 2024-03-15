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
	    
	    private String image; // 이 필드 지우면 에러 떠서 그냥 보관해야함...ㅠㅠ
	    
	    private String originalFilename; // 첨부 이미지

		private String renamedFilename; // 첨부 이미지
	    
	    private Date rgstrDate; // 등록 날짜
	    
	    private int views; // 조회수
	    
	    private String rstatus; // 상태 (Y/N)
	    
	    private int userNo; // 회원 번호
	    
	    private int prdNo; // 상품 번호
	    
		private String id; // 회원 아이디
		
		private String productName; // 상품 이름
		
		private String productimage; // 상품 이미지
		

	}

