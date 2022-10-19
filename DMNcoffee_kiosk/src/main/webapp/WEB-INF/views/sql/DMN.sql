-- SYS

CREATE USER DMN IDENTIFIED BY cafe;
GRANT CONNECT, RESOURCE TO DMN;

-- DMN --

-- DROP TABLE

DROP TABLE CATEGORY;
DROP TABLE PRODUCT;
DROP TABLE MEMBER;
DROP SEQUENCE member_seq;
DROP TABLE USERLOG;
DROP TABLE OPT;
DROP TABLE CART;
DROP TABLE EMP;
DROP TABLE ORDERINFO;

-- CREATE TABLE

-- CATEGORY 테이블 생성
CREATE TABLE CATEGORY(
	CTNO NUMBER(20) PRIMARY KEY,
    CTNM VARCHAR2(20)
);

-- PRODUCT 테이블 생성
CREATE TABLE PRODUCT (	
    PDNO NUMBER(10) PRIMARY KEY,
    PDNM VARCHAR2(50),
    PDPRICE NUMBER(7),
    CTNO NUMBER(20) REFERENCES CATEGORY
);

-- MEMBER 테이블 생성 
CREATE TABLE MEMBER(
    MEMNO NUMBER(10) PRIMARY KEY,
    PHONE1 VARCHAR2(3),
    PHONE2 VARCHAR2(4),
    PHONE3 VARCHAR2(4),
    MEMPOINT NUMBER(10),
    STAMPCHECK VARCHAR2(5)
);
-- MEMBER 시퀀스 생성
CREATE SEQUENCE member_seq
INCREMENT BY 1
START WITH 1;

-- USERLOG 테이블 생성
CREATE TABLE USERLOG(
    PHONE2 VARCHAR2(4),
    PHONE3 VARCHAR2(4),
    DATELOG VARCHAR2(20),
    STATUS VARCHAR2(10),
    POINTLOG NUMBER(10)
);

-- OPT 테이블 생성 
CREATE TABLE OPT(
    OPTNO NUMBER(10) PRIMARY KEY,
    OPTNM VARCHAR2(30),
    OPTPRICE NUMBER(10),
    CTNO NUMBER(20)
);

-- CART 테이블 생성
CREATE TABLE CART(
    PDNO VARCHAR2(20),
    PDNM VARCHAR2(50),
    AMOUNT NUMBER(3), 
    TOTALPRICE NUMBER(10),
    OPT VARCHAR2(100),
   	CTNM VARCHAR2(30),
   	PDNUM NUMBER(3)
);

-- ORDERINFO 테이블 생성 
CREATE TABLE ORDERINFO( 
    ORDERDATE VARCHAR(20),
    ORDERSEQ NUMBER(4),
    PDNUM NUMBER(4),
    PDNM VARCHAR(50),
    OPT VARCHAR(100),
    AMOUNT NUMBER(10),
    PRICE NUMBER(10),
    ORDERTAKEOUT VARCHAR(20),
    COMPLETE_YN VARCHAR(20)
);

 -- EMP 테이블 생성 
CREATE TABLE EMP(
    USERID VARCHAR2(15) PRIMARY KEY,
    PASSWD VARCHAR2(15) NOT NULL,
    USERNAME VARCHAR2(10) NOT NULL,
    PHONE1 VARCHAR2(3) NOT NULL,
    PHONE2 VARCHAR2(4) NOT NULL,
    PHONE3 VARCHAR2(4) NOT NULL,
    BDAY1 VARCHAR2(4) NOT NULL,
    BDAY2 VARCHAR2(2) NOT NULL,
    BDAY3 VARCHAR2(2) NOT NULL,
    EMAIL1 VARCHAR2(20) NOT NULL,
    EMAIL VARCHAR2(20) NOT NULL,
    GRADE VARCHAR2(15) NOT NULL
);

-- INSERT

-- CATEGORY 테이블 insert문
insert into category (ctno, ctnm) VALUES (01, '디저트');
insert into category (ctno, ctnm) VALUES (02, '논카페');
insert into category (ctno, ctnm) VALUES (03, '디카페인');
insert into category (ctno, ctnm) VALUES (04, '스무디');
insert into category (ctno, ctnm) VALUES (05, '커피(HOT)');
insert into category (ctno, ctnm) VALUES (06, '커피(ICE)');


