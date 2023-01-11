package service;

import java.util.HashMap;
import dao.CurationDaoImp;

public class CurationServiceImp {

	String check_match_tag_store = "한식";
	int check_match_tag_gender = 0;
	int check_match_tag_age = 2;
	
	private CurationDaoImp cr;
	
	public CurationServiceImp() {
		
	}
	
	public void setCr(CurationDaoImp cr) {
		this.cr = cr;
	}
		
	public CurationDaoImp getCr() {
		return cr;
	}

	
	// 업소 태그를 받아오기 위한 메서드
	public HashMap<String, String> getStoreTag (String tag){
	
		HashMap<String, String> tags = new HashMap<String, String>();
		
		return tags;
		}
}



