package kr.yjh.lecture.dao;

import java.util.List;

import kr.yjh.lecture.vo.L_faqCategoryVO;
import kr.yjh.lecture.vo.L_faqVO;

public interface L_faqDAO {

	void insertFAQ(L_faqVO vo);
	
	void insertCategory(L_faqCategoryVO vo2);
	
	List<L_faqCategoryVO> categoryList();
	
	List<L_faqVO> faqList(int TYPE_NO);
	
}
