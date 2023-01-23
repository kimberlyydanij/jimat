package service;

import java.util.List;

import dao.MypageDAO;
import dto.ShopDetailDTO;

public class MypageServiceImpl implements MypageService{

	private MypageDAO dao;
	
	public MypageServiceImpl() {

	}
	
	public void setDao(MypageDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<ShopDetailDTO> mypage_findPro(String k_id) {
		return dao.mypage_find(k_id);
	}
	
	
}
