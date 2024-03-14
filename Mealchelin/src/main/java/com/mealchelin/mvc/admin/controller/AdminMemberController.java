package com.mealchelin.mvc.admin.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	public ModelAndView adMember(ModelAndView modelAndView, 
								 @RequestParam(defaultValue = "1") int page,
								 @RequestParam(defaultValue="", name = "ad_memberSearch") String name
								 ) {
		int listCount = 0;
		PageInfo pageInfo = null;
		List<Member> list = null;
		
		listCount = memberService.getMemberCount(name);
		pageInfo = new PageInfo(page, 10, listCount, 10);
		list = memberService.getMemberList(pageInfo, name);
		
		log.info("List : {}", list);
		log.info("#############ListCount : {}", listCount);
		
		
		modelAndView.addObject("list",list);
		modelAndView.addObject("pageInfo",pageInfo);
		modelAndView.setViewName("admin/member/adMember");
		
		return modelAndView;
	}
	
	@GetMapping("/edit")
	public ModelAndView adMemberEdit(ModelAndView modelAndView,
			 						 @RequestParam int no) {
		
		Member member = memberService.getAdminMemberByNo(no);
		
		System.out.println(member);
		
		modelAndView.addObject("member", member);
		modelAndView.setViewName("admin/member/edit");
		
		return modelAndView;
	}
	
	@PostMapping("/edit")
	public ModelAndView adMemberEdit(ModelAndView modelAndView,
								     @RequestParam("memberNo") int memberNo,
									 @RequestParam("adMemEmail") String email, 
									 @RequestParam("adMemPh") String phone, 
									 @RequestParam("adMemAd") String postalCode, 
									 @RequestParam("adMemAd") String address, 
									 @RequestParam("adMemDetailAd") String addressDetail,
									 @RequestParam("adRandomPw") String password
																			) {
		int result = 0;
		
		Member member = null;
		
		member = memberService.getAdminMemberByNo(memberNo);
		
		if(member != null) {
			
			member.setEmail(email);
			member.setPhone(phone);
			member.setPostalCode(postalCode);
			member.setAddress(address);
			member.setAddressDetail(addressDetail);
			member.setPassword(password);
			
			result = memberService.adminMemberUpdate(member);
			
			if(result > 0 ) {
				modelAndView.addObject("msg", "정보 수정이 완료되었습니다.");
				modelAndView.addObject("location", "/admin/member/adMember");	
			} else {
				modelAndView.addObject("msg", "정보 수정이 실패되었습니다.");
				modelAndView.addObject("location", "/admin/member/edit?no="+member.getMemberNo());	
			}
		
		} else {
			modelAndView.addObject("msg", "잘못된 접근입니다.");
			modelAndView.addObject("location", "/admin/member/edit?no="+member.getMemberNo());
		}
			
			modelAndView.setViewName("common/msg");
		
		return modelAndView;
		
	}
	
	
	
	
	
}
