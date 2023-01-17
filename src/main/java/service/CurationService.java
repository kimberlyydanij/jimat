package service;

import java.util.HashMap;
import java.util.List;
import dto.CurationDTO;

public interface CurationService {
	
	public HashMap<String, String> getStoreTag (String tag);
	
	public List<CurationDTO> getShopInfo(CurationDTO cDto);
	
	public List<CurationDTO> matchCheckProcess(int number);
	
	
	

}
