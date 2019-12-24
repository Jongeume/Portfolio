package kr.yjh.lecture.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.yjh.lecture.service.L_memberService;
import kr.yjh.lecture.vo.L_memberVO;

@Controller
public class L_memberController{
	
	
	@Autowired
	private L_memberService service;

	@RequestMapping(value="/L_member/join")
	public String join(HttpServletRequest request) {
		if(request.getSession().getAttribute("sessionVO")!=null) {
			return "redirect:/";
		}
		return "join";
	}
	
	@RequestMapping(value="/L_member/fregister")
	public String fregister() {
		return "fregister";
	}
	
	@RequestMapping(value="/L_member/joinOk", method=RequestMethod.GET)
	public String joinOkGET() {
		return "redirect:login";
	}

	
	@RequestMapping(value="/L_member/joinOk", method=RequestMethod.POST)
	public String joinOkPOST(@ModelAttribute L_memberVO vo) {
		System.out.println(vo+"************* joinOkPOST **********");
		// 서비스를 호출해서 DB에 저장하고
		service.insert(vo);
		return "redirect:login";
	}

	@RequestMapping(value="/L_member/login")
	public String login(HttpServletRequest request) {
		//세션정보가 null이 아닐때 = 이미 로그인을 하였기에 세션이 존재.
		if(request.getSession().getAttribute("sessionVO")!=null) {
			return "redirect:/";
		}
		return "login";
		}
	
	@RequestMapping(value="/L_member/loginOk", method=RequestMethod.GET)
	public String loginOkGET() {
		return "redirect:login";
	}
	
	@RequestMapping(value="/L_member/loginOk", method=RequestMethod.POST)
	public String loginOkPOST(@ModelAttribute L_memberVO memberVO, HttpServletRequest request) {
		L_memberVO vo = service.loginOk(memberVO);
		if(vo==null) {
			return "redirect:/L_member/login";
		}else {
			request.getSession().setAttribute("sessionVO", vo); // 세션에 저장
			request.getSession().setMaxInactiveInterval(60*30); // 세션 유지시간 15분 설정
			return "redirect:/"; // home으로
		}
	}
	@RequestMapping(value="/L_member/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam String ID) {
		System.out.println(ID + "******************* idCheck **************************");
		// 서비스를 호출해서 아이디 중복 검사
		String result = service.idCheck(ID);
		return result;
	}
	
	
	@RequestMapping(value="/L_member/logOut")
	public String logOut(HttpServletRequest request) {
		request.getSession().removeAttribute("sessionVO");
		return "redirect:/"; 
	}
}