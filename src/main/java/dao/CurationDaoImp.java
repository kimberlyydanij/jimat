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
		System.out.println("check10");
	}

	public List<CurationDTO> matchCheck(HashMap<String, Object> map) {
		
		return sqlSession.selectList("curation.curationTags", map);
	}


}
	//public CurationDTO foodStoreTag (CurationDTO checkTag) {}