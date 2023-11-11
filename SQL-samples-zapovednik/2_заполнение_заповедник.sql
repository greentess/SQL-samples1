USE Zapovednik


SET DATEFORMAT ymd

--���������� ������� �����

IF NOT EXISTS(SELECT * FROM z_dept where dept_name='������� �����')
  BEGIN
	INSERT INTO z_dept (dept_name)
	VALUES('������� �����');
  END
IF NOT EXISTS(SELECT * FROM z_dept where dept_name='����� �������������� ����������� � �������')
  BEGIN
	INSERT INTO z_dept (dept_name)
	VALUES('����� �������������� ����������� � �������');
  END
IF NOT EXISTS(SELECT * FROM z_dept where dept_name='����� �������������� ����� � ����������')
  BEGIN
	INSERT INTO z_dept (dept_name)
	VALUES('����� �������������� ����� � ����������');
  END
IF NOT EXISTS(SELECT * FROM z_dept where dept_name='����� ������ ����������')
  BEGIN
	INSERT INTO z_dept (dept_name)
	VALUES('����� ������ ����������');
  END
IF NOT EXISTS(SELECT * FROM z_dept where dept_name='����� ����������� �������� ������������')
  BEGIN
	INSERT INTO z_dept (dept_name)
	VALUES('����� ����������� �������� ������������');
  END

--���������� ������� ����������
  --����� 1

IF NOT EXISTS(SELECT * FROM z_staff where staff_num=1)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate, staff_phone)
	VALUES('����� ������� �������', 1,'������� ������� ���������', '1999-01-01', 89873156790);
  END

IF NOT EXISTS(SELECT * FROM z_staff where staff_num=2)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate)
	VALUES('������� ����� ��������', 1,'������� ������� ���������', '2005-12-15');
  END

IF NOT EXISTS(SELECT * FROM z_staff where staff_num=3)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate, staff_phone)
	VALUES('������� ��������� ���������', 1,'�������� �� ������� ������', '1990-01-01', 89874162330);
  END

  --����� 2

IF NOT EXISTS(SELECT * FROM z_staff where staff_num=4)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate, staff_phone)
	VALUES('�������� �������� �������������', 2,'�������� �� �������������� ����������� � �������', '2003-08-01', 89028162340);
  END
IF NOT EXISTS(SELECT * FROM z_staff where staff_num=5)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate)
	VALUES('������ ���� ���������', 2,'�������� �� �������������� �����������', '1994-08-10');
  END
IF NOT EXISTS(SELECT * FROM z_staff where staff_num=6)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate)
	VALUES('������ ����� ����������', 2,'���������� �� �������������� �����������', '2001-04-11');
  END

  --����� 3

IF NOT EXISTS(SELECT * FROM z_staff where staff_num=7)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate, staff_phone)
	VALUES('������� ���� ����������', 3,'������� ���������', '1990-01-01', 89878710010);
  END
IF NOT EXISTS(SELECT * FROM z_staff where staff_num=8)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate)
	VALUES('������� ������� ��������', 3,'���������', '2006-10-12');
  END

  --����� 4

IF NOT EXISTS(SELECT * FROM z_staff where staff_num=9)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate, staff_phone)
	VALUES('������� ����� ���������', 4,'�������� ������ �� ������ ����������', '1990-02-01', 89346510000);
  END
IF NOT EXISTS(SELECT * FROM z_staff where staff_num=10)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate)
	VALUES('������ ����� ��������', 4, '��������', '1991-05-12');
  END
IF NOT EXISTS(SELECT * FROM z_staff where staff_num=11)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate, staff_phone)
	VALUES('������ ����� ��������', 4,'��������', '1991-07-05', 89105603322);
  END
IF NOT EXISTS(SELECT * FROM z_staff where staff_num=12)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate, staff_phone)
	VALUES('������� ������ ϸ������', 4,'��������', '1991-11-09', 89102672177);
  END

  --����� 5

IF NOT EXISTS(SELECT * FROM z_staff where staff_num=13)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate)
	VALUES('������ ������� ����������', 5,'������������� ��������', '2007-09-03');
  END
IF NOT EXISTS(SELECT * FROM z_staff where staff_num=14)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate, staff_phone)
	VALUES('�������� �������� ���������', 5,'�������� �� ����� ��������', '1990-01-05', 8911789922);
  END
IF NOT EXISTS(SELECT * FROM z_staff where staff_num=15)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate, staff_phone)
	VALUES('���������� ����� ���������', 5,'������������� ��������', '1991-04-10', 89873097123);
  END

