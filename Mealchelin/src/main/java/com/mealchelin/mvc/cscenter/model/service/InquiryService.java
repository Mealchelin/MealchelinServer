package com.mealchelin.mvc.cscenter.model.service;

import java.util.List;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.cscenter.model.vo.Inquiry;
import com.mealchelin.mvc.cscenter.model.vo.Support;
import com.mealchelin.mvc.member.model.vo.Member;

public interface InquiryService {

	int getInquiryCount(Inquiry inquiry);

	List<Support> getInquiryList(Inquiry inquiry, PageInfo pageInfo);

	Inquiry getInquiryByNo(int no);

	int inquirySave(Inquiry inquiry);

	int getadInquiryCount();

	List<Inquiry> getadInquiryList(PageInfo pageInfo);

}
