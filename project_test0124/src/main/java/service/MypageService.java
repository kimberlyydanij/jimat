package service;

import java.util.List;

import dto.ShopDetailDTO;

public interface MypageService {

	public List<ShopDetailDTO> mypage_findPro(String k_id);
}
