package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dto.ShopDetailDTO;
import service.ShopDetailService;


//http://localhost:8090/shopdetail.do

@Controller
public class ShopDetailController {

	private ShopDetailService sservice;
	private ShopDetailDTO sDTO;
	int storeIDQuery;
	
	public ShopDetailController() {
		
	}

	public void setSservice(ShopDetailService sservice) {
		this.sservice = sservice;
	}

	public void setsDTO(ShopDetailDTO sDTO) {
		this.sDTO = sDTO;
	}

	public int main(@RequestParam(value="page") int qdata) {
		storeIDQuery = qdata; 
		return qdata;
	}
	 
 
	@RequestMapping(value="shopdetail.do", method=RequestMethod.GET)
	public ModelAndView shopDetailBody(HttpServletRequest request, String shopDetail_num, ShopDetailDTO sDTO, ModelAndView mav) {
		//String qdata = request.getParameter("shopDetail_num");
		//this.sDTO = new ShopDetailDTO();
		//System.out.println("qdata : " + qdata);
		ShopDetailDTO adto = sservice.shopDetailData(shopDetail_num);
		mav.addObject("adto", adto);
		mav.setViewName("mainPage/shopDetail");
		return mav;
	}
	   
	 
}
