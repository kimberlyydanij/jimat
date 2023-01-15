package service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import dao.ReviewDAO;
import dto.PageDTO;
import dto.ReviewDTO;

public class ReviewServiceImpl implements ReviewService{

	private ReviewDAO dao;
	
	public ReviewServiceImpl() {

	}
	
	public void setDao(ReviewDAO dao) {
		this.dao = dao;
	} 

	@Override
	public List<ReviewDTO> find_review_allProcess() {
		return dao.find_review_all();
	}

	@Override
	public List<ReviewDTO> find_review_userProcess(String review_user_id) {
		return dao.find_review_user(review_user_id);
	}

	@Override
	public ReviewDTO find_review_numberProcess(int review_seq) {
		return dao.find_review_number(review_seq);
	}

	@Override
	public void review_writeProcess(ReviewDTO dto) {
		dao.review_write(dto);
	}

	@Override
	public void review_updateProcess(ReviewDTO dto) {
		dao.review_update(dto);
	}

	@Override
	public void review_deleteProcess(int review_seq) {
		dao.review_delete(review_seq);
	}

	@Override
	public List<ReviewDTO> find_review_pageProcess(int review_foodstore_seq) {
		return dao.find_review_page(review_foodstore_seq);
	}

	@Override
	public int countProcess(int review_foodstore_seq) {
		return dao.count(review_foodstore_seq);
	}

	@Override
	public List<ReviewDTO> listProcess(int startRow, int endRow, int review_foodstore_seq) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("review_foodstore_seq", review_foodstore_seq);
		
		return dao.list(map);
	}


	
	
}
