package com.mycompany.myapp;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class ReviewServiceImpl implements ReviewService{

	private ReviewDAO dao;
	
	public ReviewServiceImpl() {

	}
	
	public void setDao(ReviewDAO dao) {
		this.dao = dao;
	} 

	@Override
	public List<ReviewDTO> find_review_allprocess() {
		return dao.find_review_all();
	}

	@Override
	public List<ReviewDTO> find_review_userprocess(String review_user_id) {
		return dao.find_review_user(review_user_id);
	}

	@Override
	public ReviewDTO find_review_numberprocess(long review_number) {
		return dao.find_review_number(review_number);
	}

	@Override
	public void review_writeprocess(ReviewDTO dto) {
		dao.review_write(dto);
	}

	@Override
	public void review_updateprocess(ReviewDTO dto) {
		dao.review_update(dto);
	}

	@Override
	public void review_deleteprocess(int review_number) {
		dao.review_delete(review_number);
	}
	
	
}
