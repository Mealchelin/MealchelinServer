package com.mealchelin.mvc.shoppingBasket.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ShoppingBasketProduct {
	
	//상품번호
	private int prdNo;
	
	//회원번호 
	private int memberNo;
	
	//상품명
	private String name;
	
	//상품가격
	private int price;
	
	//상품이미지
	private String image;
	
	//상품브랜드 
	private String brand;
	
	//상품수량 
	private int quantity;
	
	//상품 총금액
	private int totalPrice;
	
	
	
}
