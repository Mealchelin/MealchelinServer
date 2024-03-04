package com.mealchelin.mvc.cscenter.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.cscenter.model.service.SupportService;
import com.mealchelin.mvc.cscenter.model.vo.Support;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/cscenter")
public class SupportController {
	private final SupportService service;
	
	@GetMapping("/faq")
	public ModelAndView csFaq(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page) {

		int listCount = 0;
		PageInfo pageInfo = null;
		List<Support> list = null;
		
		listCount = service.getFaqCount();
		pageInfo = new PageInfo(page, 5, listCount, 10);
		list = service.getFaqList(pageInfo);
		
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("list", list);

		modelAndView.setViewName("cscenter/faq");
		
		return modelAndView;
	}
	
	@GetMapping("/notice")
	public ModelAndView csNotice(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page) {
		int listCount = 0;
		PageInfo pageInfo = null;
		List<Support> list = null;
		
		listCount = service.getNoticeCount();
		pageInfo = new PageInfo(page, 5, listCount, 10);
		list = service.getNoticeList(pageInfo);
		
//		log.info("Page Number: {}", page);
//		log.info("List Count : {}", listCount);
		
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("cscenter/notice");
		
		return modelAndView;
	}
	
	@GetMapping("/noticeView")

	public ModelAndView csNoticeView(ModelAndView modelAndView, @RequestParam int no) {
		Support support = null;
		
		log.info("view() 호출 - {}", no);
		
		support = service.getNoticeByNo(no);
		
		modelAndView.addObject("support", support);

		modelAndView.setViewName("cscenter/noticeView");
		
		return modelAndView;
	}
}
