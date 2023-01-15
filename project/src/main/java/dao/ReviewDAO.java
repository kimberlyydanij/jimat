package dao;

import java.util.HashMap;
import java.util.List;

import dto.PageDTO;
import dto.ReviewDTO;

public interface ReviewDAO {

	public int count(int review_foodstore_seq);
	
	public List<ReviewDTO> list(HashMap<String, Object> map);
	
	public List<ReviewDTO> find_review_all();
	
	public List<ReviewDTO> find_review_user(String review_user_id);
	
	public ReviewDTO find_review_number(int review_seq);
	
	public List<ReviewDTO> find_review_page(int review_foodstore_seq);
	
	public void review_write(ReviewDTO dto);
	
	public void review_update(ReviewDTO dto);
	
	public void review_delete(int review_seq);
} 
