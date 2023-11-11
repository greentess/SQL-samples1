USE Zapovednik


--SELECT tourist_name, tourist_address  FROM z_tourist

--SELECT '������ � '+CONVERT(CHAR(6),tourist_num)+
-- ' ������� ��������� '+ CONVERT(CHAR(12),excursion_date)+
-- '  ����������  '+CONVERT(CHAR(9),excursion_price)
--FROM z_excursion

--SELECT DISTINCT tourist_address FROM z_tourist

--SELECT object_num 
--FROM z_object
--WHERE zona_num=3;

--SELECT staff_name FROM z_staff
--WHERE staff_phone IS NOT NULL

--SELECT object_num  as "�������� �����������"
--FROM z_object
--WHERE zona_num IN (1,2)

--SELECT * FROM z_excursion
--WHERE excursion_date BETWEEN '2000-01-01' AND '2018-01-01' 

--SELECT staff_name FROM z_staff
--WHERE staff_name LIKE '�%'

--SELECT SUM(excursion_price) FROM z_excursion
--WHERE staff_num =5

--SELECT COUNT(*) FROM z_animal

--SELECT staff_name FROM z_staff ORDER BY 1

--SELECT staff_name FROM z_staff ORDER BY staff_hiredate

--����������� ���������
--�������� ������ �����������, ������� ������������ �� ����, � ������� ���� ����-��������
SELECT staff_name FROM z_staff 
WHERE  staff_num IN
	(SELECT staff_num FROM z_resp_zona
	WHERE  zona_num IN
		(SELECT zona_num FROM z_object
		WHERE object_num IN
			(SELECT object_num FROM z_animal
			WHERE animal_species = '����-��������')))

--����������� ��������� � ������������� ������������ �������
--�������� �������� ����, � ������� ��������� ����� ������ �������� �����������
SELECT zona_name FROM z_zona
WHERE  zona_num IN
	(SELECT zona_num FROM z_object
	WHERE object_num IN
		(SELECT object_num FROM z_animal
		WHERE animal_rarity= 
		(SELECT MIN(CONVERT(numeric(1),animal_rarity)) from z_animal)))

--��������� ���������
--�������� ��� � ��������� �����������, ������� ��������� ��������� � ������� ���� 


--�����������
--�������� ������ ����������� � ����� ����� ��� ���������, ������� ������ �� ��� ��������

SELECT staff_name, SUM(excursion_price) AS 'excursion_sum' 
FROM z_excursion e, z_staff s
WHERE e.staff_num=s.staff_num
GROUP BY staff_name

--������� �� ���������� ������
--���������� ������ �������� � ��������� �������� ����, � ������� ��� ���������
SELECT animal_species, zona_name, animal_rdate
FROM z_object f, z_animal c, z_zona a
WHERE f.object_num=c.object_num AND f.zona_num=a.zona_num
--(� ������� animal ���� �������� object_num, � ������� obje�t ���� �������� zona_num, � � ������� zona ���� zona_name)

--������� �� ���������� ������  ������� JOIN
--���������� ������ �������� � ���� �������� �� ���������
SELECT animal_species, progeny_birth_date
FROM z_animal a JOIN  z_progeny p  ON a.object_num=p.object_num 

--����������� ��������
--�������� ������ ��������� � ����� ������ ���������, � ����� ������ � �������� ������:
SELECT ' ��������� � '+CONVERT(CHAR(6),excursion_num) AS "�����",
'�� ����� ' + CONVERT(CHAR(6),excursion_price) AS "�����" FROM z_excursion
UNION
SELECT '�����: ', CONVERT(CHAR(6),SUM(excursion_price)) FROM z_excursion 






