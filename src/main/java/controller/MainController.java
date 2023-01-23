package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//http://localhost:8090/index.do

@Controller
public class MainController {
/*
	// index로 이동
	@RequestMapping("index.do")
	public String MainPage() {
		return "mainPage/index";
	}
*/
	// 팀소개로 이동
	@RequestMapping("teamVita500.do")
	public String TeamVita500() {
		return "mainPage/teamVita500";
	}

	
	// 맛집소개로 이동
	@RequestMapping("curationPage.do")
	public String Curation() {
		return "curation/curation";
	}

	// 1km로 이동
	@RequestMapping("oneKmMap.do")
	public String OneKmMap() {
		return "mainPage/oneKmMap";
	}

	// 매거진로 이동
	@RequestMapping("magazinePage.do")
	public String Magazine() {
		return "magazine/magazine";
	}

    //  마이페이지로 이동
	@RequestMapping("myPage.do")
	public String Mypage() {
		return "mainPage/mypage";
	}

	// 임시-상세페이지로 이동
	@RequestMapping("shopDetail.do")
	public String ShopDetail() {
		return "mainPage/shopDetail";
	}

	// 임시-상세지도
	//@RequestMapping("detailMap.do")
	public String DetailMap() {
		return "mainPage/detailMap";
	}
}
