package service;

import java.util.List;

import dao.DetailpageDao;
import dto.DetailpageDTO;

public class DetailpageServiceImp implements DetailpageService {
	private DetailpageDao dao;

	public DetailpageServiceImp() {

	}

	public void setDao(DetailpageDao dao) {
		this.dao = dao;
	}

	@Override
	public List<DetailpageDTO> listProcess(DetailpageDTO pv) {
		return dao.list(pv);
	}

	@Override
	public List<DetailpageDTO> list_matchProcess(String number) {
		return dao.list_match(number);
	}

}
