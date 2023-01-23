package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.MapDTO;

public class MapDaoImp implements MapDao {

	private SqlSessionTemplate sqlSession;

	public MapDaoImp() {

	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<MapDTO> map_list(HashMap<String, Object> map) {
		return sqlSession.selectList("food.food_list", map);
	}

	@Override
	public int food_countAll(String data) {
		return sqlSession.selectOne("food.food_countAll", data);
	}
}
