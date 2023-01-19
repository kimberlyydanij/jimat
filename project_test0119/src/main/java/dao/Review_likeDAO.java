package dao;

import dto.Review_likeDTO;

public interface Review_likeDAO {

	public int count(int review_like_review_seq);
	
	public void review_like_insert(Review_likeDTO dto);
	
	public void review_like_delete(int review_like_review_seq);
}
