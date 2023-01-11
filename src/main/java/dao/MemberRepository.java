package dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.KakaoDTO;

@Repository
public class MemberRepository{

	// mapper를 호출하기 위한 클래스 주입.
	private SqlSessionTemplate sqlSession;

	public MemberRepository() {

	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 정보 저장
	public void kakaoinsert(KakaoDTO userInfo) {
		sqlSession.insert("Member.kakaoInsert",userInfo);
	}

	// 정보 확인
	public KakaoDTO findkakao(KakaoDTO userInfo) {
		return sqlSession.selectOne("Member.findKakao", userInfo);
	}

}