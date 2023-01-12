package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dto.CurationDTO;
import service.CurationService;
import service.CurationServiceImp;


//http://localhost:8090/curationrow.do

@Controller
public class CurationController {
	
	private CurationService cservice;
	private CurationDTO cDTO;
	int randomTag;
			
	public CurationController() {
		
	}

	public void setCservice(CurationService cservice) {
		this.cservice = cservice;
	}

	public void setcDTO(CurationDTO cDTO) {
		this.cDTO = cDTO;
	}

	@RequestMapping(value="/index.do")
	public ModelAndView indexBody(CurationDTO cDTO, ModelAndView mav) {
//		int randomTagNo = (int)((Math.random()*10000)%10);
		String randomTagNo = "1";
		System.out.println(randomTagNo);
		
		this.cDTO = new CurationDTO();
		List<CurationDTO> aList = cservice.matchCheckProcess(randomTagNo);
		mav.addObject("aList", aList);
		mav.setViewName("mainPage/index");
		
		return mav;
	}


//	@RequestMapping(value="/curationrow.do", method=RequestMethod.GET)
//	public String curationForm() {
//		return "curation/curationrow";
//	}
	//http://localhost:8090/curationrow.do
	@RequestMapping(value="/curationrow.do")
	public ModelAndView curationBody(CurationDTO cDTO, ModelAndView mav) {
//		int randomTagNo = (int)((Math.random()*10000)%10);
		String randomTagNo = "1";
		System.out.println(randomTagNo);
		
		this.cDTO = new CurationDTO();
		List<CurationDTO> aList = cservice.matchCheckProcess(randomTagNo);
		mav.addObject("aList", aList);
		mav.setViewName("curation/curationrow");
		
		return mav;
	}
	
}
