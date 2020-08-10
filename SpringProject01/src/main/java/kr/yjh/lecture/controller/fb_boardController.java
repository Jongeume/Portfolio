package kr.yjh.lecture.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.yjh.common.Pagination;
import kr.yjh.lecture.service.board_replyService;
import kr.yjh.lecture.service.fb_boardService;
import kr.yjh.lecture.vo.L_memberVO;
import kr.yjh.lecture.vo.board_replyVO;
import kr.yjh.lecture.vo.fb_boardVO;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class fb_boardController {

	@Autowired
	private fb_boardService service;
	
	@Autowired
	private board_replyService replyService;
	
	
	// 글쓰기폼
	@RequestMapping(value="/fb_board/write")
	public String boardWrite(HttpServletRequest request, RedirectAttributes rttr, Model model) {
		return "/fb_board/write";
	}
	
	// 글쓰기
	@RequestMapping(value = "/fb_board/create", method = RequestMethod.GET)
	public String  createGET(RedirectAttributes rttr) throws Exception {
		log.info("GET방식");
		return "redirect:/fb_board/listAll";
	}

	@RequestMapping(value = "/fb_board/create", method = RequestMethod.POST)
	public String createPOST(fb_boardVO board, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
		log.info(" POST방식 입니다.");
		log.info(board.toString());
		if(request.getSession().getAttribute("sessionVO")!=null) {
			log.info("글쓰기-회원");
			board.setFb_available(2);
			service.insertFb(board);
			rttr.addFlashAttribute("msg2", "글쓰기-성공");
			return "redirect:/fb_board/listAll";
		}
		log.info("글쓰기-비회원");
		board.setFb_available(1);
		service.insertFb(board);

		// return "/board/succes";
		rttr.addFlashAttribute("msg2", "글쓰기-성공");
		return "redirect:/fb_board/listAll";
	}

	//목록
	@RequestMapping(value = "/fb_board/listAll", method = RequestMethod.GET)
	public void listAll(Model model
			, @RequestParam(required = false, defaultValue = "1") int page

			, @RequestParam(required = false, defaultValue = "1") int range 
			) throws Exception {

		log.info("전체목록 페이지");

		//전체 게시글 개수
		int listCnt =  service.getBoardListCnt();
		
		//Pagination
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("listFb", service.listFb(pagination));

	}
	
	// 글읽기 + 조회수
	@RequestMapping(value="/fb_board/fbContent", method = RequestMethod.GET)
	public void readFb(@RequestParam("fb_no") int fb_no, Model model ){
		log.info(fb_no+"번 내용 보기");
		// fb_no 들어와서 서비스 readFb에 fb_no 들어와
		model.addAttribute("fbContent", service.readFb(fb_no)); 
		model.addAttribute("board_replyVO", new board_replyVO());
		service.updateViews(fb_no);
		
	}
	
	
	// 게시글 수정 폼
	@RequestMapping(value="/fb_board/updateContent" ,method=RequestMethod.GET)
	public String updateContent(@RequestParam("fb_no") int fb_no , Model model) {
		log.info("게시글 수정폼");
		log.info(fb_no+"번 글을 수정합니다.");
		model.addAttribute("fbContent",service.readFb(fb_no));
		return "/fb_board/updateContent";
	}

	
	
	// 게시글 수정
	@RequestMapping(value="/fb_board/updateOk", method=RequestMethod.POST)
	public String updateOkPOST(fb_boardVO vo , HttpServletRequest request, RedirectAttributes rttr ) {
		log.info(vo);
		fb_boardVO dbvo = service.selectByFn(vo.getFb_no()); 
		log.info(dbvo);
		if(request.getSession().getAttribute("sessionVO")==null) {
			// 비회원
			// vo: 입력한거, dbvo: db에서 가져온거
			if(dbvo.getFb_pwd().equals(vo.getFb_pwd())) {
				service.updateFb(vo);
				log.info(dbvo+"수정 성공");
				rttr.addFlashAttribute("msg2", "게시글수정-비회원 성공");
				return "redirect:listAll";
			}else {
				log.info("수정실패");
				rttr.addFlashAttribute("msg2", "게시글수정-비회원 실패");
				return "redirect:updateContent";
			}
		}else {
			// 회원
			if(dbvo.getFb_pwd().equals(vo.getFb_pwd())) {
				service.updateFb(vo);
				rttr.addFlashAttribute("msg2", "게시글수정-회원 성공");
				log.info(dbvo+"수정 성공(회원)");
				return "redirect:listAll";
			}else {
				log.info("수정 실패(회원)");
				return "redirect:listAll";
			}
		}
		
	}
	
	// 게시글 수정 - 비회원 =unmember
	@RequestMapping(value="/fb_board/updateFbC")
	public String updateFb() {
			return null;
	}
	
	
	// 삭제 - 회원전용
	@RequestMapping(value="/fb_board/delete", method= RequestMethod.GET)
	public String delete(@RequestParam("fb_no") int fb_no,HttpServletRequest request, RedirectAttributes rttr ) throws Exception {
		if(request.getSession().getAttribute("sessionVO")==null) {
			return "redirect:deleteContent";
		}else {
			fb_boardVO vo1 = service.selectByFn(fb_no);
			L_memberVO vo2 = (L_memberVO) request.getSession().getAttribute("sessionVO");
			if(vo1.getFb_pwd().equals(vo2.getPASSWORD()) ) {
				rttr.addFlashAttribute("msg2", "글삭제-성공");
				replyService.delContent(fb_no);
					service.delete(fb_no);
			}else {
				rttr.addFlashAttribute("msg2", "글삭제-실패");
				return "redirect:listAll";
			}
		}
		
		return "redirect:listAll";
	}
	// 삭제 - 비회원전용 	
	@RequestMapping(value="/fb_board/deleteContent", method=RequestMethod.GET)
	public String deleteOk(@RequestParam("fb_no") int fb_no, Model model) {
		model.addAttribute("fbContent", service.readFb(fb_no)); 
		return "/fb_board/deleteContent";
	}
	
   
	@RequestMapping(value="/fb_board/deleteContentOk", method=RequestMethod.POST)
	public String deleteOkPOST(fb_boardVO vo, RedirectAttributes rttr ) {
		log.info(vo);
		fb_boardVO vo1 = service.selectByFn(vo.getFb_no());
		log.info("입력한 비밀번호: "+vo.getFb_pwd());
		log.info("DB에 있는 비밀번호: "+vo1.getFb_pwd());
		if(vo1.getFb_pwd().equals(vo.getFb_pwd()) ) {
			service.delete(vo.getFb_no());
			rttr.addFlashAttribute("msg2", "글삭제-비회원성공");
			return "redirect:listAll"; 
		}else {
			rttr.addFlashAttribute("msg2", "글삭제-비회원실패");
			return "redirect:listAll"; 
		}
	}
	
	// 게시글 추천
	@RequestMapping(value="/fb_board/updateLikeCnt")
	@ResponseBody
	public String updateLikeCnt (@RequestParam("fb_no") int fb_no) {
		log.info(fb_no+"번 글 추천");
		service.updateLikeCnt(fb_no);
		return "success";
	}
	// 비추천
	@RequestMapping(value="/fb_board/updateHateCnt")
	@ResponseBody
	public String updateHateCnt (@RequestParam("fb_no") int fb_no) {
		log.info(fb_no+"번 글 비추천");
		service.updateHateCnt(fb_no);
		return "success";
	}
	
	// 댓글 리스트
	@RequestMapping(value="/fb_board/getReplyList", method=RequestMethod.GET)
	@ResponseBody
	public List<board_replyVO> getReplyList(@RequestParam("fb_no") int fb_no) {
		log.info("댓글");
		return replyService.replyList(fb_no);
	}

	
	// 댓글 추가
	
	@RequestMapping(value="/fb_board/inserReply", method=RequestMethod.GET)
	public String insertReplyGET() {
		log.info("댓글 추가는 GET방식이 안됩니다.");
		return "redirect:listAll";
 	}
	
	@RequestMapping(value="/fb_board/insertReply", method= RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> insertReply(@RequestBody board_replyVO vo){
		
		Map<String, Object> result = new HashMap<String, Object>();
		try {

			replyService.insertReply(vo);

			result.put("status", "OK");

		} catch (Exception e) {

			e.printStackTrace();

			result.put("status", "False");

		}

		return result;
		
	}
	
	@RequestMapping(value="/fb_board/updateReply", method=RequestMethod.POST)
	@ResponseBody
	public String updateReply(@RequestBody board_replyVO vo){
		replyService.updateReply(vo);
		log.info("댓글수정");
		return "success";
	}

	
	// 댓글 삭제
	@RequestMapping(value="/fb_board/delReply", method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String delReply(@RequestParam("br_no") int br_no) {
		replyService.delReply(br_no);
		log.info("댓글삭제");
		return "success";
	}
	
}
