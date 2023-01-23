package service;

import java.util.HashMap;
import java.util.List;

import dao.MapDao;
import dto.MapDTO;

public class MapServiceImp implements MapService{
	private MapDao dao;
	
	public MapServiceImp() {

	}
	
	public void setDao(MapDao dao) {
		this.dao = dao;
	}
	
	@Override
	public List<MapDTO> f_listProcess(int pageNo, int pageSize, String keyword) {
		HashMap<String, Object>map = new HashMap<String, Object>();
		map.put("startpage", ((pageNo - 1) * pageSize)+1);
		map.put("endpage", pageNo * pageSize);
		map.put("keyword", keyword); //키워드
		return dao.map_list(map);
	}

	@Override
	public int f_countAllProcess(String data) {
		return dao.food_countAll(data);
	}
	
	

}
