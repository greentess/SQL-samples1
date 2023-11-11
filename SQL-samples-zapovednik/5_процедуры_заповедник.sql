--Процедура удаления растения

CREATE PROCEDURE del_p @on NUMERIC(6)
AS
DELETE FROM z_plant
WHERE object_num = @on
DELETE FROM z_object
WHERE object_num = @on
GO
EXEC del_p 1016

--Процедура удаления животного

CREATE PROCEDURE del_a @on NUMERIC(6)
AS
DELETE FROM z_сondition WHERE object_num = @on
DELETE FROM z_progeny WHERE object_num = @on
DELETE FROM z_animal WHERE object_num = @on
DELETE FROM z_object WHERE object_num = @on
GO
EXEC del_a 1016

--Процедура удаления достопримечательности
CREATE PROCEDURE del_l @on NUMERIC(6)
AS
DELETE FROM z_landmark
WHERE object_num = @on
DELETE FROM z_object
WHERE object_num = @on
GO
EXEC del_l 1016

--Процедура, которая добавляет животное в таблицу объекты (надтип) и в таблицу животные (подтип)
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
PRINT 'Вы неправильно заполнили данные! Мы не можем добавить ваши данные в таблицы'
END CATCH
GO

---------------------------------------------
SELECT * FROM z_object
SELECT * FROM z_animal
EXEC add_a 3, 'Млекопитающие', 'Псовые','Белые волки','Белый волк','2014/06/01','3 года','Самка','1'
SELECT * FROM z_object
SELECT * FROM z_animal


--Процедура, которая добавляет растение в таблицу объекты (надтип) и в таблицу растения (подтип)

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
PRINT 'Вы неправильно заполнили данные! Мы не можем добавить ваши данные в таблицы'
END CATCH
GO
--------------------------------------
SELECT * FROM z_object
SELECT * FROM z_plant
EXEC add_p 1, 'Двудольные', 'Астровые','Ромашка','Ромашка аптечная','2014/06/01','6 месяцев', '-'
SELECT * FROM z_object
SELECT * FROM z_plant


--Процедура, которая добавляет достопримечательность  в таблицу объекты (надтип) и в таблицу достопримечательности (подтип)

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
PRINT 'Вы неправильно заполнили данные! Мы не можем добавить ваши данные в таблицы'
END CATCH
GO
-----------------------------------------------------------
SELECT * FROM z_object
SELECT * FROM z_landmark
EXEC add_l 1, 'Тропа мудрой черепахи', 'Здесь по территории нашего заповедника пролегает открытая для посетителей и обустроенная в 2015 году экологическая тропа «Mудрой черепахи». Протяженность пешеходного маршрута составляет девять километров.  В самом начале тропы обустроена купель. Местные жители верят, что вода в ней обладает особой целебной силой, а омовение ею придает чистоту помыслам и добавляет сил телесных. Еще одно чудо, которое можно встретить на тропе - целые облака из ярких бабочек. Они садятся на руки, не боясь людей. Считается, что это к большой удаче. Неподалеку от купели построена белокаменная часовня. Далее тропа ведет к Медвежьему гроту, называемому также Большим Ширяевским. Это – небольшая известковая пещера, промытая в незапамятные времена почвенными водами.
Особого внимания заслуживает растительный мир тропы Мудрой черепахи, представленный реликтовыми папоротниками, плаунами, мхами и другими редкими видами, живущими на нашей планете сотни миллионов лет. Вероятно, каждому искреннему ценителю природы стоит здесь побывать.'
SELECT * FROM z_object
SELECT * FROM z_landmark



--Процедура, позволяющая поменять отдел сотрудника, к которому он прикреплен, и его должность
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
EXEC change_dept_post 'Жукова Сабрина Максимовна','Научный отдел', 'Старший научный сотрудник'
SELECT * FROM z_staff

--Процедура которая меняет руководителя отдела
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

--Процедура которая меняет руководителя отдела
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


--Процедура которая добавляет отдел
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


--Процедура которая удаляет отдел (если не выходит, значит в отделе есть сотрудники)
CREATE PROCEDURE del_dept @dn NUMERIC(6)
AS
DELETE FROM z_dept
WHERE dept_num = @dn
GO
EXEC del_p 1016

--Процедура которая добавляет ответственность за зону
CREATE PROCEDURE add_resp @sn NUMERIC (6), @zn NUMERIC (6)
AS
BEGIN
INSERT INTO z_resp_zona(staff_num, zona_num)
VALUES (@sn,@zn)
END
GO
EXEC add_resp 2,1

--Процедура которая удаляет ответственность за зону
CREATE PROCEDURE del_resp @sn NUMERIC (6), @zn NUMERIC (6)
AS
BEGIN
DELETE z_resp_zona 
WHERE staff_num=@sn AND zona_num=@zn
END
GO
EXEC del_resp 2,1

--Процедура которая добавляет потомство
CREATE PROCEDURE add_pro @bd DATE, @on NUMERIC (6)
AS
BEGIN
INSERT INTO z_progeny(progeny_birth_date, object_num)
VALUES (@bd,@on)
END
GO
EXEC add_pro '10/10/2010',18

--Процедура которая удаляет потомство
CREATE PROCEDURE del_pro @bn NUMERIC (6)
AS
BEGIN
DELETE z_progeny 
WHERE progeny_baby_num=@bn
END
GO
EXEC del_resp 2,1

--Процедура которая добавляет состояние
CREATE PROCEDURE add_cond @vd DATETIME, @cd VARCHAR(1000), @cc VARCHAR(1000), @on NUMERIC (6)
AS
BEGIN
INSERT INTO z_сondition (visit_date, condition_disease,condition_cond,object_num)
VALUES (@vd,@cd,@cc,@on)
END
GO
EXEC add_cond '11/11/2000','ff','zz',4

--Процедура которая удаляет состояние
CREATE PROCEDURE del_cond @nn NUMERIC (6)
AS
BEGIN
DELETE z_сondition
WHERE note_num=@nn
END
GO
EXEC del_cond 1006


--Процедура, которая позволяет увеличить на 1 категорию редкости животного, если у него родилось определенное количество потомства
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
