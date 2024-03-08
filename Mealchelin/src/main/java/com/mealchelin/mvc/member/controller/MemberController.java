package com.mealchelin.mvc.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.member.model.service.MemberService;
import com.mealchelin.mvc.member.model.vo.Member;
import com.mealchelin.mvc.pay.model.vo.Payment;
import com.mealchelin.mvc.shippingLocation.model.service.ShippingLocationService;
import com.mealchelin.mvc.shippingLocation.model.vo.ShippingLocation;
import com.mealchelin.mvc.shoppingBasket.model.service.ShoppingBasketService;
import com.mealchelin.mvc.shoppingBasket.model.vo.ShoppingBasket;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@SessionAttributes("loginMember")
public class MemberController {
	
	private final MemberService service;
	
	private final ShoppingBasketService shoppingBasketService;
	
	private final ShippingLocationService shippingLocationService;
	
	private final BCryptPasswordEncoder encoder;
	
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
			String adminYN = loginMember.getRole();
	        log.info(adminYN);
			modelAndView.addObject("loginMember",loginMember);
			modelAndView.addObject("adminYN",adminYN);
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
	public ModelAndView logout(ModelAndView modelAndView,SessionStatus status) {
		
		// 세션 영역으로 확장된 Attribute를 지워준다.
		status.setComplete();
		
		modelAndView.addObject("msg", "로그아웃이 완료되었습니다. ");
		modelAndView.addObject("location", "/");
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	@GetMapping("/member/enroll")
	public String enroll() {
		
		return "/member/enroll";
				
	}
	
	
	//회원가입
	@PostMapping("/member/enroll")
	public ModelAndView enroll(ModelAndView modelAndView,
							   Member member,
							   ShoppingBasket shoppingBasket,
							   ShippingLocation shippingLocation) {
		
		int result = service.save(member);
		int sbresult = 0;
		int slresult = 0; 
			
		
		if(result > 0) {
			
			modelAndView.setViewName("member/enrollEnd");
				
			// 회원 가입 후 장바구니 만들기
			shoppingBasket.setMemberNo(member.getMemberNo());
			
			sbresult = shoppingBasketService.save(shoppingBasket);
			
			// 회원 가입 후 배송지 관리 만들기
			shippingLocation.setMemberNo(member.getMemberNo());			
			shippingLocation.setShipName(member.getName());
			shippingLocation.setRecipient(member.getName());
			shippingLocation.setPhone(member.getPhone());
			shippingLocation.setPostalCode(member.getPostalCode());
			shippingLocation.setShipAddress(member.getAddress());
			shippingLocation.setShipAddressDetail(member.getAddressDetail());
			
			slresult = shippingLocationService.save(shippingLocation);
			
		} else {
			modelAndView.addObject("msg", "회원 가입에 실패했습니다.");
			modelAndView.addObject("location", "/member/enroll");
			modelAndView.setViewName("common/msg");
		}
		
		
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
	

	// 마이페이지 정보수정 첫번째 화면 (비밀번호 비교)
	@GetMapping("/mypage/updateMember")
	public String updateMember() {

		return "mypage/updateMember";
		
	}
	
	@PostMapping("/mypage/updateMember")
	public ModelAndView updateMember(ModelAndView modelAndView,
			 						 @RequestParam("mymemberId") String id,   
			 						 @RequestParam("mymemberPwd") String password,
			 						 @SessionAttribute("loginMember") Member loginMember) {
	
		loginMember = service.updateBefore(id,password);
		
		if(loginMember != null) {
			modelAndView.addObject("loginMember", loginMember); 
			modelAndView.setViewName("redirect:/mypage/updateMember2"); 
		} else {
			modelAndView.addObject("msg", "비밀번호가 일치하지 않습니다.");
			modelAndView.addObject("location", "/mypage/updateMember");
			modelAndView.setViewName("common/msg");
		}
		
		  return modelAndView;
		
	}
	
	
	// 마이페이지 정보수정 두번째 화면 
	@GetMapping("/mypage/updateMember2")
	public String updateMember2() {
		
		return "mypage/updateMember2";
		
	}
	
	@PostMapping("/mypage/updateMember2")
	public ModelAndView updateMember2(ModelAndView modelAndView,
									  Member member, 
									  @SessionAttribute("loginMember") Member loginMember,
									  @RequestParam("myMemberName") String name,
									  @RequestParam("myMemberPwd") String password,
									  @RequestParam("myMemberPhone") String phone,
									  @RequestParam("myMemberEmail") String email,
									  @RequestParam("myMemberAdress") String postalCode,
									  @RequestParam("myMemberAdress2") String address,
									  @RequestParam("myMemberAdress3") String addressDetail,
									  @RequestParam("myMemberBdate") String birth) {
		int result = 0;
		
		member.setMemberNo(loginMember.getMemberNo());
		
		member.setName(name);
		member.setPassword(encoder.encode(password));
		member.setPhone(phone);
		member.setEmail(email);
		member.setPostalCode(postalCode);
		member.setAddress(address);
		member.setAddressDetail(addressDetail);
		member.setBirth(birth);
		
		result = service.save(member);
		
		if(result > 0) {
			// 회원 정보 수정 완료
			modelAndView.addObject("loginMember", service.findMemberById(loginMember.getId()));
			modelAndView.addObject("msg", "회원 정보 수정이 완료되었습니다.");
		} else {
			// 회원 정보 수정 실패 
			modelAndView.addObject("msg"," 회원 정보 수정이 실패되었습니다.");		
		}
		
		modelAndView.addObject("location","/mypage/updateMember");
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	@GetMapping("/member/enrollEnd")
	public String enrollEnd() {
		
		return "member/enrollEnd";
	}
	
	
	// 회원 탈퇴 ( 회원 상태 바꾸기 )
	@GetMapping("/member/delete")
	public ModelAndView delete(ModelAndView modelAndView,
							   @SessionAttribute("loginMember") Member loginMember) {
		int result = 0;
		
		
		result = service.dalete(loginMember.getMemberNo());
		
		if (result > 0) {
			modelAndView.addObject("msg", "탈퇴가 정상적으로 처리되었습니다.");
			modelAndView.addObject("location", "/");			
		} else {
			modelAndView.addObject("msg", "탈퇴가 정상적으로 처리되지 않았습니다.");
			modelAndView.addObject("location", "/mypage/updateMember");
		}
		
		modelAndView.setViewName("common/msg");

		return modelAndView;
	}

}
