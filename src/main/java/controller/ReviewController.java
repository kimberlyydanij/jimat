package controller;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dto.PageDTO;
import dto.ReviewDTO;
import service.ReviewService;

@Controller
public class ReviewController {

	private ReviewService service;
	private ReviewDTO rdto;
	private PageDTO pdto;
	private int currentPage;
	
	public ReviewController() {

	}
	
	public void setService(ReviewService service) {
		this.service = service;
	}
	
	//http://localhost:8090/myapp/list.do
	@RequestMapping(value="list.do")
	public ModelAndView listMethod(PageDTO pv, ModelAndView mav) {
		int totalRecord = service.countProcess();
		if(totalRecord>=1) {
			if(pv.getCurrentPage() == 0)
				this.currentPage = 1;
			else
				this.currentPage = pv.getCurrentPage();
			
			this.pdto = new PageDTO(this.currentPage, totalRecord);
			List<ReviewDTO> aList = service.listProcess(pdto);
			mav.addObject("aList", aList);
			mav.addObject("pv", this.pdto);
		}
		mav.setViewName("review/list");
		return mav;
	}
	
	//http://localhost:8090/myapp/test.do
	@RequestMapping(value="test.do", method=RequestMethod.GET)
	public ModelAndView check_list(ReviewDTO dto, ModelAndView mav) {
		System.out.println("find_review_allprocess : OK");
		List<ReviewDTO> alist = service.find_review_allProcess();
		List<String> alist_write_date = new ArrayList<String>();
//		List<String> alist_update_date = new ArrayList<String>();
		
		for(ReviewDTO roll:alist) {
			String[] convert_list1 = roll.getReview_write_date().split("/");
//			String[] convert_list2 = roll.getReview_update_date().split("/");
			alist_write_date.add(convert_list1[0] +"년 " + convert_list1[1] + "월 " + convert_list1[2] + "일");
//			alist_write_date.add(convert_list2[0] +"년 " + convert_list2[1] + "월 " + convert_list2[2] + "일");			
		}
		
		mav.addObject("alist", alist);
		mav.addObject("alist_write_date", alist_write_date);
//		mav.addObject("alist_update_date", alist_write_date);
		mav.setViewName("review/test");
		return mav;
	}
	
	//http:localhost:8090/myapp/reviewlist.do
	@RequestMapping(value="reviewlist.do", method=RequestMethod.GET)
	public String search_review_user( ) {
		return "review/review";
	}
	
	//http:localhost:8090/myapp/reviewlist2.do
	@RequestMapping(value="reviewlist2.do", method=RequestMethod.GET)
	public String search_review_number( ) {
		return "review/review2";
	}
	
	//http:localhost:8090/myapp/reviewlist.do
	@RequestMapping(value="reviewlist.do", method=RequestMethod.POST)
	public ModelAndView review_user_list(String review_writer_id, ReviewDTO dto, ModelAndView mav) {
		System.out.println("find_user_review");
//		System.out.println("review_writer_id :" +review_writer_id);
		List<ReviewDTO> aList = service.find_review_userProcess(review_writer_id);
//		System.out.println(aList);
		List<String> alist_write_date = new ArrayList<String>();
//		List<String> alist_update_date = new ArrayList<String>();
		
		for(ReviewDTO roll:aList) {
			String[] convert_list1 = roll.getReview_write_date().split("/");
//			String[] convert_list2 = roll.getReview_update_date().split("/");
			alist_write_date.add(convert_list1[0] +"년 " + convert_list1[1] + "월 " + convert_list1[2] + "일");
//			alist_write_date.add(convert_list2[0] +"년 " + convert_list2[1] + "월 " + convert_list2[2] + "일");			
		}
		
		mav.addObject("aList", aList);
		mav.addObject("alist_write_date", alist_write_date);
//		mav.addObject("alist_update_date", alist_write_date);
		mav.setViewName("review/review");
		return mav;
	}
	
	//http://localhost:8090/myapp/reviewlist2.do
	@RequestMapping(value="reviewlist2.do", method=RequestMethod.POST)
	public ModelAndView review_number(int review_seq, ModelAndView mav, ReviewDTO dto) {
		System.out.println("find_review_number");
		ReviewDTO list_review_number = service.find_review_numberProcess(review_seq);
		String alist_write_date = "";
		String[] convert_list1 = list_review_number.getReview_write_date().split("/");
//		String[] convert_list2 = roll.getReview_update_date().split("/");
		alist_write_date = convert_list1[0] +"년 " + convert_list1[1] + "월 " + convert_list1[2] + "일";
//		alist_write_date = convert_list2[0] +"년 " + convert_list2[1] + "월 " + convert_list2[2] + "일";			
		
		mav.addObject("list_review_number", list_review_number);
		mav.addObject("alist_write_date", alist_write_date);
//		mav.addObject("alist_update_date", alist_write_date);
		mav.setViewName("review/review2");
		return mav;
	}
	
	//http://localhost:8090/myapp/review_page_search.do
	@RequestMapping(value="review_page_search.do")
	public String review_page_search() {
		return "review/pagesearch";
	}
	
	//http://localhost:8090/myapp/review_page_list.do
	@RequestMapping(value="review_page_list.do", method=RequestMethod.GET)
	public ModelAndView review_page_list(HttpServletRequest httpServletRequest, ReviewDTO dto, ModelAndView mav) {
		System.out.println("find_page_review");
		int review_main_number = Integer.parseInt(httpServletRequest.getParameter("review_main_number"));
		ReviewDTO aList = service.find_review_numberProcess(review_main_number);
		List<String> alist_write_date = new ArrayList<String>();
//		List<String> alist_update_date = new ArrayList<String>();
		
			String[] convert_list1 = aList.getReview_write_date().split("/");
//			String[] convert_list2 = aList.getReview_update_date().split("/");
			alist_write_date.add(convert_list1[0] +"년 " + convert_list1[1] + "월 " + convert_list1[2] + "일");
//			alist_write_date.add(convert_list2[0] +"년 " + convert_list2[1] + "월 " + convert_list2[2] + "일");			
		
		mav.addObject("aList", aList);
		mav.addObject("alist_write_date", alist_write_date);
//		mav.addObject("alist_update_date", alist_write_date);
		mav.setViewName("review3");
		return mav;
	}
	
	//http://localhost:8090/myapp/reviewform.do
	@RequestMapping(value="reviewform.do", method=RequestMethod.GET)
	public String review_write() {
		return "review/reviewform";
	}
	
	@RequestMapping(value="review_write.do", method=RequestMethod.POST)
	public String review_writePro(HttpServletRequest httpServletRequest) {
		System.out.println("review_write");
		
		String review_writer_id = httpServletRequest.getParameter("review_writer_id");
		String review_content = httpServletRequest.getParameter("review_content");
		int review_foodstore_seq = Integer.parseInt(httpServletRequest.getParameter("review_main_number"));
		int review_read_count_number = Integer.parseInt(httpServletRequest.getParameter("review_read_count_number"));
		int review_good_number = Integer.parseInt(httpServletRequest.getParameter("review_good_number"));
		
		
		rdto.setReview_writer_id(review_writer_id);
		rdto.setReview_content(review_content);
		rdto.setReview_foodstore_seq(review_foodstore_seq);
		rdto.setReview_good_number(review_good_number);
		
		service.review_writeProcess(rdto);
		System.out.println("review_write_insert_success");

		return "redirect:/test.do";
	}
	
	
}   
 