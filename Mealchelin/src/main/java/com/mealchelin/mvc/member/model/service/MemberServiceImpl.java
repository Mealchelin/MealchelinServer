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
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.mealchelin.mvc.common.util.PageInfo;
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
	public String getAccessToken(String code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		
		try {
			URL url = new URL(reqURL);            
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            
		    BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		    StringBuilder sb = new StringBuilder();
		    
		    
		    sb.append("grant_type=authorization_code");            
		    sb.append("&client_id=df2ba4c3585b62edc907c6e6f8b09486"); //본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost:8080/member/kakao/login"); // 본인이 설정한 주소			            
			sb.append("&code=" + code);
			bw.write(sb.toString());
			bw.flush();
		
			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			
			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			            
			while ((line = br.readLine()) != null) {
					result += line;
			}
//			System.out.println("response body : " + result);
			
			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);
            
			br.close();
			bw.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
		
		
	}

	@Override
	public Member getUserInfo(String access_Token) {
		
		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			
			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			String id = element.getAsJsonObject().get("id").getAsString();
//			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			
//			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String name = kakao_account.getAsJsonObject().get("name").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			String phone_number = kakao_account.getAsJsonObject().get("phone_number").getAsString();

			// 전화번호 들어오는 데이터 형식 변경하기 
			String phone = phone_number.replaceAll("[^0-9]", "");
			if (!phone.startsWith("010")) {
				phone = "010" + phone.substring(4);
			}
			String password = "1234";
			
			System.out.println(element);
			System.out.println("id!!!!!!!!!!!!!!!!!! : " + id);
			
			userInfo.put("id",id);
			userInfo.put("password",encoder.encode(password));
			userInfo.put("email", email);
			userInfo.put("name", name);
			userInfo.put("phone_number", phone);

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Member result = mapper.findKakao(userInfo);
		
		System.out.println("SSSSSSSSSSSSSSSSSS: " + result);
		
		if (result == null) {
		// result null이면 정보가 저장이 안된거라 정보를 저장 
			
			mapper.kakaoInsert(userInfo);
			
			return mapper.findKakao(userInfo);
			// result를 리턴으로 보내면 null이 리턴되므로 위 코드로 사용,
		}else {
			
			return result;
			// 정보가 이미 있어서 result를 리턴 
		}
		
	}
//----------------------------admin
	@Override
	public List<Member> getMemberList(PageInfo pageInfo, String name) {
		int limit = pageInfo.getListLimit();
	    int offset = (pageInfo.getCurrentPage() - 1) * limit;
	    RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		return mapper.selectAll(rowBounds, name);
	}

	@Override
	public int getMemberCount(String name) {
		return mapper.selectCount(name);
	}
}











