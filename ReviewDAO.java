package com.mycompany.myapp;

import java.util.List;

public interface ReviewDAO {

	public List<ReviewDTO> find_review_all();
	
	public List<ReviewDTO> find_review_user(String review_user_id);
	
	public ReviewDTO find_review_number(long review_number);
	
	public void review_write(ReviewDTO dto);
	
	public void review_update(ReviewDTO dto);
	
	public void review_delete(int review_number);
} 
