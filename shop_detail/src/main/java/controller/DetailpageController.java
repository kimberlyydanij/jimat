package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dto.DetailpageDTO;
import service.DetailpageService;

//http://localhost:8090/myapp/list.do
//http://localhost:8090/myapp/detailpagemap.do

@Controller
public class DetailpageController {
	private DetailpageService service;
	private DetailpageDTO pv;
	String res_num_data;

	public DetailpageController() {

	}
	public void setService(DetailpageService service) {
		this.service = service;
	}
	
	public void setPv(DetailpageDTO pv) {
		this.pv = pv;
	}

	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public ModelAndView listMethod(DetailpageDTO pv, ModelAndView mav) {
		this.pv = new DetailpageDTO();
		List<DetailpageDTO> aList = service.listProcess(pv);
		mav.addObject("aList", aList);
		mav.setViewName("list");
		return mav;
	}// listMethod()

	@RequestMapping("/detailpage.do")
	public String detailpageMethod(HttpServletRequest httpServletRequest, Model model) {
		String latitude = httpServletRequest.getParameter("latitude");
		String longitude = httpServletRequest.getParameter("longitude");
		String foodtype = httpServletRequest.getParameter("foodtype");
		String img_url = httpServletRequest.getParameter("img_url");
		String foodstore_id = httpServletRequest.getParameter("foodstore_id");
		String foodstroe_num = httpServletRequest.getParameter("foodstroe_num");
		String road_name = httpServletRequest.getParameter("road_name");
		String rate = httpServletRequest.getParameter("rate");
		String openinghours = httpServletRequest.getParameter("openinghours");

		model.addAttribute("latitude", latitude);
		model.addAttribute("longitude", longitude);
		model.addAttribute("foodtype", foodtype);
		model.addAttribute("img_url", img_url);
		model.addAttribute("foodstore_id", foodstore_id);
		model.addAttribute("foodstroe_num", foodstroe_num);
		model.addAttribute("road_name", road_name);
		model.addAttribute("rate", rate);
		model.addAttribute("openinghours",openinghours);
		return "detailpage";
	}//detailpageMethod()
	
	@RequestMapping("/detailpage_aList.do")
	public ModelAndView detailpageMethod(DetailpageDTO pv, ModelAndView mav) {
		this.pv = new DetailpageDTO();
		List<DetailpageDTO> aList = service.list_matchProcess(res_num_data);
		mav.addObject("aList", aList);
		mav.setViewName("detailpage_aList");
		return mav;
	}//detailpageMethod()
}