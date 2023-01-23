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
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.PageDTO;
import dto.ReviewDTO;
import dto.ShopDetailDTO;
import service.ShopDetailService;


//http://localhost:8090/shopdetail.do

@Controller
public class ShopDetailController {

	private ShopDetailService sservice;
	private ShopDetailDTO sDTO;
	int storeIDQuery;
	private PageDTO pdto;
	private int currentPage;

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
	public ModelAndView shopDetailBody(HttpServletRequest request, String shopDetail_num, ShopDetailDTO sDTO, ModelAndView mav, PageDTO pv) {
		//String qdata = request.getParameter("shopDetail_num");
		//this.sDTO = new ShopDetailDTO();
		//System.out.println("qdata : " + qdata);
		ShopDetailDTO adto = sservice.shopDetailData(shopDetail_num);
		String review_foodstore_seq = shopDetail_num;

		int totalRecord = sservice.countProcess(review_foodstore_seq);

		if(totalRecord>=1) {
			if(pv.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = pv.getCurrentPage();

			pdto = new PageDTO(currentPage, totalRecord);
			List<ReviewDTO> aList = sservice.listProcess(pdto.getStartRow(), pdto.getEndRow(), review_foodstore_seq);
			List<String> alist_write_date = new ArrayList<String>();
			List<String> review_image_list = new ArrayList<String>();
			for(ReviewDTO review_list:aList) {
				String[] convert_list1 = review_list.getReview_write_date().split("/");
				alist_write_date.add(convert_list1[0] +"년 " + convert_list1[1] + "월 " + convert_list1[2] + "일");

				review_image_list.add(sservice.review_imageProcess(review_list.getReview_writer_id()));
			}
			mav.addObject("aList", aList);
			mav.addObject("alist_write_date", alist_write_date);
			mav.addObject("review_image_list", review_image_list);
			mav.addObject("pv", pdto);
		}	

		mav.addObject("review_foodstore_seq", review_foodstore_seq);
		mav.addObject("adto", adto);
		mav.setViewName("mainPage/shopDetail");
		return mav;
	}

	@RequestMapping(value="review_basic.do", method=RequestMethod.GET)
	public String basic_page() {
		return "review/basic";
	}

	//review 작성을 위한 form으로 연결
	//http://localhost:8090/reviewform.do
	@RequestMapping(value="reviewform.do", method=RequestMethod.GET)
	public String review_write() {
		System.out.println("reviewform.do checkpoint1");
		return "review/review_form";
	}

	//review 작성후 페이지로 리턴
	//http://localhost:8090/reviewform.do
	@RequestMapping(value="reviewform.do", method=RequestMethod.POST)
	public String review_writePro(HttpServletRequest request, ReviewDTO dto){
		System.out.println("reviewform.do checkpoint2");
		System.out.println("dto_review_writer_id : " + dto.getReview_writer_id());
		System.out.println("review_content : " + dto.getReview_content());
		System.out.println("review_foodstore_seq : " + dto.getReview_foodstore_seq());
		
		MultipartFile file = dto.getFilename();
		System.out.println("file : " + file);
		System.out.println("review_content : " + dto.getReview_content());

		if(!file.isEmpty()) {
			UUID random = save_copy_file(file, request);
			dto.setReview_upload(random + "_" + file.getOriginalFilename());
		}

		sservice.review_writeProcess(dto);
	
		if(request.getHeader("Referer") != null) {
			return "redirect:" + request.getHeader("Referer");
		}else {
			return "redirect:/index.do";
		}
	}

	//review 수정을 위한 페이지 이동 전 수정 리뷰 정보를 받아서 리뷰 작성 페이지에 전달
	@RequestMapping(value="review_update_form.do")
	public ModelAndView review_update(ModelAndView mav, HttpServletRequest request) {
		int review_edit_num = (int) Integer.parseInt(request.getParameter("review_edit_num"));
		System.out.println(review_edit_num);
		ReviewDTO rDto = sservice.find_review_numberProcess(review_edit_num);
		String Prev_uri = request.getHeader("Referer");
		request.getSession().setAttribute("Prev_uri", Prev_uri);
		mav.addObject("review_dto", rDto);
		mav.setViewName("review/review_update_form");
		return mav;
	}

	//review 수정 후 원래 페이지로 이동
	@RequestMapping(value="review_update.do", method=RequestMethod.POST)
	public String review_updatePro(ReviewDTO dto, HttpServletRequest request) {
		MultipartFile file = dto.getFilename();
		//			System.out.println("file : " + file);
		//			System.out.println("review_content : " + dto.getReview_content());
		String Prev_uri = (String) request.getSession().getAttribute("Prev_uri");
		request.getSession().removeAttribute("Prev_uri");
		
		if(!file.isEmpty()) {
			UUID random = save_copy_file(file, request);
			dto.setReview_upload(random + "_" + file.getOriginalFilename());
		}
		sservice.review_updateProcess(dto, urlPath(request));
		return "redirect:" + Prev_uri;
	}

	//review 삭제 후 원래 페이지로 이동
	@RequestMapping(value="review_delete.do")
	public String review_deletePro(HttpServletRequest request) {
		int review_delete_num = (int) Integer.parseInt(request.getParameter("review_delete_num"));

		sservice.review_deleteProcess(review_delete_num, urlPath(request));
		return "redirect:" + request.getHeader("Referer");
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
	
	@RequestMapping(value="test.do")
	public String test() {
		return "review/test";
	}
}
