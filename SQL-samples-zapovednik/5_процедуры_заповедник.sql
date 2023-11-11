--��������� �������� ��������

CREATE PROCEDURE del_p @on NUMERIC(6)
AS
DELETE FROM z_plant
WHERE object_num = @on
DELETE FROM z_object
WHERE object_num = @on
GO
EXEC del_p 1016

--��������� �������� ���������

CREATE PROCEDURE del_a @on NUMERIC(6)
AS
DELETE FROM z_�ondition WHERE object_num = @on
DELETE FROM z_progeny WHERE object_num = @on
DELETE FROM z_animal WHERE object_num = @on
DELETE FROM z_object WHERE object_num = @on
GO
EXEC del_a 1016

--��������� �������� ���������������������
CREATE PROCEDURE del_l @on NUMERIC(6)
AS
DELETE FROM z_landmark
WHERE object_num = @on
DELETE FROM z_object
WHERE object_num = @on
GO
EXEC del_l 1016

--���������, ������� ��������� �������� � ������� ������� (������) � � ������� �������� (������)
CREATE PROCEDURE add_a
	@zona_num NUMERIC(6),
	@animal_class VARCHAR(30),
	@animal_family VARCHAR(30),
	@animal_genus VARCHAR(30),
	@animal_species VARCHAR(30),
	@animal_rdate DATE,
	@animal_age VARCHAR(30),
	@animal_gender VARCHAR(6),
	@animal_rarity CHAR (1)
AS
BEGIN TRY
BEGIN TRANSACTION
INSERT INTO z_object (zona_num)
VALUES (@zona_num)
INSERT INTO z_animal(object_num, animal_class, animal_family, animal_genus, animal_species, animal_rdate, animal_age, animal_gender, animal_rarity)
VALUES (@@IDENTITY, @animal_class,@animal_family,@animal_genus,@animal_species,@animal_rdate,@animal_age,@animal_gender,@animal_rarity )
COMMIT TRANSACTION
END TRY
BEGIN CATCH
IF @@trancount > 0 ROLLBACK TRANSACTION
PRINT '�� ����������� ��������� ������! �� �� ����� �������� ���� ������ � �������'
END CATCH
GO

---------------------------------------------
SELECT * FROM z_object
SELECT * FROM z_animal
EXEC add_a 3, '�������������', '������','����� �����','����� ����','2014/06/01','3 ����','�����','1'
SELECT * FROM z_object
SELECT * FROM z_animal


--���������, ������� ��������� �������� � ������� ������� (������) � � ������� �������� (������)

CREATE PROCEDURE add_p
	@zona_num NUMERIC(6),
	@plant_class VARCHAR(30),
	@plant_family VARCHAR(30),
	@plant_genus VARCHAR(30),
	@plant_species VARCHAR(30),
	@plant_rdate DATE,
	@plant_age VARCHAR(30),
	@plant_rarity CHAR (1)
AS
BEGIN TRY
BEGIN TRANSACTION
INSERT INTO z_object (zona_num)
VALUES (@zona_num)
INSERT INTO z_plant(object_num, plant_class, plant_family, plant_genus, plant_species, plant_rdate, plant_age, plant_rarity)
VALUES (@@IDENTITY, @plant_class,@plant_family,@plant_genus,@plant_species,@plant_rdate,@plant_age,@plant_rarity )
COMMIT TRANSACTION
END TRY
BEGIN CATCH
IF @@trancount > 0 ROLLBACK TRANSACTION
PRINT '�� ����������� ��������� ������! �� �� ����� �������� ���� ������ � �������'
END CATCH
GO
--------------------------------------
SELECT * FROM z_object
SELECT * FROM z_plant
EXEC add_p 1, '����������', '��������','�������','������� ��������','2014/06/01','6 �������', '-'
SELECT * FROM z_object
SELECT * FROM z_plant


--���������, ������� ��������� ���������������������  � ������� ������� (������) � � ������� ��������������������� (������)

