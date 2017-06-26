-- FORMATO_PROCEDURE
-- 

/*
	CALL TipoFormato_Procedure("1~0~TipoFormato001~Url001");
    CALL TipoFormato_Procedure("2~4~TipoFormato002~Url002");
    CALL TipoFormato_Procedure("0~0~0~0");
    
    ALTER TABLE Tipo_Formato 
	ADD COLUMN UrlImgTipoFormato VARCHAR(100);
*/

DROP PROCEDURE IF EXISTS TipoFormato_Procedure;

DELIMITER ;;
CREATE PROCEDURE TipoFormato_Procedure (IN arrayTipoFormato VARCHAR (400))
BEGIN

DECLARE opcion INTEGER(1);
DECLARE idTipoFormato_Var INTEGER DEFAULT 0;
DECLARE nomTipoFormato_Var VARCHAR(60);
DECLARE urlImgTipoFormato_Var VARCHAR(100);

SET @opcion = 0,
	@idTipoFormato_Var = 0,
    @nomTipoFormato_Var = "0",
	@urlImgTipoFormato_Var = "0";

CALL EXECUTE_ARRAY(
		arrayTipoFormato,
        "~",
        "CASE @i
			WHEN 0 THEN SET @opcion = @valor;
			WHEN 1 THEN SET @idTipoFormato_Var = @valor;
            WHEN 2 THEN SET @nomTipoFormato_Var = @valor;
            WHEN 3 THEN SET @urlImgTipoFormato_Var = @valor;
        END CASE;"
    );

SET opcion = @opcion,
	idTipoFormato_Var = @idTipoFormato_Var,
    nomTipoFormato_Var = @nomTipoFormato_Var,
	urlImgTipoFormato_Var = @urlImgTipoFormato_Var;
    

CASE opcion
WHEN 1 THEN
BEGIN -- CREAR TIPO FORMATO
	INSERT INTO Tipo_Formato VALUES (null,nomTipoFormato_Var,urlImgTipoFormato_Var);
END;
WHEN 2 THEN 
BEGIN -- MODIFICAR TIPO FORMATO
	UPDATE Tipo_Formato 
    SET Nom_Tipo_Formato = nomTipoFormato_Var, UrlImgTipoFormato = urlImgTipoFormato_Var
    WHERE Id_Tipo_Formato = idTipoFormato_Var;
END;
ELSE SELECT * FROM Tipo_Formato;
END CASE;
SELECT * FROM Tipo_Formato;
END;;
DELIMITER ;