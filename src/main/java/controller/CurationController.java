package controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.CurationDTO;
import service.CurationService;
import dto.KakaoDTO;

//http://curationrow.do
//http://localhost:8090/curation.do
//http://localhost:8090/index.do

@Controller
public class CurationController {

	private CurationService cservice;
	private CurationDTO cDTO;
	private KakaoDTO kdto;

	public CurationController() {

	}

	public void setCservice(CurationService cservice) {
		this.cservice = cservice;
	}

	public void setcDTO(CurationDTO cDTO) {
		this.cDTO = cDTO;
	}

	public KakaoDTO getKdto() {
		return kdto;
	}

	@RequestMapping(value = "/index.do")
	public ModelAndView indexBody(CurationDTO cDTO, ModelAndView mav, HttpSession session, HttpServletRequest request) {

		String sessionId = (String) session.getAttribute("sessionId");
		if (sessionId != null)
			System.out.println("sessionId = " + sessionId);
		String sessionAgeRange = (String) session.getAttribute("session_age_range");
		if (sessionAgeRange != null)
			System.out.println("sessionAgeRange = " + sessionAgeRange.substring(0, 2));
		String sessionGender = (String) session.getAttribute("session_gender");
		if (sessionGender != null)
			System.out.println("sessionGender = " + sessionGender);

		if (sessionId != null && sessionId != "") {
			System.out.println("LOGIN SESSION");

			int randomTagNo = 1 + (int) ((Math.random() * 1000) % 13);

			this.cDTO = new CurationDTO();
			List<CurationDTO> aList = null;
			if (sessionAgeRange != null && sessionGender != null) {
				aList = cservice.loginMatchCheckProcess(Integer.toString(randomTagNo), sessionAgeRange.substring(0, 2),
						sessionGender);
				System.out.println("aList.size = " + aList.size());
			} else {
				System.out.println("aList.size = -1");
			}
			mav.addObject("aList", aList);
			mav.setViewName("mainPage/index");

		} else {
			System.out.println("LOGOUT SESSION");

			int randomTagNo = 1 + (int) ((Math.random() * 1000) % 17);

			this.cDTO = new CurationDTO();
			List<CurationDTO> aList = cservice.matchCheckProcess(randomTagNo);
			mav.addObject("aList", aList);
			mav.setViewName("mainPage/index");
			// }

		}
		return mav;
	}

//  여기부터 수정

	@RequestMapping(value = "/curationrow.do")
	public ModelAndView curationRowBody(CurationDTO cDTO, ModelAndView mav, HttpSession session,
			HttpServletRequest request) {

		String sessionId = (String) session.getAttribute("sessionId");
		if (sessionId != null)
			System.out.println("sessionId = " + sessionId);
		String sessionAgeRange = (String) session.getAttribute("session_age_range");
		if (sessionAgeRange != null)
			System.out.println("sessionAgeRange = " + sessionAgeRange.substring(0, 2));
		String sessionGender = (String) session.getAttribute("session_gender");
		if (sessionGender != null)
			System.out.println("sessionGender = " + sessionGender);

		if (sessionId != null && sessionId != "") {
			System.out.println("LOGIN SESSION");

			int randomTagNo = 1 + (int) ((Math.random() * 1000) % 13);

			this.cDTO = new CurationDTO();
			List<CurationDTO> aList = null;

			if (sessionAgeRange != null && sessionGender != null) {
				aList = cservice.loginMatchCheckProcess(Integer.toString(randomTagNo), sessionAgeRange.substring(0, 2),
						sessionGender);
				System.out.println("aList.size = " + aList.size());
			} else {
				System.out.println("aList.size = -1");
			}

			mav.addObject("aList", aList);
			mav.setViewName("mainPage/index");

		} else {
			System.out.println("LOGOUT SESSION");

			int randomTagNo = 1 + (int) ((Math.random() * 1000) % 13);
			
			this.cDTO = new CurationDTO();
			List<CurationDTO> aList = cservice.matchCheckProcess(randomTagNo);
			mav.addObject("aList", aList);
			mav.setViewName("mainPage/index");
			// }

		}
		return mav;
	}

