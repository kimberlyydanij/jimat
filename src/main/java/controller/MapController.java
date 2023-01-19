package controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.MapDTO;
import service.MapService;

// http://localhost:8090/myapp/map.do

@Controller
public class MapController {
	private MapService service;

	public MapController() {

	}

	public void setService(MapService service) {
		this.service = service;
	}

	@RequestMapping("/map.do")
	public String mapForm() {
		return "map/map";
	}// end mapForm()

	@ResponseBody
	@RequestMapping(value = "/foodmap.do", method = RequestMethod.POST)
	public ModelAndView foodMap(int pageNo, int pageSize, String keyword, ModelAndView mav) {
		int countAll = service.f_countAllProcess(keyword);
		int totalPage = countAll / pageSize;
		if ((countAll % pageSize) > 0)
			totalPage++;

		List<MapDTO> aList = service.f_listProcess(pageNo, pageSize, keyword);
		mav.addObject("aList", aList);
		mav.addObject("pageNo", pageNo);
		mav.addObject("totalPage", totalPage);
		mav.setViewName("jsonView");
		return mav;
	}// end foodMap()

	@RequestMapping("/detailpage.do")
	public String detailpageMethod(HttpServletRequest httpServletRequest, Model model)
			throws UnsupportedEncodingException {
		String latitude = httpServletRequest.getParameter("latitude");
		String longitude = httpServletRequest.getParameter("longitude");
		String food_category = httpServletRequest.getParameter("food_category");
		String img_url = httpServletRequest.getParameter("img_url");
		String foodstore_id = httpServletRequest.getParameter("foodstore_name");
		String store_num = httpServletRequest.getParameter("store_num");
		String address = httpServletRequest.getParameter("address");
		String working_time = httpServletRequest.getParameter("working_time");
//		String rate = httpServletRequest.getParameter("rate");
		String menu_namesearch = URLDecoder.decode(httpServletRequest.getParameter("menu_namesearch"), "UTF-8");
		String menu_pricesearch = URLDecoder.decode(httpServletRequest.getParameter("menu_pricesearch"), "UTF-8");

		model.addAttribute("latitude", latitude);
		model.addAttribute("longitude", longitude);
		model.addAttribute("food_category", food_category);
		model.addAttribute("img_url", img_url);
		model.addAttribute("foodstore_name", foodstore_id);
		model.addAttribute("store_num", store_num);
		model.addAttribute("address", address);
		model.addAttribute("working_time", working_time);
//		model.addAttribute("rate", rate);
		model.addAttribute("menu_namesearch", menu_namesearch);
		model.addAttribute("menu_pricesearch", menu_pricesearch);

		return "map/detailpage";
	}//end detailpageMethod()
}
