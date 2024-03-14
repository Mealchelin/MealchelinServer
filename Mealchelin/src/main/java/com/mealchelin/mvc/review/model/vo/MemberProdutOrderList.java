package com.mealchelin.mvc.review.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberProdutOrderList {
	private int memberNo; // 회원번호
    
    private String memberId; // 회원 아이디
    
    private String productName; // 상품 이름
    
    private int orderNo; // 주문번호
    
    private Date orderDate; // 주문날짜
    
    private int prdNo; // 상품번호
    
    private String image; // 상품이미지
}
