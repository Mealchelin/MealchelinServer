package com.mealchelin.mvc.cscenter.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mealchelin.mvc.cscenter.model.vo.Support;


@Mapper
public interface SupportMapper {
	int selectNoticeCount();
	
	List<Support> selectNoticeAll();
}