	@RequestMapping(value = "/curation.do")
	public ModelAndView curationBody(CurationDTO cDTO, ModelAndView mav, HttpSession session,
			HttpServletRequest request) {
		
		// 세션값 저장
				String sessionId = (String) session.getAttribute("sessionId");
				if (sessionId != null)
					System.out.println("sessionId = " + sessionId);
				String sessionAgeRange = (String) session.getAttribute("session_age_range");
				if (sessionAgeRange != null)
					System.out.println("sessionAgeRange = " + sessionAgeRange.substring(0, 2));
				String sessionGender = (String) session.getAttribute("session_gender");
				if (sessionGender != null)
					System.out.println("sessionGender = " + sessionGender);

				// 로그인 여부 확인
					if (sessionAgeRange != null && sessionGender != null) {
						System.out.println("LOGIN SESSION");
						
						int randomTagNo = 1 + (int) ((Math.random() * 1000) % 13);

						this.cDTO = new CurationDTO();
						int inc = 0;
						
						List<CurationDTO> aList0 = cservice.loginMatchCheckProcess(Integer.toString(randomTagNo),
								sessionAgeRange.substring(0, 2), sessionGender);
						List<CurationDTO> aList1 = cservice.loginMatchCheckProcess(Integer.toString((randomTagNo + (++inc))),
								sessionAgeRange.substring(0, 2), sessionGender);
						List<CurationDTO> aList2 = cservice.loginMatchCheckProcess(Integer.toString((randomTagNo + (++inc))),
								sessionAgeRange.substring(0, 2), sessionGender);
						List<CurationDTO> aList3 = cservice.loginMatchCheckProcess(Integer.toString((randomTagNo + (++inc))),
								sessionAgeRange.substring(0, 2), sessionGender);
						List<CurationDTO> aList4 = cservice.loginMatchCheckProcess(Integer.toString((randomTagNo + (++inc))),
								sessionAgeRange.substring(0, 2), sessionGender);

						mav.addObject("aList0", aList0);
						mav.addObject("aList1", aList1);
						mav.addObject("aList2", aList2);
						mav.addObject("aList3", aList3);
						mav.addObject("aList4", aList4);
						mav.setViewName("curation/curation");
						
						System.out.println("로그인 끝");

						// login session 끝

					} else if(sessionAgeRange == null && sessionGender == null)  {
						System.out.println("LOGOUT SESSION");
						
						int randomTagNo = 1 + (int) ((Math.random() * 1000) % 13);

						this.cDTO = new CurationDTO();
						int inc = 0;

						List<CurationDTO> aList0 = cservice.matchCheckProcess(randomTagNo);
						List<CurationDTO> aList1 = cservice.matchCheckProcess((randomTagNo + (++inc)));
						List<CurationDTO> aList2 = cservice.matchCheckProcess((randomTagNo + (++inc)));
						List<CurationDTO> aList3 = cservice.matchCheckProcess((randomTagNo + (++inc)));
						List<CurationDTO> aList4 = cservice.matchCheckProcess((randomTagNo + (++inc)));

						mav.addObject("aList0", aList0);
						mav.addObject("aList1", aList1);
						mav.addObject("aList2", aList2);
						mav.addObject("aList3", aList3);
						mav.addObject("aList4", aList4);
						mav.setViewName("curation/curation");
						
						System.out.println("비로그인 끝");
						
					}
				
				return mav;
			} // end method

	// http://localhost:8090/magazine-korea-drink.do
	@RequestMapping(value = "/magazine-korea-drink.do")
	public ModelAndView magazineBody0(CurationDTO cDTO, ModelAndView mav) {

		this.cDTO = new CurationDTO();
		List<CurationDTO> aList = cservice.magazineCheckProcess(24);
		mav.addObject("aList", aList);
		mav.setViewName("magazine/magazine-korea-drink");

		return mav;
	}

	// http://localhost:8090/magazine-garosu.do
	@RequestMapping(value = "/magazine-garosu.do")
	public ModelAndView magazineBody1(CurationDTO cDTO, ModelAndView mav) {

		this.cDTO = new CurationDTO();
		List<CurationDTO> aList = cservice.magazineCheckProcess(21);

		mav.addObject("aList", aList);
		mav.setViewName("magazine/magazine-garosu");

		return mav;
	}

	// http://localhost:8090/magazine-garosu.do
	@RequestMapping(value = "/magazine-macandcheese.do")
	public ModelAndView magazineBody2(CurationDTO cDTO, ModelAndView mav) {

		this.cDTO = new CurationDTO();
		List<CurationDTO> aList = cservice.magazineCheckProcess(23);

		mav.addObject("aList", aList);
		mav.setViewName("magazine/magazine-macandcheese");

		return mav;

	}

	// http://localhost:8090/magazine-porkcutlet.do
	@RequestMapping(value = "/magazine-porkcutlet.do")
	public ModelAndView magazineBody3(CurationDTO cDTO, ModelAndView mav) {

		this.cDTO = new CurationDTO();
		List<CurationDTO> aList = cservice.magazineCheckProcess(22);

		mav.addObject("aList", aList);
		mav.setViewName("magazine/magazine-porkcutlet");

		return mav;

	}
}