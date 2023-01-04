package service;

import java.util.HashMap;
import java.util.List;

import dao.MapDao;
import dto.MapDTO;
import dto.PageDTO;

public class MapServiceImp implements MapService {
	private MapDao dao;

	public MapServiceImp() {

	}

	public void setDao(MapDao dao) {
		this.dao = dao;
	}
	
	@Override
	public List<MapDTO> f_coordindate(String latitude, String longitude) {
		HashMap<String, Object> coordinate = new HashMap<String, Object>();
		coordinate.put("latitude", latitude);
		coordinate.put("longitude", longitude);
		return dao.res_coordindate(coordinate);
	}

	@Override
	public List<MapDTO> listProcess(PageDTO pv) {
		return dao.list(pv);
	}

	@Override
	public int countProcess() {
		return dao.count();
	}
}
