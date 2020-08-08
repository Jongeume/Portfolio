CREATE TABLE L_member -- 인강 회원관리 테이블
(
	M_NO 		NUMBER 			PRIMARY KEY, -- 회원번호	
	ID			VARCHAR2(50) 	NULL,	  -- 회원아이디
	PASSWORD 	VARCHAR2(50) 	NULL,	  -- 비밀번호
	NAME		VARCHAR2(50)	NULL,	  -- 회원이름
	NICKNAME    VARCHAR2(50)	NULL,     -- 닉네임
	BIRTH		TIMESTAMP		NULL,	  -- 생년월일
	PHONE		VARCHAR2(50)	NULL,	  -- 핸드폰
	ZIPCODE		VARCHAR2(50)	NULL,	  -- 우편번호
	ADDR1		VARCHAR2(100)	NULL,	  -- 주소
	ADDR2		VARCHAR2(100)	NULL,	  -- 상세 주소
	GENDER		VARCHAR2(50)	NULL,	  -- 성별
	USE			NUMBER(1)		NULL,	  -- 사용여부
	REGDATE		TIMESTAMP		NULL	  -- 등록일
);
DROP TABLE L_member;

CREATE SEQUENCE L_MEMBER_M_NO_SEQ;

DROP SEQUENCE LEC_MEMBER_M_NO_SEQ;

INSERT INTO LEC_MEMBER(M_NO, ID, PASSWORD, NAME, NICKNAME, BIRTH, PHONE,
 ZIPCODE, ADDR1, ADDR2, GENDER, USE, REGDATE)
VALUES (LEC_MEMBER_M_NO_SEQ.NEXTVAL,'casta10@naver.com','4216','윤종휘','종휘쿤',
'1999-11-29','010-8254-0551','12312','경기도','신프','M','2',SYSDATE);



----------------------------------------------------------------------------------
CREATE TABLE FAQ_CATEGORY -- 자주하는 질문 유형
(
	TYPE_NO NUMBER PRIMARY KEY,
	FAQ_TYPE VARCHAR2(50) NOT NULL
);
DROP TABLE FAQ_CATEGORY;
CREATE SEQUENCE FAQ_CATEGORY_TYPE_NO_SEQ;
DROP SEQUENCE FAQ_CATEGORY_TYPE_NO_SEQ;

INSERT INTO FAQ_CATEGORY VALUES (FAQ_CATEGORY_TYPE_NO_SEQ.NEXTVAL, '서비스 관련 문의');
--------------------------------------------------------------------------------
CREATE TABLE FAQ -- 자주하는 질문 테이블
( 
	FAQ_NO NUMBER PRIMARY KEY,
	TYPE_NO NUMBER ,
	FAQ_NAME VARCHAR2(50) NOT  NULL,
	FAQ_CONTENT VARCHAR2(2000)  NOT NULL,
	REGDATE TIMESTAMP NOT NULL
);
DROP TABLE FAQ;
ALTER TABLE FAQ ADD FOREIGN KEY(TYPE_NO) REFERENCES FAQ_CATEGORY(TYPE_NO); -- 외래키
CREATE SEQUENCE FAQ_FAQ_NO_SEQ;
DROP SEQUENCE FAQ_FAQ_NO_SEQ;

INSERT INTO FAQ VALUES (FAQ_FAQ_NO_SEQ.NEXTVAL, '1' , '서비스가 왜이런가요?','서비스가 개판이에요! 개선해주세요', SYSDATE);
INSERT INTO FAQ VALUES (FAQ_FAQ_NO_SEQ.NEXTVAL, '3' , '보안이 왜이런가요?','보안 정말 개판이에요! 개선해주세요', SYSDATE);
--------------------------------------------------------------------------------
CREATE TABLE free_board -- 자유게시판 테이블
(
	fb_no NUMBER PRIMARY KEY, 
	fb_title VARCHAR2(50) NOT NULL,
	fb_content VARCHAR2(2000) NOT NULL,
	fb_userID VARCHAR2(30) NOT NULL,
	fb_date TIMESTAMP NOT NULL,
	fb_count NUMBER,
	fb_available NUMBER
);
CREATE SEQUENCE free_board_fb_no_SEQ;

DROP TABLE PROFILE_BOARD;

DROP SEQUENCE profile_board_pb_no_seq;

INSERT INTO profile_board(pb_no, pb_title, pb_content, pb_userID, pb_date, pb_count, pb_available)
VALUES (profile_board_pb_no_SEQ.NEXTVAL,'반가워요','모두들 방가방가~ ㅎㅎ','casta10',SYSDATE,'1','2');

--------------------------------------------------------------------------------
ALTER SEQUENCE profile_board_pb_no_SEQ INCREMENT BY 1;
alter sequence profile_board_pb_no_SEQ nocache;
SELECT  * FROM user_sequences;
SELECT profile_board_pb_no_SEQ FROM DUAL;
SELECT LAST_NUMBER FROM USER_SEQUENCES  WHERE SEQUENCE_NAME = 'profile_board_pb_no_SEQ';




SELECT 
		PB_NO,
  		PB_TITLE,
  		PB_USERID,
  		PB_COUNT,
  		PB_AVAILABLE,
  		PB_CONTENT,
	CASE WHEN pb_date > TO_CHAR(SYSDATE,'YYYY-MM-DD') THEN TO_CHAR(pb_date,'HH24:mm:ss')   /* 오늘 작성한 글 시간만 출력 */
	     ELSE TO_CHAR(pb_date,'YYYY-MM-DD') /* 이전 작성글 */
	END pb_date
FROM profile_board WHERE pb_no = '3'  ;

select 
			TYPE_NO,
			FAQ_TYPE
		from
			FAQ_CATEGORY
		order by 
			TYPE_NO;