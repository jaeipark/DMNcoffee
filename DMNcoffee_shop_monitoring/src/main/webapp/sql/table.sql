--EMP 테이블 생성
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

--EMP 데이터 인서트 (임시용)
insert into EMP VALUES ('abc123', 'abc123', '홍길동', '010', '1111','1111', '2000', '01', '01', 'abc123', 'naver.com', 'MANAGER'); 

--주문 테이블 생성!!
create table ORDERINFO( 
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
    
-- 주문내역 넣기!!
insert into orderinfo VALUES ('2022/09/28', 1, 1, '아이스아메리카노', '없음', 1, 2000, '포장', 'N'); 
insert into orderinfo VALUES ('2022/09/28', 1, 2, '아이스라떼', '얼음많이 샷추가 ', 1, 2500, '포장', 'N'); 
insert into orderinfo VALUES ('2022/09/28', 1, 3, '초코케이크', '없음', 1, 2000, '포장', 'N'); 
insert into orderinfo VALUES ('2022/09/28', 2, 1, '망고스무디', '없음', 2, 4000, '매장', 'N');
insert into orderinfo VALUES ('2022/09/28', 2, 2, '아이스라떼', '샷추가 바닐라시럽 ', 1, 3000, '매장', 'N');
insert into orderinfo VALUES ('2022/09/28', 3, 1, '아이스라떼', '얼음적게 샷추가 카라멜시럽 ', 1, 3000, '매장', 'N');
insert into orderinfo VALUES ('2022/09/28', 4, 1, '아이스라떼', '없음', 3, 6000, '포장', 'N');
insert into orderinfo VALUES ('2022/09/28', 5, 1, '아이스라떼', '없음', 1, 2000, '포장', 'N');
commit;

--날짜 업데이트
update orderinfo set orderdate = '2022/09/28'; --형태 'YYYY/MM/DD' 직접넣기!!
commit;


-- 판매완료 >> 완료대기(시험용)
update orderinfo set complete_yn = 'N';
commit;