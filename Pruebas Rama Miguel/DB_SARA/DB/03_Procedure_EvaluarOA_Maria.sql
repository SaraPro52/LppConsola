USE SARA;


DROP PROCEDURE IF EXISTS RegistrarEvaluacion;
DELIMITER ;;	
CREATE PROCEDURE RegistrarEvaluacion(IN ArrayEvaluacion VARCHAR(500))
BEGIN

    CALL EXECUTE_ARRAY(
		ArrayEvaluacion,"~",
        "CASE @i 
			WHEN 0 THEN SET @observacionG 	= @valor;
			WHEN 1 THEN SET @resultado 	  	= @valor;
			WHEN 2 THEN SET @idVersion 	  	= @valor;
			WHEN 3 THEN SET @idLista 	  	= @valor;
			WHEN 4 THEN SET @idFuncionario 	= @valor;
            WHEN 5 THEN SET @fechaVigencia  = @valor;
			WHEN 6 THEN SET @ArrayEvaItems 	= @valor;
		END CASE;");
	
    IF(@fechaVigencia = "null")THEN 
		SET @fechaVigencia = CONCAT(DATE_ADD(CURDATE(), INTERVAL 30 DAY)," 18:00:00");	
    END IF;
	
	CALL SARA_CRUD("INSERT","Evaluacion_General",CONCAT("Observacion~",@observacionG,"|Resultado~",@resultado,"|Id_Version~",@idVersion,"|Id_Lista_Chequeo~",@idLista,"|Id_Funcionario~",@idFuncionario,""),"");
    CALL SARA_CRUD("SELECT","Evaluacion_General","Id_Evaluacion_General INTO @idEvaluacion","Id_Evaluacion_General > 0 ORDER BY Id_Evaluacion_General DESC LIMIT 1");
    
    CALL SARA_CRUD("UPDATE","Version",CONCAT("Fecha_Vigencia~",@fechaVigencia,""),CONCAT("Id_Version = ",@idVersion,""));
    SET @i = 0;
	SET @num = M_LENGTH(@ArrayEvaItems,"|");
	WHILE(@i < @num)DO
		SET @arrayE = SUBSTRING_INDEX(@ArrayEvaItems,"|",1);
        SET @cant = CHAR_LENGTH(@ArrayEvaItems) - CHAR_LENGTH(@arrayE);
        SET @ArrayEvaItems = RIGHT(@ArrayEvaItems,@cant -1);  
        SET @a = 0;
        
        WHILE(@a < 3 )DO
			SET @val = SUBSTRING_INDEX(@arrayE,"¤",1);
			SET @cant = CHAR_LENGTH(@arrayE) - CHAR_LENGTH(@val);
			SET @arrayE = RIGHT(@arrayE,@cant -1);
				SELECT @val;

                CASE @a
					WHEN 0 THEN SET @valorizacion = @val;
                    WHEN 1 THEN SET @observacionItem = @val;
                    WHEN 2 THEN SET @idDetallesLista = @val;
                END CASE;
            SET @a = @a + 1;        
        END WHILE;
        
        CALL SARA_CRUD("INSERT","Detalles_Evaluacion",CONCAT("Valorizacion~",@valorizacion,"|Observacion~",@observacionItem,"|Id_Detalles_Lista~",@idDetallesLista,"|Id_Evaluacion_General~",@idEvaluacion,""),"");

        SET @i = @i + 1;
    END WHILE;
    
    -- SI FUE ACEPTADO POR PARTE DEL E TECNICO
    CALL SARA_CRUD("SELECT","Version","Id_Estado INTO @estado1","Id_Version = @idVersion");
    CALL SARA_CRUD("SELECT","Version","Url_Version INTO @urlVer","Id_Version = @idVersion");
    
    SELECT Id_Centro INTO @idCentro
    FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro
    WHERE Id_Funcionario = @idFuncionario;
    
    IF(@resultado = 1 AND @estado1 = 4)THEN
		
        SELECT v1.Id_Funcionario INTO @idEval
		FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro 
		INNER JOIN Rol_Funcionario v3 ON v1.Id_Funcionario = v3.Id_Funcionario
		WHERE Id_Centro = @idCentro AND Id_Rol = 3;
        
        SELECT @idEval;
		CALL RegistarNotificaion(CONCAT("Nuevo Producto Virtual ha evaluar para EP~1~",@idFuncionario,"~",@idEval,"~",@idVersion,""));
        
        -- CALL RegistarNotificaion(CONCAT("El Producto Virtual ",@idVersion," ",@estado1,"a pasado a la siguiente face de evaluacion",@i+@a,"~3~",@idFuncionario,"~",@idFun2,""));
        
        ELSE IF(@resultado = 1 AND @estado1 = 5) THEN
        
            SELECT v1.Id_Funcionario INTO @idCoor
			FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro 
			INNER JOIN Rol_Funcionario v3 ON v1.Id_Funcionario = v3.Id_Funcionario
			WHERE Id_Centro = @idCentro AND Id_Rol = 4;
            
			CALL RegistarNotificaion(CONCAT("Nuevo Producto Virtual ha aprobar CO~3~",@idFuncionario,"~",@idCoor,"~",@idVersion,""));	

				ELSE IF(@resultado = 0 AND @estado1 = 3 OR @estado1 = 4)THEN
					CALL ALL_AUTOR(@idVersion,@autores);
					CALL RegistarNotificaion(CONCAT("El Producto Virtual Fue reprovado INS~2~",@idFuncionario,"~",@autores,"~",@idEvaluacion,""));						
				END IF;
		END IF;
    END IF;
    
END;;
DELIMITER ;

DROP PROCEDURE IF EXISTS ALL_AUTOR;
DELIMITER ;;
CREATE PROCEDURE ALL_AUTOR(IN idVersion INTEGER, OUT salida VARCHAR(50))
BEGIN
	SELECT COUNT(*) INTO @cont
    FROM Version v1 INNER JOIN Autor v2 ON v1.Id_Version = v2.Id_Version
    WHERE v1.Id_Version = idVersion;
    
    SET @idVersion = idVersion;
    SET @c = 0;
    SET @idis = "0";
    WHILE(@c < @cont)DO
			CALL MACC(CONCAT("SELECT v2.Id_Funcionario INTO @idFun
			FROM Version v1 INNER JOIN Autor v2 ON v1.Id_Version = v2.Id_Version INNER JOIN Funcionario v3 ON v2.Id_Funcionario = v3.Id_Funcionario
			WHERE v2.Id_Version = ",@idVersion," AND v2.Id_Funcionario NOT IN (",@idis,")
			ORDER BY v2.Id_Funcionario ASC LIMIT 1"));
            
            IF(@c = 0)THEN
				SET @idis = @idFun;
                ELSE SET @idis = CONCAT(@idis,",",@idFun);
            END IF;
            SET @c = @c + 1;
    END WHILE;
	SET salida = @idis;
END;;

DELIMITER ;

-- CALL ALL_AUTOR(4,@sali);

-- SELECT @sali;

-- CALL RegistrarEvaluacion("Observacion1111 de hhhpruebakk17719~1~4~3~2~2017-08-01~    1¤si cumple con el item¤1|1¤si cumple con el item¤2");

-- CALL SARA_CRUD("SELECT","Tipo_Notificacion","","");

-- CALL SARA_CRUD("SELECT","Evaluacion_General","","");

-- CALL SARA_CRUD("DELETE","Detalles_Evaluacion","","Id_Detalles_Evaluacion >= 5");
-- CALL SARA_CRUD("DELETE","Evaluacion_General","","Id_Evaluacion_General >= 2 ");

-- CALL SARA_CRUD("SELECT","Categoria","","");

-- CALL SARA_CRUD("DELETE","Evaluacion_General","","Id_Evaluacion_General > 1");
-- CALL SARA_CRUD("SELECT","Evaluacion_General","","");

-- CALL SARA_CRUD("DELETE","Detalles_Evaluacion","","Id_Detalles_Evaluacion > 1");
-- CALL SARA_CRUD("SELECT","Detalles_Evaluacion","","");

-- probar luego la validacion de la actualizacion de los estados 

DROP TRIGGER IF EXISTS EvaluacionGeneral_AI_Trigger;
DELIMITER ;;
CREATE TRIGGER EvaluacionGeneral_AI_Trigger AFTER INSERT ON Evaluacion_General FOR EACH ROW
BEGIN
	SET @estado = 0;
    
    SELECT Id_Estado INTO @estado FROM Version WHERE Id_Version = NEW.Id_Version;
    
    IF(NEW.Resultado = 1)THEN
		CASE @estado
			WHEN 3 THEN SET @etd = 4;
            WHEN 4 THEN SET @etd = 5;
        END CASE;
        UPDATE Version SET Id_Estado = @etd WHERE Id_Version = NEW.Id_Version;
    END IF;
END;;
DELIMITER ;

DROP TRIGGER IF EXISTS EvaluacionGeneral_BI_Trigger;
DELIMITER ;;
CREATE TRIGGER EvaluacionGeneral_BI_Trigger BEFORE INSERT ON Evaluacion_General FOR EACH ROW
BEGIN 
	SET @estado = 0;
    SELECT Id_Estado INTO @estado FROM Version WHERE Id_Version = NEW.Id_Version;
    IF(@estado = 3 OR @estado = 4)THEN
		SET @estado = 0;
        ELSE SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "La version no se encuentra en el estado requerido para derrollar la evaluacion";
    END IF;
END;;

DELIMITER ;
