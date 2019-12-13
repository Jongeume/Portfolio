package kr.yjh.lecture.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.yjh.lecture.service.L_memberService;

@Controller
public class L_memberController{
		
	@Autowired
	private L_memberService service;

	@RequestMapping(value="/L_member/join")
	public String join() {
		return "join";
	}
	
	@RequestMapping(value="/L_member/joinOk", method=RequestMethod.GET)
	public String joinOkGET() {
		return "redirect:login";
	}
	
	@RequestMapping(value="/L_member/joinOk", method=RequestMethod.POST)
	public String joinOkPOST() {
		//service.confirm();
		return "redirect:login";
	}

	@RequestMapping(value="/L_member/login")
	public String login() {
		return "login";
	}
	
	
	@RequestMapping(value="/member/loginOk")
	public String login(HttpServletRequest request , Model model) {
		// 쿠키를 읽자
		// 쿠키 가져오기 
		// 이유: 아이디저장을 위해.
		Cookie[] cookies = request.getCookies();
		if(cookies!=null && cookies.length>0){
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("ID")) {
					model.addAttribute("ID", cookie.getValue());
					break;
				}
			}
		}
		
		return null;
	}
	
	
}