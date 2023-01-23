package dao;

import java.util.HashMap;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;

import dto.ReviewDTO;
import dto.ShopDetailDTO;


public class ShopDetailDaoImp implements ShopDetailDAO{
	
	// mapper를 호출하기 위한 클래스 주입.
	private SqlSessionTemplate sqlSession;
		
	public ShopDetailDaoImp() {
		
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public ShopDetailDTO shopDetailData(String number) {

		return sqlSession.selectOne("shopDetail.shopDetailData", number);
	}

	@Override
	public List<ReviewDTO> find_review_all() {
		return sqlSession.selectList("shopDetail.find_review_all");
	}

	@Override
	public List<ReviewDTO> find_review_user(String review_user_id) {
		return sqlSession.selectList("shopDetail.find_review_user", review_user_id);
	}

	@Override
	public ReviewDTO find_review_number(int review_seq) {
		return sqlSession.selectOne("shopDetail.find_review_number", review_seq);
	}

	@Override
	public void review_write(ReviewDTO dto) {
		sqlSession.insert("shopDetail.review_write", dto);
	}

	@Override
	public void review_update(ReviewDTO dto) {
		sqlSession.update("shopDetail.review_update", dto);
	}

	@Override
	public void review_delete(int review_seq) {
		sqlSession.delete("shopDetail.review_delete", review_seq);
	}

	@Override
	public List<ReviewDTO> find_review_page(String review_foodstore_seq) {
		return sqlSession.selectList("shopDetail.find_review_page", review_foodstore_seq);
	}

	@Override
	public int count(String review_foodstore_seq) {
		return sqlSession.selectOne("shopDetail.count", review_foodstore_seq);
	}

	@Override
	public List<ReviewDTO> list(HashMap<String, Object> map) {
		return sqlSession.selectList("shopDetail.list", map);
	}

	@Override
	public String review_upload(int review_seq) {
		return sqlSession.selectOne("shopDetail.review_upload", review_seq);
	}

	@Override
	public String review_image(String review_writer_id) {
		return sqlSession.selectOne("shopDetail.review_image", review_writer_id);
	}
}
