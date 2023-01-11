package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import service.CurationServiceImp;


//http://localhost:8090/myapp/curationRow.do

@Controller
public class CurationController {
	
	public CurationController() {
		
	}
	
	private CurationServiceImp cs;

	public CurationServiceImp getCs() {
		return cs;
	}

	public void setCs(CurationServiceImp cs) {
		this.cs = cs;
	}
	
	@RequestMapping("/curationRow.do")
	public String curationFrom() {
		return "curation/curationRow";
	}
	
}
