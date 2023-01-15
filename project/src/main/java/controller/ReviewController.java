package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dto.PageDTO;
import dto.ReviewDTO;
import service.ReviewService;

@Controller
public class ReviewController {

	private ReviewService service;
	private PageDTO pdto;
	private int currentPage;
	
	public ReviewController() {

	}
	
	public void setService(ReviewService service) {
		this.service = service;
	}
	
//	//http://localhost:8090/list.do
//	@RequestMapping(value="list.do")
//	public ModelAndView listMethod(PageDTO pv, ModelAndView mav) {
//		int totalRecord = service.countProcess();
//		if(totalRecord>=1) {
//			if(pv.getCurrentPage() == 0)
//				this.currentPage = 1;
//			else
//				this.currentPage = pv.getCurrentPage();
//			
//			this.pdto = new PageDTO(this.currentPage, totalRecord);
//			List<ReviewDTO> aList = service.listProcess(pdto.getStartRow(), pdto.getEndRow(), review_foodstore_seq);
//			mav.addObject("aList", aList);
//			mav.addObject("pv", this.pdto);
//		}
//		mav.setViewName("review/list");
//		return mav;
//	}
	
	
	//sql 전체 리뷰 데이터를 테이블로 확인
	//http://localhost:8090/test.do
	@RequestMapping(value="test.do", method=RequestMethod.GET)
	public ModelAndView check_list(ReviewDTO dto, ModelAndView mav) {
		System.out.println("find_review_allprocess : OK");
		List<ReviewDTO> alist = service.find_review_allProcess();
		List<String> alist_write_date = new ArrayList<String>();
		
		for(ReviewDTO roll:alist) {
			String[] convert_list1 = roll.getReview_write_date().split("/");
			alist_write_date.add(convert_list1[0] +"년 " + convert_list1[1] + "월 " + convert_list1[2] + "일");
		}
		
		mav.addObject("alist", alist);
		mav.addObject("alist_write_date", alist_write_date);
		mav.setViewName("review/test");
		return mav;
	}
	
	//유저 아이디를 통해 유저가 쓴 리뷰를 확인
	//http://localhost:8090/reviewlist.do
	@RequestMapping(value="reviewlist.do", method=RequestMethod.GET)
	public String search_review_user( ) {
		return "review/review";
	}
	
	//http://localhost:8090/reviewlist.do
	@RequestMapping(value="reviewlist.do", method=RequestMethod.POST)
	public ModelAndView review_user_list(String review_writer_id, ReviewDTO dto, ModelAndView mav) {
		System.out.println("find_user_review");
		List<ReviewDTO> aList = service.find_review_userProcess(review_writer_id);
		List<String> alist_write_date = new ArrayList<String>();
		
		for(ReviewDTO roll:aList) {
			String[] convert_list1 = roll.getReview_write_date().split("/");
			alist_write_date.add(convert_list1[0] +"년 " + convert_list1[1] + "월 " + convert_list1[2] + "일");
		}
		
		mav.addObject("aList", aList);
		mav.addObject("alist_write_date", alist_write_date);
		mav.setViewName("review/review");
		return mav;
	}
	
	//리뷰 번호를 통해 리뷰 확인
	//http://localhost:8090/reviewlist2.do
	@RequestMapping(value="reviewlist2.do", method=RequestMethod.GET)
	public String search_review_number( ) {
		return "review/review2";
	}
	
	//http://localhost:8090/reviewlist2.do
	@RequestMapping(value="reviewlist2.do", method=RequestMethod.POST)
	public ModelAndView review_number(int review_seq, ModelAndView mav, ReviewDTO dto) {
		ReviewDTO list_review_number = service.find_review_numberProcess(review_seq);
		String alist_write_date = "";
		String[] convert_list1 = list_review_number.getReview_write_date().split("/");
		alist_write_date = convert_list1[0] +"년 " + convert_list1[1] + "월 " + convert_list1[2] + "일";
		
		mav.addObject("list_review_number", list_review_number);
		mav.addObject("alist_write_date", alist_write_date);
		mav.setViewName("review/review2");
		return mav;
	}
	
