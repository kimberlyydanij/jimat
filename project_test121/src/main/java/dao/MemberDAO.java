package dao;

import dto.KakaoDTO;

public interface MemberDAO {

	public void kakaoinsert(KakaoDTO userInfo);
	
	public KakaoDTO findkakao(KakaoDTO userInfo);
}
