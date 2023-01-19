package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
	
	@RequestMapping(value="review_basic.do", method=RequestMethod.GET)
	public String basic_page() {
		return "review/basic";
	}
	
	//해당 페이지(review_foodstore_seq)내에 리뷰를 보여준다.
	//http://localhost:8090/review_page.do
	@RequestMapping(value="review_page.do", method=RequestMethod.GET)
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
			List<String> review_image_list = new ArrayList<String>();
			for(ReviewDTO review_list:aList) {
				String[] convert_list1 = review_list.getReview_write_date().split("/");
				alist_write_date.add(convert_list1[0] +"년 " + convert_list1[1] + "월 " + convert_list1[2] + "일");
				
				review_image_list.add(service.review_imageProcess(review_list.getReview_writer_id()));
			}
			mav.addObject("aList", aList);
			mav.addObject("alist_write_date", alist_write_date);
			mav.addObject("review_image_list", review_image_list);
			mav.addObject("pv", pdto);
			mav.setViewName("review/review");
		}	
		
		return mav;
	}
	
	//review 작성을 위한 form으로 연결
	//http://localhost:8090/reviewform.do
	@RequestMapping(value="reviewform.do", method=RequestMethod.GET)
	public String review_write() {
		return "review/review_form";
	}
	
	//review 작성후 페이지로 리턴
	//http://localhost:8090/reviewform.do
	@RequestMapping(value="reviewform.do", method=RequestMethod.POST)
	public String review_writePro(HttpServletRequest request, ReviewDTO dto) {
		MultipartFile file = dto.getFilename();
		System.out.println("file : " + file);
		System.out.println("review_content : " + dto.getReview_content());

		if(!file.isEmpty()) {
			UUID random = save_copy_file(file, request);
			dto.setReview_upload(random + "_" + file.getOriginalFilename());
		}
		
		service.review_writeProcess(dto);
		return "redirect:/review_page.do";
	}
	
	//review 수정을 위한 페이지 이동 전 수정 리뷰 정보를 받아서 리뷰 작성 페이지에 전달
	@RequestMapping(value="review_update_form.do")
	public ModelAndView review_update(ModelAndView mav, HttpServletRequest request) {
		int review_edit_num = (int) Integer.parseInt(request.getParameter("review_edit_num"));
		ReviewDTO rDto = service.find_review_numberProcess(review_edit_num);
		mav.addObject("review_dto", rDto);
		mav.setViewName("review/review_update_form");
		return mav;
	}
	
	//review 수정 후 원래 페이지로 이동
	@RequestMapping(value="review_update.do", method=RequestMethod.POST)
	public String review_updatePro(ReviewDTO dto, HttpServletRequest request) {
		MultipartFile file = dto.getFilename();
//		System.out.println("file : " + file);
//		System.out.println("review_content : " + dto.getReview_content());
		if(!file.isEmpty()) {
			UUID random = save_copy_file(file, request);
			dto.setReview_upload(random + "_" + file.getOriginalFilename());
		}
		service.review_updateProcess(dto, urlPath(request));
		return "redirect:/review_page.do";
	}
	
	//review 삭제 후 원래 페이지로 이동
	@RequestMapping(value="review_delete.do")
	public String review_deletePro(HttpServletRequest request) {
		int review_delete_num = (int) Integer.parseInt(request.getParameter("review_delete_num"));
			
		service.review_deleteProcess(review_delete_num, urlPath(request));
		return "redirect:/review_page.do";
	}
	
	private UUID save_copy_file(MultipartFile file, HttpServletRequest request) {
		String fileName = file.getOriginalFilename();
		
		//중복파일명을 처리하기 위해 난수 발생
		UUID random = UUID.randomUUID();
		File fe = new File(urlPath(request));
		if(!fe.exists()) {
			fe.mkdir();
		}
		
		//중복이 되지 않게 난수값을 붙여서 저장
		File ff = new File(urlPath(request), random + "_" + fileName);
		try {
			FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return random;
	}//end saveCopyFile()
	
	private String urlPath(HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("/");
		String saveDirectory = root + "resources" + File.separator + "images" + File.separator + "reviews" + File.separator;
		return saveDirectory;
	}//end urlPath()
}   
 