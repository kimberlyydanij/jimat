package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dto.Review_likeDTO;
import service.Review_likeService;

@Controller
public class Review_likeController {

	private Review_likeService service;
	
	public Review_likeController() {

	}
	
	public void setService(Review_likeService service) {
		this.service = service;
	}
	
	@ResponseBody
	@RequestMapping(value="review_like_insert.do", method=RequestMethod.POST)
	public void review_like_insertPro() {
		Review_likeDTO dto = new Review_likeDTO();
		service.review_like_insertPro(dto);
	}
	
	@ResponseBody
	@RequestMapping(value="review_like_delete.do", method=RequestMethod.POST)
	public void review_like_deletePro(int review_like_review_seq) {
		service.review_like_deletePro(review_like_review_seq);
	}
	
	
}
