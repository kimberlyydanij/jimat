package dao;

import java.util.HashMap;
import java.util.List;

import dto.MapDTO;

public interface MapDao {
	public List<MapDTO> map_list(HashMap<String, Object> map);
	public int food_countAll(String data);

}
