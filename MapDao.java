package dao;

import java.util.HashMap;
import java.util.List;

import dto.MapDTO;
import dto.PageDTO;

public interface MapDao {
	public List<MapDTO> list(PageDTO pv);
	public List<MapDTO> res_coordindate(HashMap<String, Object> coor);
	public int count();
}
