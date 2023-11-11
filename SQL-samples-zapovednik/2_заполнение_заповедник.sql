USE Zapovednik


SET DATEFORMAT ymd

--заполнение таблицы Отдел

IF NOT EXISTS(SELECT * FROM z_dept where dept_name='Научный отдел')
  BEGIN
	INSERT INTO z_dept (dept_name)
	VALUES('Научный отдел');
  END
IF NOT EXISTS(SELECT * FROM z_dept where dept_name='Отдел экологического просвещения и туризма')
  BEGIN
	INSERT INTO z_dept (dept_name)
	VALUES('Отдел экологического просвещения и туризма');
  END
IF NOT EXISTS(SELECT * FROM z_dept where dept_name='Отдел бухгалтерского учета и отчетности')
  BEGIN
	INSERT INTO z_dept (dept_name)
	VALUES('Отдел бухгалтерского учета и отчетности');
  END
IF NOT EXISTS(SELECT * FROM z_dept where dept_name='Отдел охраны территории')
  BEGIN
	INSERT INTO z_dept (dept_name)
	VALUES('Отдел охраны территории');
  END
IF NOT EXISTS(SELECT * FROM z_dept where dept_name='Отдел обеспечения основной деятельности')
  BEGIN
	INSERT INTO z_dept (dept_name)
	VALUES('Отдел обеспечения основной деятельности');
  END

--Заполнение таблицы Сотрудники
  --Отдел 1

IF NOT EXISTS(SELECT * FROM z_staff where staff_num=1)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate, staff_phone)
	VALUES('Фомин Ермолай Еремеев', 1,'Старший научный сотрудник', '1999-01-01', 89873156790);
  END

IF NOT EXISTS(SELECT * FROM z_staff where staff_num=2)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate)
	VALUES('Галкина Дарья Семёновна', 1,'Младший научный сотрудник', '2005-12-15');
  END

IF NOT EXISTS(SELECT * FROM z_staff where staff_num=3)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate, staff_phone)
	VALUES('Сысуева Екатерина Андреевна', 1,'Директор по научной работе', '1990-01-01', 89874162330);
  END

  --Отдел 2

IF NOT EXISTS(SELECT * FROM z_staff where staff_num=4)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate, staff_phone)
	VALUES('Тихонова Розалина Ростиславовна', 2,'Директор по экологическому просвещению и туризму', '2003-08-01', 89028162340);
  END
IF NOT EXISTS(SELECT * FROM z_staff where staff_num=5)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate)
	VALUES('Наумов Исак Оскарович', 2,'Методист по экологическому просвещению', '1994-08-10');
  END
IF NOT EXISTS(SELECT * FROM z_staff where staff_num=6)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate)
	VALUES('Ефимов Артем Васильевич', 2,'Специалист по экологическому просвещению', '2001-04-11');
  END

  --Отдел 3

IF NOT EXISTS(SELECT * FROM z_staff where staff_num=7)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate, staff_phone)
	VALUES('Захаров Юлий Арсеньевич', 3,'Главный бухгалтер', '1990-01-01', 89878710010);
  END
IF NOT EXISTS(SELECT * FROM z_staff where staff_num=8)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate)
	VALUES('Доронин Аркадий Фролович', 3,'Бухгалтер', '2006-10-12');
  END

  --Отдел 4

IF NOT EXISTS(SELECT * FROM z_staff where staff_num=9)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate, staff_phone)
	VALUES('Данилов Роман Борисович', 4,'Директор отдела по охране территории', '1990-02-01', 89346510000);
  END
IF NOT EXISTS(SELECT * FROM z_staff where staff_num=10)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate)
	VALUES('Беляев Захар Павлович', 4, 'Охранник', '1991-05-12');
  END
IF NOT EXISTS(SELECT * FROM z_staff where staff_num=11)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate, staff_phone)
	VALUES('Зайцев Мирон Олегович', 4,'Охранник', '1991-07-05', 89105603322);
  END
IF NOT EXISTS(SELECT * FROM z_staff where staff_num=12)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate, staff_phone)
	VALUES('Лебедев Руслан Пётрович', 4,'Охранник', '1991-11-09', 89102672177);
  END

  --Отдел 5

IF NOT EXISTS(SELECT * FROM z_staff where staff_num=13)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate)
	VALUES('Жукова Сабрина Максимовна', 5,'Хозяйственный работник', '2007-09-03');
  END
IF NOT EXISTS(SELECT * FROM z_staff where staff_num=14)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate, staff_phone)
	VALUES('Алексеев Всеволод Дамирович', 5,'Директор по общим вопросам', '1990-01-05', 8911789922);
  END
IF NOT EXISTS(SELECT * FROM z_staff where staff_num=15)
  BEGIN
	INSERT INTO z_staff
	(staff_name, dept_num, staff_post, staff_hiredate, staff_phone)
	VALUES('Виноградов Давид Давидович', 5,'Хозяйственный работник', '1991-04-10', 89873097123);
  END

