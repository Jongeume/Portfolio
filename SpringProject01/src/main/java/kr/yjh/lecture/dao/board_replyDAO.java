package kr.yjh.lecture.dao;

import java.util.List;

import kr.yjh.lecture.vo.board_replyVO;

public interface board_replyDAO {

	// 저장
	int insertReply(board_replyVO vo);

	// 리스트
	List<board_replyVO> replyList(int fb_no );

	// 업뎃
	int updateReply(board_replyVO vo);
	
	// 삭제
	int delReply(int br_no);
	
	int delContent(int fb_no);
	
	
}
