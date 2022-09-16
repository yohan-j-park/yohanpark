/* 데이터베이스 생성 및 삭제 */
/* 테이블을 삭제하는 방법 3가지
	1) delete from 테이블;  (데이터 삭제O, 구조 삭제X, 저장공간 삭제X)
	2) truncate table 테이블명; (데이터 삭제O, 구조 삭제X, 저장공간 삭제O)
	3) drop table 테이블명; (데이터 삭제O, 구조 삭제O, 저장공간 삭제O)
*/
create database mydb;
show databases;

/* 프로젝트에서 사용할 DB 생성 */
use mydb;

/* student 테이블 생성 */
CREATE TABLE student(
	MID varchar(20),
	irum varchar(30),
	phone varchar(50)
);
show tables;
desc student;
/* 암호(pwd)와 주소(address) 컬럼을 추가 */
alter table student add pwd varchar(30);
alter table student add address varchar(50);

/* mid 컬럼을 id로, irum 컬럼명을 name으로 수정 */
alter table student change mid id VARCHAR(30);
ALTER TABLE student CHANGE irum name VARCHAR(30);
desc student;

/* index.jsp에서 student input창에 입력 시킨 정보들 column 추가 */
alter table student add gender varchar(10);
alter table student add zipcode char(10);
alter table student add address2 varchar(50);
alter table student add email varchar(50);

/* 성적 관리 테이블 생성
table name : score
fields : serial(순번), stdid(학번), mdate(시험일자), subject(과목), score(성적)
 */
create table score(
	serial INT,
	stdid varchar(10),
	mdate datetime,
	subject varchar(30),
	score decimal(7,1)
);

desc score;



/* 회원 관리 테이블 생성
table name : member
fields : id(아이디), name(회원명), gender(성별), phohe(연락처),
		 photo(프로필사진), mdate(가입일)
*/
create table member(
	id varchar(20),
	name varchar(10),
	gender varchar(10),
	phone varchar(20),
	mdate datetime,
	photo varchar(50)
);

alter table member change photo picture varchar(50);

desc member;

show tables;

/* 기존 테이블 정보를 사용하려 새로운 테이블 생성 (복사) */
CREATE TABLE cus AS SELECT * FROM classicmodels.customers;
select * from cus;

CREATE TABLE cus2 AS SELECT customerNumber, customerName FROM classicmodels.customers;
select * from cus2;

/* payment사용: 사용 금액(amount)이 50,000 ~ 100,000인 고객의 정보를 사용하여 새로운 테이블 pay1을 생성 */

CREATE table pay1  AS select customerNumber,checkNumber,paymentDate,amount  
from classicmodels.payments where amount>="50000" and amount<="100000";

select * from pay1 order by amount asc;






/* 지불일자(paymentDate)가 2004년 10월인 정보를 사용하여 새로운 테이블 pay2를 생성 */
CREATE TABLE pay2 AS SELECT * from classicmodels.payments
WHERE DATE_FORMAT(paymentDate, "%Y-m")="2004-10";

select * from pay2 order by paymentDate asc;

/* 지불일자(paymentDate)가 9월인 정보를 사용하여 새로운 테이블 pay3을 생성 */

create table pay3 as select customerNumber,checkNumber,paymentDate,amount 
from classicmodels.payments where month(paymentdate)="09";

select * from pay3 order by paymentDate asc;

CREATE TABLE pay33 AS SELECT * FROM classicmodels.payments
WHERE DATE_FORMAT(paymentDate, "%m")="09";

/* 2004-09 */
CREATE TABLE pay4 AS SELECT * FROM classicmodels.payments
WHERE DATE_FORMAT(paymentDate, '%Y-%m')='2004-09';

/* 데이터 없이 구조만 복사 */
create table pay5 as select * from classicmodels.payments
where 1=2;  /* 1과 2가 같다면, 참이 아니기 때문에 select가 안됨.. */

select * from pay5;