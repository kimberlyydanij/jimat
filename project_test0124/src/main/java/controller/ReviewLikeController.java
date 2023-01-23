package controller;

import java.security.Policy.Parameters;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import dto.ReviewLikeDTO;
import service.ReviewLikeService;

@Controller
public class ReviewLikeController {

	private ReviewLikeService service;
	
	public ReviewLikeController() {

	}
	
	public void setService(ReviewLikeService service) {
		this.service = service;
	}
	
	@ResponseBody
	@RequestMapping(value="review_like_check.do", method=RequestMethod.POST)
	public List<ReviewLikeDTO> review_lick_checkPro(String review_like_user_id, Model md) {
		System.out.println("review_like_user_id : " + review_like_user_id);
		return (List<ReviewLikeDTO>) service.review_like_listPro(review_like_user_id);

	}
	
	@ResponseBody
	@RequestMapping(value="review_like_action.do", method=RequestMethod.POST)
	public Map<String, Object> review_like_actionPro(ReviewLikeDTO dto) {
		Map<String, Object> result = new HashMap<String, Object>();
		System.out.println("review_like_user_id : " + dto.getReview_like_user_id());
		System.out.println("review_like_review_seq : " + dto.getReview_like_review_seq());
		int check_num = service.review_like_viewPro(dto.getReview_like_review_seq(), dto.getReview_like_user_id());
		System.out.println(check_num);
		if(check_num == 0) {
			service.review_like_insertPro(dto);
			result.put("data", "1");
		
		}else if(check_num == 1){
			service.review_like_deletePro(dto);
			result.put("data", "0");
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="review_like_num.do", method=RequestMethod.POST)
	public List<ReviewLikeDTO> review_like_numPro(String review_like_store_id) {
		return service.review_like_countPro(review_like_store_id);
	}
}
