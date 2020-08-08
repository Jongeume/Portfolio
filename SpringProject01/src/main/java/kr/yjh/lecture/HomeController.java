package kr.yjh.lecture;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.yjh.common.Pagination;
import kr.yjh.lecture.service.fb_boardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@Autowired
	private fb_boardService service;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = {"/","/home"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model
			, @RequestParam(required = false, defaultValue = "1") int page

			, @RequestParam(required = false, defaultValue = "1") int range 
			
			
			)throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		//전체 게시글 개수
		int listCnt =  service.getBoardListCnt();
		
		//Pagination
				Pagination pagination = new Pagination();
				pagination.pageInfo(page, range, listCnt);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("listFb", service.listFb(pagination));
		model.addAttribute("latestList", service.latestList(pagination));
		model.addAttribute("popuarList", service.popuarList(pagination));
		model.addAttribute("hotest", service.hotest(pagination));

		
		
		return "home";
	}
	
}
