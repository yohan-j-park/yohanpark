/* 더미데이터 boardtype mansearch 삭제 */
delete from mansearch_board;
delete from board where boardtype='mansearch';

insert into pixel_price values(1000,100,2700,300,4500,500,9000,1000,27000,3000,45000,5000);
commit;

/* 구인게시판에 글 작성 가능한 id목록 추가 */
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('kodup104','사업자등록증.png','mansearch_view_corp_logo.png','캐빈시스템','010-1111-1111','corp@outlook.com','담당자이름','010-2222-2222','manager@outlook.com');
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00152','사업자등록증.png','mansearch_bluecom.jpg','블루컴','010-1111-1111','bluecom@outlook.com','담당자이름','010-2222-2222','bluecom1@outlook.com');
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00153','사업자등록증.png','mansearch_dabinnetworks.png','다빈네트웍스','010-1111-1111','dabin@outlook.com','담당자이름','010-2222-2222','dabin1@outlook.com');
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00154','사업자등록증.png','mansearch_gspec.Jpg','지스펙','010-1111-1111','gspec@outlook.com','담당자이름','010-2222-2222','gspec1@outlook.com');
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00155','사업자등록증.png','mansearch_itist.jpg','아이티이스트','010-1111-1111','itist@outlook.com','담당자이름','010-2222-2222','itist1@outlook.com');
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00156','사업자등록증.png','mansearch_pilgrimsoft.png','필그림소프트','010-1111-1111','pilgrimsoft@outlook.com','담당자이름','010-2222-2222','pilgrimsoft1@outlook.com');
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00157','사업자등록증.png','mansearch_pni.png','피앤아이','010-1111-1111','pni@outlook.com','담당자이름','010-2222-2222','pni1@outlook.com');
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00158','사업자등록증.png','mansearch_pssoft.png','피에스소프트','010-1111-1111','pssoft@outlook.com','담당자이름','010-2222-2222','pssoft1@outlook.com');
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00159','사업자등록증.png','mansearch_smartfive.png','스마트파이브','010-1111-1111','smartfive@outlook.com','담당자이름','010-2222-2222','smartfive1@outlook.com');
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00160','사업자등록증.png','mansearch_wizinc.png','위즈아이앤씨','010-1111-1111','wizinc@outlook.com','담당자이름','010-2222-2222','wizinc1@outlook.com');

/* 기업인증한 아이디 corp_status 2로 변경 */
update member set corp_status=2 where id='m00151';
update member set corp_status=2 where id='m00152';
update member set corp_status=2 where id='m00153';
update member set corp_status=2 where id='m00154';
update member set corp_status=2 where id='m00155';
update member set corp_status=2 where id='m00156';
update member set corp_status=2 where id='m00157';
update member set corp_status=2 where id='m00158';
update member set corp_status=2 where id='m00159';
update member set corp_status=2 where id='m00160';

/* 게시글 추가*/
/* mansearch_board table에 추가 */
select * from board where boardtype='mansearch';
select * from mansearch_board;
select * from corperation;
CREATE PROCEDURE board_mansearch_input1()
BEGIN
	DECLARE cnt INT DEFAULT 1;
	here:LOOP
		INSERT INTO board(id, boardtype, nal, subject, doc)
		VALUES ('m00151','mansearch',now(),CONCAT('가족같은 분위기에서 일하실 분 구합니다',cnt),'<p><span style="background-color: rgb(255, 255, 0);">구인공고글 작성!!</span></p>');
		INSERT INTO mansearch_board(sno, work_start, pay, corp_location, position, job_type, required_career, education_level, work_type, pay_date, required_skill, deadline, main_task, sub_task)
		VALUES ((select sno from board order by sno desc limit 0,1),'2023-02-15',800,'경기 용인시 기흥구 농서동','프론트앤드개발, 팀원','계약직','10년 이상 ~ 무관','학사 이상','협의','매월 12일','javascript, vue.js','2023-02-05','SM','금융');
		IF cnt=20 THEN
			LEAVE here;
		END IF;
		SET cnt=cnt+1;	
	END LOOP;
	
END;

CALL board_mansearch_input1();

