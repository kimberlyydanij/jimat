package dao;

import java.util.HashMap;
import java.util.List;
import dto.CurationDTO;
import dto.ReviewDTO;

public interface CurationDAO {

	public List<CurationDTO> matchCheck(int number);
	
	public List<CurationDTO> magazineCheck(int number);
	
	public List<CurationDTO> loginMatchCheck(HashMap<String, Object> map);
	
	//public CurationDTO foodStoreTag (CurationDTO checkTag);
	
}
