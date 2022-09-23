/* 9월 22일 예제 다시풀어보기(강사님ver) */
USE mydb;
/* 2) 사번을 입력받아 같은 부서 직원의 이름과, 이메일, 직무(job title)를 출력 (cur_test22)*/
CREATE PROCEDURE cur_test22(IN en INT)
BEGIN
	DECLARE flag INT DEFAULT 0; /* flag의 디폴트값은 0이다 */
	DECLARE m_lastname varchar(50);
	DECLARE m_officeCode VARCHAR(50);
	DECLARE m_email varchar(50);
	DECLARE m_jobtitle varchar(50);
		DECLARE cur CURSOR FOR  
	/* 묵시적 커서에 저장한 정보(SELECT ~ WHERE)를 명시적 커서 cur라는 곳에 저장하겠다. */
		SELECT other.lastName,other.officeCode, other.email,other.jobTitle
		FROM classicmodels.employees other 
		JOIN classicmodels.employees me
		ON other.officeCode = me.officeCode
		WHERE me.employeeNumber = en;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET flag = 1;
	/* 계속 해야 할 핸들러가 다 끝났으면(NOT FOUND) 그것을 flag라는 것으로 설정하고 값을 1이라고 하겠다. (flag값이 처음 디폴트값인 0이면 NOT FOUND가 아니라고 가정하는 것) */
	
	OPEN cur;
	
		here : LOOP 
			FETCH cur INTO m_lastName,m_officeCode, m_email, m_jobTitle; /* FETCH로 출력된 (row)가 몇 건인지 모르기 때문에 조건을 충족할 때 까지 반복하는 LOOP문 안에 넣는다. */
			IF flag = 1 THEN
				LEAVE here;  /* 만약flag값이 1이면 = 핸들러(내가 구현하고자 하는 기능을 위해 필요한 것) 가 끝났으면(NOT FOUND) LOOP를 빠져나가라. */
			END IF;
		END LOOP;
				
	CLOSE cur;
SELECT m_lastName,m_officeCode m_email, m_jobTitle;
END;


/* 3) 고객번호를 입력받아 고객이름, 연락처, 지불액, 우편번호를 출력(cur_test33) */
CREATE PROCEDURE cur_test33(IN cn INT)
BEGIN
	DECLARE m_customerName      VARCHAR(50);
	DECLARE m_phone                  VARCHAR(50);
	DECLARE m_amount                DECIMAL(10,2);
	DECLARE m_postalCode           VARCHAR(30);
	DECLARE flag                         INT DEFAULT 0;
	DECLARE cur CURSOR FOR
		SELECT c.customerName, c.phone, p.amount, c.postalCode
		FROM classicmodels.customers c JOIN classicmodels.payments p
		ON c.customerNumber = p.customerNumber
		WHERE c.customerNumber = cn;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET flag = 1;	
	
	OPEN cur;
		
		here : LOOP
			FETCH cur INTO m_customerName, m_phone, m_amount, m_postalCode;
		
			IF flag = 1 THEN
			LEAVE here;
			END IF;
	
		END LOOP;

	CLOSE cur;
	SELECT m_customerName, m_phone, m_amount, m_postalCode;
END;	
CALL cur_test33(103);

/* 4) 년도를 입력받아 해당 년도에 지불된 지불액, 고객명, 연락처 */
CREATE PROCEDURE cur_test44(y int)
BEGIN
	DECLARE m_amt                       VARCHAR(50);
	DECLARE m_customerNumber     INT;
	DECLARE m_customerName        VARCHAR(50);
	DECLARE m_phone	                VARCHAR(50);
	DECLARE flag                           INT DEFAULT 0;
	
	DECLARE cur CURSOR FOR
		SELECT customerNumber, amount
		FROM classicmodels.payments
		WHERE YEAR(paymentDate) = y;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET flag = 1;	
	
	OPEN cur;
		here : LOOP
			FETCH cur INTO m_customerNumber, m_amt;
			IF flag = 1 THEN
			LEAVE here;
			END IF;
			SELECT customerName,phone INTO m_customerName, m_phone
			FROM classicmodels.customers
			WHERE customerNumber = m_customerNumber;
			
			SELECT m_customerNumber, m_customerName, m_phone, m_amt;
			
		END LOOP;	
	CLOSE cur;
END;	
CALL cur_test44(2003); 
DROP PROCEDURE cur_test44;

/* 신용한도액과 지불총액을 비교하여 신용 한도액을 초과한 고객의 이름, 신용한도액, 지불총액, 연락처 출력(cur_test55) */
	
	/* 지불총액을 출력 안해도 될 경우 */
	SELECT c.customerName,c.creditLimit,c.phone
	FROM classicmodels.customers c 
	WHERE c.creditLimit < (SELECT SUM(amount) FROM classicmodels.payments WHERE customerNumber = c.customerNumber);
	
	/* 지불총액을 출력 해야 할 경우 */
	SELECT c.customerName,c.phone, c.creditLimit,
	(SELECT SUM(amount) FROM classicmodels.payments p  WHERE p.customerNumber = c.customerNumber ) AS '지불총액'
	FROM classicmodels.customers c 
	WHERE c.creditLimit < (SELECT SUM(amount) FROM classicmodels.payments p WHERE p.customerNumber = c.customerNumber );	
	/* -------------------------------------------------------------------------------------------------------------*/
CREATE PROCEDURE cur_test55()
BEGIN
	DECLARE m_customerNumber int;
	DECLARE m_customerName VARCHAR(50);
	DECLARE m_creditLimit DECIMAL(10,2);
	DECLARE m_phone VARCHAR(50);
	DECLARE flag INT DEFAULT 0;
	DECLARE m_amount DECIMAL(10,2);
	
	DECLARE cur CURSOR FOR 
		SELECT c.customerNumber,c.customerName, c.creditLimit, c.phone
		FROM classicmodels.customers c;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET flag = 1;

	OPEN cur;
		here : LOOP
			FETCH cur INTO m_customerNumber,m_customerName,m_creditLimit, m_phone;
			IF flag = 1 THEN
				LEAVE here;
			END IF;
			SELECT SUM(amount) INTO m_amount FROM classicmodels.payments p WHERE p.customerNumber = m_customerNumber;
			
			IF (m_amount > m_creditLimit) THEN 
				SELECT m_customerNumber, m_customerName, m_creditLimit, m_amount, m_phone;
			END IF;
			
		END LOOP;	
	CLOSE cur;	
END;

CALL cur_test55();
DROP PROCEDURE cur_test55;
