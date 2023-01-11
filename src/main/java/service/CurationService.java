package service;

import java.util.HashMap;

import dto.CurationDTO;

public interface CurationService {
	
	public HashMap<String, String> getStoreTag (String tag);
	
	public CurationDTO getShopInfo();
	
	

}
