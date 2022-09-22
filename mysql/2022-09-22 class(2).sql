/* CASE--------------------------------------- */
CREATE PROCEDURE case_test1()
BEGIN
	DECLARE score INT DEFAULT 0;
	DECLARE str VARCHAR(100);
	
	SET score = 70;
	CASE score
		WHEN 100 THEN SET str = '백';
		WHEN 80 THEN  SET str = '팔십';
		WHEN 70 THEN  SET str = '칠십';
		WHEN 60 THEN  SET str = '육십';
	ELSE 
		str = '낮은 점수';
	END CASE;
	SELECT score, str;
END;
DROP PROCEDURE case_test1;

CREATE PROCEDURE case_test2()
BEGIN
DECLARE score INT DEFAULT 0;
DECLARE str varchar(50);

SET score = 80;

CASE
	WHEN score>=90 THEN SET str ='A';
	WHEN score>=80 THEN SET str ='B';
	WHEN score>=70 THEN SET str ='C';
	
	ELSE SET str = 'F';
	
	END case;

	SELECT score,str;

END;

CALL case_test2;