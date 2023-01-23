package dao;

import java.util.List;

import dto.ShopDetailDTO;

public interface MypageDAO {

	public List<ShopDetailDTO> mypage_find(String k_id);
}
