package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.ReviewLikeDTO;

public class ReviewLikeDaoImpl implements ReviewLikeDAO{

	private SqlSessionTemplate sqlSession;
	
	public ReviewLikeDaoImpl() {
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<ReviewLikeDTO> review_like_count(String review_like_review_seq) {
		return sqlSession.selectList("reviewLike.like_counts", review_like_review_seq);
	}

	@Override
	public void review_like_insert(ReviewLikeDTO dto) {
		sqlSession.insert("reviewLike.like_insert", dto);
	}

	@Override
	public void review_like_delete(ReviewLikeDTO dto) {
		sqlSession.delete("reviewLike.like_delete", dto);
	}

	@Override
	public int review_like_view(HashMap<String, Object> map) {
		return sqlSession.selectOne("reviewLike.like_views", map);
	}

	@Override
	public List<ReviewLikeDTO> review_like_list(String review_like_user_id) {
		return sqlSession.selectList("reviewLike.like_list", review_like_user_id);
	}

}
