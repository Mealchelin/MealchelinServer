package com.mealchelin.mvc.cscenter.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.cscenter.model.mapper.InquiryMapper;
import com.mealchelin.mvc.cscenter.model.mapper.SupportMapper;
import com.mealchelin.mvc.cscenter.model.vo.Inquiry;
import com.mealchelin.mvc.cscenter.model.vo.Support;
import com.mealchelin.mvc.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class InquiryServiceImpl implements InquiryService {
	private final InquiryMapper mapper;

	@Override
	public int getInquiryCount(Inquiry inquiry) {
		return mapper.selectInquiryCount(inquiry);
	}

	@Override
	public List<Support> getInquiryList(Inquiry inquiry, PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectInquiryAll(inquiry, rowBounds);
	}

	@Override
	public Inquiry getInquiryByNo(int no) {
		return mapper.selectInquiryByNo(no);
	}

	@Override
	@Transactional
	public int inquirySave(Inquiry inquiry) {
		int result = 0;
		
		result = mapper.insertInquiry(inquiry);
		
		return result;
	}

	@Override
	public List<Inquiry> getadInquiryList(PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectadInquiryAll(rowBounds);
	}
	
	@Override
	public int getadInquiryCount() {
		return mapper.selectadInquiryCount();
	}

	@Override
	public int inquiryadSave(Inquiry inquiry) {
		return mapper.insertadInquiry(inquiry);
	}

}
