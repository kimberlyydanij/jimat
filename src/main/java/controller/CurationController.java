package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import service.CurationServiceImp;


//http://localhost:8090/curationRow.do

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
	
	@RequestMapping(value="/curationRow.do", method=RequestMethod.GET)
	public String curationForm() {
		return "curation/curationRow";
	}
	
}
