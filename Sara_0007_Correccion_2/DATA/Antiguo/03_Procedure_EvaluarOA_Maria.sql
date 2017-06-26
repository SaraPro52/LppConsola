USE SARA005;


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
        
	SELECT "1";
	SELECT  COUNT(*) INTO @contRepro
    FROM Evaluacion_General
    WHERE Id_Version = @idVersion AND Resultado = 0 AND Id_Funcionario = @idFuncionario; 
    
    SELECT Id_Estado INTO @idEstado
    FROM Version 
    WHERE Id_Version = @idVersion;
    
    
    IF(@contRepro < 3 AND @idEstado in (3,4))THEN
    SELECT "2";
		CALL SARA_CRUD("INSERT","Evaluacion_General",CONCAT("Observacion~",@observacionG,"|Resultado~",@resultado,"|Id_Version~",@idVersion,"|Id_Lista_Chequeo~",@idLista,"|Id_Funcionario~",@idFuncionario,""),"");
		CALL SARA_CRUD("SELECT","Evaluacion_General","Id_Evaluacion_General INTO @idEvaluacion","Id_Evaluacion_General > 0 ORDER BY Id_Evaluacion_General DESC LIMIT 1");
    
    -- ------------------------------------ VALIDACION SOLUCION FECHA-----------------------------------------------------------------------

 
		CALL SARA_CRUD("SELECT","08_V_Funcionario","Id_Rol INTO @rol",
		CONCAT("Id_Funcionario = ",@idFuncionario," AND Id_Rol IN (2,3)"));
    
	IF(@rol = 2 AND @resultado = 1)THEN
    
		IF(@fechaVigencia = "null")THEN 
			SET @fechaVigencia = CONCAT(DATE_ADD(CURDATE(), INTERVAL 1 MONTH)," 18:00:00");	
		END IF;	
    
		 CALL SARA_CRUD("UPDATE","Version",CONCAT("Fecha_Publicacion~",@fechaVigencia,""),CONCAT("Id_Version = ",@idVersion,""));
         
         ELSE IF (@rol = 3 AND @resultado = 1)THEN
    
			CALL SARA_CRUD("SELECT","Version","Fecha_Publicacion INTO @fechaVigencia",CONCAT("Id_Version = ",@idVersion,""));
            
            CALL SARA_CRUD("UPDATE","Version",CONCAT("Fecha_Vigencia~",@fechaVigencia,""),CONCAT("Id_Version = ",@idVersion,""));
            
            ELSE IF((@rol = 2 OR  @rol = 3) AND @resultado = 0) THEN
                
				IF(@fechaVigencia = "null")THEN 
					SET @fechaVigencia = CONCAT(DATE_ADD(CURDATE(), INTERVAL 3 DAY)," 18:00:00");	
				END IF;	
				CALL SARA_CRUD("UPDATE","Version",CONCAT("Fecha_Vigencia~",@fechaVigencia,""),CONCAT("Id_Version = ",@idVersion,""));
            
			END IF;
         END IF;
         
    END IF;
    
    -- -------------------------------------------------------------------------------
	
    SELECT "3";
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
				
                CASE @a
					WHEN 0 THEN SET @valorizacion = @val;
                    WHEN 1 THEN SET @observacionItem = @val;
                    WHEN 2 THEN SET @idDetallesLista = @val;
                END CASE;
            SET @a = @a + 1;        
        END WHILE;
        SELECT @valorizacion,@observacionItem,@idDetallesLista,@idEvaluacion;
        CALL SARA_CRUD("INSERT","Detalles_Evaluacion",CONCAT("Valorizacion~",@valorizacion,"|Observacion~",@observacionItem,"|Id_Detalles_Lista~",@idDetallesLista,"|Id_Evaluacion_General~",@idEvaluacion,""),"");

        SET @i = @i + 1;
    END WHILE;
    
    -- SI FUE ACEPTADO POR PARTE DEL E TECNICO
    CALL SARA_CRUD("SELECT","Version","Id_Estado INTO @estado1","Id_Version = @idVersion");
    CALL SARA_CRUD("SELECT","Version","Url_Version INTO @urlVer","Id_Version = @idVersion");
    
    SELECT Id_Centro INTO @idCentro
    FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro
    WHERE Id_Funcionario = @idFuncionario;
    
    SELECT  COUNT(*) INTO @contRepro
    FROM Evaluacion_General
    WHERE Id_Version = @idVersion AND Resultado = 0 AND Id_Funcionario = @idFuncionario;
    
    SELECT v3.Nom_Rol INTO @nomRol
    FROM Funcionario v1 
	INNER JOIN Rol_Funcionario v2 ON v1.Id_Funcionario = v2.Id_Funcionario
	INNER JOIN Rol v3 ON v2.Id_Rol = v3.Id_Rol
	WHERE v2.Id_Funcionario = @idFuncionario;
    
    SELECT "Entro0",@resultado,@estado1;
    IF(@resultado = 1 AND @estado1 = 4)THEN
		
        SELECT v1.Id_Funcionario INTO @idEval
		FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro 
		INNER JOIN Rol_Funcionario v3 ON v1.Id_Funcionario = v3.Id_Funcionario
		WHERE Id_Centro = @idCentro AND Id_Rol = 3;
        
		CALL RegistarNotificaion(CONCAT("Nuevo Producto Virtual ha evaluar para EP~1~",@idFuncionario,"~",@idEval,"~",@idVersion,""));
        
        -- CALL RegistarNotificaion(CONCAT("El Producto Virtual ",@idVersion," ",@estado1,"a pasado a la siguiente face de evaluacion",@i+@a,"~3~",@idFuncionario,"~",@idFun2,""));
        
        ELSE IF(@resultado = 1 AND @estado1 = 5 OR @estado1 = 11) THEN
			
            SELECT v1.Id_Funcionario  INTO @idCoor
			FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro 
			INNER JOIN Rol_Funcionario v3 ON v1.Id_Funcionario = v3.Id_Funcionario
			WHERE Id_Centro = @idCentro AND Id_Rol = 4;
            
			CALL RegistarNotificaion(CONCAT("Nuevo Producto Virtual ha aprobar CO~3~",@idFuncionario,"~",@idCoor,"~",@idVersion,""));	
            
            
            -- CODIGOOO LARGO PARA EL NUMERO VERSION ---------------------------------------------------------
            
            -- CAMBIAR NUMERO VERSION APROBADA
				
            -- CAMBIAR EL NUMERO DE VERSION DE LAS OTRAS VERSIONES QUE ESTAN EN EVALUACION
				
                SET @lineas = 0;
                SELECT Id_P_Virtual INTO @idPro1 FROM Version 
				WHERE Id_Version = @idVersion;
                
				SELECT COUNT(*) INTO @lineas
				FROM Version
				WHERE Id_P_Virtual = @idPro1 AND Id_Estado IN (3,4,9,10); 
                
                IF(@lineas > 0) THEN
					CALL UpdateNumeroVersion(@idPro1,@idVersion,@idCoor);
                END IF;
				
                
            -- ------------------------------------------------------------------------------------------

				ELSE IF(@resultado = 0 AND (@estado1 = 3 OR @estado1 = 4) AND @contRepro < 3)THEN
                
					CALL ALL_AUTOR(@idVersion,@autores);
					
                    CASE (@estado1)-- 13/04/2017
						WHEN 3 THEN SET @newEstado = 9;
                        WHEN 4 THEN SET @newEstado = 10;
                    END CASE;-- 
                    -- -------------- 12/04/2017
                    UPDATE Version SET Id_Estado = @newEstado -- corregir
					WHERE Id_Version  = @idVersion;
                    -- -----------------
                    
					CALL RegistarNotificaion(CONCAT("El Producto Virtual Fue reprovado por el ",@nomRol,"~2~",@idFuncionario,"~",@autores,"~",@idEvaluacion,""));	
                    
                    -- --------------------------------------TRES INTENTOS ERRADOS------------------------------------------------- CAMBIO
                    ELSE IF(@contRepro = 3) THEN
                    
						CALL ALL_AUTOR(@idVersion,@autores);
                        
						SELECT @autores as Autores_1; -- Verificacion del datos de autores por si lo pasa bien
                        
                        CALL RegistarNotificaion(CONCAT("El Producto Virtual Fue reprovado INS~2~",@idFuncionario,"~",@autores,"~",@idEvaluacion,""));	
                    
						CALL RegistarNotificaion(CONCAT("El Producto Virtual, Fue reprobado 3 veses por el ",@nomRol,", dejando esta version cancelada~3~",@idFuncionario,"~",@autores,"~",@idVersion,""));
                        
						UPDATE Version SET Id_Estado = 8 -- cancelado
                        WHERE Id_Version  = @idVersion;
                        
                    END IF;
					-- ------------------------------------------------------------------------------------- CAMBIO
				END IF;
		END IF;
    END IF;
    ELSE SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "La version se encuentra anulada";
    END IF;
        
