package kr.yjh.lecture.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.yjh.common.Pagination;
import kr.yjh.lecture.dao.fb_boardDAO;
import kr.yjh.lecture.vo.fb_boardVO;

@Service
public class fb_boardService {

	@Autowired
	private fb_boardDAO dao;
	
	//글 쓰기
	public void insertFb(fb_boardVO vo) {
		if (vo != null && vo.getFb_title() != null) {
			dao.insertFb(vo);
		}
	}

	//글 목록
	public List<fb_boardVO> listFb(Pagination pagination){
		return dao.listFb(pagination);
	}
	
	public List<fb_boardVO> latestList(Pagination pagination){
		return dao.latestList(pagination);
	}
	
	public List<fb_boardVO> popuarList(Pagination pagination){
		return dao.popuarList(pagination);
	}
	
	public List<fb_boardVO> hotest(Pagination pagination){
		return dao.hotest(pagination);
	}
	
	

	//글 읽기
	public fb_boardVO readFb (int fb_no) {
		return dao.readFb(fb_no);
	}
	
	//조회수
	
	public void updateViews (int fb_no) {
		dao.updateViews(fb_no);
	}
	
	// 업뎃
	public void updateFb(fb_boardVO vo) {
		dao.updateFb(vo);
	}
	
	// 추천
	public void updateLikeCnt(int fb_no) {
		dao.updateLikeCnt(fb_no);
	}
	
	public void updateHateCnt(int fb_no) {
		dao.updateHateCnt(fb_no);
	}
	
	
	//글번호로 전체읽기
	public fb_boardVO selectByFn(int fb_no) {
		fb_boardVO vo1 = null;
		vo1 = dao.selectByFn(fb_no);
		return vo1;
	}

	// 삭제
	public void delete(int fb_no) {
		dao.delete(fb_no);
	}
	

	// 총갯수
	public int getBoardListCnt() throws Exception {

		return dao.getBoardListCnt();

	}

	// 내글읽기
	
	public List<fb_boardVO> myContent(String fb_userID){
		return dao.myContent(fb_userID);
	}
	
	
}
