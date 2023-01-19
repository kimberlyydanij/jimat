package controller;


import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.CurationDTO;
import service.CurationService;
import service.MemberService;
import dao.MemberDaoImpl;
import dto.KakaoDTO;
import service.MemberService;


//http://localhost:8090/curationrow.do
//http://localhost:8090/index.do
@Controller
public class CurationController2 {
	
	private CurationService cservice;
	private CurationDTO cDTO;
	private MemberService kms;
	private KakaoDTO kdto;

			
	public CurationController2() {
		
	}

	public void setCservice(CurationService cservice) {
		this.cservice = cservice;
	}

	public void setcDTO(CurationDTO cDTO) {
		this.cDTO = cDTO;
	}
	
	public void setMs(MemberService kms) {
		this.kms = kms;
	}
	
    public KakaoDTO getKdto() {
		return kdto;
	}

	@RequestMapping(value="/index.do")
	public ModelAndView indexBody(CurationDTO cDTO, ModelAndView mav, HttpSession session, HttpServletRequest request) {

		String sessionId = (String) session.getAttribute("sessionId");
		String sessionAgeRange = (String) session.getAttribute("session_age_range");
		String sessionGender = (String) session.getAttribute("session_gender");

		if (sessionId != null && sessionId != "")
		{
			int randomTagNo = 1+ (int)((Math.random()*1000)%17);

			this.cDTO = new CurationDTO();
			List<CurationDTO> aList = cservice.loginMatchCheckProcess(Integer.toString(randomTagNo), sessionAgeRange.substring(0, 2) + "%", sessionGender);
			mav.addObject("aList", aList);
			mav.setViewName("mainPage/index");


		} else {
			
		int randomTagNo = 1+ (int)((Math.random()*1000)%17);

			this.cDTO = new CurationDTO();
			List<CurationDTO> aList = cservice.matchCheckProcess(randomTagNo);
			mav.addObject("aList", aList);
			mav.setViewName("mainPage/index");
		//}
		
		}
		return mav;
	}


//	@RequestMapping(value="/curationrow.do", method=RequestMethod.GET)
//	public String curationForm() {
//		return "curation/curationrow";
//	}
	//http://localhost:8090/curationrow.do
	@RequestMapping(value="/curationrow.do")
	public ModelAndView curationRowBody(CurationDTO cDTO, ModelAndView mav) {
        int randomTagNo = 1 + (int)((Math.random()*1000)%17);
		
		this.cDTO = new CurationDTO();
		int inc = 0;
		List<CurationDTO> aList = cservice.matchCheckProcess(randomTagNo);
		while (aList.size() == 0)
			aList = cservice.matchCheckProcess(randomTagNo + (++inc));

		mav.addObject("aList", aList);
		mav.setViewName("curation/curationrow");
		
		return mav;
	}
	
	@RequestMapping(value="/curation.do")
	public ModelAndView curationBody(CurationDTO cDTO, ModelAndView mav) {
		int randomTagNo = 1 + (int)((Math.random()*1000)%17);
		
		this.cDTO = new CurationDTO();
		int inc = 0;
		
		List<CurationDTO> aList0 = cservice.matchCheckProcess(randomTagNo);
		while (aList0.size() == 0)
			aList0 = cservice.matchCheckProcess(randomTagNo + (++inc));
		
		List<CurationDTO> aList1 = cservice.matchCheckProcess((randomTagNo + (++inc)) % 17);
		while (aList1.size() == 0)
			aList1 = cservice.matchCheckProcess(randomTagNo + (++inc));
		
		List<CurationDTO> aList2 = cservice.matchCheckProcess((randomTagNo + (++inc)) % 17);
		while (aList2.size() == 0)
			aList2 = cservice.matchCheckProcess(randomTagNo + (++inc));

		List<CurationDTO> aList3 = cservice.matchCheckProcess((randomTagNo + (++inc)) % 17);
		while (aList3.size() == 0)
			aList3 = cservice.matchCheckProcess(randomTagNo + (++inc));
		
		List<CurationDTO> aList4 = cservice.matchCheckProcess((randomTagNo + (++inc)) % 17);
		while (aList4.size() == 0)
			aList4 = cservice.matchCheckProcess(randomTagNo + (++inc));

		mav.addObject("aList0", aList0);
		mav.addObject("aList1", aList1);
		mav.addObject("aList2", aList2);
		mav.addObject("aList3", aList3);
		mav.addObject("aList4", aList4);
		mav.setViewName("curation/curation");
		
		return mav;
	}
	
	}
