package com.mealchelin.mvc.product.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
	private int no;
	
	private String name;
	
	private String category;
	
	private int price;
	
	private String description;
	
	private String image;
	
	private String brand;
	
	private String sale;
	
	private int stock;
	
	private Date rgstrDate;
	
	private int totalSales; 
	
	private int views;
	
	private int rating;
	
	private String status;
	
	private String weight;
	

}
