package kr.yjh.lecture.service;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import kr.yjh.lecture.dao.L_memberDAO;
import kr.yjh.lecture.vo.L_memberVO;

@Service
public class L_memberService {

	@Autowired
	private L_memberDAO dao;

	// 1. 회원정보 DB에 저장
	public void insert(L_memberVO vo) {
		// 데이터 검증
		if (vo == null || vo.getID() == null)
			return;
		// 회원 정보 DB저장
		dao.insert(vo);
	}

	@SuppressWarnings("unused")
	private MimeMessagePreparator getMessagePreparator(final L_memberVO vo) {
	    MimeMessagePreparator preparator = new MimeMessagePreparator() {
	                public void prepare(MimeMessage mimeMessage) throws Exception {
	                    mimeMessage.setFrom("jongeume@gmail.com");
	                    mimeMessage.setRecipient(Message.RecipientType.TO,
	                            new InternetAddress(vo.getID()));
	                    mimeMessage.setText("반갑습니다. " + vo.getID() +"님 <br>"
	                    		+ "회원 가입을 축하드립니다.<br>"
	                    		+ "회원 가입을 완료하실려면 다음의 링크를 클릭해사 인증하시기 바랍니다.<br>"
	                            + "<a href='https://location:8080/lecture/L_member/confirm?ID="+vo.getID()+"'인증</a><br>");
	                    mimeMessage.setSubject("인강사이트 회원 가입을 축하드립니다.");
	        }
	    };
	    return preparator;
	}
	
	// 인증메일 발송 후 인증 했을시 ==> use(permission)을 0->2 로 준다.
	// (use : 2 = 인증함 , 1 = 관리자 , 0 = 인증안함)
	public void confirm(L_memberVO vo) {
		
	}
	

}