CREATE PROCEDURE board_mansearch_input2()
BEGIN
	DECLARE cnt INT DEFAULT 21;
	here:LOOP
		INSERT INTO board(id, boardtype, nal, subject, doc)
		VALUES ('m00152','mansearch',now(),CONCAT('가족같은 분위기에서 일하실 분 구합니다',cnt),'<p><span style="background-color: rgb(255, 255, 0);">구인공고글 작성!!</span></p>');
		INSERT INTO mansearch_board(sno, work_start, pay, corp_location, position, job_type, required_career, education_level, work_type, pay_date, required_skill, deadline, main_task, sub_task)
		VALUES ((select sno from board order by sno desc limit 0,1),'2023-02-15',800,'경기 용인시 기흥구 농서동','프론트앤드개발, 팀원','계약직','10년 이상 ~ 무관','학사 이상','협의','매월 12일','javascript, vue.js','2023-02-05','SM','금융');
		IF cnt=40 THEN
			LEAVE here;
		END IF;
		SET cnt=cnt+1;	
	END LOOP;
	
END;

CALL board_mansearch_input2();

CREATE PROCEDURE board_mansearch_input3()
BEGIN
	DECLARE cnt INT DEFAULT 41;
	here:LOOP
		INSERT INTO board(id, boardtype, nal, subject, doc)
		VALUES ('m00153','mansearch',now(),CONCAT('가족같은 분위기에서 일하실 분 구합니다',cnt),'<p><span style="background-color: rgb(255, 255, 0);">구인공고글 작성!!</span></p>');
		INSERT INTO mansearch_board(sno, work_start, pay, corp_location, position, job_type, required_career, education_level, work_type, pay_date, required_skill, deadline, main_task, sub_task)
		VALUES ((select sno from board order by sno desc limit 0,1),'2023-02-15',800,'경기 용인시 기흥구 농서동','프론트앤드개발, 팀원','계약직','10년 이상 ~ 무관','학사 이상','협의','매월 12일','javascript, vue.js','2023-02-05','SM','금융');
		IF cnt=60 THEN
			LEAVE here;
		END IF;
		SET cnt=cnt+1;	
	END LOOP;
	
END;

CALL board_mansearch_input3();

CREATE PROCEDURE board_mansearch_input4()
BEGIN
	DECLARE cnt INT DEFAULT 61;
	here:LOOP
		INSERT INTO board(id, boardtype, nal, subject, doc)
		VALUES ('m00154','mansearch',now(),CONCAT('가족같은 분위기에서 일하실 분 구합니다',cnt),'<p><span style="background-color: rgb(255, 255, 0);">구인공고글 작성!!</span></p>');
		INSERT INTO mansearch_board(sno, work_start, pay, corp_location, position, job_type, required_career, education_level, work_type, pay_date, required_skill, deadline, main_task, sub_task)
		VALUES ((select sno from board order by sno desc limit 0,1),'2023-02-15',800,'경기 용인시 기흥구 농서동','프론트앤드개발, 팀원','계약직','10년 이상 ~ 무관','학사 이상','협의','매월 12일','javascript, vue.js','2023-02-05','SM','금융');
		IF cnt=80 THEN
			LEAVE here;
		END IF;
		SET cnt=cnt+1;	
	END LOOP;
	
END;

CALL board_mansearch_input4();

CREATE PROCEDURE board_mansearch_input5()
BEGIN
	DECLARE cnt INT DEFAULT 81;
	here:LOOP
		INSERT INTO board(id, boardtype, nal, subject, doc)
		VALUES ('m00155','mansearch',now(),CONCAT('가족같은 분위기에서 일하실 분 구합니다',cnt),'<p><span style="background-color: rgb(255, 255, 0);">구인공고글 작성!!</span></p>');
		INSERT INTO mansearch_board(sno, work_start, pay, corp_location, position, job_type, required_career, education_level, work_type, pay_date, required_skill, deadline, main_task, sub_task)
		VALUES ((select sno from board order by sno desc limit 0,1),'2023-02-15',800,'경기 용인시 기흥구 농서동','프론트앤드개발, 팀원','계약직','10년 이상 ~ 무관','학사 이상','협의','매월 12일','javascript, vue.js','2023-02-05','SM','금융');
		IF cnt=100 THEN
			LEAVE here;
		END IF;
		SET cnt=cnt+1;	
	END LOOP;
	
END;

CALL board_mansearch_input5();

CREATE PROCEDURE board_mansearch_input6()
BEGIN
	DECLARE cnt INT DEFAULT 101;
	here:LOOP
		INSERT INTO board(id, boardtype, nal, subject, doc)
		VALUES ('m00156','mansearch',now(),CONCAT('가족같은 분위기에서 일하실 분 구합니다',cnt),'<p><span style="background-color: rgb(255, 255, 0);">구인공고글 작성!!</span></p>');
		INSERT INTO mansearch_board(sno, work_start, pay, corp_location, position, job_type, required_career, education_level, work_type, pay_date, required_skill, deadline, main_task, sub_task)
		VALUES ((select sno from board order by sno desc limit 0,1),'2023-03-24',600,'서울 서초구 서초동','백엔드개발, 팀원','계약직','3년 이상 ~ 무관','학력 무관','상근','매월 25일','java,spring,mysql','2023-03-10','SI','인터넷 / 서비스');
		IF cnt=120 THEN
			LEAVE here;
		END IF;
		SET cnt=cnt+1;	
	END LOOP;
	
