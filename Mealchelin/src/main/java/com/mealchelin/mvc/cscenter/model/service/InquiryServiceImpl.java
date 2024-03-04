package com.mealchelin.mvc.cscenter.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.cscenter.model.mapper.InquiryMapper;
import com.mealchelin.mvc.cscenter.model.mapper.SupportMapper;
import com.mealchelin.mvc.cscenter.model.vo.Support;
import com.mealchelin.mvc.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class InquiryServiceImpl implements InquiryService {
	private final InquiryMapper mapper;
	
	@Override
	public int getInquiryCount(Member loginMember) {
		return mapper.selectInquiryCount(loginMember);
	}

	@Override
	public List<Support> getInquiryList(Member loginMember, PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectInquiryAll(loginMember, rowBounds);
	}

}
