package com.mealchelin.mvc.review.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberDTO {

	private int memberNo; // 리뷰 번호
	
	private int userNo; // 회원 번호
	
	private String id; // 회원 아이디
	
	private int reviewNo; // 리뷰 번호
}