--���������� ������� ����� �������������� �� ������ �����������
UPDATE z_dept SET staff_num=3
WHERE dept_name='������� �����';
UPDATE z_dept SET staff_num=4
WHERE dept_name='����� �������������� ����������� � �������';
UPDATE z_dept SET staff_num=7
WHERE dept_name='����� �������������� ����� � ����������';
UPDATE z_dept SET staff_num=9
WHERE dept_name='����� ������ ����������';
UPDATE z_dept SET staff_num=14
WHERE dept_name='����� ����������� �������� ������������';


--���������� ������� ������

IF NOT EXISTS(SELECT * FROM z_tourist where tourist_num=1)
  BEGIN
	INSERT INTO z_tourist
	(tourist_name, tourist_address, tourist_phone, tourist_birthdate)
	VALUES('������ ��������� ����������', '�. ������, ��. ������, �.57', 89875556910, '1972-09-01');
  END
IF NOT EXISTS(SELECT * FROM z_tourist where tourist_num=2)
  BEGIN
	INSERT INTO z_tourist
	(tourist_name,tourist_address , tourist_birthdate)
	VALUES('������ ����� ����������', '�. ������, ��. �������, �.104', '1986-11-15' );
  END
IF NOT EXISTS(SELECT * FROM z_tourist where tourist_num=3)
  BEGIN
	INSERT INTO z_tourist
	(tourist_name, tourist_address, tourist_phone, tourist_birthdate)
	VALUES('�������� ����� �����������', '�. ������, ��. ������� , �.34', 89345152643, '2000-10-03');
  END
IF NOT EXISTS(SELECT * FROM z_tourist where tourist_num=4)
  BEGIN
	INSERT INTO z_tourist
	(tourist_name, tourist_phone, tourist_birthdate)
	VALUES('�������� ����� ����������',89356902121, '1998-05-17' );
  END
IF NOT EXISTS(SELECT * FROM z_tourist where tourist_num=5)
  BEGIN
	INSERT INTO z_tourist
	(tourist_name)
	VALUES('������� ������ ��������');
  END

--���������� ������� ���������

IF NOT EXISTS(SELECT * FROM z_excursion where excursion_num=1)
  BEGIN
	INSERT INTO z_excursion
	(excursion_date, excursion_price, tourist_num, staff_num)
	VALUES('2019-09-15', 1500, 2, 5);
  END
IF NOT EXISTS(SELECT * FROM z_excursion where excursion_num=2)
  BEGIN
	INSERT INTO z_excursion
	(excursion_price, tourist_num, staff_num)
	VALUES(2500, 1, 6);
  END
IF NOT EXISTS(SELECT * FROM z_excursion where excursion_num=3)
  BEGIN
	INSERT INTO z_excursion
	(excursion_price, tourist_num, staff_num)
	VALUES(500, 3, 4);
  END
IF NOT EXISTS(SELECT * FROM z_excursion where excursion_num=4)
  BEGIN
	INSERT INTO z_excursion
	(excursion_date, excursion_price, tourist_num, staff_num)
	VALUES('2015-04-26', 8500, 5, 5);
  END
IF NOT EXISTS(SELECT * FROM z_excursion where excursion_num=5)
  BEGIN
	INSERT INTO z_excursion
	(excursion_date, excursion_price, tourist_num, staff_num)
	VALUES('2020-05-11', 1500, 2, 4);
  END
IF NOT EXISTS(SELECT * FROM z_excursion where excursion_num=6)
  BEGIN
	INSERT INTO z_excursion
	(excursion_date, excursion_price, tourist_num, staff_num)
	VALUES('2017-10-04', 2000, 4, 5);
  END

--���������� ������� ����
IF NOT EXISTS(SELECT * FROM z_zona where zona_num=1)
  BEGIN
	INSERT INTO z_zona
	(zona_name,zona_descript)
	VALUES ('���� ��������������� �������','���������� ����� �������� ����� ���������� ��������� � � ������� ������������ �������� ������ � �������������� ��������� � �������� ���������� � ����������� ����� ��������� ��������. ������������� ��� ����������� �������������� ����������� � ������������ � ����������� ���������� � ��������-������������� ����������������������� ������������� �����. ������ ���������� ����������� � ���� ���� ����������� � ������������ ���������� ������������� ������ ��������� � ���������� ����������. ��� ������������ ����������� ����������� ����������� �������� � �������� ���������� � ������� ��� �������, ������, ������ �����.');
  END
