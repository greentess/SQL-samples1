CREATE PROCEDURE change_rarity_cursor @baby Int = 3
AS
DECLARE @on Int
BEGIN
DECLARE cur1 CURSOR FOR 
SELECT object_num FROM z_progeny
WHERE progeny_birth_date<=GETDATE()
GROUP BY object_num HAVING COUNT (*)>= @baby

OPEN cur1
FETCH cur1 INTO @on

WHILE @@FETCH_STATUS=0
BEGIN
UPDATE z_animal
SET animal_rarity=NULL
WHERE object_num=@on AND animal_rarity=5
UPDATE z_animal
SET animal_rarity=CONVERT(CHAR(1),(CONVERT(NUMERIC(1),animal_rarity)+1))
WHERE object_num=@on AND animal_rarity IS NOT NULL AND animal_rarity!=5

FETCH cur1 INTO @on
END

DEALLOCATE cur1
END
GO
-----------------------------------------------
SELECT * FROM z_animal
SELECT * FROM z_progeny
EXEC change_rarity_cursor 3
SELECT * FROM z_animal