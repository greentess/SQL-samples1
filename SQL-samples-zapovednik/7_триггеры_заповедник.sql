--�������, ������� ��������� ����� ������ � ������� ��������� ��������, ����� � ���������� ��������� ����� ��������. 
CREATE TRIGGER trig_animaladd1 ON z_animal
FOR INSERT
AS
DECLARE @object_num as INT
DECLARE @animal_rdate as DATE
DECLARE @animal_species as VARCHAR(30)
	BEGIN
		SELECT @animal_species=animal_species, @animal_rdate=animal_rdate  FROM inserted
		SELECT @object_num=object_num FROM z_animal WHERE animal_species=@animal_species AND animal_rdate=@animal_rdate
		INSERT INTO z_�ondition (visit_date,condition_cond,object_num)
		VALUES (@animal_rdate,'������ ��� ��������. ��������� ����� ��������� ������',@object_num)
	END
SELECT * FROM z_object
SELECT * FROM z_animal
SELECT * FROM z_�ondition
EXEC add_a 3,'�����', '������','������ ����','����������', '2019-05-07', '5 �������','�����','-'
SELECT * FROM z_object
SELECT * FROM z_animal
SELECT * FROM z_�ondition

--�������, ������� ��� �������� ������� ������� ��������� � ��� ���������

ALTER TABLE z_excursion DROP CONSTRAINT fk_tourist_excursion_num 

CREATE TRIGGER del_touristnum ON z_tourist
FOR DELETE
AS
	    BEGIN
		DELETE FROM z_excursion WHERE tourist_num IN (SELECT tourist_num FROM DELETED)			
		END
SELECT * FROM z_tourist
SELECT * FROM z_excursion

--������� ������� ������� ������ ��� �������� ���������, � ����� ���� � �������� ��������� � ���������
CREATE TRIGGER del_animal ON z_animal
FOR DELETE
AS
	    BEGIN
		DELETE FROM z_object WHERE object_num IN (SELECT object_num FROM DELETED)	
		DELETE FROM z_�ondition WHERE object_num IN (SELECT object_num FROM DELETED)	
		DELETE FROM z_progeny WHERE object_num IN (SELECT object_num FROM DELETED)	
		END


--������� ������� ��� ������� ��������� ������� ���� � �������� ��������� � ���������





--��������, ������� ��� �������� ������ ������� �������� � ���� ����������� 
--(� ��� �������� ����������� ��������� ���������� �� �� �������������� �� ���� � �����������
-- � ���������� � ���������� ��� ����������)
CREATE TRIGGER del_dept ON z_dept
INSTEAD OF DELETE
AS 
	BEGIN
	 DELETE FROM z_staff WHERE dept_num IN (SELECT dept_num FROM DELETED)
	 DELETE FROM z_dept WHERE dept_num IN (SELECT dept_num FROM DELETED)
	END

CREATE TRIGGER del_staff ON z_staff
INSTEAD OF DELETE
AS 
	BEGIN
	 DELETE FROM z_resp_zona WHERE staff_num IN (SELECT staff_num FROM DELETED)
	 DELETE FROM z_excursion WHERE staff_num IN (SELECT staff_num FROM DELETED)
	 DELETE FROM z_staff WHERE staff_num IN (SELECT staff_num FROM DELETED)
	END


SELECT * FROM z_dept
SELECT * FROM z_staff
SELECT * FROM z_resp_zona
SELECT * FROM z_excursion
Delete z_dept where dept_num=5;
SELECT * FROM z_dept
SELECT * FROM z_staff
SELECT * FROM z_resp_zona
SELECT * FROM z_excursion

ALTER TABLE z_resp_zona DROP  CONSTRAINT fk_resp_zona_staff_num
ALTER TABLE z_dept DROP  CONSTRAINT fk_dept_staff_num
ALTER TABLE z_staff DROP  CONSTRAINT fk_staff_dept_num
ALTER TABLE z_excursion DROP CONSTRAINT fk_staff_excursion_num






