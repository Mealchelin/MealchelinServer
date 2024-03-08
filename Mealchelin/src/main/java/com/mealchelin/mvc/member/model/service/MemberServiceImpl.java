package com.mealchelin.mvc.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.mealchelin.mvc.member.model.mapper.MemberMapper;
import com.mealchelin.mvc.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Override
	public Member findMemberById(String id) {
		
		return mapper.selectMemberById(id);
	}
	
	@Override
	public Member login(String id, String password) {
		Member member = this.findMemberById(id);
		
		member = mapper.selectMemberById(id);
		
		if (member == null || !encoder.matches(password, member.getPassword())) {
			return null;
		}
		
		return member;
		
	}

	
	
	@Override
	public Member getMemberByNo(int i) {
		
	return mapper.selectMemberByNo(i);
	}
		
	
	
	@Override
	public Member MemberByOrderInfo(String id) {
		

		return mapper.selectMemberByOrderInfo(id);			
	}

	
	
	@Override
	@Transactional  //  자동 롤백& 커밋
	public int save(Member member) {
		int result = 0;
		
		if(member.getMemberNo() > 0) {
			//update
			result = mapper.updateMember(member);
			
		} else {
			//insert
			member.setPassword(encoder.encode(member.getPassword()));
			
			result = mapper.insertMember(member);					
		}
	
		return result;
	}

	
	
	
	@Override
	public Boolean isDuplicateId(String userId) {
		
		return this.findMemberById(userId) != null;
	}

	
	
	@Override
	public Member updateBefore(String id, String password) {
		Member member = this.findMemberById(id);
		
		member = mapper.selectMemberById(id);
		
		if (member == null || !encoder.matches(password, member.getPassword())) {
			return null;
		}
		
		return member;
	}
	
	

	@Override
	public int dalete(int memberNo) {

		return mapper.updateStatus(memberNo, "N");
	}

	
	
	// 카카오 ----------------------------------------------------
	@Override
	public String getReturnAccessToken(String code) {
		String access_token = "";
		String refresh_token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			// HttpURLConnection 설정 값 세팅 
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			//buffer 스트림 객체 값 세팅 후 요청 
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=[df2ba4c3585b62edc907c6e6f8b09486]");
			sb.append("&redirect_uri=http://localhost:8080/member/kakao/login");
			sb.append("&code=" + code);
			bw.write(sb.toString());
			bw.flush();
			
			// Return 값 result 변수에 저장 
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String br_line = "";
			String result = "";
			
			while((br_line = br.readLine()) != null) {
				result += br_line;
			}
			
			JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result);
	        
	        // 토큰 값 저장 및 리턴 
	        access_token = element.getAsJsonObject().get("access_token").getAsString();
	        refresh_token = element.getAsJsonObject().get("refresh_token").getAsString();
			
	        br.close();
	        bw.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return access_token;
	}

	@Override
	public Map<String, Object> getUserInfo(String access_token) {
		Map<String, Object> resultMap = new HashMap<>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		
		URL url;
		try {
			url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			
			//요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_token);
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String br_line = "";
			String result = "";
			
			while((br_line = br.readLine()) != null) {
				result += br_line;
			}
			System.out.println("response:" + result);
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String profile_image = properties.getAsJsonObject().get("profile_image").getAsString();
			resultMap.put("nickname", nickname);
			resultMap.put("profile_image", profile_image);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return resultMap;
	}



}











