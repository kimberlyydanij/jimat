package dao;

import java.util.HashMap;
import java.util.List;

import dto.CurationDTO;

public interface CurationDAO {

	public List<CurationDTO> matchCheck(int number);
	
	//public CurationDTO foodStoreTag (CurationDTO checkTag);
	
}
