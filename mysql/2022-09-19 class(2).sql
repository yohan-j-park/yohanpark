/* VIEW --------------------------------  */
CREATE VIEW my_cus AS  /* VIEW 만드는 명령어 */
	SELECT customerNumber, customerName, country, city FROM customers;

DROP VIEW my_cus;        /* 만든 VIEW 삭제 명령어 */
	
SELECT * FROM my_cus 
WHERE customerNumber= 459
ORDER BY city;


CREATE OR REPLACE VIEW my_cus2 AS
	SELECT employeeNumber AS "사번", lastName AS  "성명", e. officeCode AS "부서코드", phone AS "부서 전화번호"
	FROM employees AS e JOIN offices AS o
	ON e.officeCode = o.officeCode
	ORDER BY lastName asc;

SELECT * FROM my_cus2;