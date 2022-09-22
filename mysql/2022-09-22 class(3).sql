/* loop----------------------------------- */
CREATE PROCEDURE loop_test()
BEGIN
	DECLARE a INT DEFAULT 0;
	DECLARE str varchar(100) DEFAULT ' ';
	here : LOOP
		SET a=a+1;
		IF a>10 THEN
			LEAVE here;
		END IF;
		SET str = concat(str, ' ', a);
	END LOOP;
	SELECT str;
	
END;
CALL loop_test;