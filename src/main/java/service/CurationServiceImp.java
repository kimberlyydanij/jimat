package service;

import java.util.HashMap;
import java.util.List;

import dao.CurationDAO;
import dao.CurationDaoImp;
import dto.CurationDTO;

public class CurationServiceImp implements CurationService{

	String check_match_tag_store = "한식";
	String check_match_tag_gender = "0";
    String check_match_tag_age = "2";
	
	private CurationDAO cdao;
	
	public CurationServiceImp() {
		
	}
	
	public void setCdao(CurationDAO cdao) {
		this.cdao = cdao;
	}

	// 업소 태그를 받아오기 위한 메서드
	public HashMap<String, String> getStoreTag (String tag){
	
		HashMap<String, String> tags = new HashMap<String, String>();
		
		return tags;
		}

	@Override
	public List<CurationDTO> getShopInfo(CurationDTO cDto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CurationDTO> matchCheckProcess(String number) {
		return cdao.matchCheck(number);
	}
}



