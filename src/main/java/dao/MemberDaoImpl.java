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
		System.out.println("check10");
	}
	
	// 정보 저장
	public void kakaoinsert(KakaoDTO userInfo) {
		sqlSession.insert("member.kakaoInsert",userInfo);
	}

	// 정보 확인
	public KakaoDTO findkakao(KakaoDTO userInfo) {
		return sqlSession.selectOne("member.findKakao", userInfo);
	}

}