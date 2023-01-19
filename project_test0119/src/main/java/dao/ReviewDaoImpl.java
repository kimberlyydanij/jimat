package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import dto.PageDTO;
import dto.ReviewDTO;

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
		return sqlSession.selectList("review.find_review_user", review_user_id);
	}

	@Override
	public ReviewDTO find_review_number(int review_seq) {
		return sqlSession.selectOne("review.find_review_number", review_seq);
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
	public void review_delete(int review_seq) {
		sqlSession.delete("review.review_delete", review_seq);
	}

	@Override
	public List<ReviewDTO> find_review_page(int review_foodstore_seq) {
		return sqlSession.selectList("review.find_review_page", review_foodstore_seq);
	}

	@Override
	public int count(int review_foodstore_seq) {
		return sqlSession.selectOne("review.count", review_foodstore_seq);
	}

	@Override
	public List<ReviewDTO> list(HashMap<String, Object> map) {
		return sqlSession.selectList("review.list", map);
	}

	@Override
	public String review_upload(int review_seq) {
		return sqlSession.selectOne("review.review_upload", review_seq);
	}

	@Override
	public String review_image(String review_writer_id) {
		return sqlSession.selectOne("review.review_image", review_writer_id);
	}
	
	
}
