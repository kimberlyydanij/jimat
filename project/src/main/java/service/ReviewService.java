package service;

import java.util.List;

import dto.PageDTO;
import dto.ReviewDTO;

public interface ReviewService {
	
	public int countProcess(int review_foodstore_seq);
	
	public List<ReviewDTO> listProcess(int startRow, int endRow, int review_foodstore_seq);
	
	public List<ReviewDTO> find_review_allProcess();
	
	public List<ReviewDTO> find_review_userProcess(String review_user_id);
	
	public ReviewDTO find_review_numberProcess(int review_seq);
	
	public List<ReviewDTO> find_review_pageProcess(int review_foodstore_seq);
	
	public void review_writeProcess(ReviewDTO dto);
	
	public void review_updateProcess(ReviewDTO dto);
	
	public void review_deleteProcess(int review_seq);

}
 