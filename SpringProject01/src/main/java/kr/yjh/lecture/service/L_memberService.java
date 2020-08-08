package kr.yjh.lecture.service;

import java.util.HashMap;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import kr.yjh.lecture.dao.L_memberDAO;
import kr.yjh.lecture.vo.L_memberVO;

@Service
public class L_memberService {
	
	private static final Logger logger = LoggerFactory.getLogger(L_memberService.class);
	
	@Autowired
	private L_memberDAO dao;

	@Autowired
	private JavaMailSender mailSender;

	// 1. 회원정보 DB에 저장
	public void insert(L_memberVO vo) {
		// 데이터 검증
		if (vo != null && vo.getID() != null)
			dao.insert(vo);
		// sendEmail
		sendEmail(vo, "join");
	}
	
	// 이메일 보내기
	public void sendEmail(L_memberVO memberVO, String div) {

		if(div.equals("join")) {
			
			MimeMessagePreparator preparator = getMessagePreparator1(memberVO);

			try {
				mailSender.send(preparator);
				System.out.println("메일 보내기 성공 *******************************");
			} catch (MailException ex) {
				System.err.println(ex.getMessage());
			}
		}else if(div.equals("updatePW")) {
			
			MimeMessagePreparator updatePW = getMessagePreparator2(memberVO);
		
			try {
				mailSender.send(updatePW);
				System.out.println("메일 보내기 성공 *******************************");
			} catch (MailException ex) {
				System.err.println(ex.getMessage());
			}
		}
		
	}