--Заполнение таблицы Отдел руководителями из списка сотрудников
UPDATE z_dept SET staff_num=3
WHERE dept_name='Научный отдел';
UPDATE z_dept SET staff_num=4
WHERE dept_name='Отдел экологического просвещения и туризма';
UPDATE z_dept SET staff_num=7
WHERE dept_name='Отдел бухгалтерского учета и отчетности';
UPDATE z_dept SET staff_num=9
WHERE dept_name='Отдел охраны территории';
UPDATE z_dept SET staff_num=14
WHERE dept_name='Отдел обеспечения основной деятельности';


--Заполнение таблицы Турист

IF NOT EXISTS(SELECT * FROM z_tourist where tourist_num=1)
  BEGIN
	INSERT INTO z_tourist
	(tourist_name, tourist_address, tourist_phone, tourist_birthdate)
	VALUES('Шилова Екатерина Степановна', 'г. Казань, ул. Мусина, д.57', 89875556910, '1972-09-01');
  END
IF NOT EXISTS(SELECT * FROM z_tourist where tourist_num=2)
  BEGIN
	INSERT INTO z_tourist
	(tourist_name,tourist_address , tourist_birthdate)
	VALUES('Фролов Назар Степанович', 'г. Казань, ул. Ямашева, д.104', '1986-11-15' );
  END
IF NOT EXISTS(SELECT * FROM z_tourist where tourist_num=3)
  BEGIN
	INSERT INTO z_tourist
	(tourist_name, tourist_address, tourist_phone, tourist_birthdate)
	VALUES('Капустин Роман Ярославович', 'г. Казань, ул. Пушкина , д.34', 89345152643, '2000-10-03');
  END
IF NOT EXISTS(SELECT * FROM z_tourist where tourist_num=4)
  BEGIN
	INSERT INTO z_tourist
	(tourist_name, tourist_phone, tourist_birthdate)
	VALUES('Никитина Елена Георгиевна',89356902121, '1998-05-17' );
  END
IF NOT EXISTS(SELECT * FROM z_tourist where tourist_num=5)
  BEGIN
	INSERT INTO z_tourist
	(tourist_name)
	VALUES('Иванова Любовь Петровна');
  END

--Заполнение таблицы Экскурсия

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

--Заполнение таблицы Зона
IF NOT EXISTS(SELECT * FROM z_zona where zona_num=1)
  BEGIN
	INSERT INTO z_zona
	(zona_name,zona_descript)
	VALUES ('Зона познавательного туризма','Выделяется вдоль основных трасс туристских маршрутов и в районах расположения наиболее ценных в познавательном отношении и наиболее популярных у посетителей парка природных объектов. Предназначена для организации экологического просвещения и ознакомления с уникальными природными и природно-историческими достопримечательностями национального парка. Задачи управления территорией в этой зоне заключаются в максимальном сохранении естественного облика природных и культурных ландшафтов. Для передвижения посетителей оборудуются специальные маршруты с видовыми площадками и местами для ночлега, отдыха, рыбной ловли.');
  END
IF NOT EXISTS(SELECT * FROM z_zona where zona_num=2)
  BEGIN
	INSERT INTO z_zona
	(zona_name, zona_descript)
	VALUES ('Рекреационная зона','В рекреационную зону выделяются участки, отличающиеся наиболее благоприятным сочетанием рекреационных ресурсов с традиционными местами отдыха населения. Предназначена для организации кратковременного и длительного отдыха в природных условиях. Управление природными ресурсами в границах этой зоны  направлено на сохранение, восстановление и повышение биологической устойчивости коренных природных сообществ. Работы по охране и защите леса и биотехнические мероприятия ориентированы на компенсацию неблагоприятных воздействий на природные сообщества в условиях рекреационного использования. Рекреационные потоки в этой зоне регулируются преимущественно планировочными методами с использованием приемов комплексного благоустройства территории. Развиваются спортивное и любительское рыболовство, сбор грибов, ягод, орехов, других дикоросов, в том числе по специальным платным разрешениям.');
  END
IF NOT EXISTS(SELECT * FROM z_zona where zona_num=3)
  BEGIN
	INSERT INTO z_zona
	(zona_name, zona_descript)
	VALUES ('Заповедная зона','Объединяет участки территории, представляющие особый интерес с точки зрения наблюдений за ходом процессов естественного развития природы в условиях полного невмешательства человека. Режим охраны заповедной зоны полностью исключает хозяйственное и рекреационное воздействия на охраняемые экосистемы. Допускается проведение научных исследований, экологического мониторинга и специальных природоохранных мероприятий.');
  END
