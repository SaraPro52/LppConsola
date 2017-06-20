DROP PROCEDURE IF EXISTS ConsultarNotificaciones;
DELIMITER ;;
CREATE PROCEDURE ConsultarNotificaciones(IN ArrayConsuNoti VARCHAR(70))
BEGIN
  -- Tener todas las consultas de notificaciones en este procedimiento
  
  CALL EXECUTE_ARRAY(
			ArrayConsuNoti,
            "~",
            "CASE @i
				WHEN 0 THEN SET @idFuncionario = @valor;
                WHEN 1 THEN SET @idRol = @valor;
				WHEN 2 THEN SET @tipoConsulta = @valor;
			END CASE;"
        );
        
  CASE (@tipoConsulta)
    WHEN 1 THEN -- CONSULTA INSTRUCTOR-FUNCIONARIO/PRINCIPAL 
      BEGIN
        SELECT Id_Notificacion,Conte_Notificacion,v1.Fecha_Envio,Ides_Proceso,
		Nom_P_Virtual,Num_Version,Url_Version
		FROM 43_V_ConsultaTodoNotificacion v1 INNER JOIN Version v2 ON v1.Ides_Proceso = v2.Id_Version
		INNER JOIN Producto_Virtual v3 ON v2.Id_P_Virtual = v3.Id_P_Virtual
		WHERE v1.TipoIdes = 1 AND IdFuncionarioRecibe = @idFuncionario
		UNION 
		SELECT Id_Notificacion,Conte_Notificacion,v1.Fecha_Envio,Ides_Proceso,
		Nom_P_Virtual,Num_Version,Url_Version
		FROM 43_V_ConsultaTodoNotificacion v1 
		INNER JOIN Evaluacion_General v2 ON v1.Ides_Proceso = v2.Id_Evaluacion_General
		INNER JOIN Version v3 ON v2.Id_Version = v3.Id_Version
		INNER JOIN Producto_Virtual v4 ON v3.Id_P_Virtual = v4.Id_P_Virtual
		WHERE v1.TipoIdes = 2 AND IdFuncionarioRecibe = @idFuncionario
		ORDER BY Fecha_Envio DESC;
      END;
    WHEN 2 THEN -- CONSULTA CORRECCION
      BEGIN
		SELECT Id_Notificacion,Conte_Notificacion,v1.Fecha_Envio,Ides_Proceso,
		Nom_P_Virtual,Num_Version,Url_Version
		FROM 43_V_ConsultaTodoNotificacion v1 
		INNER JOIN Evaluacion_General v2 ON v1.Ides_Proceso = v2.Id_Evaluacion_General
		INNER JOIN Version v3 ON v2.Id_Version = v3.Id_Version
		INNER JOIN Producto_Virtual v4 ON v3.Id_P_Virtual = v4.Id_P_Virtual
        INNER JOIN Autor v5 ON v1.IdFuncionarioRecibe = v5.Id_Funcionario
		WHERE v1.TipoIdes = 2 AND IdFuncionarioRecibe = @idFuncionario AND v3.Id_Estado IN (9,10) AND v1.EstadoNotificacion = 0
        AND v5.Principal = 1 AND v3.Id_Version = v5.Id_Version;
		
      END;
    WHEN 3 THEN -- CONSULTA NOTIFICACIONES DE EVALUACION 
      BEGIN
        SET @idEstado = 0;
		CASE @idRol
			WHEN 2 THEN SET @idEstado = 3;
            WHEN 3 THEN SET @idEstado = 4;
        END CASE;
        
        SELECT Id_Notificacion,Conte_Notificacion,v1.Fecha_Envio,Ides_Proceso,
		Nom_P_Virtual,Num_Version,Url_Version
		FROM 43_V_ConsultaTodoNotificacion v1 
		INNER JOIN Version v2 ON v1.Ides_Proceso = v2.Id_Version
		INNER JOIN Producto_Virtual v3 ON v2.Id_P_Virtual = v3.Id_P_Virtual
		WHERE v1.TipoIdes = 1 AND IdFuncionarioRecibe = @idFuncionario AND v2.Id_Estado = @idEstado AND v1.EstadoNotificacion = 0;  
      END;
	WHEN 4 THEN -- CONSULTA HABILITAR PRODUCTO VIRTUAL
	  BEGIN
        SELECT Id_Notificacion,Conte_Notificacion,v1.Fecha_Envio,Ides_Proceso,
		Nom_P_Virtual,Num_Version,Url_Version
		FROM 43_V_ConsultaTodoNotificacion v1 
		INNER JOIN Version v2 ON v1.Ides_Proceso = v2.Id_Version
		INNER JOIN Producto_Virtual v3 ON v2.Id_P_Virtual = v3.Id_P_Virtual
		WHERE v1.TipoIdes = 1 AND IdFuncionarioRecibe = @idFuncionario AND v1.EstadoNotificacion = 0 AND v2.Id_Estado = 5;
	  END;
	WHEN 5 THEN -- CONSULTA ACTUALIZAR PRODUCTO VIRTUAL
      BEGIN
		SELECT v1.Id_P_Virtual,v1.Nom_P_Virtual,v3.Id_Version,v3.Num_Version,v3.Fecha_Vigencia,v3.Url_Version,v2.Nom_Formato,v4.Id_Funcionario
		FROM Producto_Virtual v1 INNER JOIN Formato v2 ON v1.Id_Formato = v2.Id_Formato
		INNER JOIN Version v3 ON v1.Id_P_Virtual = v3.Id_P_Virtual
		INNER JOIN Autor v4 ON v3.Id_Version = v4.Id_Version
		WHERE v4.Id_Funcionario = @idFuncionario AND v3.Id_Estado IN (6,7) AND v3.Id_Version = (
		  SELECT v33.Id_version FROM Version v33 WHERE v33.Id_P_Virtual = v1.Id_P_Virtual AND v33.Id_Estado IN (6,7)
		  ORDER BY v33.Num_Version DESC LIMIT 1);
      END;
  END CASE;

END;;
DELIMITER ;
