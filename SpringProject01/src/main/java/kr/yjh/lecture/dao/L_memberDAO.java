package kr.yjh.lecture.dao;

import java.util.HashMap;
import java.util.List;

import kr.yjh.lecture.vo.L_memberVO;

// mapper의 인터페이스
public interface L_memberDAO {
	
	// 1. 회원정보 DB에 저장
	void insert(L_memberVO vo);
	
	// 2-1. 회원아이디 읽기 - 로그인, 인증메일
	L_memberVO selectByID(HashMap<String, String> map);

	// 2-2. USE값 변경 
	void updateUse(HashMap<String, String> map); //-- ! map2 인건가?
	
	
}
