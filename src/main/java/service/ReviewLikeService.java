package service;

import java.util.HashMap;
import java.util.List;

import dto.ReviewLikeDTO;

public interface ReviewLikeService {

	public List<ReviewLikeDTO> review_like_countPro(String review_like_review_seq);
	
	public int review_like_viewPro(int review_like_review_seq, String review_like_user_id);
	
	public void review_like_insertPro(ReviewLikeDTO dto);
	
	public void review_like_deletePro(ReviewLikeDTO dto);
	
	public List<ReviewLikeDTO> review_like_listPro(String review_like_user_id);
}
