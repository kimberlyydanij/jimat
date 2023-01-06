package com.mycompany.myapp;

import java.util.List;

public interface ReviewService {
	
	public List<ReviewDTO> find_review_allprocess();
	
	public List<ReviewDTO> find_review_userprocess(String review_user_id);
	
	public ReviewDTO find_review_numberprocess(long review_number);
	
	public void review_writeprocess(ReviewDTO dto);
	
	public void review_updateprocess(ReviewDTO dto);
	
	public void review_deleteprocess(int review_number);
}
 