USE Zapovednik


--SELECT tourist_name, tourist_address  FROM z_tourist

--SELECT 'Турист № '+CONVERT(CHAR(6),tourist_num)+
-- ' посетил экскурсию '+ CONVERT(CHAR(12),excursion_date)+
-- '  стоимостью  '+CONVERT(CHAR(9),excursion_price)
--FROM z_excursion

--SELECT DISTINCT tourist_address FROM z_tourist

--SELECT object_num 
--FROM z_object
--WHERE zona_num=3;

--SELECT staff_name FROM z_staff
--WHERE staff_phone IS NOT NULL

--SELECT object_num  as "Название предприятия"
--FROM z_object
--WHERE zona_num IN (1,2)

--SELECT * FROM z_excursion
--WHERE excursion_date BETWEEN '2000-01-01' AND '2018-01-01' 

--SELECT staff_name FROM z_staff
--WHERE staff_name LIKE 'Д%'

--SELECT SUM(excursion_price) FROM z_excursion
--WHERE staff_num =5

--SELECT COUNT(*) FROM z_animal

--SELECT staff_name FROM z_staff ORDER BY 1

--SELECT staff_name FROM z_staff ORDER BY staff_hiredate

--НЕСВЯЗАННЫЙ ПОДЗАПРОС
--Получить список сотрудников, которые ответственны за зону, в которой есть Енот-полоскун
SELECT staff_name FROM z_staff 
WHERE  staff_num IN
	(SELECT staff_num FROM z_resp_zona
	WHERE  zona_num IN
		(SELECT zona_num FROM z_object
		WHERE object_num IN
			(SELECT object_num FROM z_animal
			WHERE animal_species = 'Енот-полоскун')))

--НЕСВЯЗАННЫЙ ПОДЗАПРОС с использование агрегирующих функций
--Получить название зоны, в которой находится самое редкое животное заповедника
SELECT zona_name FROM z_zona
WHERE  zona_num IN
	(SELECT zona_num FROM z_object
	WHERE object_num IN
		(SELECT object_num FROM z_animal
		WHERE animal_rarity= 
		(SELECT MIN(CONVERT(numeric(1),animal_rarity)) from z_animal)))

--СВЯЗАННЫЙ ПОДЗАПРОС
--Получить ФИО и Должность сотрудников, которые проводили экскурсию в текущем году 


--ГРУППИРОВКА
--Получить список сотрудников и общую сумму цен экскурсий, которые каждый из них проводил

SELECT staff_name, SUM(excursion_price) AS 'excursion_sum' 
FROM z_excursion e, z_staff s
WHERE e.staff_num=s.staff_num
GROUP BY staff_name

--ВЫБОРКА ИЗ НЕСКОЛЬКИХ ТАБЛИЦ
--Напечатать список животных с указанием названия зоны, в которой они находятся
SELECT animal_species, zona_name, animal_rdate
FROM z_object f, z_animal c, z_zona a
WHERE f.object_num=c.object_num AND f.zona_num=a.zona_num
--(в таблице animal есть указание object_num, в таблице objeсt есть указание zona_num, а в таблице zona есть zona_name)

--ВЫБОРКА ИЗ НЕСКОЛЬКИХ ТАБЛИЦ  ПОМОЩЬЮ JOIN
--Напечатать список животных и даты рождения их детенышей
SELECT animal_species, progeny_birth_date
FROM z_animal a JOIN  z_progeny p  ON a.object_num=p.object_num 

--ОБЪЕДИНЕНИЕ ЗАПРОСОВ
--Получить список экскурсий и сумму каждой экскурсии, а также строку с итоговой суммой:
SELECT ' Экскурсия № '+CONVERT(CHAR(6),excursion_num) AS "Номер",
'на сумму ' + CONVERT(CHAR(6),excursion_price) AS "Сумма" FROM z_excursion
UNION
SELECT 'ИТОГО: ', CONVERT(CHAR(6),SUM(excursion_price)) FROM z_excursion 




