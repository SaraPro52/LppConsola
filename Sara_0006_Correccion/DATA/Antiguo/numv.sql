 DROP TABLE IF EXISTS Prueba1;
 CREATE TEMPORARY TABLE Prueba2 (
            Id_Version INTEGER DEFAULT null,
            Num_Version FLOAT DEFAULT null
            
        );
        
        INSERT INTO Prueba VALUES (1,1.1);
        INSERT INTO Prueba VALUES (2,2);
        INSERT INTO Prueba VALUES (3,1.1);
        
        
        UPDATE Prueba SET Num_Version = 3.1 WHERE Id_Version = 3;
		UPDATE Prueba SET Num_Version = ROUND(Num_Version) WHERE Id_Version = 2;
		UPDATE Prueba SET Num_Version = Num_Version + 1.1 WHERE Id_Version = 2;


SET @Num_Version = 0.0;
SELECT MAX(Num_Version) INTO @Num_Version FROM Prueba;
SELECT @Num_Version;
UPDATE Prueba SET Num_Version = @Num_Version / 0.1 WHERE Id_Version = 1;

SET @Num_Version = LPAD(3.1/0.1,2,"0");
SELECT @Num_Version;
SELECT RIGHT(@Num_Version,1);

SET @t = 0;


SELECT Id_Version,@t := @t + 1  
FROM Prueba; 

SELECT * FROM Prueba1










UPDATE Prueba 
	SET Num_Version = CASE 
						WHEN RIGHT(Num_Version,1) IN (1) 		THEN Num_Version + 1.0
						WHEN RIGHT(Num_Version,1) NOT IN (0,1) 	THEN (Num_Version + 1.0) - 0.1
					END
WHERE Id_Version NOT IN (4)


SET @i = 1;
SELECT @i +1,CASE WHEN @i >= 1 THEN CONCAT("1.",@i) END ;


DROP PROCEDURE P1
DELIMITER ;;
CREATE PROCEDURE P1 (IN val INTEGER)
BEGIN
IF (val = 1) THEN
	SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "sale";
END IF;

SELECT "Funciono";
END;;
DELIMITER ;


CALL P1 (1);

SHOW SESSION VARIABLES
    

