-- AREA_PROCEDURE
-- 

/*
	CALL Area_Procedure("1~0~Area_2.1~LiderArea2.1~1,2,3");
    CALL Area_Procedure("2~5~Area_2.2~LiderArea2.2~4");
    CALL Area_Procedure("3~5~0~0~0");
    CALL Area_Procedure("0~0~0~0~0");
*/

DROP PROCEDURE IF EXISTS Area_Procedure;

DELIMITER ;;
CREATE PROCEDURE Area_Procedure (IN arrayArea VARCHAR (400))
BEGIN

DECLARE opcion INTEGER(1);
DECLARE idArea_Var INTEGER DEFAULT 0;
DECLARE nomArea_Var VARCHAR(100);
DECLARE liderArea_Var VARCHAR(70);
DECLARE arrayProgramas_Var VARCHAR(100) DEFAULT "0";
DECLARE i,num,cant INTEGER DEFAULT 0;
DECLARE valor VARCHAR(400) DEFAULT "";


CALL EXECUTE_ARRAY(
		arrayArea,
        "~",
        "CASE @i
			WHEN 0 THEN SET @opcion = @valor;
			WHEN 1 THEN SET @idArea_Var = @valor;
            WHEN 2 THEN SET @nomArea_Var = @valor;
            WHEN 3 THEN SET @liderArea_Var = @valor;
            WHEN 4 THEN SET @arrayProgramas_Var = @valor;
        END CASE;"
    );

SET opcion = @opcion,
	idArea_Var = @idArea_Var,
    nomArea_Var = @nomArea_Var,
	liderArea_Var = @liderArea_Var,
    arrayProgramas_Var = @arrayProgramas_Var;
    

CASE opcion
WHEN 1 THEN
BEGIN -- CREAR AREA
	INSERT INTO Area VALUES (null,nomArea_Var,liderArea_Var);
    SELECT Id_Area INTO idArea_Var FROM Area WHERE Nom_Area = nomArea_Var AND Lider_Area = liderArea_Var;
    SELECT Id_Area,Nom_Area,Lider_Area FROM Area;
END;
WHEN 2 THEN 
BEGIN -- MODIFICAR AREA
	UPDATE Area
    SET Nom_Area = nomArea_Var, Lider_Area = liderArea_Var
    WHERE Id_Area = idArea_Var;
    SELECT Id_Area,Nom_Area,Lider_Area FROM Area;
END;
WHEN 3 THEN
BEGIN -- Multiselect - Modificar

    SELECT pr.Id_Programa, pr.Nom_Programa,
    CASE(
    SELECT 1 FROM Detalles_Area v1
    WHERE v1.Id_Programa = pr.Id_Programa AND v1.Id_Area = idArea_Var
    )WHEN 1 THEN 1 
	ELSE 0 END AS Tipo
    FROM Programa pr;
    
END;
ELSE SELECT Id_Area,Nom_Area,Lider_Area FROM Area;
END CASE;
IF(opcion <> 3 AND arrayProgramas_Var <> "0")THEN 
	SET num = M_LENGTH(arrayProgramas_Var,",");
    WHILE(i < num)DO
		SET valor = SUBSTRING_INDEX(arrayProgramas_Var,",",1);
        SET cant = CHAR_LENGTH(arrayProgramas_Var) - CHAR_LENGTH(valor);
        SET arrayProgramas_Var = RIGHT(arrayProgramas_Var,cant -1);
        
			CALL SARA_CRUD("INSERT","Detalles_Area",CONCAT("Id_Area~",idArea_Var,"|Id_Programa~",valor,""),"");
        SET i = i + 1;
    END WHILE;
END IF;

END;;
DELIMITER ;