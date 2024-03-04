package com.mealchelin.mvc.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.member.model.service.MemberService;
import com.mealchelin.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMember")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@GetMapping("/member/login")
	public String login() {
		
		return "/member/login";
	}
	
	
	// 로그인
	@PostMapping("/member/login")
	public ModelAndView login(ModelAndView modelAndView,
							  @RequestParam("userId") String id,
							  @RequestParam("userPwd") String password) {
		
		log.info("login() 호출 - {}, {}", id, password);
		
		Member loginMember = service.login(id,password);
		
		if (loginMember != null) {
			modelAndView.addObject("loginMember",loginMember);
			modelAndView.setViewName("redirect:/");	
		} else {
			modelAndView.addObject("msg", "아이디나 비밀번호가 일치하지 않습니다.");
			modelAndView.addObject("location", "/member/login");
			modelAndView.setViewName("common/msg");
		}
		
		return modelAndView;
	}
	
	
	//로그아웃
	@GetMapping("/member/logout")
	public String logout(SessionStatus status) {
		
		// 세션 영역으로 확장된 Attribute를 지워준다.
		status.setComplete();
		
		return "redirect:/";
	}
	
	@GetMapping("/member/enroll")
	public String enroll() {
		
		return "/member/enroll";
				
	}
	
	
	//회원가입
	@PostMapping("/member/enroll")
	public ModelAndView enroll(ModelAndView modelAndView,
							   Member member) {
		
		int result = service.save(member);
		
		if(result > 0) {
			modelAndView.addObject("msg", "회원 가입 성공");
			modelAndView.addObject("location", "/");
		} else {
			modelAndView.addObject("msg", "회원 가입 실패");
			modelAndView.addObject("location", "/member/enroll");
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	
	
	// 아이디 중복체크 
	@GetMapping("/member/idCheck")
	public ResponseEntity< Map<String, Boolean>> idCheck(@RequestParam("userId") String userId) {
		Map<String, Boolean> map = new HashMap<>();
		
		log.info("UserId : {}", userId);
		
		map.put("duplicate", service.isDuplicateId(userId));
		
		
	      return ResponseEntity.ok()
	    		 .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE).body(map);
	}
	

	@GetMapping("/mypage/updateMember")
	public String updateMember() {
		
		return "mypage/updateMember";
		
	}
	
	
	@PostMapping("/mypage/updateMember")
	public ResponseEntity< Map<String, Boolean>> updateMember(@RequestParam("userPwd") String userPwd) {
		Map<String, Boolean> map = new HashMap<>();
		
		map.put("duplicate", service.isDuplicatePwd(userPwd));
		
		  return ResponseEntity.ok()
				 .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE).body(map);
		
	}
	
	@GetMapping("/mypage/updateMember2")
	public ModelAndView updateMember2(ModelAndView modelAndView) {
		
		modelAndView.setViewName("mypage/updateMember2");
		
		return modelAndView;
		
	}
}
