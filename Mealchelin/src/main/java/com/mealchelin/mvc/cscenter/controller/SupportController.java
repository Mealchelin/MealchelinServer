package com.mealchelin.mvc.cscenter.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	
	@RequestMapping(value="/ckImgSubmit.do") 
	public void ckSubmit(@RequestParam(value="uid") String uid 
			, @RequestParam(value="fileName") String fileName
			, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{ 
		
		//서버에 저장된 이미지 경로 
		String real = session.getServletContext().getRealPath("/resources/img/support");
		String sDirPath = real+ "/" + uid + "_" + fileName; 
		File imgFile = new File(sDirPath); 
		
		//사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다. 
		if(imgFile.isFile()){ byte[] buf = new byte[1024]; 
		int readByte = 0; 
		int length = 0; 
		byte[] imgBuf = null; 
		
		FileInputStream fileInputStream = null; 
		ByteArrayOutputStream outputStream = null; 
		ServletOutputStream out = null; 
		
		try{ 
			fileInputStream = new FileInputStream(imgFile); 
			outputStream = new ByteArrayOutputStream(); 
			out = response.getOutputStream(); 
			
			while((readByte = fileInputStream.read(buf)) != -1){ 
				outputStream.write(buf, 0, readByte); 
				} 
			
			imgBuf = outputStream.toByteArray(); 
			length = imgBuf.length; 
			out.write(imgBuf, 0, length); 
			out.flush(); 
			
		}catch(IOException e){ 
			e.getMessage();
		}finally { 
			outputStream.close();
			fileInputStream.close();
			out.close();
			} 
		} 
	}
}
