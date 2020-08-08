package kr.yjh.lecture.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.yjh.lecture.service.L_faqService;
import kr.yjh.lecture.vo.L_faqCategoryVO;

@Controller
public class faqController{
	
	
	@Autowired
	private L_faqService service;
	
	@RequestMapping(value="/L_board/serviceCenter")
	public String serviceCenter(Model model) {
		model.addAttribute("faqList", service.categoryList());
		return "board/serviceCenter";
	}
	
	@RequestMapping(value="/L_board/categoryInsert")
	public String categoryInsert() {
		return "board/categoryInsert";
	}
	
	@RequestMapping(value="/L_board/categoryInsertOk", method=RequestMethod.GET)
	public String categoryInsertOkGET() {
		return "redirect:categoryInsert";
	}
	
	@RequestMapping(value="/L_board/categoryInsertOk",method=RequestMethod.POST)
	public String categoryInsertOkPOST(@ModelAttribute L_faqCategoryVO vo) {
		service.insertCategory(vo);
		return "redirect:serviceCenter";
	}
	
	@RequestMapping(value="/L_board/faqListView", method=RequestMethod.GET)
	public String faqListView(@RequestParam int TYPE_NO, Model model) {
		List<L_faqCategoryVO> faqList = service.categoryList();
		System.out.println("faqList : " + faqList.get(0));
		String test = faqList.get(TYPE_NO-1).getFAQ_TYPE();
		model.addAttribute("test",test);
		model.addAttribute("faqList", faqList);
		model.addAttribute("faqList2", service.faqList(TYPE_NO));
		
		return "board/faqListView";
	}
	
	
	
}