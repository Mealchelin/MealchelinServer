package com.mealchelin.mvc.cscenter.model.service;

import java.util.List;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.cscenter.model.vo.Support;

public interface SupportService {

	int getNoticeCount();

	List<Support> getNoticeList(PageInfo pageInfo);
<<<<<<< HEAD

=======
<<<<<<< HEAD
>>>>>>> parent of ff83659 (성연 240304)

	int getFaqCount();

	List<Support> getFaqList(PageInfo pageInfo);

	Support getNoticeByNo(int no);

	int getadNoticeCount();

	List<Support> getadNoticeList(PageInfo pageInfo);
<<<<<<< HEAD

=======
=======
>>>>>>> origin/feature/pay_sy
>>>>>>> parent of ff83659 (성연 240304)
	
}
