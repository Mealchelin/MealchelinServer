package com.mealchelin.mvc.cscenter.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Inquiry {
	private int inquiryNo;
	
	private String name;
	
	private String inquiryContent;
	
	private Date rgstrDate;
	
	private String answerContent;
	
	private int memberNo;
}
