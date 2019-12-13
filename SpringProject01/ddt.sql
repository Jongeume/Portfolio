CREATE TABLE LEC_MEMBER -- 인강 회원관리 테이블
(
	M_NO 		NUMBER 			PRIMARY KEY, -- 회원번호	
	ID			VARCHAR2(50) 	NULL,	  -- 회원아이디
	PASSWORD 	VARCHAR2(50) 	NULL,	  -- 비밀번호
	NAME		VARCHAR2(50)	NULL,	  -- 회원이름	
	GENDER		NUMBER(1)		NULL,	  -- 성별
	BIRTH		TIMESTAMP		NULL,	  -- 생년월일
	PHONE		VARCHAR2(50)	NULL,	  -- 핸드폰
	REGDATE		TIMESTAMP		NULL,	  -- 등록일
	USE			NUMBER(1)		NULL,	  -- 사용여부
	ZIPCODE		VARCHAR2(50)	NULL,	  -- 우편번호
	ADDR1		VARCHAR2(100)	NULL,	  -- 주소
	ADDR2		VARCHAR2(100)	NULL	  -- 상세 주소
);
DROP TABLE LEC_MEMBER;

CREATE SEQUENCE LEC_MEMBER_M_NO_SEQ;
DROP SEQUENCE LEC_MEMBER_M_NO_SEQ;



INSERT INTO LEC_MEMBER(M_NO, ID, PASSWORD, NAME, GENDER, BIRTH, PHONE,
REGDATE, USE, ZIPCODE, ADDR1, ADDR2)
VALUES (LEC_MEMBER_M_NO_SEQ.NEXTVAL,'casta10@naver.com','4216','윤종휘',
'1','1999-11-29','01082540551',SYSDATE,'1','12312','경기도','신프');





----------------------------------------------------------------------------------

CREATE TABLE APPLY -- 수강 신청 테이블
(
	A_NO 		NUMBER 		PRIMARY KEY, -- 수강	신청
	LEC_NO 		NUMBER 		, -- 과정	번호
	M_NO 		NUMBER 	 	, -- 회원	번호

);

DROP TABLE APPLY;

----------------------------------------------------------------------------------
s
CREATE TABLE LECTURE -- 과정 테이블
(
	LEC_NO 		 NUMBER		 PRIMARY KEY, -- 과정번호
	S_NO		 NUMBER		 NOT NULL, -- 과목번호
	START		 TIMESTAMP 	 NOT NULL, -- 시작일
	END 		 TIMESTAMP 	 NOT NULL, -- 종료일

);

DROP TABLE LECTURE;
----------------------------------------------------------------------------------

CREATE TABLE SUBJECT -- 과목 테이블
(
	S_NO 		NUMBER   		PRIMARY KEY,	-- 과목번호  
	SUBJECT 	VARCHAR2(20) 	NOT NULL,		-- 과목명
	INTRO 		VARCHAR2(200)	NOT NULL,		-- 과목소개
	CONTENT		VARCHAR2(200)	NOT NULL		-- 교육내용
);

DROP TABLE SUBJECT;