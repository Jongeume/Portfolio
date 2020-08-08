package kr.yjh.lecture.vo;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

/*TYPE_NO NUMBER PRIMARY KEY,
FAQ_TYPE VARCHAR2(50) NOT NULL*/

@XmlRootElement
@Data
public class L_faqCategoryVO {
	private int TYPE_NO;
	private String FAQ_TYPE;
}
