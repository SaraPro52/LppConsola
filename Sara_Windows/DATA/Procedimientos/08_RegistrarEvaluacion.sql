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
    
    BEGIN-- Validacion de estado y actualizacion del mismo
    	
        SET @idProd = 0;
        
        SELECT Id_P_Virtual INTO @idProd FROM Version WHERE Id_Version = @idVersion;
        
        IF(@resultado = 1)THEN
    		CASE @idEstado
    			WHEN 3 THEN UPDATE Version SET Id_Estado = 4 WHERE Id_Version = @idVersion;
                WHEN 4 THEN 
                BEGIN 
    				
                    SET @val = 0;
    				SELECT COUNT(*) INTO @val
    				FROM Version 
    				WHERE Id_P_Virtual = @idProd AND Id_Estado = 5;
    				
    				IF (@val > 0) THEN
                    
    					UPDATE Version SET Id_Estado = 11,Num_Version = ROUND(Num_Version) WHERE Id_Version = @idVersion;
                        
                        ELSE UPDATE Version SET Id_Estado = 5,Num_Version = ROUND(Num_Version) WHERE Id_Version = @idVersion;
    				
    				END IF;
                END;
                
            END CASE;
            
        END IF;
    END;
    
    
    -- ------------------------------------ VALIDACION SOLUCION FECHA-----------------------------------------------------------------------

 
		-- CALL SARA_CRUD("SELECT","08_V_Funcionario","Id_Rol INTO @rol",
		-- CONCAT("Id_Funcionario = ",@idFuncionario," AND Id_Rol IN (2,3)"));
        
        SELECT Id_Rol INTO @rol
        FROM Funcionario fu INNER JOIN Rol_Funcionario rf ON fu.Id_Funcionario = rf.Id_Funcionario AND rf.Vigencia = 1
        WHERE fu.Id_Funcionario = @idFuncionario AND Id_Rol IN (2,3);
    
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
	INNER JOIN Rol_Funcionario v2 ON v1.Id_Funcionario = v2.Id_Funcionario AND v2.Vigencia = 1
	INNER JOIN Rol v3 ON v2.Id_Rol = v3.Id_Rol
	WHERE v2.Id_Funcionario = @idFuncionario;
    
    SELECT "Entro0",@resultado,@estado1;
    IF(@resultado = 1 AND @estado1 = 4)THEN
		
        SELECT v1.Id_Funcionario INTO @idEval
		FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro 
		INNER JOIN Rol_Funcionario v3 ON v1.Id_Funcionario = v3.Id_Funcionario AND v3.Vigencia = 1
		WHERE Id_Centro = @idCentro AND Id_Rol = 3;
        
		CALL RegistarNotificaion(CONCAT("Nuevo Producto Virtual ha evaluar para EP~1~",@idFuncionario,"~",@idEval,"~",@idVersion,""));
        
        -- CALL RegistarNotificaion(CONCAT("El Producto Virtual ",@idVersion," ",@estado1,"a pasado a la siguiente face de evaluacion",@i+@a,"~3~",@idFuncionario,"~",@idFun2,""));
        
        ELSE IF(@resultado = 1 AND @estado1 = 5 OR @estado1 = 11) THEN
			
            SELECT v1.Id_Funcionario  INTO @idCoor
			FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro 
			INNER JOIN Rol_Funcionario v3 ON v1.Id_Funcionario = v3.Id_Funcionario AND v3.Vigencia = 1
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
DELIMITER ;;

