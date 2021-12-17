-- 사용자 ddl
use example;

drop table empids;
CREATE TABLE EMPIDS(TABLE_NAME VARCHAR(16) NOT NULL PRIMARY KEY,NEXT_ID DECIMAL(30) NOT NULL);
insert empids values('EMPLOYEE',01);


DROP TABLE EMPLOYEE;
-- CREATE TABLE EMPLOYEE (
-- EMP_No VARCHAR(6) PRIMARY KEY NOT NULL, 
-- EMP_Name VARCHAR(15) NOT NULL,
-- EMP_Addr VARCHAR(50) NOT NULL,
-- EMP_Birth DATE NOT NULL,
-- EMP_Gen VARCHAR(1) NOT NULL,
-- EMP_JoinDT DATE NOT NULL,
-- EMP_Phone VARCHAR(13) NOT NULL,
-- EMP_Tel VARCHAR(12),
-- EMP_Dept VARCHAR(2) NOT NULL,
-- EMP_Position VARCHAR(2) NOT NULL,
-- EMP_Email VARCHAR(50) NOT NULL,
-- Input_Photo VARCHAR(50),
-- Real_Photo VARCHAR(200),
-- EMP_ID VARCHAR(20) NOT NULL,
-- EMP_PW VARCHAR(20) NOT NULL,
-- foreign key (EMP_Dept) references DEPT(DEPT_Code),
-- foreign key (EMP_Position) references POS(POS_Code)
-- );
use example;
drop table employee;
CREATE TABLE EMPLOYEE (
EMP_No VARCHAR(6) PRIMARY KEY NOT NULL, 
EMP_Name VARCHAR(15) NOT NULL,
EMP_Addr VARCHAR(50) NOT NULL,
EMP_Birth DATE NOT NULL,
EMP_Gen VARCHAR(1) NOT NULL,
EMP_JoinDT DATE NOT NULL,
EMP_Phone VARCHAR(13) NOT NULL,
EMP_Tel VARCHAR(12),
EMP_Dept VARCHAR(20) NOT NULL,
EMP_Position VARCHAR(8) NOT NULL,
EMP_Email VARCHAR(50) NOT NULL,
Input_Photo VARCHAR(50),
Real_Photo VARCHAR(200),
EMP_ID VARCHAR(20) NOT NULL,
EMP_PW VARCHAR(100) NOT NULL,
EMP_PWck VARCHAR(100) NOT NULL
-- foreign key (EMP_Dept) references DEPT(DEPT_Code),
-- foreign key (EMP_Position) references POS(POS_Code)
);

-- 사용자 정보
insert into employee values('211001','이하진','대구 달서구 월배로','1997-04-25','M','2021-10-05','010-9386-7694','','SI사업본부','사원','lhj@forwiz.com','','','lhj','1234','1234');
insert into employee values('211002','강덕구','대구 달서구 월배로','1997-10-25','M','2021-10-06','010-9386-7894','','SI사업본부','사원','gdg@forwiz.com','','','gdg','1234','1234');
INSERT INTO EMPLOYEE VALUES('000000','관리자','주소','1999-09-09','M','2021-10-06','010-0000-0000','','관리자','관리자','manager@forwiz.com','','','admin','1111','1111');
insert into employee values('211103','고등어','대구 달서구 월배로','1997-04-25','M','2021-10-05','010-9386-7694','053-555-5555','SI사업본부','사원','lhj@forwiz.com','','','gde','1234','1234');



-- 부서/직급 테이블 삭제
DROP TABLE POS;
DROP TABLE DEPT;


-- 부서/ 직급 테이블 생성
CREATE TABLE POS(
POS_Code VARCHAR(2) PRIMARY KEY NOT NULL,
POS_Name VARCHAR(12) NOT NULL
);


CREATE TABLE DEPT(
DEPT_Code VARCHAR(2) PRIMARY KEY NOT NULL,
DEPT_Name VARCHAR(20) NOT NULL
);

-- 부서 직급 테이블 정보
INSERT INTO DEPT VALUES('00','관리자');
INSERT INTO DEPT VALUES('01','경영관리팀');
INSERT INTO DEPT VALUES('02','전략사업본부');
INSERT INTO DEPT VALUES('03','영업1본부');
INSERT INTO DEPT VALUES('04','영업2본부');
INSERT INTO DEPT VALUES('05','SI사업본부');
INSERT INTO DEPT VALUES('06','금융사업부');
INSERT INTO DEPT VALUES('07','부설연구소');


INSERT INTO POS VALUES('00','관리자');
INSERT INTO POS VALUES('01','회장');
INSERT INTO POS VALUES('02','사장');
INSERT INTO POS VALUES('03','부사장');
INSERT INTO POS VALUES('04','이사');
INSERT INTO POS VALUES('05','부장');
INSERT INTO POS VALUES('06','차장');
INSERT INTO POS VALUES('07','과장');
INSERT INTO POS VALUES('08','대리');
INSERT INTO POS VALUES('09','주임');
INSERT INTO POS VALUES('10','사원');
INSERT INTO POS VALUES('11','인턴');

use example;
SELECT EMP_Dept,
        ( 
	CASE EMP_Dept
		WHEN '01'  THEN '경영관리팀'
		WHEN '02'  THEN '전략사업본부'
		WHEN '03'  THEN '영업1본부'
		WHEN '04'  THEN '영업2본부'
		WHEN '05'  THEN 'SI사업본부'
		WHEN '06'  THEN '금융사업부'
		WHEN '07'  THEN '부설연구소'
		WHEN '00'  THEN '관리자'
	END
       )AS EMP_DeptName
FROM   EMPLOYEE