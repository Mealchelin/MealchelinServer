package com.mealchelin.mvc.cscenter.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
<<<<<<< HEAD
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
=======
>>>>>>> origin/feature/pay_sy

import com.mealchelin.mvc.cscenter.model.vo.Support;


@Mapper
public interface SupportMapper {
	int selectNoticeCount();
	
<<<<<<< HEAD
	List<Support> selectNoticeAll(RowBounds rowBounds);
	
	int selectFaqCount();
	
	List<Support> selectFaqAll(RowBounds rowBounds);

	Support selectNoticeByNo(@Param("supportNo") int no);

	int selectadNoticeCount();

	List<Support> selectadNoticeAll(RowBounds rowBounds);
=======
	List<Support> selectNoticeAll();
>>>>>>> origin/feature/pay_sy
}
