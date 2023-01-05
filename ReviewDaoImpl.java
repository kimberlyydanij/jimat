package com.mycompany.myapp;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class ReviewDaoImpl implements ReviewDAO{

	private SqlSessionTemplate sqlSession;
	
	public ReviewDaoImpl() {

	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	} 

	@Override
	public List<ReviewDTO> find_review_all() {
		return sqlSession.selectList("review.find_review_all");
	}

	@Override
	public List<ReviewDTO> find_review_user(String review_user_id) {
		return sqlSession.selectList("review.fint_review_user", review_user_id);
	}

	@Override
	public ReviewDTO find_review_number(long review_number) {
		return sqlSession.selectOne("review.find_review_number", review_number);
	}

	@Override
	public void review_write(ReviewDTO dto) {
		sqlSession.insert("review.review_write", dto);
	}

	@Override
	public void review_update(ReviewDTO dto) {
		sqlSession.update("review.review_update", dto);
	}

	@Override
	public void review_delete(int review_number) {
		sqlSession.delete("review.review_delete", review_number);
	}
	
	
}