IF NOT EXISTS(SELECT * FROM z_zona where zona_num=2)
  BEGIN
	INSERT INTO z_zona
	(zona_name, zona_descript)
	VALUES ('������������� ����','� ������������� ���� ���������� �������, ������������ �������� ������������� ���������� ������������� �������� � ������������� ������� ������ ���������. ������������� ��� ����������� ���������������� � ����������� ������ � ��������� ��������. ���������� ���������� ��������� � �������� ���� ����  ���������� �� ����������, �������������� � ��������� ������������� ������������ �������� ��������� ���������. ������ �� ������ � ������ ���� � �������������� ����������� ������������� �� ����������� ��������������� ����������� �� ��������� ���������� � �������� �������������� �������������. ������������� ������ � ���� ���� ������������ ��������������� �������������� �������� � �������������� ������� ������������ ��������������� ����������. ����������� ���������� � ������������ �����������, ���� ������, ����, ������, ������ ���������, � ��� ����� �� ����������� ������� �����������.');
  END
IF NOT EXISTS(SELECT * FROM z_zona where zona_num=3)
  BEGIN
	INSERT INTO z_zona
	(zona_name, zona_descript)
	VALUES ('���������� ����','���������� ������� ����������, �������������� ������ ������� � ����� ������ ���������� �� ����� ��������� ������������� �������� ������� � �������� ������� ��������������� ��������. ����� ������ ���������� ���� ��������� ��������� ������������� � ������������� ����������� �� ���������� ����������. ����������� ���������� ������� ������������, �������������� ����������� � ����������� ��������������� �����������.');
  END
IF NOT EXISTS(SELECT * FROM z_zona where zona_num=4)
  BEGIN
	INSERT INTO z_zona
	(zona_name, zona_descript)
	VALUES ('���� �������������� ����������','� ��� ���� ���������� �����, �� ������� �� �������������� �������������, � ����� ��������� ������� ������, ��������������� ��� ����������� �������� ������������ ������������� �����. ���������� ����������� ���� �������������� ����  ���������� �� ������������� ������������� ��������� ��������, �������� �� ����������� ������������� ������ � ���� ������������������ � �������������� ����� ������������, ��������� ������� ����� ��������� � ���������� ����������.');
  END

--���������� ������� ��������������� �� ����
IF NOT EXISTS(SELECT * FROM z_resp_zona where staff_num=10)
  BEGIN
   INSERT INTO z_resp_zona
    (staff_num, zona_num )
   VALUES (10,1);
  END
IF NOT EXISTS(SELECT * FROM z_resp_zona where staff_num=11)
  BEGIN
   INSERT INTO z_resp_zona
    (staff_num, zona_num )
   VALUES (11,2);
  END
IF NOT EXISTS(SELECT * FROM z_resp_zona where staff_num=12)
  BEGIN
   INSERT INTO z_resp_zona
    (staff_num, zona_num )
   VALUES (12,3);
  END
IF NOT EXISTS(SELECT * FROM z_resp_zona where staff_num=13)
  BEGIN
   INSERT INTO z_resp_zona
    (staff_num, zona_num )
   VALUES (13,1);
  END
IF NOT EXISTS(SELECT * FROM z_resp_zona where staff_num=15)
  BEGIN
   INSERT INTO z_resp_zona
    (staff_num, zona_num )
   VALUES (15,3);
  END

--���������� ������� ������
IF NOT EXISTS(SELECT * FROM z_object where object_num=1)
  BEGIN
	INSERT INTO z_object
	(zona_num)
	VALUES (1);
  END
IF NOT EXISTS(SELECT * FROM z_object where object_num=2)
  BEGIN
	INSERT INTO z_object
	(zona_num)
	VALUES (3);
  END
IF NOT EXISTS(SELECT * FROM z_object where object_num=3)
  BEGIN
	INSERT INTO z_object
	(zona_num)
	VALUES (3);
  END
IF NOT EXISTS(SELECT * FROM z_object where object_num=4)
  BEGIN
	INSERT INTO z_object
	(zona_num)
	VALUES (3);
  END
IF NOT EXISTS(SELECT * FROM z_object where object_num=5)
  BEGIN
	INSERT INTO z_object
	(zona_num)
	VALUES (3);
  END
IF NOT EXISTS(SELECT * FROM z_object where object_num=6)
  BEGIN
	INSERT INTO z_object
	(zona_num)
	VALUES (3);
  END
IF NOT EXISTS(SELECT * FROM z_object where object_num=7)
  BEGIN
	INSERT INTO z_object
	(zona_num)
	VALUES (3);
  END
IF NOT EXISTS(SELECT * FROM z_object where object_num=8)
  BEGIN
	INSERT INTO z_object
	(zona_num)
	VALUES (2);
  END

--���������� ������� ��������
IF NOT EXISTS(SELECT * FROM z_animal where object_num=1)
  BEGIN
   INSERT INTO z_animal
	(object_num, animal_class, animal_family, animal_genus, animal_species, 
	animal_rdate, animal_age, animal_gender)
   VALUES (1, '�������������', '��������', '�����', '����-��������', '2015-05-01', '1 ���', '�����');
  END