CREATE PROCEDURE add_l
	@zona_num NUMERIC(6),
	@landmark_name VARCHAR(30),
	@landmark_descript VARCHAR(1000)	
AS
BEGIN TRY
BEGIN TRANSACTION
INSERT INTO z_object (zona_num)
VALUES (@zona_num)
INSERT INTO z_landmark(object_num,landmark_name, landmark_descript)
VALUES (@@IDENTITY, @landmark_name,@landmark_descript)
COMMIT TRANSACTION
END TRY
BEGIN CATCH
IF @@trancount > 0 ROLLBACK TRANSACTION
PRINT '�� ����������� ��������� ������! �� �� ����� �������� ���� ������ � �������'
END CATCH
GO
-----------------------------------------------------------
SELECT * FROM z_object
SELECT * FROM z_landmark
EXEC add_l 1, '����� ������ ��������', '����� �� ���������� ������ ����������� ��������� �������� ��� ����������� � ������������ � 2015 ���� ������������� ����� �M����� ��������. ������������� ����������� �������� ���������� ������ ����������.  � ����� ������ ����� ���������� ������. ������� ������ �����, ��� ���� � ��� �������� ������ �������� �����, � �������� �� ������� ������� �������� � ��������� ��� ��������. ��� ���� ����, ������� ����� ��������� �� ����� - ����� ������ �� ����� �������. ��� ������� �� ����, �� ����� �����. ���������, ��� ��� � ������� �����. ���������� �� ������ ��������� ������������ �������. ����� ����� ����� � ���������� �����, ����������� ����� ������� ����������. ��� � ��������� ����������� ������, �������� � ������������ ������� ���������� ������.
������� �������� ����������� ������������ ��� ����� ������ ��������, �������������� ����������� �������������, ��������, ����� � ������� ������� ������, �������� �� ����� ������� ����� ��������� ���. ��������, ������� ���������� �������� ������� ����� ����� ��������.'
SELECT * FROM z_object
SELECT * FROM z_landmark



--���������, ����������� �������� ����� ����������, � �������� �� ����������, � ��� ���������
CREATE PROCEDURE change_dept_post @n VARCHAR(100), @d VARCHAR(100), @p VARCHAR(100)
AS
DECLARE @dn int
BEGIN
SELECT @dn=dept_num FROM z_staff 
WHERE dept_num IN 
(SELECT dept_num FROM z_dept 
WHERE dept_name=@d)
UPDATE z_staff SET dept_num=@dn, staff_post=@p
WHERE staff_name=@n
END
GO
----------------------------------------------------------
SELECT * FROM z_staff
EXEC change_dept_post '������ ������� ����������','������� �����', '������� ������� ���������'
SELECT * FROM z_staff

--��������� ������� ������ ������������ ������
CREATE PROCEDURE change_dept_rr @dn NUMERIC(6), @sn NUMERIC (6)
AS
DECLARE @dsn int
BEGIN
SELECT @dsn=staff_num FROM z_dept
WHERE staff_num=@sn
IF @dsn=@sn
    BEGIN
        RAISERROR('Error', 15, 1)
        RETURN
    END
ELSE
BEGIN
UPDATE z_dept SET staff_num=@sn
WHERE dept_num=@dn
END
END
GO
SELECT * FROM z_dept
EXEC change_dept_rr 2,7
SELECT * FROM z_dept
SELECT * FROM z_staff

--��������� ������� ������ ������������ ������
CREATE PROCEDURE change_dept_post @n VARCHAR(100), @d VARCHAR(100), @p VARCHAR(100)
AS
DECLARE @dn int
BEGIN
SELECT @dn=dept_num FROM z_dept
WHERE dept_name=@d
UPDATE z_staff SET dept_num=@dn, staff_post=@p
WHERE staff_name=@n
END
GO
SELECT * FROM z_dept
SELECT * FROM z_staff
EXEC change_dept_rr 2,7
SELECT * FROM z_dept
SELECT * FROM z_staff


