/* �ȼ� ���Ž� ������̺� �ȼ��߰�, �ȼ����Ÿ���Ʈ �߰�, �ȼ������丮 �߰� Ȯ�� */
SELECT * FROM member WHERE id='m00110';
SELECT * FROM pixel_buy_list WHERE id = 'm00110';
SELECT * FROM pixel_history WHERE id='m00110';
commit;

/* �ȼ� ���� �� ȸ�������� �ȼ� �߰� */
update member m set m.pixel = m.pixel+(SELECT pb.pixel_buy_amount FROM pixel_buy_list pb WHERE id = 'm0011' ORDER BY pixel_buy_date DESC LIMIT 0,1) WHERE id= 'm0011';

/* �ȼ� ���� �� �����丮�� �����ȼ� �߰� */
INSERT INTO pixel_history(id,pixel_log,history_date) VALUES('m0011', ,now()); 

/* mansearch ����Ʈ �Ѹ��� */
SELECT DATEDIFF(deadline, DATE_FORMAT(now(),'%Y-%m-%d')) as deadlinecount, mb.pay, mb.corp_location, mb.position, mb.required_career, mb.job_type, mb.required_skill, mb.deadline, 
       b.subject,
       c.corp_logo, c.corp_name 
FROM mansearch_board mb LEFT JOIN board b 		ON mb.sno = b.sno
                        LEFT JOIN member m      ON b.id = m.id
                        LEFT JOIN corperation c ON m.id = c.id
where b.boardtype = 'mansearch'
ORDER BY b.sno desc;

select * from board where boardtype='mansearch';

select * from mansearch_board;

/* mansearch_board���̺� �׽�Ʈ�� ���̵����� �߰� */
insert into mansearch_board(sno,work_start,pay,corp_location,position,job_type,required_career,education_level,work_type,pay_date,required_skill,deadline,main_task,sub_task)
values(1301,'2023-01-25',500,'���� �߱� ������4��','����Ʈ�ص� ����,����','�����','3�� �̻� ~ ����','����','���','�ſ� 25��','java,javascript,spring,mysql','2023-01-23','SI','���ͳ�/����');

insert into mansearch_board(sno,work_start,pay,corp_location,position,job_type,required_career,education_level,work_type,pay_date,required_skill,deadline,main_task,sub_task)
values(1302,'2023-01-25',500,'���� �߱� ������4��','����Ʈ�ص� ����,����','�����','3�� �̻� ~ ����','����','���','�ſ� 25��','java,javascript,spring,mysql','2023-01-23','SI','���ͳ�/����');
/* corperation���̺� �׽�Ʈ�� ���̵����� �߰� */
select * from corperation;
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values('m0011','�������.png','mansearch_view_corp_logo.png','ĳ��ý���','010-1234-5678','kevin@admin.com','����','010-1111-1111','nong@dam.gom');

insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values('m0012','�������.png','mansearch_view_corp_logo.png','ĳ��ý���','010-1234-5678','kevin@admin.com','����','010-1111-1111','nong@dam.gom');

/* mansearch_board_view �ҷ����� */
SELECT DATEDIFF(deadline, DATE_FORMAT(now(),'%Y-%m-%d')) as deadlinecount, mb.pay, mb.pay_date, mb.education_level, mb.work_type, mb.corp_location, mb.position, mb.required_career, mb.job_type, mb.required_skill, mb.deadline, 
	   mb.main_task, mb.sub_task, mb.work_start,
	   b.subject, b.doc,
       c.corp_logo, c.corp_name, c.manager_name, c.manager_phone, c.manager_email
FROM mansearch_board mb LEFT JOIN board b 		ON mb.sno = b.sno
                        LEFT JOIN member m      ON b.id = m.id
                  		LEFT JOIN corperation c ON m.id = c.id
WHERE b.boardtype = 'mansearch' and mb.mansearch_sno = 1;


/* mansearch_board_insert �� �ۼ� �� board table�� �߰� */

insert into board(id,boardtype,nal,subject,doc)
values('m0011','mansearchboard',now(),'�����׽�Ʈ','���ߵ��������ڴ�');
commit;
select * from board where id='m0011' order by sno desc;

/* mansearch_board_insert �� �ۼ� �� board_att�� �߰� */		
 insert into board_att(sno, sysFile, oriFile)
 values((select sno from board order by sno desc limit 0,1),'default.png', 'default.png');
 select * from board_att order by sno desc;

/* delete�� mansearch_board -> board -> corperation ������ ����� */
DELETE FROM mb, b
    USING mansearch_board AS mb
    LEFT JOIN board AS b ON mb.sno = b.sno
WHERE mb.sno = 1566;

insert into corperation(id,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00151','mansearch_view_corp_logo.png','ĳ��ý���','010-1111-1111','corp@email.com','��Ŵ���','010-2222-2222','manager@email.com');
select * from corperation;
select * from board order by sno desc;

select c.corp_logo from corperation c
join board b on b.id = c.id
where b.sno= 1564;

select * from mansearch_board;
commit;

	
