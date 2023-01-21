package dao;

import java.util.HashMap;
import java.util.List;

import dto.ReviewLikeDTO;

public interface ReviewLikeDAO {

	public List<ReviewLikeDTO> review_like_count(String review_like_review_seq);
	
	public int review_like_view(HashMap<String, Object> map);
	
	public void review_like_insert(ReviewLikeDTO dto);
	
	public void review_like_delete(ReviewLikeDTO dto);
	
	public List<ReviewLikeDTO> review_like_list(String review_like_user_id);
}
