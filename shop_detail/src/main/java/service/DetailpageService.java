package service;

import java.util.List;

import dto.DetailpageDTO;

public interface DetailpageService {
	public List<DetailpageDTO> listProcess(DetailpageDTO pv);
	public List<DetailpageDTO> list_matchProcess(String number);
	
}
