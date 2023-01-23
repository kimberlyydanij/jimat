package service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import dto.KakaoDTO;

public interface MemberService {
	
	public HashMap<String, String> getToken (String code);
	
	public KakaoDTO getUserInfo();
	
	public String logOut();
	
	public String stopConn();
	
	public void kakao_updatePro(KakaoDTO userInfo);
	
	public void kakao_deletePro(String k_id);
	
	public void kakao_connect_sessionPro(HttpServletRequest request, KakaoDTO userinfo);
	
	public String move_pagePro(HttpServletRequest request);
	
	public int kakao_check_nicknamePro(String k_nickname);
}
