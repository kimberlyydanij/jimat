package service;

import java.util.List;

import dto.ShopDetailDTO;

public interface ShopDetailService {

	public List<ShopDetailDTO> getShopDetailData(ShopDetailDTO sdto);
	
	public ShopDetailDTO shopDetailData(String number);
	
}
