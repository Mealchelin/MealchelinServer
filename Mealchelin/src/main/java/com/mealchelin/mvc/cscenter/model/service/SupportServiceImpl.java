package com.mealchelin.mvc.cscenter.model.service;


import java.util.List;

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
		return mapper.selectNoticeAll();
	}
	
}
