package com.mealchelin.mvc.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	
	// 회원 번호
	private int memberNo;
	
	// 회원 아이디
	private String id;
	
	// 회원 비밀번호
	private String password;
	
	// 회원 이름
	private String name;
	
	// 회원 전화번호
	private String phone;
	
	// 회원 이메일
	private String email;
	
	// 회원 우편번호
	private String postalCode;
	
	// 회원 주소
	private String address;
	
	// 회원 상세주소
	private String addressDetail;
	
	// 회원 생년월일
	private String birth;
	
	// 회원 가입일자
	private Date enrollDate;
	
	// 회원 형태(괸리자 여부)
	private String role;
	
	// 회원 상태 (탈퇴 여부)
	private String status;



}