--��������� ������� ��������� �����
CREATE PROCEDURE add_dept @dn VARCHAR(100), @sn NUMERIC (6)
AS
DECLARE @dsn int
BEGIN
SELECT @dsn=staff_num FROM z_dept
WHERE staff_num=@sn
IF @dsn=@sn
    BEGIN
        RAISERROR('Error', 15, 1)
        RETURN
    END
ELSE
BEGIN
INSERT INTO z_dept(dept_name, staff_num)
VALUES (@dn,@sn)
END
END
GO
EXEC add_dept 'gg',1


--��������� ������� ������� ����� (���� �� �������, ������ � ������ ���� ����������)
CREATE PROCEDURE del_dept @dn NUMERIC(6)
AS
DELETE FROM z_dept
WHERE dept_num = @dn
GO
EXEC del_p 1016

--��������� ������� ��������� ��������������� �� ����
CREATE PROCEDURE add_resp @sn NUMERIC (6), @zn NUMERIC (6)
AS
BEGIN
INSERT INTO z_resp_zona(staff_num, zona_num)
VALUES (@sn,@zn)
END
GO
EXEC add_resp 2,1

--��������� ������� ������� ��������������� �� ����
CREATE PROCEDURE del_resp @sn NUMERIC (6), @zn NUMERIC (6)
AS
BEGIN
DELETE z_resp_zona 
WHERE staff_num=@sn AND zona_num=@zn
END
GO
EXEC del_resp 2,1

--��������� ������� ��������� ���������
CREATE PROCEDURE add_pro @bd DATE, @on NUMERIC (6)
AS
BEGIN
INSERT INTO z_progeny(progeny_birth_date, object_num)
VALUES (@bd,@on)
END
GO
EXEC add_pro '10/10/2010',18

--��������� ������� ������� ���������
CREATE PROCEDURE del_pro @bn NUMERIC (6)
AS
BEGIN
DELETE z_progeny 
WHERE progeny_baby_num=@bn
END
GO
EXEC del_resp 2,1

--��������� ������� ��������� ���������
CREATE PROCEDURE add_cond @vd DATETIME, @cd VARCHAR(1000), @cc VARCHAR(1000), @on NUMERIC (6)
AS
BEGIN
INSERT INTO z_�ondition (visit_date, condition_disease,condition_cond,object_num)
VALUES (@vd,@cd,@cc,@on)
END
GO
EXEC add_cond '11/11/2000','ff','zz',4

--��������� ������� ������� ���������
CREATE PROCEDURE del_cond @nn NUMERIC (6)
AS
BEGIN
DELETE z_�ondition
WHERE note_num=@nn
END
GO
EXEC del_cond 1006


--���������, ������� ��������� ��������� �� 1 ��������� �������� ���������, ���� � ���� �������� ������������ ���������� ���������
CREATE PROCEDURE change_rarity @baby Int = 4
AS
DECLARE @on Int
BEGIN
SELECT @on=object_num FROM z_progeny
WHERE progeny_birth_date<=GETDATE()
GROUP BY object_num HAVING COUNT (*)= @baby

UPDATE z_animal
SET animal_rarity=NULL
WHERE object_num=@on AND animal_rarity=5
UPDATE z_animal
SET animal_rarity=CONVERT(CHAR(1),(CONVERT(NUMERIC(1),animal_rarity)+1))
WHERE object_num=@on AND animal_rarity IS NOT NULL AND animal_rarity!=5
END
GO
-----------------------------------------------
SELECT * FROM z_animal
SELECT * FROM z_progeny
EXEC change_rarity 4
SELECT * FROM z_animal

UPDATE z_dept SET staff_num=1004
WHERE dept_num=1005
UPDATE z_staff SET dept_num=1005
WHERE staff_num=1004
Delete z_dept 
WHERE dept_num=1006

SELECT * FROM z_dept
SELECT * FROM z_staff

