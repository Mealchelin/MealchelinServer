package com.mealchelin.mvc.cscenter.model.service;

import java.util.List;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.cscenter.model.vo.Support;

public interface SupportService {

	int getNoticeCount();

	List<Support> getNoticeList(PageInfo pageInfo);
	
}
