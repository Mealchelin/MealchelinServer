package com.mealchelin.mvc.admin.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.member.model.service.MemberService;
import com.mealchelin.mvc.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/member")
public class AdminMemberController {
	
	private final MemberService memberService;
	
	@GetMapping("/adMember")
	public ModelAndView adMember(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page) {
		int listCount = 0;
		PageInfo pageInfo = null;
		List<Member> list = null;
		
		listCount = memberService.getMemberCount();
		pageInfo = new PageInfo(page, 10, listCount, 10);
		list = memberService.getMemberList(pageInfo);
		
		log.info("List : {}", list);
		log.info("#############ListCount : {}", listCount);
		
		
		modelAndView.addObject("list",list);
		modelAndView.addObject("pageInfo",pageInfo);
		modelAndView.setViewName("admin/member/adMember");
		
		return modelAndView;
	}
	
	@GetMapping("/edit")
	public ModelAndView adMemberEdit(ModelAndView modelAndView) {
		
		modelAndView.setViewName("admin/member/edit");
		
		return modelAndView;
	}
}
