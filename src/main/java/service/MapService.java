package service;

import java.util.List;

import dto.MapDTO;

public interface MapService {
	public List<MapDTO> f_listProcess(int pageNo, int pageSize, String keyword);
	public int f_countAllProcess(String data);

}
