-- FORMATO_PROCEDURE
-- 

/*
	CALL Formato_Procedure("1~0~0O01~Des12~2");
    CALL Formato_Procedure("2~40~0O02~Des122~1");
    CALL Formato_Procedure("0~0~0~0~0");
*/

DROP PROCEDURE IF EXISTS Formato_Procedure;

DELIMITER ;;
CREATE PROCEDURE Formato_Procedure (IN arrayFormato VARCHAR (400))
BEGIN

DECLARE opcion INTEGER(1);
DECLARE idFormato_Var INTEGER DEFAULT 0;
DECLARE nomFormato_Var VARCHAR(50);
DECLARE desFormato_Var VARCHAR(100);
DECLARE idTipoFormato_Var VARCHAR(100);
DECLARE i,num,cant INTEGER DEFAULT 0;
DECLARE valor VARCHAR(400) DEFAULT "";


SET @opcion = 0,
	@idFormato_Var = 0,
    @nomFormato_Var = "0",
	@desFormato_Var = "0",
    @idTipoFormato_Var = 0;

CALL EXECUTE_ARRAY(
		arrayFormato,
        "~",
        "CASE @i
			WHEN 0 THEN SET @opcion = @valor;
			WHEN 1 THEN SET @idFormato_Var = @valor;
            WHEN 2 THEN SET @nomFormato_Var = @valor;
            WHEN 3 THEN SET @desFormato_Var = @valor;
            WHEN 4 THEN SET @idTipoFormato_Var = @valor;
        END CASE;"
    );

SET opcion = @opcion,
	idFormato_Var = @idFormato_Var,
    nomFormato_Var = @nomFormato_Var,
	desFormato_Var = @desFormato_Var,
    idTipoFormato_Var = @idTipoFormato_Var;
    

CASE opcion
WHEN 1 THEN
BEGIN -- CREAR AREA
	INSERT INTO Formato VALUES (null,nomFormato_Var,desFormato_Var,idTipoFormato_Var);
END;
WHEN 2 THEN 
BEGIN -- MODIFICAR AREA
	UPDATE Formato 
    SET Nom_Formato = nomFormato_Var, Des_Formato = desFormato_Var, Id_Tipo_Formato = idTipoFormato_Var
    WHERE Id_Formato = idFormato_Var;
END;
ELSE SELECT * FROM Formato;
END CASE;
SELECT * FROM Formato;
END;;
DELIMITER ;