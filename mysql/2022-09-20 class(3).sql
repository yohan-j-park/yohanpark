SELECT * FROM cus;
/* 1) country가 USA인 고객정보를 삭제 */
SELECT * FROM cus WHERE country = 'usa'; 		/* select로 내가 삭제하려는 범위가 맞는지 확인!! */
DELETE FROM cus WHERE country = 'usa';  		/* ctrl+enter 하기 전에 AUTOCOMMIT OFF인지 확인!! */
	/* 3번째 줄 다시 실행 =>값이 사라짐 */
ROLLBACK; 		 /* 잘못 지웠으면 롤백 실행 */
	/* 순서: 3>4>3>6>3 */

/* 2) country가 USA이고 state가 NY인 자료만 삭제 */
SELECT * FROM cus WHERE country='usa' AND state = 'NY';
DELETE FROM cus WHERE country = 'usa' AND state = 'NY';
ROLLBACK;

/* 3) 사번이 146번인 고객과 같은 country 자료를 삭제 */
SELECT * FROM cus WHERE customerNumber = 146;
DELETE FROM cus WHERE country = 'france';

SELECT country FROM cus WHERE customerNumber = 146;

/* INSERT UPDATE DELETE 하려는 테이블과
같은 테이블에서 서브쿼리로 값을 끌어오려 해서
에러가 발생하는 것이다. 
따라서 서브쿼리를 한번 더 감싼 뒤 값을 끌어서 사용해줘야 에러가 발생하지 않는다 + 별명을 달아야 한다(서브쿼리 테이블)  */
DELETE FROM cus WHERE country   = 
	(SELECT a.country FROM
		(SELECT country  FROM cus WHERE customerNumber = 146) a
	) ;
SELECT country FROM cus WHERE customerNumber = 146

DELETE FROM cus WHERE country = 'ㄹㄴ어ㅏㅣ렁라ㅣ허ㅏㅣㅎㅇ러ㅏㅣㅎㅇ러하ㅣㅇ렇 ';

DELETE  FROM cus;

DELETE c1 FROM cus c1 JOIN cus c2
ON c1.country = c2.country
WHERE c2.customerNumber = 146;
SELECT * FROM cus WHERE country = 'france';