IF NOT EXISTS(SELECT * FROM z_zona where zona_num=4)
  BEGIN
	INSERT INTO z_zona
	(zona_name, zona_descript)
	VALUES ('Зона хозяйственного назначения','В эту зону включаются земли, не изъятые из хозяйственного использования, а также отдельные участки земель, предназначенные для обеспечения основной деятельности национального парка. Управление территорией этой функциональной зоны  направлено на регулирование использования природных ресурсов, контроль за соблюдением установленных правил и норм природопользования и предотвращение видов деятельности, способных нанести ущерб природным и культурным ландшафтам.');
  END

--Заполнение таблицы Ответственность за зону
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

--Заполнение таблицы Объект
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

--Заполнение таблицы Животное
IF NOT EXISTS(SELECT * FROM z_animal where object_num=1)
  BEGIN
   INSERT INTO z_animal
	(object_num, animal_class, animal_family, animal_genus, animal_species, 
	animal_rdate, animal_age, animal_gender)
   VALUES (1, 'Млекопитающие', 'Енотовые', 'Еноты', 'Енот-полоскун', '2015-05-01', '1 год', 'Самец');
  END

IF NOT EXISTS(SELECT * FROM z_animal where object_num=2)
  BEGIN
   INSERT INTO z_animal
	(object_num,animal_class, animal_family, animal_genus, animal_species, 
	animal_rdate, animal_age, animal_gender, animal_rarity)
   VALUES (2, 'Млекопитающие', 'Кошачьи', 'Пантеры', 'Амурский тигр', '2015-06-01', '3 года', 'Самка', '2');
  END

IF NOT EXISTS(SELECT * FROM z_animal where object_num=3)
  BEGIN
   INSERT INTO z_animal
	(object_num, animal_class, animal_family, animal_genus, animal_species, 
	animal_rdate, animal_age, animal_gender, animal_rarity)
   VALUES (3, 'Млекопитающие', 'Псовые', 'Красные волки', 'Красный волк', '2014-06-01', '4 года', 'Самка', '1');
  END

IF NOT EXISTS(SELECT * FROM z_animal where object_num=4)
  BEGIN
   INSERT INTO z_animal
	(object_num, animal_class, animal_family, animal_genus, animal_species, 
	animal_rdate, animal_age, animal_gender, animal_rarity)
   VALUES (4,'Млекопитающие', 'Хомяковые', 'Желтые пеструшки', 'Желтая пеструшка', '2018-11-09', '1.5 года', 'Самец', '1');
  END

IF NOT EXISTS(SELECT * FROM z_animal where object_num=5)
  BEGIN
   INSERT INTO z_animal
	(object_num, animal_class, animal_family, animal_genus, animal_species, 
	animal_rdate, animal_age, animal_gender, animal_rarity)
   VALUES (5,'Земноводные', 'Саламандровые', 'Тритоны', 'Тритон Карелина', '2019-12-13', '2.5 года', 'Самец', '4');
  END

--Заполнение таблицы Растение
IF NOT EXISTS(SELECT * FROM z_plant where object_num=6)
  BEGIN
   INSERT INTO z_plant
	(object_num,plant_class, plant_family, plant_genus, plant_species, 
	plant_rdate, plant_age, plant_rarity)
   VALUES (6, 'Двудольные', 'Розоцветные', 'Рябинокизильник', 'Рябинокизильник Позднякова', '2019-05-01', '1 год', '3');
  END

IF NOT EXISTS(SELECT * FROM z_plant where object_num=7)
  BEGIN
   INSERT INTO z_plant
	(object_num, plant_class, plant_family, plant_genus, plant_species, 
	plant_rdate, plant_age, plant_rarity)
   VALUES (7, 'Сифоновые', 'Дербезиевые', 'Дербезия', 'Дербезия Морская', '2019-05-01', '1 год', '3');
  END

--Заполнение таблицы Достопримечательность
IF NOT EXISTS(SELECT * FROM z_landmark where object_num=8)
  BEGIN
   INSERT INTO z_landmark
	(object_num, landmark_name, landmark_descript)
   VALUES (8,'Карасиха (озеро)', 'Карасиха — озеро в России, располагается в посёлке Садовый на территории Зеленодольского района Республики Татарстан. Относится к бассейну реки Сумка.Озеро имеет округлую форму, длиной 100 м и максимальной шириной в 60 м. Площадь водной поверхности озера составляет 0,6 га. Наибольшая глубина достигает 11,6 м, средняя глубина равняется 5,5 м. Вода очень мягкая, прозрачность — 0,6 м. Озеро пересекает река Сер-Булак.');
  END

--Заполнение таблицы Журнал потомства
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

--Заполнение таблицы Журнал состояния
IF NOT EXISTS(SELECT * FROM z_сondition where note_num=1)
  BEGIN
	INSERT INTO z_сondition
	(visit_date, condition_disease, condition_cond, object_num)
	VALUES ('2020-10-04','нет','отлично', 1 );
END

IF NOT EXISTS(SELECT * FROM z_сondition where note_num=2)
  BEGIN
	INSERT INTO z_сondition
	(condition_disease, condition_cond, object_num)
	VALUES ('нет','отлично', 5 );
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
SELECT * FROM z_сondition;
