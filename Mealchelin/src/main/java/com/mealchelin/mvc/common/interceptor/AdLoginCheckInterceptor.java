package com.mealchelin.mvc.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AdLoginCheckInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 컨트롤러가 실행되기 전에 필요한 작업을 할 수 있는 메소드
		// 반환값이 false일 경우 컨트롤러를 실행하지 않는다.
		
		log.info("preHandle() 호출");
//		log.info(service.toString());
		
		Member loginMember = 
				(Member) request.getSession().getAttribute("loginMember");
		
		String adYN = "ROLE_ADMIN";
		
		if (loginMember == null || !loginMember.getRole().equals(adYN)) {
			request.setAttribute("msg", "관리자 로그인 후 이용이 가능합니다.");
			request.setAttribute("location", "/member/login");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
				.forward(request, response);
			
			return false;
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// 컨트롤러가 실행된 후에 필요한 작업을 할 수 있는 메소드
		
		log.info("postHandle() 호출");
		
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// 컨트롤러의 처리가 끝나고 화면 처리까지 모두 끝나면 실행되는 메소드
		
		log.info("afterCompletion() 호출");
		
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
}
