
package service;

import java.util.HashMap;
import java.util.List;

import dao.ReviewLikeDAO;
import dto.ReviewLikeDTO;

public class ReviewLikeServiceImpl implements ReviewLikeService{

	private ReviewLikeDAO dao;
	
	public ReviewLikeServiceImpl() {
		
	}
	
	public void setDao(ReviewLikeDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public List<ReviewLikeDTO> review_like_countPro(String review_like_review_seq) {
		return dao.review_like_count(review_like_review_seq);
	}

	@Override
	public void review_like_insertPro(ReviewLikeDTO dto) {
		dao.review_like_insert(dto);
	}

	@Override
	public void review_like_deletePro(ReviewLikeDTO dto) {
		dao.review_like_delete(dto);
	}

	@Override
	public int review_like_viewPro(int review_like_review_seq, String review_like_user_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("review_like_review_seq", review_like_review_seq);
		map.put("review_like_user_id", review_like_user_id);
		
		return dao.review_like_view(map);
	}

	@Override
	public List<ReviewLikeDTO> review_like_listPro(String review_like_user_id) {
		return dao.review_like_list(review_like_user_id);
	}

}
