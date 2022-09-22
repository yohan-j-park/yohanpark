/* 1) 임의의변수 a,b에 값을 대입한 후 큰 값을 if문을 사용하여 출력하시오(if_test1) */ 
CREATE PROCEDURE if_test1()
BEGIN
	DECLARE a INT DEFAULT  100;
	DECLARE b INT DEFAULT  200;
	
	IF(a>b) THEN
		SELECT a;
	END IF;
	
	IF(a<b) THEN
		SELECT b;
	END IF;

END;

CALL if_test1();

/* a,b값을 외부에서 전달받아 큰 값을 출력하는 if문을 작성(if_test2) */
CREATE PROCEDURE if_test2(IN a INT, IN b INT)
BEGIN
	IF(a>b) THEN
		SELECT a;
	ELSE 
		SELECT b;
	END IF;		
END;
SET @a = 150;
SET @b = 200;
CALL if_test2(@a, @b);

/*
 2) 강사님ver
	 CREATE PROCEDURE if_test2(IN a INT, IN b INT)
	BEGIN
		DECLARE m INT;
		SET m=a;
		
		IF(b>m) THEN
			SET m=b;
		END IF;
		SELECT m;
	END;
 */

/* 3) a,b,c값을 외부에서 전달 받아 최대값을 출력하는 if문을 작성(if_test3) */
CREATE PROCEDURE if_test3(IN a INT, IN b INT, IN c INT)
BEGIN
	IF(a>b) THEN
		SELECT a AS 'max : a';
	ELSEIF(b>c) THEN
		SELECT b AS 'max : b';
	ELSE SELECT c AS 'max : c';
	
	END IF;

END;

SET @a = 200;
SET @b = 300;
SET @c = 500;
CALL if_test3(@a,@b,@c);
DROP PROCEDURE if_test3;

/* 4) 고객 번호를 parameter로 전달받아 지불액 총액을 계산하여 80000이상이면 '우수고객', 아니면 '일반고객'을 지불액과 함께 출력  (if_test4) */
CREATE PROCEDURE if_test4(IN c_num INT)
BEGIN
	SELECT c_num AS "고객번호", format(sum(amount), 0) AS "총액", IF (SUM(amount)>=80000, "우수고객", "일반고객") AS "우수고객 여부" 
	FROM classicmodels.payments p WHERE customerNumber = c_num;
END;
SET @c_num = 114;
CALL if_test4(@c_num);
DROP PROCEDURE if_test4;
SELECT * FROM classicmodels.payments;
/* -------------------------------------------------------
CREATE PROCEDURE if_test4(IN cn INT)	
BEGIN
	DECLARE tot DECIMAL(10,2) DEFAULT 0;
	DECLARE msg varchar(50);
	
	SELECT sum(amount) 
	FROM classicmodels.payments 
	WHERE customerNumber = cn;
	
	IF tot>=80000 THEN
		SET msg = '우수고객';
	ELSE
		 SET msg = '일반고객';
	END IF;
	
	SELECT cn, tot, msg;
	
END;

CALL if_test4(103);

----------------------------------------------------------*/

/* 5) 년도를 parameter로 전달받아 해당 년도의 지불액 총액을 계산하여 10만 이상 A, 8만 이상 B, 5만 이상 C, 그 외는 D를 출력 (if_test5) */
CREATE PROCEDURE if_test5(y INT)
BEGIN
	DECLARE grade VARCHAR(50);
	DECLARE amt DECIMAL (10,2);
	SELECT SUM(amount) AS "해당 년도 지불 총액" INTO amt 
	FROM classicmodels.payments
	WHERE YEAR(paymentDate) = y;
	
	IF (amt>=100000) THEN SET grade = "A" ;
	ELSEIF (amt>=80000) THEN SET grade = "B";
	ELSEIF (amt>=50000) THEN SET grade = "C";
	ELSE SET grade = "D";
	END IF;
	
	SELECT y, amt, grade;
END;

CALL if_test5(2004);
DROP PROCEDURE if_test5;

/*----------------------------------------------------------
CREATE PROCEDURE if_test6(k INT)
BEGIN
DECLARE tot decimal(10,2);
DECLARE msg varchar(10);

	SELECT sum(amount) INTO tot
	FROM classicmodels.payments
	WHERE YEAR(paymentDate) = k;
	
	IF tot>=100000 THEN SET msg = 'A';
	ELSEIF tot>=80000 THEN SET msg = 'B';
	ELSEIF tot>=50000 THEN SET msg = 'C';
	ELSE SET 'D';
	END IF;
	
	SELECT k, tot, msg;
	
END;

CALL if_test5(2003);
----------------------------------------------------------*/
/* 6) 고객번호와 년도를 parameter로 전달받아 지불 총액을 계산하고 해당 년도의 평균보다 높으면 'VViP' 아니면 'VIP'를 출력(if_test6) */


/*----------------------------------------------------------
CREATE PROCEDURE if_test6(cn int, pd int)
BEGIN

DECLARE hap DECIMAL(10,2);
DECLARE yavg DECIMAL(10,2);
DECLARE grade varchar(10);

	SELECT sum(amount) INTO hap
	FROM classicmodels.payments
	WHERE customerNumber=cn AND YEAR(paymentDate)=pd;
	
	SELECT avg(amount) INTO yavg
	FROM classicmodels.payments
	WHERE YEAR(paymentDate)=pd;
	
	IF hap>yavg THEN
		SET grade = 'VVIP'
	ELSE
		SET grade = 'VIP'
	END IF;
	
	SELECT cn, hap, yavg, grade
	
END;

CALL if_test6(103, 2003)
----------------------------------------------------------*/
