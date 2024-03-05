package com.mealchelin.mvc.admin.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.cscenter.controller.SupportController;
import com.mealchelin.mvc.cscenter.model.vo.Inquiry;
import com.mealchelin.mvc.cscenter.model.vo.Support;
import com.mealchelin.mvc.cscenter.model.service.InquiryService;
import com.mealchelin.mvc.cscenter.model.service.SupportService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/post")
public class AdminPostController {
	private final SupportService serviceS;
	private final InquiryService serviceI;
	
	@GetMapping("/adPost")
	public ModelAndView adPost(ModelAndView modelAndView) {
		
		modelAndView.setViewName("admin/post/adPost");
		
		return modelAndView;
	}
	
	@GetMapping("/ad1by1")
	public ModelAndView ad1by1(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page) {
		int listCount = 0;
		PageInfo pageInfo = null;
		List<Inquiry> list = null;
		
		listCount = serviceI.getadInquiryCount();
		pageInfo = new PageInfo(page, 5, listCount, 10);
		list = serviceI.getadInquiryList(pageInfo);
		
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("admin/post/ad1by1");
		
		return modelAndView;
	}
	
	@GetMapping("/ad1by1Detail")
	public ModelAndView ad1by1Detail(ModelAndView modelAndView, @RequestParam int no) {
		Inquiry inquiry = null;
		
		inquiry = serviceI.getInquiryByNo(no);
		
		modelAndView.addObject("inquiry", inquiry);
		modelAndView.setViewName("admin/post/ad1by1Detail");
		
		return modelAndView;
	}
	
	@GetMapping("/adQnA")
	public ModelAndView adQnA(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page) {
		int listCount = 0;
		PageInfo pageInfo = null;
		List<Support> list = null;
		
		listCount = serviceS.getadFaqCount();
		pageInfo = new PageInfo(page, 5, listCount, 10);
		list = serviceS.getadFaqList(pageInfo);
		
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("admin/post/adQnA");
		
		return modelAndView;
	}
	
	@GetMapping("/adQnADetail")
	public ModelAndView adQnADetail(ModelAndView modelAndView, @RequestParam int no) {
		Support support = null;
		
		log.info("view() 호출 - {}", no);
		
		support = serviceS.getFaqByNo(no);
		
		modelAndView.addObject("support", support);
		modelAndView.setViewName("admin/post/adQnADetail");
		
		return modelAndView;
	}
	
	@GetMapping("/adNotice")
	public ModelAndView adNotice(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page) {
		int listCount = 0;
		PageInfo pageInfo = null;
		List<Support> list = null;
		
		listCount = serviceS.getadNoticeCount();
		pageInfo = new PageInfo(page, 5, listCount, 10);
		list = serviceS.getadNoticeList(pageInfo);
		
//		log.info("Page Number: {}", page);
//		log.info("List Count : {}", listCount);
		
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("admin/post/adNotice");
		
		return modelAndView;
	}
	
	@GetMapping("/adNoticeDetail")
	public ModelAndView adNoticeDetail(ModelAndView modelAndView, @RequestParam int no) {
		Support support = null;
		
		log.info("view() 호출 - {}", no);
		
		support = serviceS.getNoticeByNo(no);
		
		modelAndView.addObject("support", support);
		modelAndView.setViewName("admin/post/adNoticeDetail");
		
		return modelAndView;
	}
	
	@GetMapping("/write")
	public ModelAndView adPostWrite(ModelAndView modelAndView) {
		
		modelAndView.setViewName("admin/post/write");
		
		return modelAndView;
	}
	
	@GetMapping("/edit")
	public ModelAndView adPostEdit(ModelAndView modelAndView) {
		
		modelAndView.setViewName("admin/post/edit");
		
		return modelAndView;
	}
}
