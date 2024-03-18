package com.mealchelin.mvc.cscenter.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.cscenter.model.service.InquiryService;
import com.mealchelin.mvc.cscenter.model.vo.Inquiry;
import com.mealchelin.mvc.cscenter.model.vo.Support;
import com.mealchelin.mvc.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/cscenter")
public class InquiryController {
	private final InquiryService service;
	
	@GetMapping("/inquiry")
	public ModelAndView csinquiry(ModelAndView modelAndView, Inquiry inquiry, @SessionAttribute("loginMember") Member loginMember, @RequestParam(defaultValue = "1") int page) {
		inquiry.setMemberNo(loginMember.getMemberNo());
		
		int listCount = 0;
		PageInfo pageInfo = null;
		List<Support> list = null;
		
		listCount = service.getInquiryCount(inquiry);
		pageInfo = new PageInfo(page, 5, listCount, 10);
		list = service.getInquiryList(inquiry, pageInfo);
		
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("cscenter/inquiry");
		
		return modelAndView;

	}
	
	@GetMapping("/inquiryView")
	public ModelAndView csinquiryView(ModelAndView modelAndView, @SessionAttribute("loginMember") Member loginMember, @RequestParam int no) {
		Inquiry inquiry = null;
		
		inquiry = service.getInquiryByNo(no);
		
		if (inquiry != null && (inquiry.getMemberNo() == loginMember.getMemberNo()) ) {
			modelAndView.addObject("inquiry", inquiry);
			modelAndView.setViewName("cscenter/inquiryView");
		}else {
			modelAndView.addObject("msg", "잘못된 접근입니다.");
			modelAndView.addObject("location", "/cscenter/inquiry");
			modelAndView.setViewName("common/msg");
		}
		
		return modelAndView;
	}
	
	@GetMapping("/inquiryWrite")
	public ModelAndView csinquiryWrite(ModelAndView modelAndView) {
		
		modelAndView.setViewName("cscenter/inquiryWrite");
		
		return modelAndView;
	}
	
	@PostMapping("/inquiryWrite")
	public ModelAndView csinquiryWrite(ModelAndView modelAndView, @SessionAttribute("loginMember") Member loginMember, Inquiry inquiry) {
		int result = 0;
		
		// 작성한 게시글을 데이터베이스에 저장
		inquiry.setMemberNo(loginMember.getMemberNo());
				
		result = service.inquirySave(inquiry);
				
		if (result > 0) {
			modelAndView.addObject("msg", "게시글 등록 성공");
			modelAndView.addObject("location", "/cscenter/inquiryView?no=" + inquiry.getInquiryNo());
		} else {
			modelAndView.addObject("msg", "게시글 등록 실패");
			modelAndView.addObject("location", "/cscenter/inquiryWrite");	
		}
				
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/image.do", method = RequestMethod.POST) 
	public void imageUpload(HttpServletRequest request, HttpSession session,
			HttpServletResponse response, MultipartHttpServletRequest multiFile , 
			@RequestParam MultipartFile upload) throws Exception{ 
		// 랜덤 문자 생성 
		UUID uid = UUID.randomUUID();
		
		OutputStream out = null; 
		PrintWriter printWriter = null; 
		
		//인코딩 
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		try{ 
			//파일 이름 가져오기 
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes(); 
			
			//이미지 경로 생성 
			String real = session.getServletContext().getRealPath("/resources/img/support");
			String ckUploadPath = real + "/" + uid + "_" + fileName; 
			File folder = new File(real);
			
			//해당 디렉토리 확인 
			if(!folder.exists()){ 
				try{ folder.mkdirs(); // 폴더 생성 
				}catch(Exception e){ 
					e.getStackTrace(); 
					} 
				}
			
			out = new FileOutputStream(new File(ckUploadPath)); 
			out.write(bytes); 
			out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화 
			
			String callback = request.getParameter("CKEditorFuncNum"); 
			printWriter = response.getWriter(); 
			String fileUrl = "ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName; // 작성화면 
			
			// 업로드시 메시지 출력
			printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}"); 
			printWriter.flush(); 
			
		}catch(IOException e){ 
			e.printStackTrace(); 
			} finally { 
				try { if(out != null) { out.close(); } 
				if(printWriter != null) { printWriter.close(); } 
				} catch(IOException e) { e.printStackTrace(); } 
			} 
		return; 
	}
	
	/*
	 * @RequestMapping(value="/ckImgSubmit.do") public void
	 * ckSubmit(@RequestParam(value="uid") String uid
	 * , @RequestParam(value="fileName") String fileName , HttpSession session,
	 * HttpServletRequest request, HttpServletResponse response) throws
	 * ServletException, IOException{
	 * 
	 * //서버에 저장된 이미지 경로 String real =
	 * session.getServletContext().getRealPath("/resources/img/support"); String
	 * sDirPath = real+ "/" + uid + "_" + fileName; File imgFile = new
	 * File(sDirPath);
	 * 
	 * //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다. if(imgFile.isFile()){ byte[] buf =
	 * new byte[1024]; int readByte = 0; int length = 0; byte[] imgBuf = null;
	 * 
	 * FileInputStream fileInputStream = null; ByteArrayOutputStream outputStream =
	 * null; ServletOutputStream out = null;
	 * 
	 * try{ fileInputStream = new FileInputStream(imgFile); outputStream = new
	 * ByteArrayOutputStream(); out = response.getOutputStream();
	 * 
	 * while((readByte = fileInputStream.read(buf)) != -1){ outputStream.write(buf,
	 * 0, readByte); }
	 * 
	 * imgBuf = outputStream.toByteArray(); length = imgBuf.length;
	 * out.write(imgBuf, 0, length); out.flush();
	 * 
	 * }catch(IOException e){ e.getMessage(); }finally { outputStream.close();
	 * fileInputStream.close(); out.close(); } } }
	 */
	
}