END;

CALL board_mansearch_input6();

CREATE PROCEDURE board_mansearch_input7()
BEGIN
	DECLARE cnt INT DEFAULT 121;
	here:LOOP
		INSERT INTO board(id, boardtype, nal, subject, doc)
		VALUES ('m00157','mansearch',now(),CONCAT('가족같은 분위기에서 일하실 분 구합니다',cnt),'<p><span style="background-color: rgb(255, 255, 0);">구인공고글 작성!!</span></p>');
		INSERT INTO mansearch_board(sno, work_start, pay, corp_location, position, job_type, required_career, education_level, work_type, pay_date, required_skill, deadline, main_task, sub_task)
		VALUES ((select sno from board order by sno desc limit 0,1),'2023-03-24',600,'서울 서초구 서초동','백엔드개발, 팀원','계약직','3년 이상 ~ 무관','학력 무관','상근','매월 25일','java,spring,mysql','2023-03-10','SI','인터넷 / 서비스');
		IF cnt=140 THEN
			LEAVE here;
		END IF;
		SET cnt=cnt+1;	
	END LOOP;
	
END;

CALL board_mansearch_input7();

CREATE PROCEDURE board_mansearch_input8()
BEGIN
	DECLARE cnt INT DEFAULT 141;
	here:LOOP
		INSERT INTO board(id, boardtype, nal, subject, doc)
		VALUES ('m00158','mansearch',now(),CONCAT('가족같은 분위기에서 일하실 분 구합니다',cnt),'<p><span style="background-color: rgb(255, 255, 0);">구인공고글 작성!!</span></p>');
		INSERT INTO mansearch_board(sno, work_start, pay, corp_location, position, job_type, required_career, education_level, work_type, pay_date, required_skill, deadline, main_task, sub_task)
		VALUES ((select sno from board order by sno desc limit 0,1),'2023-03-24',600,'서울 서초구 서초동','백엔드개발, 팀원','계약직','3년 이상 ~ 무관','학력 무관','상근','매월 25일','java,spring,mysql','2023-03-10','SI','인터넷 / 서비스');		
		IF cnt=160 THEN
			LEAVE here;
		END IF;
		SET cnt=cnt+1;	
	END LOOP;
	
END;

CALL board_mansearch_input8();

CREATE PROCEDURE board_mansearch_input9()
BEGIN
	DECLARE cnt INT DEFAULT 161;
	here:LOOP
		INSERT INTO board(id, boardtype, nal, subject, doc)
		VALUES ('m00159','mansearch',now(),CONCAT('가족같은 분위기에서 일하실 분 구합니다',cnt),'<p><span style="background-color: rgb(255, 255, 0);">구인공고글 작성!!</span></p>');
		INSERT INTO mansearch_board(sno, work_start, pay, corp_location, position, job_type, required_career, education_level, work_type, pay_date, required_skill, deadline, main_task, sub_task)
		VALUES ((select sno from board order by sno desc limit 0,1),'2023-03-24',600,'서울 서초구 서초동','백엔드개발, 팀원','계약직','3년 이상 ~ 무관','학력 무관','상근','매월 25일','java,spring,mysql','2023-03-10','SI','인터넷 / 서비스');		
		IF cnt=180 THEN
			LEAVE here;
		END IF;
		SET cnt=cnt+1;	
	END LOOP;
	
END;

CALL board_mansearch_input9();

CREATE PROCEDURE board_mansearch_input10()
BEGIN
	DECLARE cnt INT DEFAULT 181;
	here:LOOP
		INSERT INTO board(id, boardtype, nal, subject, doc)
		VALUES ('m00160','mansearch',now(),CONCAT('가족같은 분위기에서 일하실 분 구합니다',cnt),'<p><span style="background-color: rgb(255, 255, 0);">구인공고글 작성!!</span></p>');
		INSERT INTO mansearch_board(sno, work_start, pay, corp_location, position, job_type, required_career, education_level, work_type, pay_date, required_skill, deadline, main_task, sub_task)
		VALUES ((select sno from board order by sno desc limit 0,1),'2023-03-24',600,'서울 서초구 서초동','백엔드개발, 팀원','계약직','3년 이상 ~ 무관','학력 무관','상근','매월 25일','java,spring,mysql','2023-03-10','SI','인터넷 / 서비스');		
		IF cnt=200 THEN
			LEAVE here;
		END IF;
		SET cnt=cnt+1;	
	END LOOP;
	
