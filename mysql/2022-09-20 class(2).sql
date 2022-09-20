/* student 제약 조건을 추가 */
SHOW tables;
DESC student;
SELECT * FROM student;
ROLLBACK;
COMMIT;
INSERT INTO student(phone) VALUES('010');
INSERT INTO student(phone) VALUES('010');
INSERT INTO student(gender) VALUES('k');
INSERT INTO student(zipcode) values('abc'); 
INSERT INTO student(id) values('a001');
INSERT INTO student(id) values('a001');

/* id에 PRIMARY KEY를 설정 */
ALTER TABLE student ADD CONSTRAINT student_id_pk PRIMARY KEY(id);
UPDATE student SET id = 'b001' WHERE id IS NULL;  /* id값이 Null인 곳에 b001을 넣기 */
ALTER TABLE student ADD CONSTRAINT student_id_pk PRIMARY KEY(id); /* id에 중복값때문에 설정이 안됨 */

/* name에 NOT NULL로 제약 조건 설정 */
UPDATE student SET name='kim';
ALTER TABLE student MODIFY NAME varchar(30) NOT null; /* 이미 null값이 들어가 있으면 적용이 안됨.. */
INSERT INTO student(id) values('a001');

/* phone에 UNIQUE 속성 추가 */
ALTER TABLE student ADD CONSTRAINT student_phone_uk UNIQUE(phone); /* Duplicate entry '010' for key 'student.student_phone_uk' : 010이 이미 2개 있어서 적용이 안됨.. */
UPDATE student SET phone=null;
commit;
SELECT * FROM student;

INSERT INTO student(phone) values('010');
INSERT INTO student(phone) values('010'); /* Duplicate entry '010' for key 'student.student_phone_uk' */

/* address에 DEFAULT 설정 */
ALTER TABLE student MODIFY address varchar(50) DEFAULT 'seoul';
ALTER TABLE student MODIFY address varchar(50) DEFAULT null; /* 'null' 아님! */
<!!주석 뒤에 DESC오류 방지용!!>;
DESC student;

/* gender에 CHECK 설정 */
ALTER TABLE student ADD CONSTRAINT student_gender_ck CHECK (gender IN( 'm' , 'f' ));
UPDATE student SET gender = 'm' WHERE gender ='k';

/* zipcode에 fk 설정 */
ALTER TABLE student ADD CONSTRAINT student_zipcode_fk FOREIGN KEY(zipcode) REFERENCES member(id);
commit;

