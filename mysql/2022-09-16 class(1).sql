/* payments 테이블에서 금액(amount)이 5만 이상인 고객의 번호를 조회 */
use classicmodels;
desc payments;
select customerNumber from payments where amount>=50000;
select paymentDate from payments where amount>=50000;
select customerNumber as "고객번호" from payments where amount>=50000;

select 10+10 as"result";  /* as "변수지정" */
select * from orders;
/* group by절에 사용된 필드만 select절에 사용 가능*/
select requiredDate from orders group by requiredDate; (O)
select status from order group by requiredDate; (X)

/* orderNumber 순으로 오름차순(asc) 또는 내림차순(desc)으로 조회*/
select * from orders order by orderNumber desc;

/* 직원(employees)들의 정보를 이름순(lastName)으로 오름차 정렬하여 조회*/
select * from employees order by lastName asc;

/* 직원들의 정보 중 officeCode가 4번인 직원들을 이름순으로 조회*/
select * from employees where 
officeCode='4'
order by lastName asc;

/* 직원들의 정보 중 officeCode가 1번 또는 4번인 직원들을  이름순으로 조회*/
select * from employees
where officeCode='1' or officeCode='4' 
order by lastName asc;

/* count, sum, avg, max, min 집계함수 */

/* officeCode가 4번인 직원들의 인원 수는? */
SELECT count(officeCode) as "인원 수" FROM employees WHERE officeCode='4';   /* 변수명을 지정해 둬야 사용하기 편리함, *대신 pri key가 있는 항목을 필드네임으로  */

/* payments에 있는 금액(amount)들의 합계(sum)와 평균(avg) */
select sum(amount) as "합계" , avg(amount) as "평균" from payments;

/* payments에 있는 금액(amount)들의 최대값(max)과 최소값(min)을 조회 */
select max(amount) as "최대값", min(amount) as "최소값"
from payments;

/* paymentDate(지불날짜)가 2004-11-14에 발생한 데이터의 건수 조회  */
select count(paymentDate) as "건수 조회" from payments where paymentDate='2004-11-14';
/* 최대 금액을 지불한 고객번호를 조회(option) */
select * from payments order by amount desc; /* 지불금액이 많은 순으로 디센딩 */
select max(amount) from payments;   /* 최대값 */ 

select customerNumber from payments
where amount = (select max(amount) from payments);  /* 서브쿼리(완전한 문장) */

/* 최소 금액을 지불한 고객번호를 조회(option) */
select customerNumber, amount, paymentDate from payments
where amount = (select min(amount) from payments);

/* 고객 번호별 금액의 합계를 조회 */
select customerNumber as "고객번호", sum(amount) as "총액"  from payments
group by customerNumber;

/* orders 테이블에서 현 상태(status)별 건수를 조회 */
select status as"상태", count(status) as "건 수" from orders group by status;

/* LIMIT 사용 */
select * from orders limit 0,300;     /* limit 0,10: 첫 번째부터 10개 */