END;;
DELIMITER ;

-- ----------------------Num version
/*
FALLOS AL CREAR LA NOTIFICACION DEL CAMBIO DE NUMERO VERSION 
LA ACTUALIZACION LA HACE BIEN PERO NO NOTIFICA AL FUNCIONARIO 
MAS DE UNA VEZ AUNQUE SE HALLAN ACTUALIZADO 3 SOLO SE LE INFORMA AL 
FUNCIONARIO DE 1 

POSIBLE: LA CONSULTA DE VALIDACION DEL PROCESIMIENTO DE REGISTRAR NOTIFICACION 
PUEDE SER LA CAUSANTE DEL FALLO YA QUE ESTA NO SE ESCUENTRA BIEN CONFIGURADA 
PARA DICHO PROPOSITO
*/

DROP PROCEDURE IF EXISTS UpdateNumeroVersion;
DELIMITER ;;
CREATE PROCEDURE UpdateNumeroVersion(IN idPro INTEGER, IN idVerAprobada INTEGER,IN idCoordinador INTEGER)
BEGIN
	DECLARE u,c,cont INTEGER;
    DECLARE numId INTEGER;
    DECLARE idis VARCHAR(100);
    DECLARE valor VARCHAR(100);
    DECLARE cant  INTEGER;
    DECLARE autoresVersion VARCHAR(200);
    DECLARE numVer1 FLOAT(2);
	DECLARE numOld1 FLOAT(2);
    
	SET SQL_SAFE_UPDATES = 0;
    DROP TEMPORARY TABLE IF EXISTS tmpVersion;
    
    CREATE TEMPORARY TABLE tmpVersion(
		IdVersion INTEGER ,
        NumVersion FLOAT,
        NumOld FLOAT);
	
	SET @o = 0;
    
	CALL MACC(CONCAT("
    INSERT INTO tmpVersion
     SELECT Id_Version, ROUND(Num_Version + 1.0) + (@o := @o +1)*0.1 ,Num_Version
     FROM Version
     WHERE Id_P_Virtual = ",idPro," AND Id_Estado IN (3,4,9,10)
     ORDER BY Fecha_Envio ASC;"));
     
     SELECT * FROM tmpVersion;
     
     UPDATE Version v1
     SET v1.Num_Version = (SELECT v2.NumVersion FROM tmpVersion v2 WHERE v2.IdVersion = v1.Id_Version)
     WHERE v1.Id_P_Virtual = idPro AND v1.Id_Estado IN (3,4,9,10);
        
	SET cont = 0;
    SELECT COUNT(*) INTO cont
    FROM tmpVersion;
    
    SET c = 0;
    SET idis = "0";
    WHILE(c < cont)DO
			CALL MACC(CONCAT("SELECT IdVersion INTO @idVer 
            FROM tmpVersion WHERE IdVersion NOT IN (",idis,") ORDER BY IdVersion ASC LIMIT 1"));
            
            IF(c = 0)THEN
				SET idis = @idver;
                ELSE SET idis = CONCAT(idis,",",@idver);
            END IF;
            SET c = c + 1;
    END WHILE;
    
    SELECT idis;
    
   
    
    SET u = 0;
		SET numId = M_LENGTH(idis,",");
		WHILE(u < numId)DO
			SET valor = SUBSTRING_INDEX(idis,",",1);
			SET cant = CHAR_LENGTH(idis) - CHAR_LENGTH(valor);
			SET idis = RIGHT(idis,cant -1);
            
            CALL ALL_AUTOR(valor,autoresVersion);
            
            SELECT NumVersion,NumOld INTO numVer1,numOld1 FROM tmpVersion WHERE IdVersion = valor;
            
            SELECT @numVer1,numOld1 ,idCoordinador,autoresVersion,valor,numId,u;
            
            CALL RegistarNotificaion(CONCAT("El Numero de la Version a sido Modificado de ",numOld1," a ",numVer1,"~3~",idCoordinador,"~",autoresVersion,"~",valor,""));	
            
			SET u = u + 1;
		END WHILE;
	 SELECT "---",numVer1,numOld1 ,idCoordinador,autoresVersion,valor,numId,u;
     DROP TEMPORARY TABLE IF EXISTS tmpVersion;
END;;
DELIMITER ;


-- -------------------------------------------------------------------

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
-- WHEN 0 THEN SET @observacionG 	= @valor;
-- WHEN 1 THEN SET @resultado 	  	= @valor;
-- WHEN 2 THEN SET @idVersion 	  	= @valor;
-- WHEN 3 THEN SET @idLista 	  	= @valor;
-- WHEN 4 THEN SET @idFuncionario 	= @valor;
-- WHEN 5 THEN SET @fechaVigencia  = @valor;
-- WHEN 6 THEN SET @ArrayEvaItems 	= @valor;

 /*CALL RegistrarEvaluacion("Evaluacion Prueba v5~0~1~2~3~2017-03-26~    1¤si cumple con el item¤1|1¤si cumple con el item¤2");
 
 SELECT * FROM Evaluacion_General WHERE Id_Version = 1;-- LA VALIDACION DE LOS TRES INTENTOS SE DA EN ESTA CONSULTA
 SELECT * FROM Detalles_Evaluacion;

 SELECT * FROM 07_v_Version WHERE Id_Estado = 8 AND Id_Version = 1;
 
 SELECT * FROM 09_v_autor WHERE Id_Estado = 3;
  
 SELECT * FROM Tipo_Notificacion;
 SELECT * FROM  18_v_notificaciones WHERE Id_Funcionario IN (1,5)*/
 
 
 -- SELECT * FROM 25_v_evaluarproductosv
 
 --  UPDATE Version 
  -- SET Fecha_Vigencia = (SELECT Fecha_Publicacion FROM Version WHERE Id_Version = @idVersion)
  --           WHERE Id_Version = @idVersion;
            
-- SELECT Fecha_Publicacion INTO @fe FROM Version WHERE Id_Version = @idVersion;
 -- SELECT @fe;
 

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
    SET @idProd = 0;
    
    SELECT Id_Estado,Id_P_Virtual INTO @estado,@idProd FROM Version WHERE Id_Version = NEW.Id_Version;
    
    IF(NEW.Resultado = 1)THEN
		CASE @estado
			WHEN 3 THEN UPDATE Version SET Id_Estado = 4 WHERE Id_Version = NEW.Id_Version;
            WHEN 4 THEN 
            BEGIN 
				
                SET @val = 0;
				SELECT COUNT(*) INTO @val
				FROM Version 
				WHERE Id_P_Virtual = @idProd AND Id_Estado = 5;
				
				IF (@val > 0) THEN
                
					UPDATE Version SET Id_Estado = 11,Num_Version = ROUND(Num_Version) WHERE Id_Version = NEW.Id_Version;
                    
                    ELSE UPDATE Version SET Id_Estado = 5,Num_Version = ROUND(Num_Version) WHERE Id_Version = NEW.Id_Version;
				
				END IF;
            END;
            
        END CASE;
        
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
