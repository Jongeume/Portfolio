package kr.yjh.lecture.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.yjh.lecture.service.L_memberService;
import kr.yjh.lecture.service.fb_boardService;
import kr.yjh.lecture.vo.L_memberVO;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class L_memberController{
	
	
	@Autowired
	private L_memberService service;
	
	@Autowired
	private fb_boardService fbservice;

	@RequestMapping(value="/L_member/join")
	public String join(HttpServletRequest request) {
		if(request.getSession().getAttribute("sessionVO")!=null) {
			return "redirect:/";
		}
		return "/member/join";
	}
	
	@RequestMapping(value="/L_member/fregister")
	public String fregister() {
		return "/member/fregister";
	}
	
	@RequestMapping(value="/L_member/joinOk", method=RequestMethod.GET)
	public String joinOkGET() {
		return "redirect:login";
	}

	@Transactional
	@RequestMapping(value="/L_member/joinOk", method=RequestMethod.POST)
	public String joinOkPOST(@ModelAttribute L_memberVO vo) {
		log.info(vo+"************ joinOkPOST **********");
		// 서비스를 호출해서 DB에 저장하고
		service.insert(vo);
		return "/member/joinComplete";
	}

	@RequestMapping(value="/L_member/joinComplete")
	public String joinComplete() {
		return "/member/joinComplete";
	}
	
	
	@RequestMapping(value="/L_member/confirm", method=RequestMethod.GET)
	public String confirm(@RequestParam String ID, RedirectAttributes rttr) {
		log.info(ID+"************ Confirm **********");
		// 서비스를 호출해서 confirm
		rttr.addFlashAttribute("msg", "인증성공");
		service.confirm(ID);
		return "redirect:login";
	}
	
	
	@RequestMapping(value="/L_member/login")
	public String login(HttpServletRequest request) {
		//세션정보가 null이 아닐때 = 이미 로그인을 하였기에 세션이 존재.
		if(request.getSession().getAttribute("sessionVO")!=null) {
			return "redirect:/";
		}// 로그인한 상태에서 로그인폼으로 이동 못하게 막음.
		return "/member/login";
		}
	
	@RequestMapping(value="/L_member/loginOk", method=RequestMethod.GET)
	public String loginOkGET() {
		return "redirect:login";
	}
	
	@RequestMapping(value="/L_member/loginOk", method=RequestMethod.POST)
	public String loginOkPOST(@ModelAttribute L_memberVO memberVO, HttpServletRequest request, RedirectAttributes rttr){
		L_memberVO vo = service.loginOk(memberVO);
		log.info("로그인시도");
		if(vo!=null) { 
			if(vo.getUSE()==0) {
				rttr.addFlashAttribute("msg","미인증");
				return "redirect:login";
			}else if(vo.getUSE()==2) {
				request.getSession().setAttribute("sessionVO", vo); // 세션에 저장
				request.getSession().setMaxInactiveInterval(60*60); // 세션 유지시간 15분 설정
				rttr.addFlashAttribute("msg", "로그인성공");
				log.info("로그인성공");
				return "redirect:/"; // home으로
			}else {
				return "redirect:/";
			}
		}else {
			String result = service.loginError(memberVO);
			if(result=="NO") {
				log.info(vo+"******* login error!!! ******");
			}else if(result=="1") {
				rttr.addFlashAttribute("msg", "아이디없음");
			}else if(result=="2") {
				rttr.addFlashAttribute("msg", "비번틀림");
			}
			return "redirect:login";
		}
	}
	
	@RequestMapping(value="/L_member/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam String ID) {
		log.info(ID + "******************* idCheck **************************");
		// 서비스를 호출해서 아이디 중복 검사
		String result = service.idCheck(ID);
		return result;
	}
	
	@RequestMapping(value="/L_member/phoneCheck")
	@ResponseBody
	public String phoneCheck(@RequestParam String PHONE) {
		log.info(PHONE + "******************* idCheck **************************");
		// 서비스를 호출해서 아이디 중복 검사
		String result = service.phoneCheck(PHONE);
		return result;
	}
	
	
	@RequestMapping(value="/L_member/nicknameCheck")
	@ResponseBody
	public String nicknameCheck(@RequestParam String NICKNAME) {
		log.info(NICKNAME + "******************* nicknameCheck **************************");
		// 서비스를 호출해서 아이디 중복 검사
		String result = service.nicknameCheck(NICKNAME);
		return result;
	}
		
	@RequestMapping(value="/L_member/logOut")
	public String logOut(HttpServletRequest request) {
		request.getSession().removeAttribute("sessionVO");
		return "redirect:/"; 
	}
	
	
	@RequestMapping(value="/L_member/idSearch")
	public String idSearch(){
		return "member/idSearch";
	}
	
	@RequestMapping(value="/L_member/idSearchOk" , method=RequestMethod.GET)
	public String idSearchOkGET() {
		return "redirect:idSearch";
	}
	
	@RequestMapping(value="/L_member/idSearchOk" , method=RequestMethod.POST)
	public String idSearchOkPOST(@ModelAttribute L_memberVO memberVO, Model model, RedirectAttributes rttr) {
		L_memberVO vo = service.idSearch(memberVO);
			//	log.info("************* idSearchOk ****************");
			//	log.info(vo);
		if(vo==null) {
			log.info("************* idSearchOk failed ****************");
			rttr.addFlashAttribute("msg","아이디찾기실패");
			return "redirect:idSearch";
		}else {
			log.info("************* idSearchOk Success ****************");
			model.addAttribute("ID", vo.getID());
			model.addAttribute("NAME", vo.getNAME());
			return "member/viewIDPage";
		}
		
	}
	
	@RequestMapping(value="/L_member/pwSearch")
	public String pwSearch() {
		return "member/pwSearch";
	}
	
	@RequestMapping(value="/L_member/pwSearchOk", method=RequestMethod.GET)
	public String pwSearchOkGET() {
		return "redirect:member/login";
	}
	
	@RequestMapping(value="/L_member/pwSearchOk", method=RequestMethod.POST)
	public String pwSearchOkPOST(@ModelAttribute L_memberVO memberVO, RedirectAttributes rttr) {
		log.info(memberVO+"****************************야호오****************************");
		/*
		L_memberVO vo = service.PWSearch(memberVO);
		 * if(vo==null) {
			log.info("************* PWSearchOk failed ****************");
			rttr.addFlashAttribute("msg","비번찾기실패");
			return "redirect:passwordSearch";
		}else {
			log.info("************* PWSearchOk Success ****************");
			service.PWUpdate(vo);
		}
		*/
		String result = service.idCheck(memberVO.getID());
		if(result=="0") {
			log.info("아이디없음");
			rttr.addFlashAttribute("msg","비번찾기실패-아이디");
			return "redirect:join";
		}else if(result=="1") {
			L_memberVO vo = service.pwSearch(memberVO);
			// vo의 이름과 memberVO의 이름이 같은지 확인 (DB에 NAME과 비번찾기에 입력된 NAME이 같은지 비교)
			if(vo.getNAME().equals(memberVO.getNAME())) {
				service.updatePW(vo);
				rttr.addFlashAttribute("msg","비번찾기성공");
			}else {
				log.info("이름이같지않아!!");
				rttr.addFlashAttribute("msg","비번찾기실패-이름");
				return "redirect:pwSearch";
			}
			
		}
		
		return "redirect:login";
	}
	
	@RequestMapping(value="/L_member/myPage")
	public String myPage(HttpServletRequest request) {
		if(request.getSession().getAttribute("sessionVO")==null) {
			return "redirect:login";
		}
		return "member/myPage";
	}
	@RequestMapping(value="/L_member/profile")
	public String profile(HttpServletRequest request,Model model) {
		if(request.getSession().getAttribute("sessionVO")==null) {
			return "redirect:login";
		}
		L_memberVO vo = (L_memberVO) request.getSession().getAttribute("sessionVO");
		model.addAttribute("gender",vo.getGENDER());
		return "member/profile";
	}
	
	@RequestMapping(value="/L_member/profileOk", method=RequestMethod.GET)
	public String profileOkGET() {
		return "redirect:profile";
	}
	
	@RequestMapping(value="/L_member/profileOk", method=RequestMethod.POST)
	public String profileOkPOST(@ModelAttribute L_memberVO memberVO, HttpServletRequest request) {
		 log.info(memberVO+"**********profileOk Post**************");
		 if(memberVO.getGENDER().equals("남자")) {
			 memberVO.setGENDER("M");
		 }else {
			 memberVO.setGENDER("F");
		 }
		 // 세션 초기화(정보 수정했기에 초기화)
		L_memberVO vo =  service.updateMember(memberVO);
		request.getSession().removeAttribute("sessionVO");
		log.info(vo+"*************** update Member ********************");
		if(vo!=null) { 
			request.getSession().setAttribute("sessionVO", vo); // 세션에 저장
			request.getSession().setMaxInactiveInterval(60*30); // 세션 유지시간 15분 설정
			return "redirect:profile";
		}else {
			return "redirect:login";
		}
	}
	
	@RequestMapping(value="/L_member/pwUpdate")
	public String pwUpdate(HttpServletRequest request) {
		if(request.getSession().getAttribute("sessionVO")==null) {
			return "redirect:login";
		}
		return "member/pwUpdate";
	}
	
	@RequestMapping(value="/L_member/pwUpdateOk", method=RequestMethod.GET)
	public String pwUpdateOkGET() {
		return "redirect:pwUpdate";
	}
	
	@RequestMapping(value="/L_member/pwUpdateOk", method=RequestMethod.POST)
	public String pwUpdateOkPOST(@ModelAttribute L_memberVO memberVO,@RequestParam("oldPw") String oldPw, RedirectAttributes rttr) {
				log.info(memberVO+"********** pwUpdate start **********");
				String result = service.updateMemberPW(memberVO, oldPw);
				if(result=="1") {
					rttr.addFlashAttribute("msg","비번변경-성공");
					return "redirect:/";
				}else {
					rttr.addFlashAttribute("msg","비번변경-실패");
					return "redirect:pwUpdate";
				}
	}
	
	@RequestMapping(value="/L_member/myContent")
	public String myContent(@RequestParam String fb_userID, HttpServletRequest request, Model model) {
		log.info(fb_userID+"내 게시물 보기");
		if(request.getSession().getAttribute("sessionVO")==null) {
			return "redirect:login";
		}
		model.addAttribute("fbContent", fbservice.myContent(fb_userID));
		return "member/myContent";
	}
	
	
	@RequestMapping(value="/L_member/deleteMember")
	public String deleteMember(HttpServletRequest request){
		if(request.getSession().getAttribute("sessionVO")==null) {
			return "redirect:login";
		}
		return "member/deleteMember";
		
	}
	
	@RequestMapping(value="/L_member/deleteMemberOk",method=RequestMethod.GET)
	public String deleteMemberOkGET(){
		return "redirect:deleteMember";
	}
	
	@RequestMapping(value="/L_member/deleteMemberOk",method=RequestMethod.POST)
	public String deleteMemberOkPOST(@ModelAttribute L_memberVO memberVO, RedirectAttributes rttr, HttpServletRequest request){
		String result = service.deleteMember(memberVO);
		if(result=="1") {
			request.getSession().removeAttribute("sessionVO");
			rttr.addFlashAttribute("msg", "회원탈퇴성공");
			return "redirect:/";
		}else {
			rttr.addFlashAttribute("msg", "비번틀림");
			return "redirect:deleteMember";
		}
	}
	
	
}