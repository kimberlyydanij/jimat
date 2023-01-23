package dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.KakaoDTO;

public class MemberDaoImpl implements MemberDAO{

	// mapper를 호출하기 위한 클래스 주입.

	private SqlSessionTemplate sqlSession;

	public MemberDaoImpl() {

	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 정보 확인
	public KakaoDTO kakao_find(KakaoDTO userInfo) {
		return sqlSession.selectOne("member.kakao_find", userInfo);
	}
	
	// 정보 저장
	public void kakao_insert(KakaoDTO userInfo) {
		sqlSession.insert("member.kakao_insert",userInfo);
	}

	@Override
	public void kakao_update(KakaoDTO userInfo) {
		sqlSession.update("member.kakao_update",userInfo);
	}

	@Override
	public void kakao_delete(String k_id) {
		sqlSession.delete("member.kakao_delete", k_id);
	}

	@Override
	public int kakao_nickname_check(String k_nickname) {
		return sqlSession.selectOne("member.kakao_nickname_check",k_nickname);
	}

}