package kr.yjh.lecture.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.yjh.lecture.dao.L_faqDAO;
import kr.yjh.lecture.vo.L_faqCategoryVO;
import kr.yjh.lecture.vo.L_faqVO;

@Service
public class L_faqService {
	
	@Autowired
	private L_faqDAO dao;
	
	
	public void insertFAQ(L_faqVO vo) {
		// 데이터 검증
		if (vo != null && vo.getFAQ_NAME() != null)
			dao.insertFAQ(vo);
	}
	
	public void insertCategory(L_faqCategoryVO vo2) {
		if(vo2 != null && vo2.getFAQ_TYPE() != null)
		 dao.insertCategory(vo2);
	}
	
	
	public List<L_faqCategoryVO> categoryList(){
		return dao.categoryList();
	}
	
	public List<L_faqVO> faqList(int TYPE_NO) {
		return dao.faqList(TYPE_NO);
	}
	
}
