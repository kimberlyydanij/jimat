package dao;

import dto.KakaoDTO;

public interface MemberDAO {

	public void kakao_insert(KakaoDTO userInfo);
	
	public KakaoDTO kakao_find(KakaoDTO userInfo);
	
	public void kakao_update(KakaoDTO userInfo);
	
	public void kakao_delete(String k_id);
	
	public int kakao_nickname_check(String k_nickname);
}
