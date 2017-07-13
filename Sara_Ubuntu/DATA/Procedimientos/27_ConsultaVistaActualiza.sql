DROP PROCEDURE IF EXISTS ConsultaVistaActualizar;
DELIMITER ;;
CREATE PROCEDURE ConsultaVistaActualizar(IN ArrayVistaActualizar VARCHAR (50))
BEGIN
    CALL EXECUTE_ARRAY(
			ArrayVistaActualizar,
            "~",
            "CASE @i
				WHEN 0 THEN SET @idPv = @valor;
				WHEN 1 THEN SET @idVersion = @valor;
				WHEN 2 THEN SET @val = @valor;
			END CASE;"
        );
     CASE (@val)
        WHEN 1 THEN 
          SELECT v1.* ,v2.Nom_Formato
          FROM Producto_Virtual v1 INNER JOIN Formato v2 ON v1.Id_Formato = v2.Id_Formato
          WHERE Id_P_Virtual = @idPv;
        WHEN 2 THEN
          SELECT * FROM 22_v_autor_simple WHERE Id_Version = @idVersion;
        WHEN 3 THEN
          SELECT  Id_Tema, Nom_Tema
          FROM 06_v_detalles_tema 
          WHERE Id_P_Virtual = @idPv AND Tipo_Tema = 0;
        WHEN 4 THEN
          SELECT  Id_Tema, Nom_Tema
          FROM 06_v_detalles_tema 
          WHERE Id_P_Virtual = @idPv AND Tipo_Tema = 1;
     END CASE;
END;;
DELIMITER ;
