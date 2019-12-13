package kr.yjh.lecture.vo;

import java.util.Date;

import lombok.Data;

/*
 *  M_NO        NUMBER           NOT NULL, 
    ID          VARCHAR2(50)     NULL, 
    PASSWORD    VARCHAR2(50)     NULL, 
    NAME        VARCHAR2(50)     NULL, 
    GENDER      NUMBER(1)        NULL, 
    BIRTH       TIMESTAMP        NULL, 
    PHONE       VARCHAR2(50)     NULL, 
    REGDATE     TIMESTAMP        NULL, 
    USE         VARCHAR2(1)      NULL, 
    ZIPCODE     VARCHAR2(50)     NULL, 
    ADDR1       VARCHAR2(100)    NULL, 
    ADDR2       VARCHAR2(100)    NULL, 
 */
@Data
public class L_memberVO {
	private int M_NO;
	private String ID;
	private String PASSWORD;
	private String NAME;
	private String NICKNAME;
	private int GENDER;
	private String PHONE;
	private Date REGDATE;
	private int USE; // 0 = 인증미완료 , 1 = 관리자계정 ,2 = 인증완료
 	private String ZIPCODE;
	private String ADDR1;
	private String ADDR2;
}
