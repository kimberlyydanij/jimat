package dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
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


}
