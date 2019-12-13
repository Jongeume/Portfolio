package kr.yjh.lecture.dao;

import java.util.HashMap;
import java.util.List;

import kr.yjh.lecture.vo.L_memberVO;

// mapper의 인터페이스
public interface L_memberDAO {
	
	// 1. 회원정보 DB에 저장
	void insert(L_memberVO vo);
}
