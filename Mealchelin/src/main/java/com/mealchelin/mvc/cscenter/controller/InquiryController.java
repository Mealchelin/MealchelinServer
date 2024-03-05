package com.mealchelin.mvc.cscenter.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.cscenter.model.service.InquiryService;
import com.mealchelin.mvc.cscenter.model.vo.Inquiry;
import com.mealchelin.mvc.cscenter.model.vo.Support;
import com.mealchelin.mvc.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/cscenter")
public class InquiryController {
	private final InquiryService service;
	
	@GetMapping("/inquiry")
	public ModelAndView csinquiry(ModelAndView modelAndView, Inquiry inquiry, @SessionAttribute("loginMember") Member loginMember, @RequestParam(defaultValue = "1") int page) {
		inquiry.setMemberNo(loginMember.getMemberNo());
		
		int listCount = 0;
		PageInfo pageInfo = null;
		List<Support> list = null;
		
		listCount = service.getInquiryCount(inquiry);
		pageInfo = new PageInfo(page, 5, listCount, 10);
		list = service.getInquiryList(inquiry, pageInfo);
		
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("cscenter/inquiry");
		
		return modelAndView;

	}
	
	@GetMapping("/inquiryView")
	public ModelAndView csinquiryView(ModelAndView modelAndView, @SessionAttribute("loginMember") Member loginMember, @RequestParam int no) {
		Inquiry inquiry = null;
		
		inquiry = service.getInquiryByNo(no);
		
		if (inquiry != null && (inquiry.getMemberNo() == loginMember.getMemberNo()) ) {
			modelAndView.addObject("inquiry", inquiry);
			modelAndView.setViewName("cscenter/inquiryView");
		}else {
			modelAndView.addObject("msg", "잘못된 접근입니다.");
			modelAndView.addObject("location", "/cscenter/inquiry");
			modelAndView.setViewName("common/msg");
		}
		
		return modelAndView;
	}
	
	@GetMapping("/inquiryWrite")
	public ModelAndView csinquiryWrite(ModelAndView modelAndView) {
		
		modelAndView.setViewName("cscenter/inquiryWrite");
		
		return modelAndView;
	}
	
	@PostMapping("/inquiryWrite")
	public ModelAndView csinquiryWrite(ModelAndView modelAndView, @SessionAttribute("loginMember") Member loginMember, Inquiry inquiry) {
		int result = 0;
		
		// 작성한 게시글을 데이터베이스에 저장
		inquiry.setMemberNo(loginMember.getMemberNo());
				
		result = service.inquirySave(inquiry);
				
		if (result > 0) {
			modelAndView.addObject("msg", "게시글 등록 성공");
			modelAndView.addObject("location", "/cscenter/inquiryView?no=" + inquiry.getInquiryNo());
		} else {
			modelAndView.addObject("msg", "게시글 등록 실패");
			modelAndView.addObject("location", "/cscenter/inquiryWrite");	
		}
				
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
}
