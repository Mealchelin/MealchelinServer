package com.mealchelin.mvc.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/post")
public class AdminPostController {
	@GetMapping("/adPost")
	public ModelAndView adPost(ModelAndView modelAndView) {
		
		modelAndView.setViewName("admin/post/adPost");
		
		return modelAndView;
	}
	
	@GetMapping("/ad1by1")
	public ModelAndView ad1by1(ModelAndView modelAndView) {
		
		modelAndView.setViewName("admin/post/ad1by1");
		
		return modelAndView;
	}
	
	@GetMapping("/ad1by1Detail")
	public ModelAndView ad1by1Detail(ModelAndView modelAndView) {
		
		modelAndView.setViewName("admin/post/ad1by1Detail");
		
		return modelAndView;
	}
	
	@GetMapping("/adQnA")
	public ModelAndView adQnA(ModelAndView modelAndView) {
		
		modelAndView.setViewName("admin/post/adQnA");
		
		return modelAndView;
	}
	
	@GetMapping("/adQnADetail")
	public ModelAndView adQnADetail(ModelAndView modelAndView) {
		
		modelAndView.setViewName("admin/post/adQnADetail");
		
		return modelAndView;
	}
	
	@GetMapping("/adNotice")
	public ModelAndView adNotice(ModelAndView modelAndView) {
		
		modelAndView.setViewName("admin/post/adNotice");
		
		return modelAndView;
	}
	
	@GetMapping("/adNoticeDetail")
	public ModelAndView adNoticeDetail(ModelAndView modelAndView) {
		
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
