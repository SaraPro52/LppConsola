
-- CALL ConsultaVistaSubirPV("2~2");


DROP PROCEDURE IF EXISTS ConsultaVistaSubirPV;
DELIMITER ;;
CREATE PROCEDURE ConsultaVistaSubirPV (IN ArrayConsultaVistaSubir VARCHAR(100))
BEGIN
DECLARE camino_Var,idTipoFormato_Var INTEGER DEFAULT 0;

  CALL EXECUTE_ARRAY(
		ArrayConsultaVistaSubir,
		"~",
		"CASE @i
			WHEN 0 THEN SET @camino_Var = @valor;
			WHEN 1 THEN SET @idTipoFormato_Var = @valor;
		END CASE;"
	);

SET camino_Var 	= @camino_Var,
	idTipoFormato_Var 	= @idTipoFormato_Var;

CASE (camino_Var)
WHEN 1 THEN
BEGIN
	SELECT Id_Tipo_Formato, Nom_Tipo_Formato
    FROM Tipo_Formato;
END;
WHEN 2 THEN
BEGIN
	SELECT v2.Id_Formato, v2.Nom_Formato
    FROM Tipo_Formato v1 INNER JOIN Formato v2 ON v1.Id_Tipo_Formato = v2.Id_Tipo_Formato
    WHERE v1.Id_Tipo_Formato = idTipoFormato_Var;
END;
END CASE;
    
END;;
DELIMITER ;
