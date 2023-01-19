package service;

import java.net.http.HttpRequest;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.tiles.request.Request;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.annotation.SessionScope;

import dao.CurationDAO;
import dao.CurationDaoImp;
import dto.CurationDTO;

public class CurationServiceImp implements CurationService{
// <<<<<<< HEAD
//=======  

	
	int check_match_tag_id;

//>>>>>>> 143a2abbf79de6ef52ec445e84e6f78570df2bbb
	
	private CurationDAO cdao;
	
	public CurationServiceImp() {
		
	}
	
	public void setCdao(CurationDAO cdao) {
		this.cdao = cdao;
	}


	@Override
	public List<CurationDTO> matchCheckProcess(int number) {
		return cdao.matchCheck(number);
	}

	@Override
	public List<CurationDTO> loginMatchCheckProcess(String number, String age, String gender) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		//String kAge = SessionScope.session_age_range;
		//String kGender = SessionScope.session_gender;
		
		//HttpSession ss = req.getSession();
		
		map.put("number", number);
		map.put("age", age);
		map.put("gender", gender);
		
		System.out.println(map.get("number"));
		System.out.println(map.get("age"));
		System.out.println(map.get("gender"));
		
		return cdao.loginMatchCheck(map);
	}

}



