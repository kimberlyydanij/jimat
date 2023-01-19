package service;

import dao.Review_likeDAO;
import dto.Review_likeDTO;

public class Review_likeServiceImpl implements Review_likeService{

	private Review_likeDAO dao;
	
	public Review_likeServiceImpl() {
		
	}
	
	public void setDao(Review_likeDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public int countPro(int review_like_review_seq) {
		return dao.count(review_like_review_seq);
	}

	@Override
	public void review_like_insertPro(Review_likeDTO dto) {
		dao.review_like_insert(dto);
	}

	@Override
	public void review_like_deletePro(int review_like_review_seq) {
		dao.review_like_delete(review_like_review_seq);
	}

}
