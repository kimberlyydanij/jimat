package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.ShopDetailDTO;
import service.MypageService;

@Controller
public class MypageController {

	private MypageService service;
	
	public MypageController() {

	}
	
	public void setService(MypageService service) {
		this.service = service;
	}
	
	//마이페이지 여는 컨트롤러 합칠 시 겹치므로 삭제
	//http://localhost:8090/mypage.do
	@RequestMapping(value="myPage.do", method=RequestMethod.GET)
	public String mypage() {
		return "mainPage/mypage";
	}
	
	@RequestMapping(value="myPage.do", method=RequestMethod.POST)
	public ModelAndView mypage_information(ModelAndView mav) {	
		mav.setViewName("mainPage/mypage");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="mypage_check_list.do", method=RequestMethod.POST)
	public List<ShopDetailDTO> mypage_check_listPro(String k_id) {
		return service.mypage_findPro(k_id);
	}
}