-- PRODUCT 테이블 insert문
insert into product (pdno, pdnm , pdprice, ctno) VALUES (1, '레드벨벳 스틱케이크', 2100, 01);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (2, '초콜릿 스틱케이크',2100, 01);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (3, '치즈 스틱케이크', 2100, 01);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (4, '티라미수 스틱케이크', 2100, 01);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (5, '허니브레드', 2500, 01);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (6, '녹차 마카롱', 1700, 01);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (7, '딸기 마카롱', 1700, 01);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (8, '민트 마카롱', 1700, 01);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (9, '바닐라 마카롱', 1700, 01);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (10, '블루베리 마카롱', 1700, 01);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (11, '유니콘 마카롱', 1700, 01);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (12, '인절미 마카롱',1700, 01);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (13, '자몽 마카롱', 1700, 01);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (14, '초코 마카롱',1700, 01);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (15, '피치 마카롱', 1700, 01);

-- 2. 논카페 insert문
insert into product (pdno, pdnm , pdprice, ctno) VALUES (21, '패션후르츠 에이드',2700, 02);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (22, '라임모히또 에이드', 2700, 02);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (23, '복숭아 아이스티', 2700, 02);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (24, '블루레몬 에이드', 2700, 02);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (25, '자몽 에이드', 2700, 02);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (26, '오렌지 에이드', 2700, 02);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (27, '핑크레몬 에이드', 2700, 02);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (28, '딸기라떼',2700, 02);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (29, '초코라떼', 2700, 02);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (30, '아이스 녹차라떼', 2700, 02);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (31, '핫녹차 라떼', 2700, 02);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (32, '토피넛 라떼', 2700, 02);

-- 3. 디카페인 insert문
insert into product (pdno, pdnm , pdprice, ctno) VALUES (41, '콜드브루 라떼', 3300, 03);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (42, '콜드브루 슈가라떼', 3500, 03);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (43, '콜드브루 마끼아또', 3500, 03);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (44, '콜드브루 헤이즐넛라떼', 3500, 03);

-- 4. 스무디 insert문
insert into product (pdno, pdnm , pdprice, ctno) VALUES (51, '녹차 스무디', 2800, 04);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (52, '딸기요거트 스무디', 2800, 04);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (53, '망고요거트 스무디', 2800, 04);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (54, '망고 스무디', 2800, 04);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (55, '복숭아 스무디',  2800, 04);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (56, '블루베리 스무디',  2800, 04);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (57, '요거트 스무디', 2800, 04);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (58, '청포도 스무디', 2800, 04);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (59, '초코 스무디',  2800, 04);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (60, '토마토 스무디',  2800, 04);

-- 5. 커피(HOT) insert문
insert into product (pdno, pdnm , pdprice, ctno) VALUES (71, '핫 라떼',  2000, 05);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (72, '핫 모카', 2500, 05);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (73, '핫 아메리카노', 1500, 05);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (74, '핫 카푸치노', 2000, 05);

-- 6. 커피(ICE) insert문
insert into product (pdno, pdnm , pdprice, ctno) VALUES (81, '아이스 라떼', 2000, 06);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (82, '아이스 모카', 2500, 06);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (83, '아이스 바닐라라떼',  2900, 06);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (84, '아이스 아메리카노', 1500, 06);
insert into product (pdno, pdnm , pdprice, ctno) VALUES (85, '아이스 카푸치노',  2000, 06);

--  OPT  CATEGORY 2[논카페] INSERT
insert into OPT VALUES (21,'덜달게',0,02);
insert into OPT VALUES (22,'슈가시럽',500,02);
insert into OPT VALUES (23,'바닐라시럽',500,02);
insert into OPT VALUES (24,'카라멜시럽',500,02);
insert into OPT VALUES (25,'헤이즐넛시럽',500,02);

--  OPT  CATEGORY 4[스무디] INSERT
insert into OPT VALUES (41,'덜달게',0,04);
insert into OPT VALUES (42,'시럽추가',500,04);
insert into OPT VALUES (43,'휘핑크림',500,04);

--  OPT CATEGORY 5[커피(HOT)] INSERT
insert into OPT VALUES (51,'샷추가',500,05);
insert into OPT VALUES (52,'슈가시럽',500,05);
insert into OPT VALUES (53,'바닐라시럽',500,05);
insert into OPT VALUES (54,'카라멜시럽',500,05);
insert into OPT VALUES (55,'헤이즐넛시럽',500,05);
insert into OPT VALUES (56,'연하게',0,05);

--  OPT  CATEGORY 6[커피(ICE)] INSERT
insert into OPT VALUES (61,'샷추가',500,06);
insert into OPT VALUES (62,'슈가시럽',500,06);
insert into OPT VALUES (63,'바닐라시럽',500,06);
insert into OPT VALUES (64,'카라멜시럽',500,06);
insert into OPT VALUES (65,'헤이즐넛시럽',500,06);
insert into OPT VALUES (66,'연하게',0,06);
insert into OPT VALUES (67,'얼음많이',0,06);
insert into OPT VALUES (68,'얼음적게',0,06);


COMMIT;









