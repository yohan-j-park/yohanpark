select * from mansearch_board order by sno desc;
select * from board order by SNO DESC;
select * from corperation;
select * from board_att;
select * from member;
commit;
insert into mansearch_board(sno,work_start,pay,corp_location,position,job_type,required_career,education_level,work_type,pay_date,required_skill,deadline,main_task,sub_task)
		values((select sno from board order by sno desc limit 0,1),now(),500,'서울','포지션','잡타입','커리어','학력','상근',500,'스킬',now(),'SI','금융');
insert into corperation(id,corp_logo,corp_license,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
		values ('m00111','로고','라이센스','(주)좋코딩','010','이메일','매니저','매니저폰','매니저이메일');		
delete from board where sno=1504;

alter table corperation alter column corp_license set default 'default_license.png';


insert into corperation(id,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
		values ('m00118','로고','회사이름','010','이메일','매니저이름',"매니저폰","매니저이메일");

delete from corperation where corp_name='네임';		
