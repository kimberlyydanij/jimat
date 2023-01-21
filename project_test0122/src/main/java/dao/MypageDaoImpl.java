package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.ShopDetailDTO;

public class MypageDaoImpl implements MypageDAO{

	private SqlSessionTemplate sqlSession;
	
	public MypageDaoImpl() {

	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<ShopDetailDTO> mypage_find(String k_id) {
		return sqlSession.selectList("mypage.mypage_find",k_id);
	}
}
