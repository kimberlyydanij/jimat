package service;

import java.util.HashMap;

import dto.KakaoDTO;

public interface MemberService {
	
	public HashMap<String, String> getToken (String code);
	
	public KakaoDTO getUserInfo();
	
	public String logOut();
	
	public String stopConn();
}
