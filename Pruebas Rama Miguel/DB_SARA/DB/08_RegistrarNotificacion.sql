USE SARA;

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
        
    END;;
DELIMITER ;


-- CALL RegistarNotificaion("Esta es una notificacion~3~2~3,1");

-- CALL SARA_CRUD("SELECT","Tipo_Notificacion","","");
-- CALL SARA_CRUD("SELECT","Detalles_Notificacion","","");