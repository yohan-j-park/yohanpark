/* ���̵����� boardtype mansearch ���� */
delete from board where boardtype='mansearch';

/* ���ΰԽ��ǿ� �� �ۼ� ������ id��� �߰� */
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00151','����ڵ����.png','mansearch_view_corp_logo.png','ĳ��ý���','010-1111-1111','corp@outlook.com','������̸�','010-2222-2222','manager@outlook.com');
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00152','����ڵ����.png','mansearch_bluecom.jpg','�����','010-1111-1111','bluecom@outlook.com','������̸�','010-2222-2222','bluecom1@outlook.com');
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00153','����ڵ����.png','mansearch_dabinnetworks.png','�ٺ��Ʈ����','010-1111-1111','dabin@outlook.com','������̸�','010-2222-2222','dabin1@outlook.com');
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00154','����ڵ����.png','mansearch_gspec.Jpg','������','010-1111-1111','gspec@outlook.com','������̸�','010-2222-2222','gspec1@outlook.com');
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00155','����ڵ����.png','mansearch_itist.jpg','����Ƽ�̽�Ʈ','010-1111-1111','itist@outlook.com','������̸�','010-2222-2222','itist1@outlook.com');
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00156','����ڵ����.png','mansearch_pilgrimsoft.png','�ʱ׸�����Ʈ','010-1111-1111','pilgrimsoft@outlook.com','������̸�','010-2222-2222','pilgrimsoft1@outlook.com');
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00157','����ڵ����.png','mansearch_pni.png','�Ǿؾ���','010-1111-1111','pni@outlook.com','������̸�','010-2222-2222','pni1@outlook.com');
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00158','����ڵ����.png','mansearch_pssoft.png','�ǿ�������Ʈ','010-1111-1111','pssoft@outlook.com','������̸�','010-2222-2222','pssoft1@outlook.com');
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00159','����ڵ����.png','mansearch_smartfive.png','����Ʈ���̺�','010-1111-1111','smartfive@outlook.com','������̸�','010-2222-2222','smartfive1@outlook.com');
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00160','����ڵ����.png','mansearch_wizinc.png','������̾ؾ�','010-1111-1111','wizinc@outlook.com','������̸�','010-2222-2222','wizinc1@outlook.com');

/* �Խñ� �߰�*/
/* mansearch_board table�� �߰� */
select * from board where boardtype='mansearch';
select * from mansearch_board;

CREATE PROCEDURE board_mansearch_input1()
BEGIN
	DECLARE cnt INT DEFAULT 1;
	here:LOOP
		INSERT INTO board(id, boardtype, nal, subject, doc)
		VALUES ('m00151','mansearch',now(),CONCAT('�������� �����⿡�� ���Ͻ� �� ���մϴ�',cnt),'<p><span style="background-color: rgb(255, 255, 0);">���ΰ���� �ۼ�!!</span></p>');
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
		VALUES ('m00152','mansearch',now(),CONCAT('�������� �����⿡�� ���Ͻ� �� ���մϴ�',cnt),'<p><span style="background-color: rgb(255, 255, 0);">���ΰ���� �ۼ�!!</span></p>');
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
		VALUES ('m00153','mansearch',now(),CONCAT('�������� �����⿡�� ���Ͻ� �� ���մϴ�',cnt),'<p><span style="background-color: rgb(255, 255, 0);">���ΰ���� �ۼ�!!</span></p>');
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
		VALUES ('m00154','mansearch',now(),CONCAT('�������� �����⿡�� ���Ͻ� �� ���մϴ�',cnt),'<p><span style="background-color: rgb(255, 255, 0);">���ΰ���� �ۼ�!!</span></p>');
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
		VALUES ('m00155','mansearch',now(),CONCAT('�������� �����⿡�� ���Ͻ� �� ���մϴ�',cnt),'<p><span style="background-color: rgb(255, 255, 0);">���ΰ���� �ۼ�!!</span></p>');
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
		VALUES ('m00156','mansearch',now(),CONCAT('�������� �����⿡�� ���Ͻ� �� ���մϴ�',cnt),'<p><span style="background-color: rgb(255, 255, 0);">���ΰ���� �ۼ�!!</span></p>');
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
		VALUES ('m00157','mansearch',now(),CONCAT('�������� �����⿡�� ���Ͻ� �� ���մϴ�',cnt),'<p><span style="background-color: rgb(255, 255, 0);">���ΰ���� �ۼ�!!</span></p>');
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
		VALUES ('m00158','mansearch',now(),CONCAT('�������� �����⿡�� ���Ͻ� �� ���մϴ�',cnt),'<p><span style="background-color: rgb(255, 255, 0);">���ΰ���� �ۼ�!!</span></p>');
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
		VALUES ('m00159','mansearch',now(),CONCAT('�������� �����⿡�� ���Ͻ� �� ���մϴ�',cnt),'<p><span style="background-color: rgb(255, 255, 0);">���ΰ���� �ۼ�!!</span></p>');
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
		VALUES ('m00160','mansearch',now(),CONCAT('�������� �����⿡�� ���Ͻ� �� ���մϴ�',cnt),'<p><span style="background-color: rgb(255, 255, 0);">���ΰ���� �ۼ�!!</span></p>');
		IF cnt=200 THEN
			LEAVE here;
		END IF;
		SET cnt=cnt+1;	
	END LOOP;
	
END;

CALL board_mansearch_input10();

/*
CREATE PROCEDURE mansearch_board_input1()
BEGIN
	DECLARE cnt INT DEFAULT 1;
	here:LOOP
		INSERT INTO board(id, boardtype, nal, subject, doc)
		VALUES ('m00151','mansearch',now(),CONCAT('�������� �����⿡�� ���Ͻ� �� ���մϴ�',cnt),'<p><span style="background-color: rgb(255, 255, 0);">���ΰ���� �ۼ�!!</span></p>');
		IF cnt=20 THEN
			LEAVE here;
		END IF;
		SET cnt=cnt+1;	
	END LOOP;
	
END;

CALL mansearch_board_input1();
*/
