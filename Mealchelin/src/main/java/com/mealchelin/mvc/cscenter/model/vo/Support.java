package com.mealchelin.mvc.cscenter.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Support {
	private int supportNo;
	
	private String category;
	
	private String name;
	
	private String content;
	
	private Date rgstrDate;
	
	private String status;
	
	private int memberNo;
	
	private String subCategory;
}