END;

CALL board_mansearch_input10();


ALTER TABLE premium_review ADD id varchar(255) AFTER mansearch_sno;
alter table premium_review add foreign key(id) references member(id);
ALTER TABLE premium_review_buylist CHANGE review_sno premium_review_sno int;
insert into premium_review(mansearch_sno,id,review) values(671,'m0011','프리미엄리뷰 테스트');
insert into premium_review(mansearch_sno,id,review) values(670,'m0013','프리미엄리뷰 테스트');
insert into premium_review_buylist(id,premium_review_sno) values('m0015',5);
commit;
select * from premium_review;
select * from mansearch_board order by mansearch_sno desc;
select * from premium_review;
select * from premium_review_buylist;

select * from information_schema.table_constraints where table_name = 'premium_review_buylist';
alter table premium_review_buylist drop foreign key FK_premium_review_TO_premium_review_buylist_1;

select pr.premium_review_sno,pr.mansearch_sno,pr.id as writer_id, pr.review,prb.id as buyer_id from premium_review pr 
				  left join premium_review_buylist prb on pr.premium_review_sno = prb.premium_review_sno;

select pr.id writer_id, prb.id buyer_id from premium_review pr JOIN premium_review_buylist prb on pr.premium_review_sno = prb.premium_review_sno
where pr.mansearch_sno=671;

ALTER TABLE `kodup`.`premium_review_buylist` DROP PRIMARY KEY;
commit;


		select mb.mansearch_sno,pr.premium_review_sno,pr.mansearch_sno as pr_mansearch_sno,pr.id as writer_id, pr.review,prb.id as buyer_id 
		from premium_review pr left join premium_review_buylist prb on pr.premium_review_sno = prb.premium_review_sno
							   left join mansearch_board mb on pr.mansearch_sno = mb.mansearch_sno
		where mb.mansearch_sno = 671; 

				SELECT pr.premium_review_sno,pr.id AS writer_id FROM premium_review pr;
		
select * from member WHERE id="kodup104" OR id="kodup101" OR id="kodup100" OR id="kodup201" OR id="kodup200" OR id="kodup105" OR id="kodup107";
select * from mansearch_board;
SELECT * FROM board;
select * from corperation;
select * from premium_review;
select * from premium_review_buylist;
SELECT * FROM pixel_history;
DELETE FROM pixel_history;
commit;

select id as buyer_id from premium_review_buylist where premium_review_sno=1;
insert into premium_review(mansearch_sno,id,review) values(4,'kodup101','프리미엄리뷰 doc입니다');
commit;
insert into premium_review_buylist(id,premium_review_sno) values('kodup200',3);
insert into premium_review_buylist(id,premium_review_sno) values('kodup201',3);
insert into premium_review_buylist(id,premium_review_sno) values('kodup201',2);

SELECT pr.premium_review_sno,pr.review,pr.id AS writer_id, prb.id AS buyer_id FROM premium_review pr 
		JOIN premium_review_buylist prb ON pr.premium_review_sno = prb.premium_review_sno;
/* 구매 버튼 눌렀을 시 필요한 데이터:
	premium_review_sno, writer_id, buyer_id
	
	데이터를 가져오기 위해 필요한 쿼리문
	SELECT pr.premium_review_sno,pr.id AS writer_id, prb.id AS buyer_id FROM premium_review pr 
	JOIN premium_review_buylist prb ON pr.premium_review_sno = prb.premium_review_sno
 */
		SELECT pr.premium_review_sno,pr.id AS writer_id FROM premium_review pr WHERE pr.mansearch_sno=4;

/* 세션아이디를 구매리스트에 추가 */
INSERT INTO premium_review_buylist(id,prmium_review_sno) VALUES(#{buyer_id},${premium_review_sno} )
/* 세션아이디의 픽셀 수량 -200 업데이트 */
UPDATE member SET pixel = pixel -200 WHERE id = #{buyer_id}
/* 세션아이디의 픽셀히스토리에 프리미엄리뷰 열람 추가 */
INSERT INTO pixel_history(id,pixel_log,history_detail) VALUES(#{buyer_id},-200,'프리미엄리뷰 열람')
/* 프리미엄리뷰 작성자의 픽셀 수량 +200 업데이트 */
UPDATE member SET pixel = pixel +200 WHERE id = #{writer_id}
/* 프리미엄리뷰 작성자의 픽셀히스토리에 프리미엄리뷰 작성 추가 */
INSERT INTO pixel_history(id,pixel_log,history_detail) VALUES(#{writer_id},-200,'프리미엄리뷰 작성')