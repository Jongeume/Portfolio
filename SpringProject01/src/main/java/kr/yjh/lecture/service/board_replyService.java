package kr.yjh.lecture.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.yjh.lecture.dao.board_replyDAO;
import kr.yjh.lecture.vo.board_replyVO;

@Service
public class board_replyService {
	
	@Autowired
	private board_replyDAO dao;
	
	public List<board_replyVO>  replyList(int fb_no){
		return dao.replyList(fb_no);
	}

	public int insertReply(board_replyVO vo) {
		return dao.insertReply(vo);
	}
	
	public int updateReply(board_replyVO vo) {
		return dao.updateReply(vo);
	}
	
	public int delReply(int br_no) {
		return dao.delReply(br_no);
	}
	public int delContent(int fb_no) {
		return dao.delContent(fb_no);
	}
	
	
	
}