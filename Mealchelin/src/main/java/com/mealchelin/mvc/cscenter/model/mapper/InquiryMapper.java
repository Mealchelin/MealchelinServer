package com.mealchelin.mvc.cscenter.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.mealchelin.mvc.cscenter.model.vo.Inquiry;
import com.mealchelin.mvc.cscenter.model.vo.Support;
import com.mealchelin.mvc.member.model.vo.Member;

@Mapper
public interface InquiryMapper {

	int selectInquiryCount(Inquiry inquiry);

	List<Support> selectInquiryAll(Inquiry inquiry, RowBounds rowBounds);

	Inquiry selectInquiryByNo(@Param("inquiryNo") int no);

	int insertInquiry(Inquiry inquiry);

	List<Inquiry> selectadInquiryAll(RowBounds rowBounds);

	int selectadInquiryCount();

}