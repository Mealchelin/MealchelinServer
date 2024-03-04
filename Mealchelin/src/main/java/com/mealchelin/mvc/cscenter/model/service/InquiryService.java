package com.mealchelin.mvc.cscenter.model.service;

import java.util.List;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.cscenter.model.vo.Support;
import com.mealchelin.mvc.member.model.vo.Member;

public interface InquiryService {

	int getInquiryCount(Member loginMember);

	List<Support> getInquiryList(Member loginMember, PageInfo pageInfo);

}
