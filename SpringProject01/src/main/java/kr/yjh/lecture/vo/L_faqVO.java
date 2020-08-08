package kr.yjh.lecture.vo;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

/*FAQ_NO NUMBER PRIMARY KEY,
TYPE_NO NUMBER ,
FAQ_NAME VARCHAR2(50) NOT  NULL,
FAQ_CONTENT VARCHAR2(2000)  NOT NULL,
REGDATE TIMESTAMP NOT NULL*/

@XmlRootElement
@Data
public class L_faqVO {
	private int FAQ_NO;
	private int TYPE_NO;
	private String FAQ_NAME;
	private String FAQ_CONTENT;
	private String REGDATE;
}