	private MimeMessagePreparator getMessagePreparator1(final L_memberVO vo) {
	    MimeMessagePreparator preparator = new MimeMessagePreparator() {
	        public void prepare(MimeMessage mimeMessage) throws Exception {
	    	   /*          
	                    mimeMessage.setFrom("jongeume@gmail.com");
	                    mimeMessage.setRecipient(Message.RecipientType.TO,
	                            new InternetAddress(vo.getID()));
	                    mimeMessage.setText("반갑습니다. " + vo.getID() +"님 <br>"
	                    		+ "회원 가입을 축하드립니다.<br>"
	                    		+ "회원 가입을 완료하실려면 다음의 링크를 클릭해사 인증하시기 바랍니다.<br>"
	                            + "<a href='https://location:8080/lecture/L_member/confirm?ID="+vo.getID()+"'인증</a><br>");
	                    mimeMessage.setSubject("인강사이트 회원 가입을 축하드립니다.");
	        }
	    };*/
	    	final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
			helper.setFrom("jongeume@gmail.com");
			helper.setTo(vo.getID());
			helper.setSubject("커뮤니티 사이트 회원가입을 축하드립니다.");
			String html="반갑습니다."+vo.getID()+"님<br>"+
						"회원가입을 축하드립니다.<br>"+
						"회원 가입을 완료하실려면 다음의 링크를 클릭해서 인증하시기 바랍니다.<br>"+
						"<a href=\'http://localhost:8080/lecture/L_member/confirm?ID="+vo.getID()+"'</a>"+
						"인증<br>";
			helper.setText(html, true);
		}
	};
	    return preparator;
	}
	private MimeMessagePreparator getMessagePreparator2(final L_memberVO vo) {
		MimeMessagePreparator updatePW = new MimeMessagePreparator() {
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom("jongeume@gmail.com");
				helper.setTo(vo.getID());
				helper.setSubject("임시 비밀번호 발급");
				helper.setText(
					vo.getID() +"님의 임시 비밀번호입니다. <br>"
					+"비밀번호를 변경하여 사용하세요.<br>"
					+"<h3> 임시 비밀번호 : "+ vo.getPASSWORD()+"</h3>" + "<br>"
				, true);
				
			}
		};
		return updatePW;
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
    	if(dao.countMember(ID)==1) {
    		System.out.println(dao.countMember(ID));
    		return "1";
    	}
    	else
    		System.out.println(dao.countMember(ID));
    		return "0";
    }
    //닉네임
    public String nicknameCheck(String NICKNAME) {
		if(dao.countNickname(NICKNAME)==1) {
    		System.out.println(dao.countNickname(NICKNAME));
    		return "1";
    	}
    	else
    		System.out.println(dao.countNickname(NICKNAME));
    		return "0";
	}
	//폰번호
	public String phoneCheck(String PHONE) {
		if(dao.countPhone(PHONE)==1) {
			System.out.println(dao.countPhone(PHONE));
			return "1";
		}
		else
			System.out.println(dao.countNickname(PHONE));
		return "0";
	}
	
	
	
	
	// 2. 로그인
	public L_memberVO loginOk(L_memberVO memberVO) {
		L_memberVO vo = null;
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("ID", memberVO.getID()); //memberVO의 아이디를 map넣어준뒤,
 		vo = dao.selectByID(map); //ID로 DB에 저장된 회원정보를 가져온'
 		System.out.println(vo+" **********vo 다 하하하*****************");
		if(vo!=null) { //vo가 null이 아닐때
			if(!vo.getPASSWORD().equals(memberVO.getPASSWORD())) { 
				// vo의 비밀번호와 memberVO의 비밀번호가 다르면 
				vo = null; // vo값은 초기화된다.
			}
		}
		return vo; 
	}
	
	// 로그인 오류
	public String loginError(L_memberVO memberVO) {
		L_memberVO vo2 = null;
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("ID", memberVO.getID());
		vo2 = dao.selectByID(map);
		if(vo2!=null) {
			if(!vo2.getPASSWORD().equals(memberVO.getPASSWORD())) {
				return  "2"; //-- 비번틀림
			}
			return "NO"; //-- 아이디, 비번 둘 다 맞음
		}else {
			return "1"; //-- 아이디 없음
		}
	}

	// 아이디 찾기
	public L_memberVO idSearch(L_memberVO memberVO) {
		L_memberVO vo = null;
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("NAME", memberVO.getNAME());
		map.put("PHONE", memberVO.getPHONE());
			logger.info(map.toString());
		vo = dao.userIDSearch(map);
	    System.out.println(vo);
	    
	    
		return vo;
	}

	// 비번 찾기 - 아이디로 회원정보 불러오기
	public L_memberVO pwSearch(L_memberVO memberVO) {
		L_memberVO vo = null;
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("ID", memberVO.getID());
		vo = dao.selectByID(map);
		return vo;
	}

	// 비번 찾기 - 임시 비밀번호 변경
	public void updatePW(L_memberVO memberVO) {
		String pw = "";
		for(int i=0; i<12; i++) {
			pw += (char)((Math.random() * 26) + 97);
		}
		memberVO.setPASSWORD(pw);
		// 비밀번호 변경
		dao.updatePassword(memberVO);
		// 비밀번호 변경 후 메일 발송
		sendEmail(memberVO, "updatePW");
		System.out.println("********* 이메일전송요청 ********");
		
	}

	
	// 회원정보 수정
	public L_memberVO updateMember(L_memberVO memberVO) {
		dao.updateMember(memberVO);
		System.out.println(memberVO+"****************회원정보 변경 요청*******************");
		L_memberVO vo = null;
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("ID", memberVO.getID()); //memberVO의 아이디를 map넣어준뒤,
 		vo = dao.selectByID(map); //ID로 DB에 저장된 회원정보를 가져온'
 		return vo;
	}
	
	// 비밀번호 수정
	public String updateMemberPW(L_memberVO memberVO,String oldPw) {
		L_memberVO vo = null;
		HashMap<String, String> map = new HashMap<String, String>(); 
		map.put("ID", memberVO.getID());
		vo = dao.selectByID(map);
		String pw = vo.getPASSWORD();
		vo.setPASSWORD(memberVO.getPASSWORD());
		if(pw.equals(oldPw)) {
			System.out.println(vo.getPASSWORD()+" ********* 비번 변경 ************");
			dao.updatePassword(vo);
			return "1";
		}else {
			System.out.println(pw+", "+oldPw+" ******** 기존 비밀번호가 다릅니다. ********");
			return "0";
		}
	}
	
	// 회원 탈퇴
	public String deleteMember(L_memberVO memberVO) {
		L_memberVO vo = null;
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("ID", memberVO.getID());
		vo=dao.selectByID(map);
		if(vo.getPASSWORD().equals(memberVO.getPASSWORD())){
			dao.deleteMember(memberVO);
			System.out.println("***** 회원탈퇴 성공 *******");
			return "1";
		}else {
			System.out.println(vo.getPASSWORD()+", "+ memberVO.getPASSWORD()+" ****** 비번틀림 ******");
			return "0";
		}
	}
	
	
	
}
