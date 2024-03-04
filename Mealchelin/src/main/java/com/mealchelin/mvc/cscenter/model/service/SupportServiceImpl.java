package com.mealchelin.mvc.cscenter.model.service;


import java.util.List;


import org.apache.ibatis.session.RowBounds;

import org.springframework.stereotype.Service;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.cscenter.model.mapper.SupportMapper;
import com.mealchelin.mvc.cscenter.model.vo.Support;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SupportServiceImpl implements SupportService {
	private final SupportMapper mapper;
	
	@Override
	public int getNoticeCount() {
		return mapper.selectNoticeCount();
	}

	@Override
	public List<Support> getNoticeList(PageInfo pageInfo) {

		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectNoticeAll(rowBounds);
	}

	@Override
	public Support getNoticeByNo(int no) {
		
		return mapper.selectNoticeByNo(no);
	}
	
	@Override
	public int getFaqCount() {
		return mapper.selectFaqCount();
	}

	@Override
	public List<Support> getFaqList(PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectFaqAll(rowBounds);
	}

	@Override
	public int getadNoticeCount() {
		return mapper.selectadNoticeCount();
	}

	@Override
	public List<Support> getadNoticeList(PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectadNoticeAll(rowBounds);
	}


	
}
