--ОБНОВЛЯЕМЫЙ
 Представление, содержащее информацию об экскурсиях, которые  проводили для туриста Фролова Назара Степановича
CREATE VIEW z_e1
AS
SELECT z_tourist.tourist_name, z_excursion.excursion_num, z_excursion.excursion_date, z_excursion.excursion_price
FROM z_excursion INNER JOIN
 z_tourist   ON z_tourist.tourist_num = z_excursion.tourist_num 
WHERE tourist_name='Фролов Назар Степанович' 
GO
SELECT * FROM z_e1

--ОБНОВЛЯЕМЫЙ
 Представление, содержащее информацию об экскурсиях, которые проводил работник Наумов Исак Оскарович
CREATE VIEW z_excursion2
AS
SELECT z_staff.staff_name, z_excursion.excursion_num, z_excursion.excursion_date, z_excursion.excursion_price
FROM z_excursion INNER JOIN z_staff   ON z_staff.staff_num=z_excursion.staff_num
WHERE staff_name='Наумов Исак Оскарович'
GO
SELECT * FROM z_excursion2

--ОБНОВЛЯЕМЫЙ
Представление, содержащее список животных, которые находятся в 3 зоне
CREATE VIEW z_object1
AS
SELECT  z_object.zona_num, z_animal.animal_class, z_animal.animal_family, z_animal.animal_genus, z_animal.animal_species,
        z_animal.animal_rdate, z_animal.animal_age, z_animal.animal_gender
FROM  z_object INNER JOIN z_animal   ON z_object.object_num = z_animal.object_num 
WHERE zona_num=3
GO
SELECT*FROM z_object1

--НЕОБНОВЛЯЕМЫЙ
Представление, содержащее информацию о сумме стоимостей экскурсий, проведенных каждым сотрудником
CREATE VIEW sum_ex1
AS
SELECT staff_num,  SUM(excursion_price) AS excursion_price 
FROM z_excursion
GROUP BY staff_num
GO
SELECT * FROM sum_ex1

--ОБНОВЛЯЕМОЕ
Представление, содержащее информацию о сотрудниках (их фио и должность), которые проводили экскурсию в текущем году 
CREATE VIEW ex_date
AS
SELECT staff_name, staff_post FROM z_staff a
WHERE EXISTS
(SELECT *  FROM z_excursion b
WHERE excursion_date
BETWEEN '2020-01-01' AND GETDATE()
AND a.staff_num=b.staff_num)
GO
SELECT * FROM ex_date

--Представление, содержащее информацию о животных, которые поступили после 2019 года
CREATE VIEW animal_date2
AS
SELECT  animal_class, animal_family, animal_genus, animal_species , animal_rdate , animal_age , animal_gender,	animal_rarity
FROM z_animal
WHERE animal_rdate
BETWEEN '2019-01-01' AND GETDATE()
GO
SELECT * FROM animal_date1
