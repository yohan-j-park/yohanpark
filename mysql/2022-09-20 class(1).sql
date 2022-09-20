USE mydb;
SHOW tables;
DESC cus;
DESC cus2;
DESC member;
DESC score;
DESC student;
SELECT * FROM cus2;

/* 제약 조건 */
USE information_schema;
DESC table_constraints;
SELECT * FROM TABLE_CONSTRAINTS
WHERE table_name = 'customers';

/* 테이블 생성 시 제약 조건 추가 Type1 */
ALTER TABLE member ADD PRIMARY KEY(id); /* 기존에 있던 id에 PRIMARY KEY 적용 해야 FOREIGN KEY 생성가능  */
CREATE TABLE STD1 (
	sno VARCHAR(30) PRIMARY  KEY,
	mname VARCHAR(20) NOT NULL,
	phone VARCHAR(30) UNIQUE,
	address VARCHAR(50) DEFAULT '서울',
	gender VARCHAR(2) CHECK(gender IN( 'm' , 'f' ) ),
	zipcode VARCHAR(30),
	score INT CHECK(score BETWEEN 0 AND 100),
	FOREIGN KEY(zipcode) REFERENCES member(id)
);
DESC std1;

SELECT * FROM student;
INSERT INTO student(id) VALUES('a001');
INSERT INTO student(id, NAME) VALUES('a001', 'hong');
INSERT INTO student VALUES('a001', 'hong', '010', '서울', '123', 'f', '봉천동', 'abc@abc.com', '12345' );

commit;

/* 제약 조건에 맞게 std1값 입력하기 */
INSERT INTO member(id) VALUES('aaa');
SELECT * FROM member;
COMMIT; /* member(id)값에 'aaa' 적용완료 */

INSERT INTO member(id) VALUES('bbb');
ROLLBACK;

SELECT * FROM std1;
INSERT INTO std1(sno) VALUES('aaaa');  /* mname이 NOT NULL 이라 mname은 반드시 써야함 */
INSERT INTO std1(sno, mname) VALUES ('aaaa', 'hong');
INSERT INTO std1(sno, mname) VALUES ('aaaa', 'hong'); /* sno='aaaa'가 PRIMARY KEY라 중복 적용 안됨 */
INSERT INTO std1(sno, mname, phone) VALUES ('bbbb', 'kim', '010'); /* UNIQUE 속성은 NULL이 1개만 적용 가능함(querybox에서는 오류로 적용됨) */
INSERT INTO std1(sno, mname, phone) VALUES ('cccc', 'kim', '010'); /* phone ='010'이 UNIQUE속성이라 중복 안됨 */
INSERT INTO std1(sno, mname, gender)VALUES ('dddd', 'park', 'k');  /* gender값은 CHECK 'f' or 'm' 이라 'k'는 넣을수 없음 */
INSERT INTO std1(sno, mname, gender, zipcode) VALUES ('eeee', 'kim', 'm', 'kkk'); /* zipcode와 relation된 member(id)에 'kkk'값이 없기 때문에 오류가 남 */

CREATE TABLE std2(
	sno varchar(30),
	mname varchar(30) NOT NULL,
	phone varchar(30),
	address varchar(50) DEFAULT 'seoul',
	gender varchar(2),
	zipcode varchar(30),
	score int,
	
	CONSTRAINT std2_sno_pk 			PRIMARY KEY(sno),
	CONSTRAINT std2_phone_uk 		UNIQUE(phone),
	CONSTRAINT std2_gender_chk 	CHECK(gender IN ('m', 'f') ),
	CONSTRAINT std2_score_chk 		CHECK(score BETWEEN 0 AND 100),
	CONSTRAINT std2_zipcode_fk 		FOREIGN KEY(zipcode) REFERENCES member(id)
);
SELECT * FROM std2;

/* 무결성 제약 조건에 의해 std2에 값이 입력되지 않는 상황의 SQL 작성 */
INSERT INTO std2(sno,mname,phone) VALUES('1','kim','010'); /* Field 'mname' doesn't have a default VALUE : mname의 default값은 없어야한다(NOT NULL) */ 
INSERT INTO std2(sno,mname,phone,gender,score) VALUES ('1','kim','011','f','100'); /* Duplicate entry '1' for key 'std2.PRIMARY' : std2의 PRIMARY KEY(sno)가 중복되었다. */
INSERT INTO std2(sno,mname,phone,gender,score) VALUES ('2','kim','017','m','95.5'); /* 실행 O, score에 INT가 있어서 96으로 등록됨  */
INSERT INTO std2 VALUES('3','kim','null','null','f','aaa','80.4'); /* 3	kim	null	null	f	aaa	80 */
INSERT INTO std2(sno,mname,phone,gender,address,zipcode,score) VALUES ( '4' , 'kim', ' ' , 'f' , ' '  , 'aaa' , '80.4' );  /* 4,	kim, ' ', ' ', f,	 aaa,	80 */
INSERT INTO std2(sno,mname,phone,gender,address,zipcode,score) VALUES ( '5' , 'kim',  , 'f' ,  , 'aaa' , '80.4' );  /* You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ', 'f' ,  , 'aaa' , '80.4' )' at line 2 */
INSERT INTO std2(sno,mname) VALUES ( '5' , 'kim');
INSERT INTO std2(sno,mname) VALUES ( '6' , 'kim'); /* phone(Key:unique)의 null값이 2번이라 두번째는 적용이 안되어야 하나 오류로 적용됨 */
INSERT INTO std2(sno, mname) values('a001', '');
INSERT INTO std2(sno, mname) values('g80', 'asd');
INSERT INTO std2(sno, mname, phone) values('c001', '', '');
INSERT INTO std2(sno, mname, phone) values('d001', '', '');



