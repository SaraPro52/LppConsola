-- CENTRO_PROCEDURE
-- 

/*
	CALL Centro_Procedure("1~0~Centro2.1~Num2~Direcc2~1~1,2,3");
    CALL Centro_Procedure("2~4~Centro2.2~Num2.1~Direcc2.1~2~4");
    CALL Centro_Procedure("3~5~0~0~0~0");
    CALL Centro_Procedure("0~0~0~0~0~0");
*/

DROP PROCEDURE IF EXISTS Centro_Procedure;

DELIMITER ;;
CREATE PROCEDURE Centro_Procedure (IN arrayCentro VARCHAR (400))
BEGIN

DECLARE opcion INTEGER(1);
DECLARE idCentro_Var INTEGER DEFAULT 0;
DECLARE nomCentro_Var VARCHAR(100);
DECLARE numCentro_Var VARCHAR(50);
DECLARE direccion_Var VARCHAR(100);
DECLARE idCiudad_Var INTEGER DEFAULT 0;
DECLARE arrayAreas_Var VARCHAR(100) DEFAULT "0";
DECLARE i,num,cant INTEGER DEFAULT 0;
DECLARE valor VARCHAR(400) DEFAULT "";


SET @opcion = 0,
	@idCentro_Var = 0,
    @numCentro_Var = "0",
	@nomCentro_Var = "0",
    @direccion_Var = "0",
	@idCiudad_Var = 0,
    @arrayAreas_Var = "0";

CALL EXECUTE_ARRAY(
		arrayCentro,
        "~",
        "CASE @i
			WHEN 0 THEN SET @opcion = @valor;
			WHEN 1 THEN SET @idCentro_Var = @valor;
            WHEN 2 THEN SET @nomCentro_Var = @valor;
            WHEN 3 THEN SET @numCentro_Var = @valor;
            WHEN 4 THEN SET @direccion_Var = @valor;
            WHEN 5 THEN SET @idCiudad_Var = @valor;
            WHEN 6 THEN SET @arrayAreas_Var = @valor;
        END CASE;"
    );

SET opcion = @opcion,
	idCentro_Var = @idCentro_Var,
    nomCentro_Var = @nomCentro_Var,
    numCentro_Var = @numCentro_Var,
    direccion_Var = @direccion_Var,
    idCiudad_Var = @idCiudad_Var,
    arrayAreas_Var = @arrayAreas_Var;
    

CASE opcion
WHEN 1 THEN
BEGIN -- CREAR AREA
	INSERT INTO Centro VALUES (null,numCentro_Var,nomCentro_Var,direccion_Var,idCiudad_Var);
    SELECT Id_Centro INTO idCentro_Var FROM Centro 
    WHERE Num_Centro = numCentro_Var AND Nom_Centro = nomCentro_Var AND Direccion = direccion_Var AND Id_Ciudad = idCiudad_Var;
    
    SELECT v1.Id_Centro,v1.Num_Centro,v1.Nom_Centro,v1.Direccion,v2.Id_Ciudad,v2.Nom_Ciudad
    FROM Centro v1 INNER JOIN Ciudad v2 ON v1.Id_Ciudad = v2.Id_Ciudad;
END;
WHEN 2 THEN 
BEGIN -- MODIFICAR AREA
	UPDATE Centro
    SET Num_Centro = numCentro_Var ,
		Nom_Centro = nomCentro_Var ,
		Direccion =  direccion_Var ,
		Id_Ciudad =  idCiudad_Var
    WHERE Id_Centro = idCentro_Var;
    
    SELECT v1.Id_Centro,v1.Num_Centro,v1.Nom_Centro,v1.Direccion,v2.Id_Ciudad,v2.Nom_Ciudad
    FROM Centro v1 INNER JOIN Ciudad v2 ON v1.Id_Ciudad = v2.Id_Ciudad;
END;
WHEN 3 THEN
BEGIN -- Multiselect - Modificar

    SELECT ar.Id_Area, ar.Nom_Area,
    CASE(
	SELECT 1 FROM Area_Centro v1
    WHERE v1.Id_Area = ar.Id_Area AND v1.Id_Centro = idCentro_Var
    )WHEN 1 THEN 1 
    ELSE 0 END AS Tipo
    FROM Area ar;
    
END;
ELSE SELECT v1.Id_Centro,v1.Num_Centro,v1.Nom_Centro,v1.Direccion,v2.Id_Ciudad,v2.Nom_Ciudad
    FROM Centro v1 INNER JOIN Ciudad v2 ON v1.Id_Ciudad = v2.Id_Ciudad;
END CASE;
IF(opcion <> 3 AND arrayAreas_Var <> "0")THEN 
	SELECT arrayAreas_Var;
	SET num = M_LENGTH(arrayAreas_Var,",");
    WHILE(i < num)DO
		SET valor = SUBSTRING_INDEX(arrayAreas_Var,",",1);
        SET cant = CHAR_LENGTH(arrayAreas_Var) - CHAR_LENGTH(valor);
        SET arrayAreas_Var = RIGHT(arrayAreas_Var,cant -1);
        
			CALL SARA_CRUD("INSERT","Area_Centro",CONCAT("Id_Area~",valor,"|Id_Centro~",idCentro_Var,""),"");
        SET i = i + 1;
    END WHILE;
END IF;

END;;
DELIMITER ;