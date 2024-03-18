package com.mealchelin.mvc.cscenter.model.service;

import java.util.List;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.cscenter.model.vo.Support;

public interface SupportService {

	int getNoticeCount();

	List<Support> getNoticeList(PageInfo pageInfo);

	int getFaqCount();

	List<Support> getFaqList(PageInfo pageInfo);

	Support getNoticeByNo(int no);

	int getadNoticeCount();

	List<Support> getadNoticeList(PageInfo pageInfo);

	int getadFaqCount();

	List<Support> getadFaqList(PageInfo pageInfo);
	
	Support getFaqByNo(int no);

	int adSave(Support support);

	Support getSupportByNo(int no);

	int deleteSupport(int no);

}
