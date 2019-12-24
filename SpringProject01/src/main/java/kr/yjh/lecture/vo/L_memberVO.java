package kr.yjh.lecture.vo;


import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;


@XmlRootElement
@Data
public class L_memberVO {
	
	private int M_NO;
	private String ID;
	private String PASSWORD;
	private String NAME;
	private String NICKNAME;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date BIRTH;
	private String PHONE;
 	private String ZIPCODE;
	private String ADDR1;
	private String ADDR2;
	private int GENDER;
	private int USE; // 0 = 인증미완료 , 1 = 관리자계정 ,2 = 인증완료
	private Date REGDATE;
	

}
