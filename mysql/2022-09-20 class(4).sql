/* 내장함수 */
SET @a =  10.1;
SET @b = -10.1;
SET @c = 9.2;
SELECT abs(@a), abs(@b), ceil(@a), ceil(@b), floor(@a), floor(@b);

SELECT round(60.2345678,-2) AS 'round 함수 출력값';

SET @START = 15;
SET @finish = 20;

SELECT truncate(1234567.123234234 ,2) AS 'truncate 함수 출력값';
SELECT (@finish := pow(2,64)) AS '단순대입';

SELECT mod(10, -10);
SELECT pow(2,64);

/* 1) 수량이 1234개이고, 단가가 123원 제품의 금액을 계산하고 1000원 미만의 금액은 절삭하여 표시 */
SET @ea = 1234;
SET @price = 123;
SELECT @amt := truncate(@ea*@price,-3);

/* 2) 12345원의 예금액에 이자율을 25% 적용하여 지급액을 조회. 단 원단위 이하, 10원단위이하는 절상 */
SET @dep = 12345;
SET @inte = @dep*0.25;
SELECT (@pay := round(@dep+@inte+5 ,-2)) AS '예금+이자(10원단위이하 절상)';
SELECT CEIL (12345)
/* 3) 12311원의 예금액에 이자율을 11% 적용하여 지급액을 조회. 단 원단위이하, 10원 단위이하는 
반올림 */
SET @dep1 = 12311;
SET @inte1 = @dep1*0.11;
SELECT (@pay1 := round(@dep1+@inte1, -2)) AS '예금+이자(10원단위이하 반올림)';









