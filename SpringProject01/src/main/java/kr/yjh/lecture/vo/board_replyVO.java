package kr.yjh.lecture.vo;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

/*CREATE TABLE board_Reply
(
	br_no NUMBER PRIMARY KEY,
	fb_no NUMBER ,
	br_content VARCHAR2(2000) NOT NULL,
	br_id VARCHAR2(50) NOT NULL,
	br_date TIMESTAMP NOT NULL, 
	br_edt TIMESTAMP NOT NULL
);*/

@XmlRootElement
@Data
public class board_replyVO {
	
	private int br_no; 
	private int fb_no; 
	private String br_content;
	private String br_id;
	private String br_date;
	private String br_edt;
	
}