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
		 INNER JOIN Rol_Funcionario v4 ON v3.Id_Funcionario = v4.Id_Funcionario AND v4.Vigencia = 1
		 INNER JOIN Rol v5 ON v4.Id_Rol = v5.Id_Rol
		 WHERE Conte_Notificacion = """,@contenido,"""
			AND Id_Tipo_Notificacion = 3
			AND v4.Id_Rol = 4 
			AND Ides_Proceso = ",@Ides,"
			AND v2.Id_Estado IN (6,7)
			AND v1.Id_FuncionarioEnvio = ",@idFun,"
			AND v1.Id_Funcionario IN (",@ArrayFun,");"));
       
    SELECT @numRt,@contenido,@Ides,@idFun,@ArrayFun;
    
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
            
                SELECT  @idNoti,@valor,@num;
				CALL SARA_CRUD("INSERT","Detalles_Notificacion",CONCAT("Id_Notificacion~",@idNoti,"|Id_Funcionario~",@valor,""),"");
			SET @i = @i + 1;
		END WHILE;
		ELSE SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Ya se encuentra un registro con dichos datos";
    END IF;
END;;
	
DELIMITER ;
