package com.mycompany.myapp;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Scanner;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;

import org.apache.velocity.tools.view.WebappUberspector.GetAttributeExecutor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.cors.reactive.UrlBasedCorsConfigurationSource;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;


@Service
public class MemberService {


	String rest_api_key = "dc71b825598ec6c58fb2a8f6fd26e952";
	String redirect_uri_login = "http://localhost:8090/myapp/loginpage.do";
	String app_admin_key = "bef3f3738f3c113417083a91c7b5da20";

	String access_token = "";
	String refresh_token = "";

	String id = "";

	@Autowired
	private MemberRepository mr;

	public MemberService() {

	}

	public void setMrt(MemberRepository mr) {
		this.mr = mr;
	}

	//토큰 정보를 받아오기 위한 메서드
	public HashMap<String, String> getToken (String code) {
		//access_token 값과 refresh_token 값을 받아오기 위해 HashMap을 이용
		HashMap<String, String> tokens = new HashMap<String, String>();

		//토큰 값을 받아올 수 있는 링크
		String reqURL = "https://kauth.kakao.com/oauth/token";
		try {
			//URL 생성
			URL url = new URL(reqURL);

			//http에 URL을 연결
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			//서버에 요청할 방법을 POST로 설정
			conn.setRequestMethod("POST");

			//서버에 요청을 보낼 수 있게 true 값을 준다.(default = false)
			conn.setDoOutput(true);

			//작성을 할 수 있게 stream 연결
			//속도를 높이기 위해 outputstreamwriter뿐 아닌 bufferedwriter를 사용한다.
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

			//객체 생성 빈도를 줄이기 위한 stringbuilder 사용
			StringBuilder sb = new StringBuilder();

			//문서에서 필수인 header 값과 parameter 값을 저장
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=" + rest_api_key);
			sb.append("&redirect_uri=" + redirect_uri_login);
			sb.append("&code=" + code);
			bw.write(sb.toString());
			bw.flush();

			//연결 상태를 확인한다. 200은 성공, 이외에는 문제 발생
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " +responseCode);

			//보낸 정보를 통해 값을 읽어오기 위해 사용
			//속도를 높이기 위해 inputstreamreader 뿐 아닌 bufferedreader 사용
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			//열 단위로 읽기 위해 변수지정
			String line = "";

			//읽을 값을 합쳐주기 위한 변수지정
			String result = "";

			//읽어올 게 없을 때까지 돌려서 저장
			while((line=br.readLine()) !=null) {
				result += line;
			}

			//읽어온 정보 확인
			System.out.println("response body : " + result);

			//읽어온 파일을 json 형식으로 바꿔준다.
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			//access_token 값과 refresh_token 값 변수에 저장 및 확인
			access_token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_token = element.getAsJsonObject().get("refresh_token").getAsString();
			System.out.println("access_token : " + access_token);
			System.out.println("refresh_token : " + refresh_token);

			//HashMap 타입으로 저장
			tokens.put("access_token", access_token);
			tokens.put("refresh_token", refresh_token);

			//사용한 stream을 닫아준다.
			br.close();
			bw.close();

		}catch (IOException e) {
			e.printStackTrace();
		}
		return tokens;
	}


	//사용자 정보를 가져오기 위한 메서드
	public KakaoDTO getUserInfo() { 

		//사용자 정보를 저장하기 위한 DTO 변수 설정
		KakaoDTO userinfo = new KakaoDTO();

		//사용자 정보를 가져오기 위한 링크
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			//URL 연결
			URL url = new URL(reqURL);

			//http에 URL을 연결
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			//요청하는 방식을 GET으로 설정
			conn.setRequestMethod("GET");

			//필수로 들어가는 header 값 설정
			conn.setRequestProperty("Authorization" , "Bearer " + access_token);

			//서버와의 연결 확인. 200은 성공, 이외에는 문제 발생
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			//요청한 값을 받아오기 위해 설정
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			//요청한 값을 읽어오기 위한 변수 설정
			String line = "";
			String result = "";

			//요청한 값을 전부 읽어올 때까지 반복하여 저장
			while((line=br.readLine()) != null) {
				result += line;
			}
			
			//요청한 값 확인 (사용자 정보 리턴)
			System.out.println("response body : " + result);

			//json타입으로 변경
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			//json 형식으로 되어 있는 요청값을 꺼내오기 위해 변수설정
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			//id 값을 변수에 저장
			id = element.getAsJsonObject().get("id").getAsString();
			
			//id 값을 내부 아이디식으로 변수에 저장
			String k_id = "kakao_" + id;
			
			//각종 정보를 변수에 저장
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String image = properties.getAsJsonObject().get("thumbnail_image").getAsString();
			String has_email = kakao_account.getAsJsonObject().get("has_email").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			String has_age_range = kakao_account.getAsJsonObject().get("has_age_range").getAsString();
			String age_range = kakao_account.getAsJsonObject().get("age_range").getAsString();
			String has_birthday = kakao_account.getAsJsonObject().get("has_birthday").getAsString();
			String birthday = kakao_account.getAsJsonObject().get("birthday").getAsString();
			String birthday_type = kakao_account.getAsJsonObject().get("birthday_type").getAsString();
			String has_gender = kakao_account.getAsJsonObject().get("has_gender").getAsString();
			String gender = kakao_account.getAsJsonObject().get("gender").getAsString();

			//DTO에 받아온 값을 저장
			userinfo.setK_id(k_id);
			userinfo.setK_nickname(nickname);
			userinfo.setK_image(image);
			userinfo.setK_has_email(has_email);
			userinfo.setK_email(email);
			userinfo.setK_has_age_range(has_age_range);
			userinfo.setK_age_range(age_range);
			userinfo.setK_has_birthday(has_birthday);
			userinfo.setK_birthday(birthday);
			userinfo.setK_birthday_type(birthday_type);
			userinfo.setK_has_gender(has_gender);
			userinfo.setK_gender(gender);

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//데이터 베이스 해당하는 정보가 있는지 확인
		KakaoDTO result = mr.findkakao(userinfo);
		System.out.println("S:" + result);
		
		//해당하는 정보가 없으면 데이터 베이스에 정보를 저장
		if(result==null) {
			mr.kakaoinsert(userinfo);
			// 정보를 저장하기 위해 Repository로 보내는 코드
			return mr.findkakao(userinfo);
			// 정보 저장 후 컨트롤러에 정보를 보내는 코드
			
		} else { // 정보가 이미 있기 때문에 result를 리턴
			return result;
			
		}

	}

