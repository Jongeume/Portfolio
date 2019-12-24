package kr.yjh.lecture.service;

import java.util.HashMap;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import kr.yjh.lecture.dao.L_memberDAO;
import kr.yjh.lecture.vo.L_memberVO;

@Service
public class L_memberService {

	@Autowired
	private L_memberDAO dao;

	@Autowired
	private JavaMailSender mailSender;

	// 1. 회원정보 DB에 저장
	public void insert(L_memberVO vo) {
		// 데이터 검증
		if (vo != null && vo.getID() != null)
			dao.insert(vo);
	}
	
	public void sendEmail(L_memberVO memberVO) {

		MimeMessagePreparator preparator = getMessagePreparator(memberVO);

		try {
			mailSender.send(preparator);
			System.out.println("메일 보내기 성공 *******************************");
		} catch (MailException ex) {
			System.err.println(ex.getMessage());
		}
	}

	
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
	public void confirm(String ID) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("ID", ID);
		L_memberVO vo = dao.selectByID(map);
		//DB내용변경 =  인증완료후 use 0->2 변경하기위함.
		if(vo!=null) {
			HashMap<String, String> map2 = new HashMap<String, String>();
			map2.put("ID", ID);
			map2.put("USE", "2");
			dao.updateUse(map2);
		}
	}
	
	// 서비스를 호출해서 아이디 중복 검사
    // 아이디 중복 검사
    public String idCheck(String ID) {
    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("ID", ID);
    	L_memberVO vo = dao.selectByID(map);
    	return vo == null ? "0" : "1";
    }
	
	// 2. 로그인
	public L_memberVO loginOk(L_memberVO memberVO) {
		L_memberVO vo = null;
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("ID", memberVO.getID()); //memberVO의 아이디를 map넣어준뒤,
 		vo = dao.selectByID(map); //vo에 map값을 넣어준다 (map안엔 아이디)
		if(vo!=null) { //vo가 null이 아닐때
			if(!vo.getPASSWORD().equals(memberVO.getPASSWORD())) { 
				// vo의 비밀번호와 memberVO의 비밀번호가 다르면 
				vo = null; // vo값은 초기화된다.
			}
		}
		return vo; 
	}
	
	
	
	
	

}
