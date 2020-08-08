package kr.yjh.lecture.vo;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

/*CREATE TABLE free_board -- 자유게시판 테이블
(
	fb_no NUMBER PRIMARY KEY,  -- 글번호
	fb_title VARCHAR2(50) NOT NULL, -- 제목
	fb_userID VARCHAR2(30) NOT NULL, -- 아이디
	fb_pwd VARCHAR2(50) 	NULL,	  -- 비밀번호
	fb_content VARCHAR2(2000) NOT NULL, -- 내용
	fb_date TIMESTAMP NOT NULL, -- 날짜 
	fb_count NUMBER, -- 조회수
	fb_likeCnt NUMBER, -- 추천
	fb_hateCnt NUMBER, -- 비추천
	fb_available NUMBER -- 이용
);*/

@XmlRootElement
@Data
public class fb_boardVO {
	private int fb_no;
	private String fb_title;
	private String fb_userID;
	private String fb_pwd;
	private String fb_content;
	private String fb_date;
	private int fb_count;
	private int fb_likeCnt;
	private int fb_hateCnt;
	private int fb_available;
}