package controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public String LoginPage() {
		return "login/loginform";
	}
	
	//login시 getToken으로 토큰 값을 받아오고 getUserInfo를 통해 유저 정보를 가져옴
	@ResponseBody
	@RequestMapping(value="/loginpage.do", method=RequestMethod.GET)
	public ModelAndView KakaoLogin(@RequestParam(value = "code", required = false, defaultValue = "") String code, ModelAndView mav) throws Exception {
		System.out.println("#########" + code);
		
		//code 값을 이용해서 access_token을 받음
		//getToken으로 access_token 값과 refresh_token 값을 받아옴
		HashMap<String, String> token = ms.getToken(code);
		String access_token = token.get("access_token");
		String refresh_token = token.get("refresh_token");
		System.out.println("###access_token : " + access_token);
		System.out.println("###refresh_token : " + refresh_token);
		
		//MemberService를 이용해서 카카오api 정보를 가져옴
		//getUserInfo를 통해 유저에 대한 각종 정보를 가져옴
		KakaoDTO userinfo = ms.getUserInfo();
		System.out.println("check2");
		System.out.println("###access_Token#### : " + access_token);
		System.out.println("###id#### : " + userinfo.getK_id());		
		System.out.println("###nickname#### : " + userinfo.getK_nickname());
		System.out.println("###image#### : " + userinfo.getK_image());
		System.out.println("###email#### : " + userinfo.getK_email());
		System.out.println("###image#### : " + userinfo.getK_image());
		System.out.println("###age_range#### : " + userinfo.getK_age_range());
		System.out.println("###birthday#### : " + userinfo.getK_birthday());
		System.out.println("###birthday_type#### : " + userinfo.getK_birthday_type());
		System.out.println("###gender#### : " + userinfo.getK_gender());
	
//		// 아래 코드가 추가되는 내용
//		session.invalidate();

		mav.setViewName("login/login");
		
		return mav;

    	}
	
	//logout 버튼 클릭시 실행이 된다.
	@RequestMapping(value="/logoutpage.do", method=RequestMethod.GET)
	public String LogoutPage(@RequestParam(value = "code", required = false, defaultValue = "") String code) {
		String result = ms.logOut();
		return "login/loginform";
	}
	
	//연결끊기 버튼 클릭시 실행이 된다.
	@RequestMapping(value="stopconnpage.do", method=RequestMethod.GET)
	public String StopConnection() {
		String result = ms.stopConn();
		return "login/loginform";
	}
}
