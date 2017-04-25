USE SARA005;

DROP PROCEDURE IF EXISTS RegistarNotificaion;
DELIMITER ;;
	CREATE PROCEDURE RegistarNotificaion(IN ArrayDatos VARCHAR(1000))
    BEGIN
		CALL EXECUTE_ARRAY(
			ArrayDatos,
            "~",
            "CASE @i
				WHEN 0 THEN SET @contenido = @valor;
				WHEN 1 THEN SET @idTipo = @valor;
				WHEN 2 THEN SET @idFun = @valor;
				WHEN 3 THEN SET @ArrayFun = @valor;
                WHEN 4 THEN SET @Ides = @valor;
			END CASE;"
        );
    
    
    SET @numRt = 0;
    

        CALL MACC(CONCAT( 
		" SELECT COUNT(*) INTO @numRt
		 FROM 18_v_notificaciones v1 
		 INNER JOIN Version v2 ON v1.Ides_Proceso = v2.Id_Version
		 INNER JOIN Funcionario v3 ON v1.Id_FuncionarioEnvio = v3.Id_Funcionario
		 INNER JOIN Rol_Funcionario v4 ON v3.Id_Funcionario = v4.Id_Funcionario
		 INNER JOIN Rol v5 ON v4.Id_Rol = v5.Id_Rol
		 WHERE Conte_Notificacion = """,@contenido,"""
			AND Id_Tipo_Notificacion = 3
			AND v4.Id_Rol = 4 
			AND Ides_Proceso = ",@Ides,"
			AND v2.Id_Estado IN (6,7)
			AND v1.Id_FuncionarioEnvio = ",@idFun,"
			AND v1.Id_Funcionario IN (",@ArrayFun,");"));
       
    SELECT @numRt;
    
    IF(@numRt = 0)THEN
		SELECT "Entro 1";
		CALL SARA_CRUD("INSERT","Notificacion",CONCAT("Conte_Notificacion~",@contenido,"|Id_Tipo_Notificacion~",@idTipo,"|Id_Funcionario~",@idFun,"|Ides_Proceso~",@Ides,""),"");
		CALL SARA_CRUD("SELECT","Notificacion","Id_Notificacion INTO @idNoti","Conte_Notificacion = @contenido AND Id_Tipo_Notificacion = @idTipo AND Id_Funcionario = @idFun AND Ides_Proceso = @Ides ORDER BY Id_Notificacion DESC LIMIT 1");
       
        SET @i = 0;
		SET @num = M_LENGTH(@ArrayFun,",");
		WHILE(@i < @num)DO
			SET @valor = SUBSTRING_INDEX(@ArrayFun,",",1);
			SET @cant = CHAR_LENGTH(@ArrayFun) - CHAR_LENGTH(@valor);
			SET @ArrayFun = RIGHT(@ArrayFun,@cant -1);
            
				SELECT  @valor;
                SELECT  @idNoti;
				CALL SARA_CRUD("INSERT","Detalles_Notificacion",CONCAT("Id_Notificacion~",@idNoti,"|Id_Funcionario~",@valor,""),"");
			SET @i = @i + 1;
		END WHILE;
		ELSE SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Ya se encuentra un registro con dichos datos";
     END IF;
    END;;
DELIMITER ;



-- CALL ConsultarNotificaciones("1~1~1~2~9,10");

DROP PROCEDURE IF EXISTS ConsultarNotificaciones;
DELIMITER ;;
CREATE PROCEDURE ConsultarNotificaciones(IN ArrayConsuNoti VARCHAR(70))
BEGIN
  -- Tener todas las consultas de notificaciones en este procedimiento
  
  CALL EXECUTE_ARRAY(
			ArrayConsuNoti,
            "~",
            "CASE @i
				WHEN 0 THEN SET @idUser = @valor;
				WHEN 1 THEN SET @idRol = @valor;
				WHEN 2 THEN SET @idCentro = @valor;
				WHEN 3 THEN SET @tipoNotificacion = @valor;
				WHEN 4 THEN SET @estado = @valor;
			END CASE;"
        );
        
  CASE (@tipoNotificacion)
    WHEN 1 THEN 
      BEGIN
        
      END;
    WHEN 2 THEN
      BEGIN
      
		CALL MACC(CONCAT("SELECT DISTINCT Id_Notificacion,Conte_Notificacion,v2.Fecha_Envio,Ides_Proceso ,
						Nom_P_Virtual,v3.Num_Version,v3.Id_Version,v3.Url_Version
					FROM  40_v_evaluaversion v1   
						INNER JOIN  18_v_notificaciones v2 ON v1.Id_Evaluacion_General = v2.Ides_Proceso
						INNER JOIN  version v3 ON v1.Id_Version = v3.Id_Version
					WHERE v2.Id_Rol = ",@idRol," AND v2.Id_Centro = ",@idCentro," AND v2.Id_Funcionario = ",@idUser," AND
						v3.Id_Estado IN (",@estado,") AND v2.Id_Tipo_Notificacion = ",@tipoNotificacion," AND v2.Estado = 0;"));
      END;
    WHEN 3 THEN
      BEGIN
          
      END;
  END CASE;

END;;
DELIMITER ;


SET GLOBAL event_scheduler = ON;

DROP EVENT IF EXISTS Event_Notificaciones;
DELIMITER ;;
CREATE EVENT Event_Notificaciones 
ON SCHEDULE EVERY 1 DAY STARTS '2017/03/09 18:00:00' ENABLE
COMMENT "Notificaciones"
DO
BEGIN 
	CALL TIME_LIMIT ();
END;;

DELIMITER ;

DROP PROCEDURE IF EXISTS TIME_LIMIT;
DELIMITER ;;
CREATE PROCEDURE TIME_LIMIT ()
BEGIN


	DECLARE done INTEGER DEFAULT FALSE;
    DECLARE idVer INTEGER;
    DECLARE fechaV TIMESTAMP;
    DECLARE idEst INTEGER;
    DECLARE cur CURSOR FOR 
    SELECT Id_Version, DATE_FORMAT(Fecha_Vigencia,'%y-%m-%d'),Id_Estado
    FROM Version WHERE Id_Estado IN (6,7);
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    SELECT Id_Version, DATE_FORMAT(Fecha_Vigencia,'%y-%m-%d') 
    FROM Version WHERE Id_Estado = 6;-- Select
    
    SET @fechaA  = DATE_FORMAT(CURRENT_TIMESTAMP,'%y-%m-%d');
    OPEN cur;
    read_loop:LOOP
    
		FETCH cur INTO idVer,fechaV,idEst;
        
        IF done THEN LEAVE read_loop; END IF;-- Posible salida
        
        -- Valida que el pv no tenga una nueva version
        SELECT COUNT(*) INTO @validarNuevoV
		FROM Version v1 INNER JOIN Producto_Virtual  v2 ON v1.Id_P_Virtual = v2.Id_P_Virtual
		WHERE v1.Id_P_Virtual = (SELECT Id_P_Virtual FROM Version WHERE Id_Version = idVer) 
			AND Id_Estado = 6
			AND Num_Version > (SELECT Num_Version FROM Version WHERE Id_Version = idVer); 
        
		
        
        SELECT v1.Id_Funcionario INTO @idFunc
        FROM Funcionario v1 INNER JOIN Rol_Funcionario v2 ON v1.Id_Funcionario = v2.Id_Funcionario
			INNER JOIN Area_Centro v3 ON v1.Id_Area_Centro = v3.Id_Area_Centro
		WHERE Id_Centro = 
        (
			SELECT Id_Centro 
			FROM Funcionario v1 
				INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro
				INNER JOIN Autor v3 ON v1.Id_Funcionario = v3.Id_Funcionario
			WHERE v3.Id_Version = idVer AND Principal = 1
        ) AND Id_Rol = 4;
        
        SELECT idVer;-- 
        
        CALL ALL_AUTOR(idVer,@autores);
        
        SELECT @autores as au;
        
        IF(fechaV = @fechaA AND idEst = 6)THEN
			SELECT "time 1";-- 
            
			UPDATE Version
            SET Id_Estado = 7
            WHERE Id_Version = idVer;
            
            CALL RegistarNotificaion(CONCAT("La version fue inhabilitada por ser obsoleta~3~",@idFunc,"~",@autores,"~",idVer,""));	
            
            ELSE IF(fechaV = DATE_ADD(@fechaA, INTERVAL 7 DAY ) AND idEst = 6 AND @validarNuevoV = 0)THEN
            
				SELECT "time 2";-- 
                
				CALL RegistarNotificaion(CONCAT("La version debe ser actualizada antes de 7 dias~3~",@idFunc,"~",@autores,"~",idVer,""));
                
                ELSE IF( @fechaA = DATE_ADD(fechaV, INTERVAL 7 DAY) AND idEst = 7 AND @validarNuevoV = 0)THEN
					
                    SELECT "time 3";--
                    
					SELECT @idFunc,@autores,idVer;-- 
                    
					CALL RegistarNotificaion(CONCAT("La Version debe ser actualizada yaque fue inhabilitada hace 7 dias~3~",@idFunc,"~",@autores,"~",idVer,""));
                    
                END IF;
            END IF;
        END IF;
		
    END LOOP;
    CLOSE cur;
    
END;;
DELIMITER ;
-- DROP EVENT IF EXISTS Evento_Prueba;

-- select * from information_schema.EVENTS



-- SELECT * FROM 18_v_Notificaciones WHERE Id_Tipo_Notificacion = 3 AND Id_FuncionarioEnvio = 4;
-- SELECT * FROM Version WHERE Id_Estado  in (6,7);


-- SELECT * FROM Notificacion;
-- SELECT * FROM Detalles_Notificacion;

-- DELETE FROM Detalles_Notificacion  WHERE Id_Notificacion >= 59;
-- DELETE FROM Notificacion  WHERE Id_Notificacion >= 59;

-- CALL RegistarNotificaion(CONCAT("La Version debe ser actualizada yaque fue inhabilitada hace 7 dias~3~4~1,5~2"));



-- CALL RegistarNotificaion("Esta es una notificacion~3~2~3,1");

-- CALL SARA_CRUD("SELECT","Tipo_Notificacion","","");
-- CALL SARA_CRUD("SELECT","Detalles_Notificacion","","");