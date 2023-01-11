SELECT * FROM member WHERE id='m00110';
SELECT * FROM pixel_buy_list WHERE id = 'm00110';
SELECT * FROM pixel_history WHERE id='m00110';
commit;

SHOW tables;

SELECT * FROM member;

/* 픽셀 구매 시 회원정보에 픽셀 추가 */
update member m set m.pixel = m.pixel+(SELECT pb.pixel_buy_amount FROM pixel_buy_list pb WHERE id = 'm0011' ORDER BY pixel_buy_date DESC LIMIT 0,1) WHERE id= 'm0011';

/* 픽셀 구매 시 히스토리에 구매픽셀 추가 */
INSERT INTO pixel_history(id,pixel_log,history_date) VALUES('m0011', ,now()); 

/* mansearch 리스트 뿌리기 */
SELECT * FROM mansearch_board;
SELECT * FROM board;
SELECT * FROM corperation;

