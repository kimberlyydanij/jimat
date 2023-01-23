package service;

import java.util.List;

import dto.LibmapDTO;

public interface LibService {
	public List<LibmapDTO> f_listProcess(int pageNo, int pageSize, String keyword);
	public int f_countAllProcess(String data);

}
