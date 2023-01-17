package service;

import java.util.List;

import dao.ShopDetailDAO;
import dto.ShopDetailDTO;

public class ShopDetailServiceImp implements ShopDetailService {
	
	
	private ShopDetailDAO sdao;
	
	public ShopDetailServiceImp() {
	
	}
	
	public void setSdao(ShopDetailDAO sdao) {
		this.sdao = sdao;
	}

	@Override
	public List<ShopDetailDTO> getShopDetailData(ShopDetailDTO sdto) {
	
		return null;
	}
	
	@Override
	public ShopDetailDTO shopDetailData(String number) {

		return sdao.shopDetailData(number);
	}


}	