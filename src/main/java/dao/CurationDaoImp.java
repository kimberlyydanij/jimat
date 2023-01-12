package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import dto.CurationDTO;


public class CurationDaoImp implements CurationDAO {
	
	// mapper를 호출하기 위한 클래스 주입.
	private SqlSessionTemplate sqlSession;
	
	public CurationDaoImp() {
		
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<CurationDTO> matchCheck(int number) {
		
		return sqlSession.selectList("curation.matchCheck", number);
	}


}
	//public CurationDTO foodStoreTag (CurationDTO checkTag) {}