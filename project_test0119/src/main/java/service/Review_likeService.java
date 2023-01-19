package service;

import dto.Review_likeDTO;

public interface Review_likeService {

	public int countPro(int review_like_review_seq);
	
	public void review_like_insertPro(Review_likeDTO dto);
	
	public void review_like_deletePro(int review_like_review_seq);
}