	//페이지 번호를 통해 페이지에 있는 리뷰를 확인
	//http://localhost:8090/reviewlist3.do
	@RequestMapping(value="reviewlist3.do", method=RequestMethod.GET)
	public String review_page_search() {
		return "review/review3";
	}
	
	//http://localhost:8090/reviewlist3.do
	@RequestMapping(value="reviewlist3.do", method=RequestMethod.POST)
	public ModelAndView review_page_list(int review_foodstore_seq, ReviewDTO dto, ModelAndView mav) {
		List<ReviewDTO> page_review = service.find_review_pageProcess(review_foodstore_seq);
		List<String> alist_write_date = new ArrayList<String>();
		
		for(ReviewDTO aList:page_review) {
			String[] convert_list1 = aList.getReview_write_date().split("/");
			alist_write_date.add(convert_list1[0] +"년 " + convert_list1[1] + "월 " + convert_list1[2] + "일");
		}
		mav.addObject("aList", page_review);
		mav.addObject("alist_write_date", alist_write_date);
		mav.setViewName("review/review3");
		return mav;
	}
	
	//review 작성을 위한 form으로 연결
	//http://localhost:8090/reviewform.do
	@RequestMapping(value="reviewform.do", method=RequestMethod.GET)
	public String review_write() {
		return "review/reviewform";
	}
	
	//review 작성후 페이지로 리턴
	//http://localhost:8090/reviewform.do
	@RequestMapping(value="reviewform.do", method=RequestMethod.POST)
	public String review_writePro(ReviewDTO dto) {
		service.review_writeProcess(dto);
		return "redirect:/review_page.do";
	}
	
	//해당 페이지(review_foodstore_seq)내에 리뷰를 보여준다.
	//http://localhost:8090/review_page.do
	@RequestMapping(value="review_page.do")
	public ModelAndView review_page(ReviewDTO dto, PageDTO pv, ModelAndView mav) {
		int review_foodstore_seq = 2;
		
		int totalRecord = service.countProcess(review_foodstore_seq);
		if(totalRecord>=1) {
			if(pv.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = pv.getCurrentPage();
			
			pdto = new PageDTO(currentPage, totalRecord);
			List<ReviewDTO> aList = service.listProcess(pdto.getStartRow(), pdto.getEndRow(), review_foodstore_seq);
			List<String> alist_write_date = new ArrayList<String>();
			for(ReviewDTO review_list:aList) {
				String[] convert_list1 = review_list.getReview_write_date().split("/");
				alist_write_date.add(convert_list1[0] +"년 " + convert_list1[1] + "월 " + convert_list1[2] + "일");
			}
			mav.addObject("aList", aList);
			mav.addObject("alist_write_date", alist_write_date);
			mav.addObject("pv", pdto);
			mav.setViewName("review/review_test");
		}	
		
		return mav;
	}
	
	//review 수정을 위한 페이지 이동 전 수정 리뷰 정보를 받아서 리뷰 작성 페이지에 전달
	@RequestMapping(value="review_update_form.do")
	public ModelAndView review_update_form(ModelAndView mav, HttpServletRequest httpServletRequest) {
		int review_edit_num = (int) Integer.parseInt(httpServletRequest.getParameter("review_edit_num"));
		ReviewDTO rDto = service.find_review_numberProcess(review_edit_num);
		mav.addObject("review_dto", rDto);
		mav.setViewName("review/reviewform2");
		return mav;
	}
	
	//review 수정 후 원래 페이지로 이동
	@RequestMapping(value="review_update.do", method=RequestMethod.POST)
	public String review_update(ReviewDTO dto) {
		service.review_updateProcess(dto);
		return "redirect:/review_page.do";
	}
	
	//review 삭제 후 원래 페이지로 이동
	@RequestMapping(value="review_delete.do")
	public String review_delete(HttpServletRequest httpServletRequest) {
		int review_delete_num = (int) Integer.parseInt(httpServletRequest.getParameter("review_delete_num"));
		service.review_deleteProcess(review_delete_num);
		return "redirect:/review_page.do";
	}
}   
 