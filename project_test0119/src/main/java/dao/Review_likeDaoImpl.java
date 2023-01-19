package dao;

import org.mybatis.spring.SqlSessionTemplate;

import dto.Review_likeDTO;

public class Review_likeDaoImpl implements Review_likeDAO{

	private SqlSessionTemplate sqlSession;
	
	public Review_likeDaoImpl() {
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int count(int review_like_review_seq) {
		return sqlSession.selectOne("review_like.like_counts", review_like_review_seq);
	}

	@Override
	public void review_like_insert(Review_likeDTO dto) {
		sqlSession.insert("review_like.like_insert", dto);
	}

	@Override
	public void review_like_delete(int review_like_review_seq) {
		sqlSession.delete("review_like.like_delete", review_like_review_seq);
	}

}