	//로그아웃시 사용되는 메서드
	public String logOut() {
		//로그아웃시 사용되는 링크
		String reqURL = "https://kapi.kakao.com/v1/user/logout";
		String result = "";
		try {
			//URL 연결
			URL url = new URL(reqURL);
			
			//http에 URL 연결
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			//요청하는 방식은 POST
			conn.setRequestMethod("POST");
			
			//서버에 요청을 보낼 수 있게 true 값을 준다.(default = false)
			conn.setDoOutput(true);

			//필수로 들어가는 header 정보 입력
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			conn.setRequestProperty("Authorization", "KakaoAK " + app_admin_key);

			//작성을 할 수 있게 stream 연결
			//속도를 높이기 위해 outputstreamwriter뿐 아닌 bufferedwriter를 사용한다.
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			
			//객체 생성 빈도를 줄이기 위한 stringbuilder 사용
			StringBuilder sb = new StringBuilder();
			
			//필수로 들어가는 parameter 정보 입력
			sb.append("&target_id_type=user_id");
			sb.append("&target_id=" + id);
			bw.write(sb.toString());
			bw.flush();

			//연결 상태를 확인한다. 200은 성공, 이외에는 문제 발생
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			
			//보낸 정보를 통해 값을 읽어오기 위해 사용
			//속도를 높이기 위해 inputstreamreader 뿐 아닌 bufferedreader 사용
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			//요청한 값을 읽어오기 위한 변수 설정
			String line = "";
			result = "";
			
			//요청한 값을 전부 읽어올 때까지 반복하여 저장
			while((line=br.readLine()) !=null) {
				result += line;
			}
			
			//요청한 값 확인 (로그아웃 된 id 값 리턴)
			System.out.println("response body : " + result);

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;
	}

	public String stopConn() {

		//연결끊기 위한 링크
		String reqURL = "https://kapi.kakao.com/v1/user/unlink";
		String result = "";
		try {
			//URL 연결
			URL url = new URL(reqURL);
			
			//http에 URL연결
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			//요청 방식을 POST 설정
			conn.setRequestMethod("POST");		
			
			//필수로 들어가는 header 정보 입력
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			conn.setRequestProperty("Authorization", "KakaoAK " + app_admin_key);
			
			//요청할 정보를 보내기 위해 true값 설정. (default = false)
			conn.setDoOutput(true);

			//작성을 할 수 있게 stream 연결
			//속도를 높이기 위해 outputstreamwriter뿐 아닌 bufferedwriter를 사용한다.
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			
			//객체 생성 빈도를 줄이기 위한 stringbuilder 사용
			StringBuilder sb = new StringBuilder();
			
			//필수로 들어가는 parameter 정보 입력
			sb.append("&target_id_type=user_id");
			sb.append("&target_id=" + id);
			bw.write(sb.toString());
			bw.flush();

			//연결 상태를 확인한다. 200은 성공, 이외에는 문제 발생
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			
			//보낸 정보를 통해 값을 읽어오기 위해 사용
			//속도를 높이기 위해 inputstreamreader 뿐 아닌 bufferedreader 사용
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			//요청한 값을 읽어오기 위한 변수 설정
			String line = "";
			result = "";
			
			//요청한 값을 전부 읽어올 때까지 반복하여 저장
			while((line=br.readLine()) !=null) {
				result += line;
			}
			
			//요청한 값 확인 (로그아웃 된 id 값 리턴)
			System.out.println("response body : " + result);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;
	}
}
