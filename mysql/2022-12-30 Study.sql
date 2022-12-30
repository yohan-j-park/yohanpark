create database final_test_db;
use final_test_db;
CREATE TABLE member (
   id   varchar(255)   NOT NULL,
   pwd   varchar(255)   NULL,
   email   varchar(255)   NOT NULL,
   nickname   varchar(255)   NULL,
   gender   varchar(50)   NULL,
   age   int   NULL,
   profile_img   varchar(255)   NULL   DEFAULT 'default.png',
   account_type   int   NULL,
   ban_status   int   NULL,
   pixel   int   NULL,
   grade   int   NULL,
   join_date   date   NULL
);


desc member;

CREATE TABLE board (
   sno   int   NOT NULL,
   id   varchar(255)   NOT NULL,
   boardtype   varchar(100)   NOT NULL,
   nal   datetime   NOT NULL   DEFAULT NOW(),
   subject   varchar(255)   NOT NULL,
   doc   longtext   NULL,
   hashtag   varchar(255)   NULL,
   viewcount   int   NULL   DEFAULT 0,
   thumbup   int   NULL   DEFAULT 0,
   thumbdown   int   NULL   DEFAULT 0
);

CREATE TABLE QnA_board (
   qna_sno   int   NOT NULL,
   sno   int   NOT NULL,
   pixel_reward   int   NOT NULL
);

CREATE TABLE repl (
   repl_sno   int   NOT NULL,
   id   varchar(255)   NOT NULL,
   sno   int   NOT NULL,
   repl_nal   datetime   NOT NULL   DEFAULT NOW(),
   repl_doc   longtext   NOT NULL,
   seq   int   NOT NULL   DEFAULT 0,
   deep   int   NOT NULL   DEFAULT 0,
   thumbup   int   NULL   DEFAULT 0,
   thumbdown   int   NULL   DEFAULT 0
);

CREATE TABLE repl_selected (
   repl_sno   int   NOT NULL,
   selected_status   int   NULL   DEFAULT 0
);

INSERT INTO member(id,pwd,email,nickname,gender,age,profile_img,account_type,ban_status,pixel,grade,join_date)
values('b002','1111','def@naver.com','kim','f','30','kim.jpg',0,0,200,0,now());

INSERT INTO board(sno,id,boardtype,nal,subject,doc,hashtag)
values(1,'a001','QnA',now(),'테스트입니다.','내용','#java#mysql');

INSERT INTO QnA_board(qna_sno,sno,pixel_reward)
values(1,1,2000);

select * from member;


commit;