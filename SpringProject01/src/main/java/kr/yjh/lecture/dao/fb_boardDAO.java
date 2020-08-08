package kr.yjh.lecture.dao;

import java.util.List;

import kr.yjh.common.Pagination;
import kr.yjh.lecture.vo.fb_boardVO;

public interface fb_boardDAO {

	// 저장
	void insertFb(fb_boardVO vo);

	List<fb_boardVO> listFb(Pagination pagination);
	
	// 최신글
	List<fb_boardVO> latestList(Pagination pagination);
	
	// 인기글
	List<fb_boardVO> popuarList(Pagination pagination);

	List<fb_boardVO> hotest(Pagination pagination);
	// 읽기
	fb_boardVO readFb(int fb_no);

	void updateViews(int fb_no);
	
	// 업뎃
	void updateFb(fb_boardVO vo);

	// 삭제
	void delete(int fb_no);
	
	// 총
	int getBoardListCnt();
	
	//추천기능
	void updateLikeCnt(int fb_no);
	
	void updateHateCnt(int fb_no);
	
	//전체읽기
	fb_boardVO selectByFn(int fb_no);
	
	// 내글읽기
	List<fb_boardVO>  myContent(String fb_userID);
	
}
