package dao;

import java.util.HashMap;
import java.util.List;

import dto.CurationDTO;

public interface CurationDAO {

	public List<CurationDTO> matchCheck(HashMap<String, Object> map);
	
	//public CurationDTO foodStoreTag (CurationDTO checkTag);
	
}
