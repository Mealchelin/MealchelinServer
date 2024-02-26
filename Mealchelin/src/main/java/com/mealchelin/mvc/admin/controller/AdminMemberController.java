package com.mealchelin.mvc.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {
	@GetMapping("/adMember")
	public ModelAndView adMember(ModelAndView modelAndView) {
		
		modelAndView.setViewName("admin/member/adMember");
		
		return modelAndView;
	}
	
	@GetMapping("/edit")
	public ModelAndView adMemberEdit(ModelAndView modelAndView) {
		
		modelAndView.setViewName("admin/member/edit");
		
		return modelAndView;
	}
}
