-- TEMA_PROCEDURE
-- 

/*
CALL Tema_Procedure("1~0~Tema_1.1~Des_Tema_1.1");
CALL Tema_Procedure("2~5~Tema_2.2~Des_Tema_2.2");
CALL Tema_Procedure("0~0~0~0");
*/

DROP PROCEDURE IF EXISTS Tema_Procedure;

DELIMITER ;;
CREATE PROCEDURE Tema_Procedure (IN arrayTema VARCHAR (200))
BEGIN

DECLARE	opcion		INTEGER(1);
DECLARE idTema_Var INTEGER DEFAULT 0;
DECLARE	nomTema_Var VARCHAR(45);
DECLARE	desTema_Var VARCHAR(100);

SET @opcion = 0,
	@idTema_Var = 0,
    @nomTema_Var = "0",
	@desTema_Var = "0";
    
CALL EXECUTE_ARRAY(
		arrayTema,
        "~",
        "CASE @i
			WHEN 0 THEN SET @opcion = @valor;
			WHEN 1 THEN SET @idTema_Var = @valor;
            WHEN 2 THEN SET @nomTema_Var = @valor;
            WHEN 3 THEN SET @desTema_Var = @valor;
        END CASE;"
    );

SET opcion = @opcion,
	idTema_Var = @idTema_Var,
    nomTema_Var = @nomTema_Var,
	desTema_Var = @desTema_Var;
    
CASE opcion
WHEN 1 THEN 
BEGIN -- CREAR TEMA
	INSERT INTO Tema VALUES(null,nomTema_Var,desTema_Var);
END;
WHEN 2 THEN
BEGIN -- MODIFICAR TEMA
	UPDATE Tema 
    SET Nom_Tema = nomTema_Var,
		Des_Tema = desTema_Var
	WHERE Id_Tema = idTema_Var;
END;
ELSE SELECT Id_Tema,Nom_Tema,Des_Tema FROM Tema;-- RETORNA ESTO
END CASE;

SELECT Id_Tema,Nom_Tema,Des_Tema FROM Tema;

END;;
DELIMITER ;