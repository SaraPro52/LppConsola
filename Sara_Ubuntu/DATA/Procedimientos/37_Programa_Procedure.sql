-- PROGRAMA_PROCEDURE
-- 

/*
	CALL Programa_Procedure("1~0~Programa_2.1~Basico2.2~1,2,3");
    CALL Programa_Procedure("2~4~Programa_1.1~Basico3~0");
    CALL Programa_Procedure("3~6~0~0~0");
    CALL Programa_Procedure("0~0~0~0~0");
*/

DROP PROCEDURE IF EXISTS Programa_Procedure;

DELIMITER ;;
CREATE PROCEDURE Programa_Procedure (IN arrayPrograma VARCHAR (400))
BEGIN

DECLARE opcion INTEGER(1);
DECLARE idPrograma_Var INTEGER DEFAULT 0;
DECLARE nomPrograma_Var VARCHAR(100);
DECLARE nivelFormacion_Var VARCHAR(45);
DECLARE arrayTemas_Var VARCHAR(100) DEFAULT "0";
DECLARE i,num,cant INTEGER DEFAULT 0;
DECLARE valor VARCHAR(400) DEFAULT "";

SET @opcion = 0,
	@idPrograma_Var = 0,
    @nomPrograma_Var = "0",
	@nivelFormacion_Var = "0",
    @arrayTemas_Var = "0";

CALL EXECUTE_ARRAY(
		arrayPrograma,
        "~",
        "CASE @i
			WHEN 0 THEN SET @opcion = @valor;
			WHEN 1 THEN SET @idPrograma_Var = @valor;
            WHEN 2 THEN SET @nomPrograma_Var = @valor;
            WHEN 3 THEN SET @nivelFormacion_Var = @valor;
            WHEN 4 THEN SET @arrayTemas_Var = @valor;
        END CASE;"
    );

SET opcion = @opcion,
	idPrograma_Var = @idPrograma_Var,
    nomPrograma_Var = @nomPrograma_Var,
	nivelFormacion_Var = @nivelFormacion_Var,
    arrayTemas_Var = @arrayTemas_Var;
    

CASE opcion
WHEN 1 THEN
BEGIN -- CREAR PROGRAMA
	INSERT INTO Programa VALUES(null,nomPrograma_Var,nivelFormacion_Var);
    SELECT Id_Programa INTO idPrograma_Var FROM Programa 
    WHERE Nom_Programa = nomPrograma_Var AND Nivel_Formacion = nivelFormacion_Var;
    SELECT Id_Programa,Nom_Programa,Nivel_Formacion FROM Programa;
END;
WHEN 2 THEN 
BEGIN -- MODIFICAR PROBRAMA
    UPDATE Programa 
    SET Nom_Programa = nomPrograma_Var, Nivel_Formacion = nivelFormacion_Var
    WHERE Id_Programa = idPrograma_Var;
    SELECT Id_Programa,Nom_Programa,Nivel_Formacion FROM Programa;
END;
WHEN 3 THEN
BEGIN -- Multiselect - Modificar

    SELECT te.Id_Tema,te.Nom_Tema,CASE(
		SELECT 1 FROM Detalles_Programa v1 
        WHERE v1.Id_Tema = te.Id_Tema AND v1.Id_Programa = idPrograma_Var
    ) WHEN 1 THEN 1 
	  ELSE 0 END AS Tipo
    FROM Tema te;
    
END;
ELSE SELECT Id_Programa,Nom_Programa,Nivel_Formacion FROM Programa;
END CASE;
IF(opcion <> 3 AND arrayTemas_Var <> "0")THEN 
	SET num = M_LENGTH(arrayTemas_Var,",");
    WHILE(i < num)DO
		SET valor = SUBSTRING_INDEX(arrayTemas_Var,",",1);
        SET cant = CHAR_LENGTH(arrayTemas_Var) - CHAR_LENGTH(valor);
        SET arrayTemas_Var = RIGHT(arrayTemas_Var,cant -1);
			CALL SARA_CRUD("INSERT","Detalles_Programa",CONCAT("Id_Tema~",valor,"|Id_Programa~",idPrograma_Var,""),"");
        SET i = i + 1;
    END WHILE;
END IF;

END;;
DELIMITER ;