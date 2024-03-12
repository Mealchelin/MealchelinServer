package com.mealchelin.mvc.admin.controller;

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

import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.common.util.MultipartFileUtil;
import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.product.model.service.ProductService;
import com.mealchelin.mvc.product.model.vo.Product;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/product")
public class AdminProductController {
	private final ProductService productService;
	private final ResourceLoader resourceLoader;
	
	@GetMapping("/adProduct")
	public ModelAndView adProduct(
			ModelAndView modelAndView,
			@RequestParam(defaultValue="1") int page,
			@RequestParam(defaultValue="", name = "ad_product_se") String category,
			@RequestParam(defaultValue="", name = "ad_memberSearch") String name) {
		
		List<Product> list = null;
		int listCount = 0;
		PageInfo pageInfo = null; 
		
		// 1. 전체 검색
		// 2. 카테고리 선택 후 검색
		// 3. 상품명 검색
		// 4. 카테고리 + 상품명 검색
		
		
		listCount = productService.getProductSearchCount(category, name);
		
		pageInfo = new PageInfo(page, 5, listCount, 10);
		list = productService.getProductListOrderByNo(pageInfo, category, name);
		
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("pageInfo", pageInfo);
		
		modelAndView.setViewName("admin/product/adProduct");
		return modelAndView;
	}
	
	@GetMapping("/write")
	public ModelAndView adProductWrite(ModelAndView modelAndView) {
		
		modelAndView.setViewName("admin/product/write");
		
		return modelAndView;
	}
	
	@PostMapping("/write")
	public ModelAndView adProductWrite(
			ModelAndView modelAndView,
			Product product,
			@RequestParam("upfile") MultipartFile upfile) {
		
		log.info(product.toString());
		log.info("isEmpty: {}", upfile.isEmpty()); // 비어있으면(업로드 안했으면) true, 했으면 false
		
		log.info("File Name: {}", upfile.getOriginalFilename()); // 업로드했으면 "파일명", 안했으면 ""(빈문자열) 리턴
		
		if (upfile != null && !upfile.isEmpty()) {
			String location = null;
			String originalFileName = null;
				
			try {
				location = resourceLoader.getResource("resources/img/product").getFile().getPath();
				System.out.println(location);
				originalFileName = MultipartFileUtil.save(upfile, location);
				
				if (originalFileName != null) {
					product.setImage(upfile.getOriginalFilename());
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		log.info(product.toString());
		
		int result = 0;
		result = productService.save(product);
		if (result > 0) {
			modelAndView.addObject("msg", "상품 등록 완료");
			modelAndView.addObject("script", "setTimeout(() => {window.close();}, 100);");
		} else {
			modelAndView.addObject("msg", "상품 등록 실패");
			modelAndView.addObject("location", "/admin/product/write");
		}
		
		modelAndView.setViewName("common/msg");
		return modelAndView;
	}
	
	@GetMapping("/edit")
	public ModelAndView adProductEdit(
			ModelAndView modelAndView, 
			@RequestParam int no) {
		
		Product product = productService.getProductAllByNo(no);
		
		log.info(product.toString());
		
		modelAndView.addObject("product", product);
		modelAndView.setViewName("admin/product/edit");
		
		return modelAndView;
	}
	
	@PostMapping("/edit")
	public ModelAndView adProductEdit(
			ModelAndView modelAndView, 
			Product product,
			@RequestParam("upfile") MultipartFile upfile) {
		
		if (upfile != null && !upfile.isEmpty()) {
			String location = null;
			String originalFileName = null;
				
			try {
				location = resourceLoader.getResource("resources/img/product").getFile().getPath();
				System.out.println(location);
				originalFileName = MultipartFileUtil.save(upfile, location);
				
				if (originalFileName != null) {
					product.setImage(upfile.getOriginalFilename());
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
		Product beforeProduct = productService.getProductAllByNo(product.getNo());
		String beforeImage = beforeProduct.getImage();
		int result = 0;
		
		if (upfile.getSize() == 0) {
			product.setImage(beforeImage);
		}
		
		result = productService.save(product);
		
		if (result > 0) {
			modelAndView.addObject("msg", "상품 수정 완료");
			modelAndView.addObject("script", "setTimeout(() => {window.close();}, 100);");
		} else {
			modelAndView.addObject("msg", "상품 수정 실패");
			modelAndView.addObject("location", "/admin/product/edit?no="+product.getNo());
		}
			modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	
	// ck에디터
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
			String real = session.getServletContext().getRealPath("/resources/img/product");
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
	
	@RequestMapping(value="/ckImgSubmit.do") 
	public void ckSubmit(@RequestParam(value="uid") String uid 
			, @RequestParam(value="fileName") String fileName
			, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{ 
		
		//서버에 저장된 이미지 경로 
		String real = session.getServletContext().getRealPath("/resources/img/product");
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
	
	@PostMapping("/exposure")
	public ModelAndView adProductEx(ModelAndView modelAndView,
			@RequestParam(value="ad_pro_chk", required=false) List<Integer> productList) {
		log.info("productList: {}", productList);
		if(productList == null || productList.isEmpty()) {
			modelAndView.addObject("msg", "노출 여부가 실패하였습니다.");
			modelAndView.addObject("location", "/admin/product/adProduct");			
		} else {
			for(Integer no : productList) {
				if (no != null) {
					Product product = productService.getProductAllByNo(no);
					product.setDisplay("Y");
					productService.save(product);
				}
			}
			
			modelAndView.addObject("msg", "선택한 데이터를 노출하였습니다.");
			modelAndView.addObject("location", "/admin/product/adProduct");			
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}

	
	@PostMapping("/nonExposure")
	public ModelAndView adProductNonEx(ModelAndView modelAndView,
			@RequestParam(value="ad_pro_chk", required=false) List<Integer> productList) {
		if(productList == null || productList.isEmpty()) {
			modelAndView.addObject("msg", "노출 여부가 실패하였습니다.");
			modelAndView.addObject("location", "/admin/product/adProduct");			
		} else {
			for(Integer no : productList) {
				if (no != null) {
					Product product = productService.getProductAllByNo(no);
					product.setDisplay("N");
					productService.save(product);
				}
			}
			modelAndView.addObject("msg", "선택한 데이터를 비노출하였습니다.");
			modelAndView.addObject("location", "/admin/product/adProduct");			
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	@PostMapping("/delete")
	public ModelAndView delete(ModelAndView modelAndView,
			@RequestParam(value="ad_pro_chk", required=false) List<Integer> productList) {
		if(productList == null || productList.isEmpty()) {
			modelAndView.addObject("msg", "삭제 여부가 실패하였습니다.");
			modelAndView.addObject("location", "/admin/product/adProduct");			
		} else {
			for(Integer no : productList) {
				if (no != null) {
					Product product = productService.getProductAllByNo(no);
					productService.delete(product);
				}
			}
			modelAndView.addObject("msg", "선택한 데이터를 삭제하였습니다.");
			modelAndView.addObject("location", "/admin/product/adProduct");			
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
}
