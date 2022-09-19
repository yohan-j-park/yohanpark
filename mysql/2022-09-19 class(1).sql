/* JOIN 연습하기 */

/* CROSS JOIN ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ  */
SELECT * FROM customers c JOIN orders o;   /* 카디션 곱 */
SELECT count(*) FROM customers; /* 122 */
SELECT count(*) FROM orders; /* 326 */
SELECT count(*) FROM customers JOIN orders; /* 39772(122X326) */

/* equi-join(등가조인) ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ  */
USE classicmodels;
DESC employees;
DESC customers;
SHOW tables;
DESC orders;

SELECT * FROM customers  c JOIN orders o
ON c.customerNumber = o.customerNumber;    /* customer의 고객정보 = orders의 고객정보 => 오더를 한 적이 있는 'customer' 조회 */

SELECT * FROM orders;

/* 고객명이 Signal Gift Stores  사람이 주문한 주문 목록 */

/* 1) JOIN 없이 검색하기 */
SELECT customerNumber FROM customers
WHERE customerName = 'Signal Gift Stores';     /* 112 */
 
SELECT * FROM orders WHERE customerNumber = '112';    /* 3건 검색됨 */

/* 2) JOIN을 사용하여 검색하기 */
SELECT c.customerName, o.* FROM orders AS o JOIN customers AS c
ON o.customerNumber = c.customerNumber 
WHERE customerName = 'Signal Gift Stores';   /* 3건 검색됨 */

	/* sub query 사용 */
	SELECT o.* FROM orders o
	WHERE o.customerNumber IN
	(SELECT customerNumber FROM customers WHERE customerName = 'Signal Gift Stores');

/* state가 'CA'인 고객들이 주문한 주문 목록을 조회 (45건) */
SELECT state, orders.* FROM orders JOIN customers
ON orders.customerNumber = customers.customerNumber 
WHERE state = 'CA';

	/* sub query 사용 */
	SELECT o.* FROM orders o
	WHERE o.customerNumber IN
	(SELECT customerNumber FROM customers WHERE state = 'CA');
	
/* France 사람들이 주문한 주문 목록을 조회 (37건) */
SELECT customers.country, orders.* FROM orders JOIN customers
ON orders.customerNumber = customers.customerNumber 
WHERE country = 'France';

	/* sub query 사용 */
	SELECT o.* FROM orders o
	WHERE o.customerNumber IN
	(SELECT customerNumber FROM customers WHERE country = 'France');
	
/* 주문 상태가 'Cancelled' 되어 있는 상품을 주문한 고객의 이름, 연락처를 조회 (6건) */
SELECT status, customerName, phone FROM customers JOIN orders 
ON orders.customerNumber = customers.customerNumber 
WHERE status='Cancelled';
	
	/* sub query사용 */
	SELECT customerName, phone FROM customers c
	WHERE c.customerNumber IN
	(SELECT customerNumber FROM orders WHERE STATUS = 'cancelled');
	
/* 선적일자(shippedDate)가 2003년 9월인 고객들의 이름, 연락처를 조회 (110건) */
SELECT shippedDate, customerName, phone FROM customers JOIN orders
ON orders.customerNumber = customers.customerNumber 
WHERE  DATE_FORMAT(shippedDate, "%Y-%m")="2003-09";

	/* sub query 사용 */
	SELECT c.customerName, c.phone FROM customers c
	WHERE c.customerNumber IN
	(SELECT customerNumber FROM orders WHERE DATE_FORMAT(shippedDate, "%Y-%m")="2003-09");
	
/* SELF JOIN ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ  */
SELECT * FROM employees;

/* LAST NAME = Bow와 같은 부서(officeCode가 같은) 직원들의 사번, 이름, 이메일을 조회 */
/* e1 : Bow의 정보 테이블,     e2 : 직원 정보 테이블 */
SELECT e2.employeeNumber, e2.lastName, e2.email 
FROM employees e2 JOIN employees e1
ON e2.officeCode=e1.officeCode
WHERE e1.lastName= "Bow"; 

	/* sub query사용 */
	SELECT employeeNumber, lastName, email FROM employees
	WHERE officeCode =
	(SELECT officeCode FROM employees WHERE lastName = "Bow");

/* Bott와 같은 직무(jobTitle)를 가진 직원들의 이름과, 이메일 조회 */
SELECT e2.jobTitle, e2.lastName, e2.firstName, e2.email
FROM employees e2 JOIN employees e1
ON e2.jobTitle = e1.jobTitle
WHERE e1.lastName = "Bott";

	/* sub query사용 */
	SELECT jobTitle, lastName, firstName, email FROM employees
	WHERE jobTitle =
	(SELECT jobTitle FROM employees WHERE lastName = "Bott");
	
/* 고객의 이름이 Signal Gift Stores와 같인 국가 고객들의 고객번호, 연락처, 고객명을 조회  */
SELECT c2.country, c2.customerNumber, c2.customerName, c2.phone
FROM customers c2 JOIN customers  c1
ON c2.country = c1.country
WHERE c1.customerName = "Signal Gift Stores";

	/* sub query사용 */
	SELECT country, customerNumber, customerName, phone FROM customers
	WHERE country =
	(SELECT country FROM customers WHERE customerName = "Signal Gift Stores");

/* LEFT OUTER JOIN (customers, payments) ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
/* 고객 번호와 고객명, 지불일자, 지불금액 조회 */
SELECT c.customerNumber, c.customerName, p.paymentDate, p.amount
FROM customers AS c JOIN payments AS p
ON c.customerNumber=p.customerNumber;

SELECT c.customerNumber, c.customerName, p.paymentDate, p.amount
FROM customers c LEFT OUTER JOIN payments p 
ON c.customerNumber = p.customerNumber;            /* LEFT OUTER JOIN에는 paymentDate 및 amount가 없어도 왼쪽 테이블에 있는 customerNumber랑 customerName이 출력됨 */

/* SELECT절보다 WHERE절이 먼저 실행됨 */
SELECT customerNumber, amount AS amt FROM payments
WHERE amt>50000;  /* 오류남.. Unknown column 'amt' in 'where clause'  */

/* ORDER BY절은 SELECT가 실행된 후에 실행됨. 오류안남 */
SELECT customerNumber, amount AS amt FROM payments
ORDER BY amt DESC; 








	
