select * from mansearch_board order by sno desc;
select * from board order by SNO DESC;
select * from corperation;
select * from board_att;
select * from member;
commit;
insert into mansearch_board(sno,work_start,pay,corp_location,position,job_type,required_career,education_level,work_type,pay_date,required_skill,deadline,main_task,sub_task)
		values((select sno from board order by sno desc limit 0,1),now(),500,'����','������','��Ÿ��','Ŀ����','�з�','���',500,'��ų',now(),'SI','����');
insert into corperation(id,corp_logo,corp_license,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
		values ('m00111','�ΰ�','���̼���','(��)���ڵ�','010','�̸���','�Ŵ���','�Ŵ�����','�Ŵ����̸���');		
delete from board where sno=1504;

alter table corperation alter column corp_license set default 'default_license.png';


insert into corperation(id,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
		values ('m00118','�ΰ�','ȸ���̸�','010','�̸���','�Ŵ����̸�',"�Ŵ�����","�Ŵ����̸���");

delete from corperation where corp_name='����';		
