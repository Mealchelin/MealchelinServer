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

	// 배송사번호
	private String orderMembers;

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

	// 상품명
	private String name;

	// 상품 번호
	private int prdNo;

	// 브랜드명
	private String brand;

	// 상품이미지
	private String image;

	// 총가격
	private int totalPrice;

	// 상품 개수
	private int countQ;

	// 상품 총합 개수
	private int sumQ;

	// 수취인 명
	private String recipient;

	// 수취인 전화번호
	private String phone;

	// 수취인 우편번호
	private String postalCode;

	// 수취인 배송지
	private String shipAddress;

	// 수취인 세부 배송지
	private String shipAddressDetail;

	// 주문자 성함
	private String mname;

	// 주문자 아이디
	private String memId;

}
