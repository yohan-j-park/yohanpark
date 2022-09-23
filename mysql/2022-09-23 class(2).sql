/*  [미션] score 테이블 사용 */
/* 1) SERIAL COLUMN에 PRIMARY KEY와 AUTO_INCREMENT 속성 추가 */
ALTER TABLE score ADD CONSTRAINT score_serial_pk PRIMARY KEY(serial);
ALTER TABLE score MODIFY COLUMN serial INT auto_increment;

SELECT * FROM score;
/* 2) ID, SUBJECT, score를 parameter로 전달받아 score 테이블에 imsert 하는 함수 scoreInsert를 작성하시오.
(단, mdate는 SQL 실행되는 시점의 시간 / sysdate()을 사용) */
CREATE FUNCTION scoreInsert (std_id VARCHAR(10), std_subject varchar(30),std_mdate DATETIME, std_score DECIMAL(7,1))
RETURNS VARCHAR(255)
BEGIN

	INSERT INTO score(stdid, subject, mdate, score) VALUES(std_id, std_subject, std_mdate, std_score);

	RETURN 1;
	
END;
SELECT scoreInsert('a001', 'english',sysdate(), 90);
DROP FUNCTION scoreInsert;
/* 3) SERIAL 번호를 입력받아 해당 행을 삭제하는 함수 scoreDelete를 작성하시오. */
CREATE FUNCTION scoreDelete (s INT)
RETURNS VARCHAR(255)
BEGIN
	DELETE FROM score WHERE SERIAL = s;
	RETURN 1;
END;
SELECT scoreDelete(2);
/* 4) serial, id, subject, score를 parameter 전달받아 serial에 해당하는 값을 parameter로 수정하는 함수 scoreUpdate를 작성하시오. */
CREATE FUNCTION scoreUpdate (std_serial INT,std_id VARCHAR(10), std_subject varchar(30),std_mdate DATETIME, std_score DECIMAL(7,1))
RETURNS VARCHAR(255)
BEGIN
	UPDATE score 
	SET  stdid = std_id,
		  mdate = std_mdate,
		  SUBJECT = std_subject,
		  score = std_score
	WHERE SERIAL = std_serial;
	RETURN 1;
END;
DROP FUNCTION scoreUpdate;
SELECT scoreUpdate(4,'bbbb','english',sysdate(),50);

/* 5) ID를 parameter로 전달받아 해당 성적 정보를 출력하는 프로시져 scoreList를 작성하시오. */
CREATE PROCEDURE scoreList(IN std_serial INT)
BEGIN
	SELECT * FROM score WHERE serial = std_serial;
END;	

CALL scoreList(4);