IF NOT EXISTS(SELECT * FROM z_animal where object_num=2)
  BEGIN
   INSERT INTO z_animal
	(object_num,animal_class, animal_family, animal_genus, animal_species, 
	animal_rdate, animal_age, animal_gender, animal_rarity)
   VALUES (2, '�������������', '�������', '�������', '�������� ����', '2015-06-01', '3 ����', '�����', '2');
  END

IF NOT EXISTS(SELECT * FROM z_animal where object_num=3)
  BEGIN
   INSERT INTO z_animal
	(object_num, animal_class, animal_family, animal_genus, animal_species, 
	animal_rdate, animal_age, animal_gender, animal_rarity)
   VALUES (3, '�������������', '������', '������� �����', '������� ����', '2014-06-01', '4 ����', '�����', '1');
  END

IF NOT EXISTS(SELECT * FROM z_animal where object_num=4)
  BEGIN
   INSERT INTO z_animal
	(object_num, animal_class, animal_family, animal_genus, animal_species, 
	animal_rdate, animal_age, animal_gender, animal_rarity)
   VALUES (4,'�������������', '���������', '������ ���������', '������ ���������', '2018-11-09', '1.5 ����', '�����', '1');
  END

IF NOT EXISTS(SELECT * FROM z_animal where object_num=5)
  BEGIN
   INSERT INTO z_animal
	(object_num, animal_class, animal_family, animal_genus, animal_species, 
	animal_rdate, animal_age, animal_gender, animal_rarity)
   VALUES (5,'�����������', '�������������', '�������', '������ ��������', '2019-12-13', '2.5 ����', '�����', '4');
  END

--���������� ������� ��������
IF NOT EXISTS(SELECT * FROM z_plant where object_num=6)
  BEGIN
   INSERT INTO z_plant
	(object_num,plant_class, plant_family, plant_genus, plant_species, 
	plant_rdate, plant_age, plant_rarity)
   VALUES (6, '����������', '�����������', '���������������', '��������������� ����������', '2019-05-01', '1 ���', '3');
  END

IF NOT EXISTS(SELECT * FROM z_plant where object_num=7)
  BEGIN
   INSERT INTO z_plant
	(object_num, plant_class, plant_family, plant_genus, plant_species, 
	plant_rdate, plant_age, plant_rarity)
   VALUES (7, '���������', '�����������', '��������', '�������� �������', '2019-05-01', '1 ���', '3');
  END

--���������� ������� ���������������������
IF NOT EXISTS(SELECT * FROM z_landmark where object_num=8)
  BEGIN
   INSERT INTO z_landmark
	(object_num, landmark_name, landmark_descript)
   VALUES (8,'�������� (�����)', '�������� � ����� � ������, ������������� � ������ ������� �� ���������� ��������������� ������ ���������� ���������. ��������� � �������� ���� �����.����� ����� �������� �����, ������ 100 � � ������������ ������� � 60 �. ������� ������ ����������� ����� ���������� 0,6 ��. ���������� ������� ��������� 11,6 �, ������� ������� ��������� 5,5 �. ���� ����� ������, ������������ � 0,6 �. ����� ���������� ���� ���-�����.');
  END

--���������� ������� ������ ���������
IF NOT EXISTS(SELECT * FROM z_progeny where progeny_baby_num=1)
  BEGIN
	INSERT INTO z_progeny
	(progeny_birth_date, object_num)
	VALUES ('2021-01-05', 2);
END

IF NOT EXISTS(SELECT * FROM z_progeny where progeny_baby_num=2)
  BEGIN
	INSERT INTO z_progeny
	(progeny_birth_date, object_num)
	VALUES ('2020-07-05', 3);
END

--���������� ������� ������ ���������
IF NOT EXISTS(SELECT * FROM z_�ondition where note_num=1)
  BEGIN
	INSERT INTO z_�ondition
	(visit_date, condition_disease, condition_cond, object_num)
	VALUES ('2020-10-04','���','�������', 1 );
END

IF NOT EXISTS(SELECT * FROM z_�ondition where note_num=2)
  BEGIN
	INSERT INTO z_�ondition
	(condition_disease, condition_cond, object_num)
	VALUES ('���','�������', 5 );
END


--_________________________________________________________________________


SELECT * FROM z_dept
SELECT * FROM z_staff

SELECT * FROM z_tourist
SELECT * FROM z_excursion

SELECT * FROM z_zona
SELECT * FROM z_resp_zona;
SELECT * FROM z_object;

SELECT * FROM z_animal;
SELECT * FROM z_plant;
SELECT * FROM z_landmark;

SELECT * FROM z_progeny;
SELECT * FROM z_�ondition;