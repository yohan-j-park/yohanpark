/* PROCEDURE 만들기 응용 */
/* 1) 파라미터로 이름을 전달받아 test 테이블에 저장 추가(pro_test2) */
CREATE TABLE test(
	mName VARCHAR(50)
);
CREATE PROCEDURE pro_test2(IN irum varchar(50) )
BEGIN 
	INSERT INTO test(mName) values(irum);
END;
CALL pro_test2('park');
SELECT * FROM test;
DROP PROCEDURE pro_test2;

/* 2) 첫 번째 파라미터는 IN MODE, 두 번째 파라미터는 OUT MODE 로 선언하여
	첫 번째 파라미터에 직원번호를 전달받아 직원명을 OUT MODE에 대입하여
	프로시저 밖에서 확인(pro_test3)*/
CREATE PROCEDURE pro_test3(IN en int, OUT lname varchar(50) )
BEGIN
	SELECT lastName INTO lname  /* lastName과 같은 컬럼과 데이터를 가지는 lname 테이블 생성 */
	FROM classicmodels.employees
	WHERE employeeNumber = en;
END;	

CALL pro_test3(1002,@irum);
SELECT @irum;
/* 3) 고객번호를 전달받아 해당 고객의 지불 총액(payments)을 계산하여
		OUT MODE 파라메터로 확인(pro_test4) */
CREATE PROCEDURE pro_test4(IN cn int, OUT hap decimal(10,2) )
BEGIN
	SELECT sum(amount) INTO hap
	FROM classicmodels.payments
	WHERE customerNumber = cn;
END;		

CALL pro_test4(103,@hap);
SELECT @hap;

/* INOUT MODE parameter----------------------- */
/* 1) 두 정수를 INOUT MODE의 parameter로 전달받아 그 결과를
	  합계를 구하고 두 정수와 합계를 프로시져 밖에서 확인하시오  */
CREATE PROCEDURE pro_test5(INOUT a int, INOUT b int, INOUT hap varchar(50) )
BEGIN
	SET a = a;
	SET b = b;
	SET hap = a+b;
END;
SET @a = 100;
SET @b = 200;
CALL pro_test5(@a, @b,@hap);
SELECT @a, @b, @hap;

/* 2) 사번을 사용하여 사무실 주소(addressline1, addressline2)를 찾아
	   프로시저 밖에서 사번, 주소를 확인하시오 (employee, offices 테이블 사용) */
CREATE PROCEDURE pro_test6(INOUT en varchar(50), INOUT address1 varchar(50), INOUT address2 varchar(50))
BEGIN
	SET address1 = address1;
	SET address2 = address2;
	
	SELECT o.addressLine1, o.addressLine2 INTO address1, address2
	FROM classicmodels.offices o JOIN classicmodels.employees e
	ON o.officeCode = e.officeCode
	WHERE employeeNumber = en;
	
END;
SET @en = 1165;
DROP PROCEDURE pro_test6;
CALL pro_test6(@en, @address1, @address2);	
SELECT @en, @address1, @address2;
   
/* 3) 고객번호(customerNumber/customers & payments)를 사용하여 연락처(phone/customers)와 지불총액(amount / payments)을 
	   INOUT 모드의 파라미터를 사용하여 프로시저 밖에서 확인하시오 */	   
CREATE PROCEDURE pro_test7(INOUT cn int, INOUT tel varchar(50), INOUT amt decimal(10,2) )
	BEGIN
	SET tel = tel;
	SET amt = amt;
	
	SELECT phone INTO tel
	FROM classicmodels.customers 
	WHERE customerNumber = cn;
	
	SELECT sum(amount) INTO amt
	FROM classicmodels.payments
	WHERE customerNumber = cn;
	END;
	DROP PROCEDURE pro_test7;
SET @cn =103;
CALL pro_test7(@cn, @tel, @amt);
SELECT @cn, @tel, @amt;