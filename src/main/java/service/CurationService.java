package service;

import java.util.List;
import dto.CurationDTO;

public interface CurationService {
	
	
	public List<CurationDTO> matchCheckProcess(int number);
	
	public List<CurationDTO> magazineCheckProcess(int number);
	
	public List<CurationDTO> loginMatchCheckProcess(String number, String age, String gender);
	
}
