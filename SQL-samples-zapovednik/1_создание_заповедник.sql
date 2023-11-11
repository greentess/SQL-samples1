USE Zapovednik

IF EXISTS( SELECT name FROM sysobjects
WHERE name='z_tourist' AND type='U')
DROP TABLE z_tourist
IF EXISTS( SELECT name FROM sysobjects
WHERE name='z_сondition' AND type='U')
DROP TABLE z_сondition
IF EXISTS( SELECT name FROM sysobjects
WHERE name='z_progeny' AND type='U')
DROP TABLE z_progeny
IF EXISTS( SELECT name FROM sysobjects
WHERE name='z_landmark' AND type='U')
DROP TABLE z_landmark
IF EXISTS( SELECT name FROM sysobjects
WHERE name='z_animal' AND type='U')
DROP TABLE z_animal
IF EXISTS( SELECT name FROM sysobjects
WHERE name='z_plant' AND type='U')
DROP TABLE z_plant
IF EXISTS( SELECT name FROM sysobjects
WHERE name='z_excursion' AND type='U')
DROP TABLE z_excursion
IF EXISTS( SELECT name FROM sysobjects
WHERE name='fk_dept_staff_num' AND type='F')
ALTER TABLE z_dept DROP CONSTRAINT fk_dept_staff_num
IF EXISTS( SELECT name FROM sysobjects
WHERE name='z_staff' AND type='U')
DROP TABLE z_staff
IF EXISTS( SELECT name FROM sysobjects
WHERE name='z_dept' AND type='U')
DROP TABLE z_dept
IF EXISTS( SELECT name FROM sysobjects
WHERE name='z_object' AND type='U')
DROP TABLE z_object
IF EXISTS( SELECT name FROM sysobjects
WHERE name='z_resp_zona' AND type='U')
DROP TABLE z_resp_zona
IF EXISTS( SELECT name FROM sysobjects
WHERE name='z_zona' AND type='U')
DROP TABLE z_zona

CREATE TABLE z_tourist
	(tourist_num NUMERIC(6) IDENTITY PRIMARY KEY,
	tourist_name VARCHAR(100) NOT NULL,
	tourist_address VARCHAR(100) NULL,
	tourist_phone NUMERIC(11) NULL,
	tourist_birthdate DATETIME NULL,
	)

CREATE TABLE z_dept
	(dept_num NUMERIC(6) IDENTITY PRIMARY KEY,
	dept_name VARCHAR(100) NOT NULL,
	staff_num NUMERIC(6),
	)

CREATE TABLE z_staff
	(staff_num NUMERIC(6) IDENTITY PRIMARY KEY,
	staff_name VARCHAR(100) NOT NULL,
	dept_num NUMERIC(6),
	staff_post VARCHAR(100) NOT NULL,
	staff_hiredate DATETIME NOT NULL,
	staff_phone NUMERIC(12) NULL,

	CONSTRAINT fk_staff_dept_num FOREIGN KEY (dept_num) 
		REFERENCES z_dept (dept_num) 
	)
	ALTER TABLE z_dept ADD CONSTRAINT fk_dept_staff_num
		FOREIGN KEY (staff_num) REFERENCES z_staff(staff_num)

CREATE TABLE z_zona
	(zona_num NUMERIC(6) IDENTITY PRIMARY KEY,
	zona_name VARCHAR(30) NOT NULL,
	zona_descript VARCHAR (1000) NULL,
	)

CREATE TABLE z_resp_zona
	(staff_num NUMERIC(6),
	zona_num NUMERIC(6),

	CONSTRAINT pk_resp_zona_staff_num PRIMARY KEY (staff_num),
	CONSTRAINT fk_resp_zona_zona_num FOREIGN KEY (zona_num)
		REFERENCES z_zona (zona_num),
	CONSTRAINT fk_resp_zona_staff_num FOREIGN KEY (staff_num)
		REFERENCES z_staff (staff_num) 
	)
	
CREATE TABLE z_object
	(object_num NUMERIC(6) IDENTITY PRIMARY KEY,
	zona_num NUMERIC(6),

	CONSTRAINT fk_object_zona_num FOREIGN KEY (zona_num)
		REFERENCES z_zona (zona_num) 
	)
	
CREATE TABLE z_animal
	(object_num NUMERIC(6),
	animal_class VARCHAR(30) NULL,
	animal_family VARCHAR(30) NULL,
	animal_genus VARCHAR(30) NULL,
	animal_species VARCHAR(30) NOT NULL,
	animal_rdate DATETIME NULL,
	animal_age VARCHAR(30) NULL,
	animal_gender VARCHAR(6) NULL,
		CHECK(animal_gender IN ('Самка','Самец','Гермафродит')),
	animal_rarity CHAR (1) NULL,
		CHECK(animal_rarity IN ('0','1','2','3','4','5')),

	CONSTRAINT pk_animal_object_num PRIMARY KEY (object_num),
	CONSTRAINT fk_animal_object_num FOREIGN KEY (object_num)
		REFERENCES z_object (object_num) 
	)

	CREATE TABLE z_plant
	(object_num NUMERIC(6),
	plant_class VARCHAR(30) NULL,
	plant_family VARCHAR(30) NULL,
	plant_genus VARCHAR(30) NULL,
	plant_species VARCHAR(30) NOT NULL,
	plant_rdate DATETIME NULL,
	plant_age VARCHAR(30) NULL,
	plant_rarity CHAR (1) NULL,
		CHECK(plant_rarity IN ('0','1','2','3','4','5')),

	CONSTRAINT pk_plant_object_num PRIMARY KEY (object_num),
	CONSTRAINT fk_plant_object_num FOREIGN KEY (object_num)
		REFERENCES z_object (object_num) 
	)

	CREATE TABLE z_landmark
	(object_num NUMERIC(6),
	landmark_descript VARCHAR (1000) NULL,
	landmark_name VARCHAR (30) NOT NULL,

	CONSTRAINT pk_landmark_object_num PRIMARY KEY (object_num),
	CONSTRAINT fk_landmark_object_num FOREIGN KEY (object_num)
		REFERENCES z_object (object_num) 
	)

	CREATE TABLE z_progeny
	(progeny_baby_num NUMERIC(6) IDENTITY PRIMARY KEY,
	progeny_birth_date DATETIME NOT NULL,
	object_num NUMERIC (6),
		
	CONSTRAINT fk_progeny_object_num FOREIGN KEY (object_num)
		REFERENCES z_animal (object_num) 
	)

	CREATE TABLE z_сondition
	(note_num NUMERIC(6) IDENTITY PRIMARY KEY,
	visit_date DATETIME DEFAULT GETDATE(),
	condition_disease VARCHAR (1000) NULL,
	condition_cond VARCHAR (1000) NOT NULL,
	object_num NUMERIC (6),
		
	CONSTRAINT fk_condition_object_num FOREIGN KEY (object_num)
		REFERENCES z_animal (object_num) 
	)

	CREATE TABLE z_excursion
	(excursion_num NUMERIC(6)  IDENTITY PRIMARY KEY,
	excursion_date DATETIME DEFAULT GETDATE(),
	excursion_price NUMERIC (6) NOT NULL,
	tourist_num NUMERIC (6),
	staff_num NUMERIC (6),
		
	CONSTRAINT fk_tourist_excursion_num FOREIGN KEY (tourist_num)
		REFERENCES z_tourist (tourist_num),
	CONSTRAINT fk_staff_excursion_num FOREIGN KEY (staff_num)
		REFERENCES z_staff (staff_num)	
	)

