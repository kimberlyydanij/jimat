package dao;

import java.util.List;

import dto.DetailpageDTO;

public interface DetailpageDao {
	public List<DetailpageDTO> list(DetailpageDTO pv);
	public List<DetailpageDTO> list_match(String number);
}
