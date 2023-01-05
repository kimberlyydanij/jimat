package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.MapDTO;
import dto.PageDTO;

public class MapDaoImp implements MapDao {

	public MapDaoImp() {
	
	}
	
	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<MapDTO> res_coordindate(HashMap<String, Object> coor) {
		return sqlSession.selectList("res_test.res_coordinate", coor);
		
	}

	@Override
	public List<MapDTO> list(PageDTO pv) {
		return sqlSession.selectList("res_test.list",pv);
	}

	@Override
	public int count() {
		return sqlSession.selectOne("res_test.count");
	}
}
