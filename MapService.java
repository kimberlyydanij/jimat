package service;

import java.util.List;

import dto.MapDTO;
import dto.PageDTO;

public interface MapService {
	public List<MapDTO> listProcess(PageDTO pv);
	public List<MapDTO> f_coordindate(String latitude, String longitude);
	public int countProcess();
}
