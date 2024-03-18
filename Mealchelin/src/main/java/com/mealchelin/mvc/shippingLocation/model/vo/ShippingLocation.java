package com.mealchelin.mvc.shippingLocation.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShippingLocation {

	//배송지 번호
	private int shipNo;
	
	//배송지명 
	private String shipName;
	
	//수취인명 
	private String recipient;
	
	//전화번호 
	private String phone;
	
	//우편번호 
	private String postalCode;
	
	//배송지 주소 
	private String shipAddress;
	
	//세부주소 
	private String shipAddressDetail;
	
	//도서산간 지역여부(Y/N)
	private String mountain;
	
	//배송비 
	private int price;
	
	//기본 배송지 유무(Y/N)
	private String defaultCheck;
	
	//상태(Y/N)
	private String status;
	
	//회원 번호 
	private int memberNo;
	
	
	
	
}