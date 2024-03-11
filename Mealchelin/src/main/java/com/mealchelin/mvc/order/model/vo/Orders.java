package com.mealchelin.mvc.order.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Orders {

	// 주문 번호
	private int orderNo;

	// 배송 요청사항
	private String request;

	// 결제수단
	private String paymentMethod;

	// 결제금액
	private int payMent;

	// 배송상태
	private String shipStatus;

	// 주문일
	private Date orderDate;
	
	// 취소 여부
	private String cancleStatus;
	
	// 취소 사유
	private String cancleReason;
	
	// 회원 번호
	private int memberNo;
	
	// 배송지 번호
	private int shipNo;

		
	



}
