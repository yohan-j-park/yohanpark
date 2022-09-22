/* 2) 사번을 입력받아 같은 부서 직원의 이름과, 이메일, 직무(job title)를 출력 (cur_test2)*/
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM payments;



DROP PROCEDURE cur_test2;
CREATE PROCEDURE cur_test2(en INT)
BEGIN
	DECLARE msg LONGTEXT DEFAULT '';
	DECLARE m_office varchar(50);
	DECLARE m_name varchar(50);
	DECLARE m_email VARCHAR(50);
	DECLARE m_title varchar(50);
	DECLARE finished INT DEFAULT 0;
	DECLARE cur CURSOR FOR
		SELECT e1.officeCode,e1.lastName,e1.email,e1.jobTitle
		FROM employees e1 JOIN employees e2
		ON e1.officeCode = e2.officeCode
		WHERE e2.employeeNumber = en;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
	
	OPEN cur;
	cur2 : LOOP
		FETCH cur INTO m_name,m_office,m_email,m_title;
		IF finished = 1 THEN
			LEAVE cur2;
		END IF;
		SET msg = concat(msg,m_name,'-',m_office,'-', m_email,'-',m_title,'\n');
	END LOOP;		
	CLOSE cur;
	SELECT msg;
END;
CALL cur_test2(1056);

/* 3) 고객번호를 입력받아 고객이름, 연락처, 지불액, 우편번호를 출력(cur_test3) */\
DROP PROCEDURE cur_test3;
CREATE PROCEDURE cur_test3(cn INT)
BEGIN
	DECLARE c_name varchar(50);
	DECLARE c_phone varchar(50);
	DECLARE c_amount DECIMAL(10,2);
	DECLARE c_postal varchar(50);
	DECLARE finished INT DEFAULT 0;
	DECLARE cur CURSOR FOR
		SELECT c.customerName, c.phone, sum(p.amount), c.postalCode FROM  customers c JOIN payments p
		ON c.customerNumber = p.customerNumber WHERE c.customerNumber=cn GROUP BY c.customerNumber;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
	
	OPEN cur;
	cur3 : LOOP
		FETCH cur INTO c_name, c_phone, c_amount, c_postal;
		IF finished = 1 THEN
			LEAVE cur3;
		END IF;
	END LOOP;	
	CLOSE cur;
	SELECT c_name, c_phone, c_amount, c_postal;
END;
CALL cur_test3(103);
/* 4) 년도를 입력받아 해당 년도에 고객에게 지불된 지불액과, 고객명, 연락처 출력(cur_test4) */
DROP PROCEDURE cur_test4;
CREATE PROCEDURE cur_test4(IN ydate INT)
BEGIN
	DECLARE msg LONGTEXT DEFAULT '';
	DECLARE c_name varchar(50);
	DECLARE c_amount varchar(50);
	DECLARE c_phone varchar(50);
	DECLARE finished INT DEFAULT 0;
	DECLARE cur CURSOR FOR
		SELECT  c.customerName, sum(p.amount),c.phone  FROM customers c JOIN payments p
		ON c.customerNumber = p.customerNumber WHERE YEAR(p.paymentDate) = ydate GROUP BY p.customerNumber;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
	
	OPEN cur;
	cur4 : LOOP
		FETCH cur INTO c_name, c_amount, c_phone;
		IF finished = 1 THEN
			LEAVE cur4;
		END IF;
		SET msg = concat(msg, c_name,'-', c_amount,'-', c_phone,'\n');	
	END LOOP;
	CLOSE cur;	
	SELECT msg;
END;
CALL cur_test4(2004);


/* 5) 신용한도액(c.creditLimit)과 지불 총액(sum(p.amount)을 비교하여 신용한도액을 초과한 고객의 이름, 신용한도액, 지불총액, 연락처 조회 */
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM payments;
DROP PROCEDURE cur_test5;
CREATE PROCEDURE cur_test5()
BEGIN
	DECLARE msg LONGTEXT DEFAULT '';
	DECLARE c_credit varchar(50);
	DECLARE c_amount varchar(50);
	DECLARE c_name varchar(50);
	DECLARE c_phone varchar(50);
	DECLARE finished INT DEFAULT 0;
	DECLARE cur CURSOR FOR
		SELECT c.customerName,c.creditLimit,sum(p.amount),c.phone
		FROM customers c JOIN payments p ON c.customerNumber = p.customerNumber
		WHERE c.creditLimit<(SELECT sum(amount) FROM payments) GROUP BY p.customerNumber;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
	
	OPEN cur;
	cur5 : LOOP
		FETCH cur INTO c_credit, c_amount, c_name, c_phone;
		IF finished = 1 THEN
			LEAVE cur5;
		END IF;
		SET msg = concat(msg, c_credit,'--', c_amount,'--', c_name,'--', c_phone, '\n');			
	END LOOP;	
	CLOSE cur;
	SELECT msg;
END;
CALL cur_test5();