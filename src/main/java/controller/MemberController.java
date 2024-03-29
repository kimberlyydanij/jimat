package controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.MemberDaoImpl;
import dto.KakaoDTO;
import service.MemberServiceImpl;


//http://localhost:8090/loginformpage.do
//http://localhost:8090/loginpage.do

@Controller
public class MemberController {

	private MemberServiceImpl ms;

	public void setMs(MemberServiceImpl ms) {
		this.ms = ms;
	}

	//loginform으로 이동
	@RequestMapping(value="/loginformpage.do", method=RequestMethod.GET)
	public String Kakao_login_pagePro(HttpServletRequest request) {
		if(request.getHeader("Referer") != null) {
			String referer = request.getHeader("Referer");
			request.getSession().setAttribute("prevURI", referer);
//			System.out.println("referer : " + referer);
		}else {
			request.getSession().setAttribute("prevURI", "index.do");
		}
		return "login/loginform";
	}

	//login시 getToken으로 토큰 값을 받아오고 getUserInfo를 통해 유저 정보를 가져옴
	@RequestMapping(value="/loginpage.do", method=RequestMethod.GET)
	public String Kakao_loginPro(@RequestParam(value = "code", required = false, defaultValue = "") String code, HttpServletRequest request) throws Exception {
//		System.out.println("#########" + code);

		//code 값을 이용해서 access_token을 받음
		//getToken으로 access_token 값과 refresh_token 값을 받아옴
		ms.getToken(code);
		//		HashMap<String, String> token = ms.getToken(code);
		//		String access_token = token.get("access_token");
		//		String refresh_token = token.get("refresh_token");
		//		System.out.println("###access_token : " + access_token);
		//		System.out.println("###refresh_token : " + refresh_token);

		//MemberService를 이용해서 카카오api 정보를 가져옴
		//getUserInfo를 통해 유저에 대한 각종 정보를 가져옴
		KakaoDTO userinfo = ms.getUserInfo();
		//		System.out.println("check2");
		//		System.out.println("###access_Token#### : " + access_token);
		//		System.out.println("###id#### : " + userinfo.getK_id());		
		//		System.out.println("###nickname#### : " + userinfo.getK_nickname());
		//		System.out.println("###name#### : " + userinfo.getK_name());
		//		System.out.println("###email#### : " + userinfo.getK_email());
		//		System.out.println("###image#### : " + userinfo.getK_image());
		//		System.out.println("###age_range#### : " + userinfo.getK_age_range());
		//		System.out.println("###birthday#### : " + userinfo.getK_birthday());
		//		System.out.println("###birthday_type#### : " + userinfo.getK_birthday_type());
		//		System.out.println("###gender#### : " + userinfo.getK_gender());

		ms.kakao_connect_sessionPro(request, userinfo);
		//		// 아래 코드가 추가되는 내용
		//		session.invalidate();

		return "login/logout";

	}

	//logout 버튼 클릭시 실행이 된다.
	@RequestMapping(value="logoutpage.do", method=RequestMethod.GET)
	public String Kakao_logout_pagePro(HttpServletRequest request) {
		ms.logOut();
		request.getSession().invalidate();
		return ms.move_pagePro(request);
	}

	//연결끊기 버튼 클릭시 실행이 된다.
	@RequestMapping(value="stopconnpage.do", method=RequestMethod.GET)
	public String Kakao_stop_connectionPro(HttpServletRequest request) {
		ms.stopConn();
		request.getSession().invalidate();
		return ms.move_pagePro(request);
	}

	@ResponseBody
	@RequestMapping(value="kakao_update.do", method=RequestMethod.POST)
	public int Kakao_nickname_updatePro(HttpServletRequest request, KakaoDTO dto, String k_nickname) {
		dto.setK_nickname(k_nickname);
		dto.setK_id((String)request.getSession().getAttribute("sessionId"));

		int check_nickname = ms.kakao_check_nicknamePro(k_nickname);
		
		if(check_nickname == 0) {
			ms.kakao_updatePro(dto);
			request.getSession().removeAttribute("session_nickname");
			request.getSession().setAttribute("session_nickname", k_nickname);
			return 0; //update 성공
		}else if(k_nickname.equals((String)request.getSession().getAttribute("session_nickname"))){
			return 1; //현재 아이디와 동일하여 수정없음
		}else {
			return 2; //중복아이디 존재 update 실패
		}
	}

	@RequestMapping(value="kakao_delete.do")
	public String Kakao_deletePro(HttpServletRequest request) {
		ms.kakao_deletePro((String)request.getSession().getAttribute("sessionId"));
		request.getSession().invalidate();
		return ms.move_pagePro(request);
	}
}
