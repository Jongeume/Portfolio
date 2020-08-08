package kr.yjh.lecture.dao;

import java.util.HashMap;

import kr.yjh.lecture.vo.L_memberVO;

// mapper의 인터페이스
public interface L_memberDAO {
	
	// 회원정보 DB에 저장
	void insert(L_memberVO vo);
	
	// 회원아이디 읽기 - 로그인, 인증메일
	L_memberVO selectByID(HashMap<String, String> map);
	
	// USE값 변경 
	void updateUse(HashMap<String, String> map); //-- 

/*	// 로그인 체킹
	L_memberVO loginCheck(HashMap<String, String> map);*/
	
	// 아이디 찾기
	L_memberVO userIDSearch(HashMap<String, String> map);
	
	// 비밀번호 재설정
	void updatePassword(L_memberVO vo);
	
	// 이름, 아이디로 회원정보 확인
	L_memberVO selectByIDandNAME(HashMap<String, String> map);
	
	// 중복된 아이디 체크
	int countMember(String ID);
	
	int countNickname(String NICKNAME);
	
	int countPhone(String PHONE);
	
	// 회원정보 변경
	void updateMember(L_memberVO vo);
	
	// 회원탈퇴
	void deleteMember(L_memberVO vo);
	
}
