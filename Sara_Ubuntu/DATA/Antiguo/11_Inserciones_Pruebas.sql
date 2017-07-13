USE SARA005;

DROP PROCEDURE IF EXISTS Registrar_PV;
DELIMITER ;;
CREATE PROCEDURE Registrar_PV(IN ArrayTodo VARCHAR(2000),OUT nomUrl VARCHAR(50))
BEGIN
	CALL EXECUTE_ARRAY(
		ArrayTodo,
		"~",
		"CASE @i
			WHEN 0 THEN SET @Nom_P_Virtual = @valor;
			WHEN 1 THEN SET @Des_P_Virtual = @valor;
			WHEN 2 THEN SET @Palabras_Clave = @valor;
			WHEN 3 THEN SET @Id_Formato = @valor;
			WHEN 4 THEN SET @Url_Version = @valor;
			WHEN 5 THEN SET @Url_Img = @valor;
			WHEN 6 THEN SET @Inst_Instalacion= @valor;
			WHEN 7 THEN SET @Reqst_Instalacion = @valor;
			WHEN 8 THEN SET @ArrayFuncionario = @valor;
			WHEN 9 THEN SET @ArrayTema = @valor;
		END CASE;"
	);	

    CALL SARA_CRUD("SELECT","Producto_Virtual","COUNT(*) INTO @co","Nom_P_Virtual = @Nom_P_Virtual OR Des_P_Virtual = @Des_P_Virtual");
    
    IF (@co = 0) THEN 
		CALL SARA_CRUD("INSERT","Producto_Virtual",CONCAT("Nom_P_Virtual~",@Nom_P_Virtual,"|Des_P_Virtual~",@Des_P_Virtual,"|Palabras_Clave~",@Palabras_Clave,"|Id_Formato~",@Id_Formato,""),"");
		CALL SARA_CRUD("SELECT","Producto_Virtual","Id_P_Virtual INTO @idPro","Nom_P_Virtual = @Nom_P_Virtual");
        
        SELECT @idPro,@Nom_P_Virtual; 
        
		SET @i = 0;
		SET @num = M_LENGTH(@ArrayTema,",");
        
        SELECT @num;
        
        
		WHILE(@i < @num)DO
         SET @i = @i + 1;
         
        SELECT "Entro1";
        
			SET @arrayT = SUBSTRING_INDEX(@ArrayTema,",",1);
			SET @cant = CHAR_LENGTH(@ArrayTema) - CHAR_LENGTH(@arrayT);
			SET @ArrayTema = RIGHT(@ArrayTema,@cant -1);
			SET @a = 0;
			WHILE(@a < 2)DO
            
            SELECT "Entro2";
				SET @val = SUBSTRING_INDEX(@arrayT,"-",1);
				SET @cant = CHAR_LENGTH(@arrayT) - CHAR_LENGTH(@val);
				SET @arrayT = RIGHT(@arrayT,@cant -1);
				CASE @a
					WHEN 0 THEN SET @idTema = @val; 
					WHEN 1 THEN SET @tipo 	= @val;
				END CASE;
				SET @a = @a + 1;        
			END WHILE;
            
            SELECT @idTema,@tipo,@idPro;
            
			CALL SARA_CRUD("INSERT","Detalles_Tema",CONCAT("Id_Tema~",@idTema,"|Id_P_Virtual~",@idPro,"|Tipo_Tema~",@tipo,""),"");
			SET @i = @i + 1;
		END WHILE;
		CALL RegistrarVersion(CONCAT("",@idPro,"~",@Url_Version,"~",@Url_Img,"~",@Inst_Instalacion,"~",@Reqst_Instalacion,"~",@ArrayFuncionario,""),nomUrl);
        
        ELSE SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "El nombre del producto o los detalles del mismo ya existen ";
	END IF;
	
END;;
DELIMITER ;

CALL ConsultarNotificaciones("1~1~1");

SET @valore = "1";
SET @NomPVirtual 			= CONCAT("Producto Numero Version_",@valore);
SET @DesPVirtual 			= CONCAT("Producto Numero Version_",@valore);
SET @PalabrasClave 			= CONCAT("Producto Numero Version_",@valore);
SET @IdFormato 				= "16";
SET @UrlVersion 			= CONCAT("Producto_",@valore);
SET @UrlImg 				= CONCAT("Producto1_",@valore);
SET @InstInstalacion		= CONCAT("Producto Numero Version_",@valore);
SET @ReqstInstalacion 		= CONCAT("Producto Numero Version_",@valore);
SET @ArrayFuncionario 		= "1";
SET @ArrayTema 				= "1-1,2-0";

CALL Registrar_PV(CONCAT(
@NomPVirtual,"~",@DesPVirtual,"~",@PalabrasClave,"~",@IdFormato,"~",@UrlVersion,"~",@UrlImg,"~",@InstInstalacion,"~",@ReqstInstalacion,"~",@ArrayFuncionario,"~",@ArrayTema),@sal);
SELECT @sal;


-- -------------------------------------------------------------------------------------------------------------------------------------
-- EVALUAR PV

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


-- --------------------------------------------- EVALUACION EQUIPO TECNICO
CALL ConsultarNotificaciones("2~2~3");


SET @observacionG_1 	= "Observacion_7";
SET @resultado_1 	  	= "1";
SET @idVersion_1 	  	= "2";
SET @idLista_1 	  		= "1";
SET @idFuncionario_1 	= "2";
SET @fechaVigencia_1  	= "null";
SET @ArrayEvaItems_1 	= "1¤si cumple con el item¤3|1¤si cumple con el item¤4";

CALL RegistrarEvaluacion(CONCAT(@observacionG_1,"~",@resultado_1,"~",@idVersion_1,"~",@idLista_1 ,"~",@idFuncionario_1,"~",@fechaVigencia_1,"~",@ArrayEvaItems_1));

-- ------------------------------------------


DROP PROCEDURE IF EXISTS UpdateNumeroVersion;
DELIMITER ;;
CREATE PROCEDURE UpdateNumeroVersion(IN idPro INTEGER, IN idVerAprobada INTEGER,IN idCoordinador INTEGER)
BEGIN
	SET @idPro = idPro;
    
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
     WHERE Id_P_Virtual = ",@idPro," AND Id_Estado IN (3,4,9,10)
     ORDER BY Fecha_Envio ASC;"));
     
     SELECT * FROM tmpVersion;
     
     UPDATE Version v1
     SET v1.Num_Version = (SELECT v2.NumVersion FROM tmpVersion v2 WHERE v2.IdVersion = v1.Id_Version)
     WHERE v1.Id_P_Virtual = @idPro AND v1.Id_Estado IN (3,4,9,10);
        
	 
    SELECT COUNT(*) INTO @cont
    FROM tmpVersion;
    
    SET @c = 0;
    SET @idis = "0";
    WHILE(@c < @cont)DO
			CALL MACC(CONCAT("SELECT IdVersion INTO @idVer 
            FROM tmpVersion WHERE IdVersion NOT IN (",@idis,") ORDER BY IdVersion ASC LIMIT 1"));
            
            IF(@c = 0)THEN
				SET @idis = @idver;
                ELSE SET @idis = CONCAT(@idis,",",@idver);
            END IF;
            SET @c = @c + 1;
    END WHILE;
    
    
    SET @i = 0;
		SET @num = M_LENGTH(@idis,",");
		WHILE(@i < @num)DO
			SET @valor = SUBSTRING_INDEX(@idis,",",1);
			SET @cant = CHAR_LENGTH(@idis) - CHAR_LENGTH(@valor);
			SET @idis = RIGHT(@idis,@cant -1);
            
            CALL ALL_AUTOR(@valor,@autoresVersion);
            
            SELECT NumVersion,NumOld INTO @numVer1,@numOld1 FROM tmpVersion WHERE IdVersion = @valor;
            
            /*UPDATE Version v1
			SET v1.Num_Version = (SELECT v2.NumVersion FROM tmpVersion v2 WHERE v2.IdVersion = @valor)
			WHERE v1.Id_P_Virtual = @idPro AND v1.Id_Version = @valor;*/
            
            CALL RegistarNotificaion(CONCAT("El Numero de la Version a sido Modificado de ",@numOld1," a ",@numVer1,"~3~",idCoordinador,"~",@autoresVersion,"~",@valor,""));	
            
			SET @i = @i + 1;
		END WHILE;

     DROP TEMPORARY TABLE IF EXISTS tmpVersion;
END;;
DELIMITER ;

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
-- --------------------------------------------- EVALUACION EQUIPO PEDAGOGICO


CALL ConsultarNotificaciones("3~3~3");

SET @observacionG_1 	= "Observacion_7";
SET @resultado_1 	  	= "1";
SET @idVersion_1 	  	= "2";
SET @idLista_1 	  		= "2";
SET @idFuncionario_1 	= "3";
SET @fechaVigencia_1  	= "null";
SET @ArrayEvaItems_1 	= "1¤si cumple con el item¤1|1¤si cumple con el item¤2|1¤si cumple con el item¤5";


CALL RegistrarEvaluacion(CONCAT(@observacionG_1,"~",@resultado_1,"~",@idVersion_1,"~",@idLista_1 ,"~",@idFuncionario_1,"~",@fechaVigencia_1,"~",@ArrayEvaItems_1));

-- ------------------------------------------

-- ------------------------------------------------------------------------------------------------
-- -----------APROBAR
DROP PROCEDURE IF EXISTS AprobarPV;
DELIMITER ;;
CREATE PROCEDURE AprobarPV(IN ArrayAprobacion VARCHAR(100),OUT nomUrl VARCHAR(50))
BEGIN
	DECLARE idProd INTEGER;
    
	CALL EXECUTE_ARRAY(
		ArrayAprobacion,
        "~",
        "CASE @i 
			WHEN 0 THEN SET @idCoordinador = @valor;
			WHEN 1 THEN SET @idVersion = @valor;
		END CASE"
    );
    
    CALL SARA_CRUD("UPDATE","Version",CONCAT("Id_Estado~6|Fecha_Publicacion~",CURRENT_TIMESTAMP,""),CONCAT("Id_Version = ",@idVersion,""));
    
    -- ------------------- Num version
    
    SET @idVerProxi = 0;
    
    SELECT Id_P_Virtual INTO idProd 
    FROM Version WHERE Id_Version = @idVersion;
    
	SELECT Id_Version INTO @idVerProxi
    FROM Version 
    WHERE Id_Estado = 11 AND Id_P_Virtual = idProd
    ORDER BY Num_Version ASC LIMIT 1;
    
    IF(@idVerProxi != 0) THEN
		UPDATE Version 
		SET Id_Estado = 5
		WHERE Id_Version = @idVerProxi;
    END IF;
    
    -- -------------------
    
    UPDATE Version SET Url_Version = NameUrl(@idVersion) WHERE Id_Version = @idVersion;-- NUEVO NOMBRE 16/04/2017
    SET nomUrl = NameUrl(@idVersion);-- RETORNA EL NOMBRE DEL ARCHIVO
    CALL ALL_AUTOR(@idVersion,@autores);
    CALL RegistarNotificaion(CONCAT("El Producto Virtual Fue publicado INS~3~",@idCoordinador,"~",@autores,"~",@idVersion,""));	
    
    -- CALL SARA_CRUD("SELECT","Version","Id_P_Virtual~@idPro","Id_Version = @idVersion");
    -- CALL SARA_CRUD("SELECT","Version","Num_Version~@numVer","Id_Version = @idVersion");
    -- CALL SARA_CRUD("UPDATE","Version",CONCAT("Num_Version~",@numVer + 1,""),
			-- "Id_P_Virtual = @idPro AND Id_Estado != 6 AND Num_Version = @numVer");
END;;
DELIMITER ;

CALL ConsultarNotificaciones("4~4~4");

SET @idCoordinador_1 	= "4";
SET @idVersion_1 		= "3";
CALL AprobarPV(CONCAT(@idCoordinador_1,"~",@idVersion_1),@sal_3);
SELECT @sal_3;



-- -------------------------------------------------------------------------------------------------------------------------------------------
-- --------------ACTUALIZAR PV

DROP PROCEDURE IF EXISTS RegistarActualizacion;
DELIMITER ;;
CREATE PROCEDURE RegistarActualizacion(IN ArrayActualizacion VARCHAR(2000),OUT nomUrl VARCHAR(50))
BEGIN
  CALL EXECUTE_ARRAY(
		ArrayActualizacion,
        "~",
        "CASE @i
			WHEN 0 THEN SET @idPro = @valor;
			WHEN 1 THEN SET @Url_Version = @valor;
			WHEN 2 THEN SET @Url_Img = @valor;
			WHEN 3 THEN SET @Inst_Instalacion = @valor;
			WHEN 4 THEN SET @Reqst_Instalacion = @valor;
			WHEN 5 THEN SET @ArrayFuncionario = @valor;
			WHEN 6 THEN SET @ArrayTemas = @valor;
        END CASE;"
    );
    SELECT "1";
    
    IF(@ArrayTemas != "null")THEN-- 20/04/2017
		SET @i = 0;
		SET @num = M_LENGTH(@ArrayTemas,",");
		WHILE(@i < @num)DO
			 SET @i = @i + 1;
				SET @arrayT = SUBSTRING_INDEX(@ArrayTemas,",",1);
				SET @cant = CHAR_LENGTH(@ArrayTemas) - CHAR_LENGTH(@arrayT);
				SET @ArrayTemas = RIGHT(@ArrayTemas,@cant -1);
				SET @a = 0;
				WHILE(@a < 2)DO
					SET @val = SUBSTRING_INDEX(@arrayT,"-",1);
					SET @cant = CHAR_LENGTH(@arrayT) - CHAR_LENGTH(@val);
					SET @arrayT = RIGHT(@arrayT,@cant -1);
					CASE @a
						WHEN 0 THEN SET @idTema = @val; 
						WHEN 1 THEN SET @tipo 	= @val;
					END CASE;
					SET @a = @a + 1;        
				END WHILE;
				CALL SARA_CRUD("INSERT","Detalles_Tema",CONCAT("Id_Tema~",@idTema,"|Id_P_Virtual~",@idPro,"|Tipo_Tema~",@tipo,""),"");
				SET @i = @i + 1;
			END WHILE;
    END IF;
    
    
    CALL RegistrarVersion(CONCAT("",@idPro,"~",@Url_Version,"~",@Url_Img,"~",@Inst_Instalacion,"~",@Reqst_Instalacion,"~",@ArrayFuncionario,""),nomUrl);
    
END;;
DELIMITER ;

DROP PROCEDURE IF EXISTS RegistrarVersion;
DELIMITER ;;
CREATE PROCEDURE RegistrarVersion(IN ArrayVersion VARCHAR(2000),OUT nomUrl VARCHAR(50))
BEGIN

DECLARE numVer FLOAT DEFAULT 1;

SET @idVer = NULL;


	CALL EXECUTE_ARRAY(
		ArrayVersion,
        "~",
        "CASE @i
			WHEN 0 THEN SET @idPro = @valor;
			WHEN 1 THEN SET @Url_Version = @valor;
			WHEN 2 THEN SET @Url_Img = @valor;
			WHEN 3 THEN SET @Inst_Instalacion = @valor;
			WHEN 4 THEN SET @Reqst_Instalacion = @valor;
			WHEN 5 THEN SET @ArrayFuncionario = @valor;
        END CASE;"
    );
    
    SELECT COUNT(*) INTO @lineas
    FROM Version
    WHERE Id_P_Virtual = @idPro AND Id_Estado IN (6,7);-- 7
    
    
    IF(@lineas > 0 )THEN-- ACTUALIZACION
    
		-- -------- Num Version
        SELECT "ENTRA";
        SELECT COUNT(*) INTO @lineasSub
        FROM Version
        WHERE Id_P_Virtual = @idPro AND Id_Estado IN (3,4,9,10);
        
        
		SET @numVer = (SELECT MAX(Num_Version) 
		FROM Version 
		WHERE Id_P_Virtual = @idPro AND Id_Estado IN (5,6,7,11));-- 7
		
        IF (@lineasSub >= 0 AND @lineasSub < 5) THEN 
			CALL MACC(CONCAT("SET @numVer = @numVer + 1.",(@lineasSub + 1),""));
            
			ELSE SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Imposible actualizar esta version";
            
        END IF;
        SET numVer = @numVer;
	
        -- ------------------
        
	END IF;
    
		CALL SARA_CRUD("INSERT","Version",CONCAT("Num_Version~",numVer,"|Url_Version~",@Url_Version,"|Url_Img~",@Url_Img,"|Inst_Instalacion~",@Inst_Instalacion,"|Reqst_Instalacion~",@Reqst_Instalacion ,"|Id_P_Virtual~",@idPro,""),"");
		-- CALL SARA_CRUD("SELECT","Version","Id_Version INTO @idVer","Inst_Instalacion = @Inst_Instalacion AND Reqst_Instalacion = @Reqst_Instalacion");
		
        
        SELECT @Inst_Instalacion,@Reqst_Instalacion,@idPro,numVer;
        
        
		SELECT Id_Version INTO @idVer
		FROM Version v1 INNER JOIN Producto_Virtual v2 ON v1.Id_P_Virtual = v2.Id_P_Virtual
		WHERE Inst_Instalacion = @Inst_Instalacion 
			AND Reqst_Instalacion = @Reqst_Instalacion 
			AND v1.Id_P_Virtual = @idPro 
			AND v1.Id_Estado = 3
			AND v1.Num_Version = numVer
		ORDER BY Fecha_Envio DESC LIMIT 1;
        
			
	   SET @a = 0;
	   Bucle : WHILE (TRUE) DO
			SET @valor = SUBSTRING_INDEX(@ArrayFuncionario,",",1);
			SET @cantidad = CHAR_LENGTH(@ArrayFuncionario) - CHAR_LENGTH(@valor);
			SET @ArrayFuncionario = RIGHT(@ArrayFuncionario,@cantidad -1);
				
				IF(@a = 0)THEN
					SET @prin = 1;
					SET @funPrin = @valor;
					ELSE SET @prin = 0;
				END IF;
                SELECT @idVer,@valor;
				CALL SARA_CRUD("INSERT","Autor",CONCAT("Id_Version~",@idVer,"|Id_Funcionario~",@valor,"|Principal~",@prin,""),"");
			SET @a = @a +1;
			IF(CHAR_LENGTH(@ArrayFuncionario) = 0) THEN
				LEAVE Bucle;
			END IF;
			
		END WHILE Bucle;
		
		SELECT Id_Centro INTO @idCentro
		FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro
		WHERE Id_Funcionario = @funPrin; -- SE PUEDE HACER DESDE SARA_CRUD
		
		SELECT v1.Id_Funcionario,v4.Nom_Rol INTO @idEval,@nomRol-- Anadir nomRol para la notificacion 14/04/2017
		FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro 
			 INNER JOIN Rol_Funcionario v3 ON v1.Id_Funcionario = v3.Id_Funcionario
			 INNER JOIN Rol v4 ON v3.Id_Rol = v4.Id_Rol
		WHERE Id_Centro = @idCentro AND v3.Id_Rol = 2; -- SE PUEDE HACER DESDE SARA_CRUD
		
		CALL RegistarNotificaion(CONCAT("Nuevo Producto Virtual ha evaluar para el ",@nomRol,"~1~",@funPrin,"~",@idEval,"~",@idVer,""));-- Anadir nomRol para la notificacion 14/04/2017
		
		UPDATE Version SET Url_Version = NameUrl(@idVer) WHERE Id_Version = @idVer;-- NUEVO NOMBRE 16/04/2017
		
		SET nomUrl = NameUrl(@idVer);-- RETORNA EL NOMBRE DEL ARCHIVO
        
END;;
DELIMITER ;

CALL ConsultarNotificaciones("1~1~5");

SET @valore_2 				= "1.1";
SET @idPro_2 				= "1";
SET @UrlVersion_2 			= CONCAT("Producto_",@valore_2);
SET @UrlImg_2 				= CONCAT("Producto1_",@valore_2);
SET @InstInstalacion_2		= CONCAT("Producto Numero Version_",@valore_2);
SET @ReqstInstalacion_2 	= CONCAT("Producto Numero Version_",@valore_2);
SET @ArrayFuncionario_2 	= "1";
SET @ArrayTema_2 			= "null";


CALL RegistarActualizacion(CONCAT(@idPro_2,"~",@UrlVersion_2,"~",@UrlImg_2,"~",@InstInstalacion_2,"~",@ReqstInstalacion_2,"~",@ArrayFuncionario_2,"~",@ArrayTema_2),@sal_2);

SELECT @sal_2;


-- -----------------------------------------------------------------------------
-- NOTIFICACIONES FUNCIONARIO INSTRUCTOR







































-- Proceso de validacion
USE SARA;
-- FUNCIONARIOS
CALL RegistrarFuncionario("1~1~1019133595~Funcionario-1~Inst1~Funcionario1@outlook.es~INS~123451~e10adc3949ba59abbe56e057f20f883e~1~1");
CALL RegistrarFuncionario("2~1~2019133595~Funcionario-2~EvalT1~Funcionario2@outlook.es~EP~123452~e10adc3949ba59abbe56e057f20f883e~1~1");
CALL RegistrarFuncionario("3~1~3019133595~Funcionario-3~EvalP1~Funcionario3@outlook.es~ET~123453~e10adc3949ba59abbe56e057f20f883e~1~1");
CALL RegistrarFuncionario("4~1~4019133595~Funcionario-4~Coor1~Funcionario4@outlook.es~CO~123454~e10adc3949ba59abbe56e057f20f883e~1~1");

CALL RegistrarFuncionario("1~1~5019133595~Funcionario-5~Inst2~Funcionario5@outlook.es~INS~123455~e10adc3949ba59abbe56e057f20f883e~1~1");


CALL SARA_CRUD("UPDATE","Funcionario","Id_Estado~1","Id_Funcionario > 0");
CALL SARA_CRUD("SELECT","Funcionario","","");
CALL SARA_CRUD("SELECT","Rol_Funcionario","","");

-- PRODUCTOS VIRTUALES

CALL Registrar_PV("Producto Virtual 1~ Des Producto Virtual 1~PV1,PV2,PV3~1~UrlVER/1~UrlIMG/1~Intruncion 1~Requisito 1~1,5~1-0,2-0");

use sara;
SELECT v1.Id_Funcionario, Nom_Funcionario, Nom_Rol, Fecha_Envio, Conte_Notificacion, Ides_Proceso,v3.Id_Funcionario
FROM Funcionario v1 INNER JOIN Detalles_Notificacion v2 ON v1.Id_Funcionario = v2.Id_Funcionario
	 INNER JOIN Notificacion v3 ON v2.Id_Notificacion = v3.Id_Notificacion INNER JOIN Rol_Funcionario v4 ON v1.Id_Funcionario = v4.Id_Funcionario
     INNER JOIN Rol v5 ON v4.Id_Rol = v5.Id_Rol
WHERE v5.Id_Rol = 1;


USE SARA;
CALL SARA_CRUD("SELECT","Version","","");
CALL SARA_CRUD("SELECT","Autor","","");

CALL SARA_CRUD("DELETE","Autor","","Id_Autor > 0");
CALL SARA_CRUD("DELETE","Version","","Id_Version > 0");
CALL SARA_CRUD("DELETE","Detalles_Tema","","Id_Detalles_Tema > 0");
CALL SARA_CRUD("DELETE","Producto_Virtual","","Id_P_Virtual > 0");


CALL SARA_CRUD("DELETE","Detalles_Notificacion","","Id_Detalles_Notificacion > 0");
CALL SARA_CRUD("DELETE","Notificacion","","Id_Notificacion > 0");

-- CREAR LISTA DE CHEQUEO- PARA UNA EVALUACION

CALL RegistrarLista("Lista Chequeo 1~ Des Lista Chequeo 1~2~1,2,3");
CALL RegistrarLista("Lista Chequeo 2~ Des Lista Chequeo 2~2~1,2");

CALL SARA_CRUD("SELECT","Lista_Chequeo","","");
CALL SARA_CRUD("SELECT","Detalles_Lista","","");

-- EVALUAR PRODUCTO VIRTUAL

-- ERROR EN LA NOTIFICACION EN EL URL CUALDO SE LE ENVIA AL COORDINADOR

CALL RegistrarEvaluacion("Evaluacion PV Prueba 1~0~2~1~2~2017-08-01~1¤Observacion Item 1¤1|1¤Observacion Item 2¤2");

CALL RegistrarEvaluacion("Evaluacion PV Prueba 2~1~1~1~3~2017-08-01~1¤Observacion Item 3¤1|1¤Observacion Item 4¤2");

-- CASO ALTERNO

CALL RegistrarEvaluacion("Evaluacion PV Prueba 2~0~1~1~2~2017-08-01~0¤Observacion Item 1¤1|1¤Observacion Item 2¤2");

CALL CorreccionVersion("1~1~URLversion1/1");

CALL RegistrarEvaluacion("Evaluacion PV Prueba 3~1~8~3~3~2017-08-01~0¤Observacion Item 1¤1|1¤Observacion Item 2¤2");
CALL CorreccionVersion("1~4~URLversion2/2");
-- APROBACION

CALL SARA_CRUD("SELECT","Rankin","","");
CALL AprobarPV("4~8");	
CALL SARA_CRUD("SELECT","Evaluacion_General","","");
CALL SARA_CRUD("SELECT","Detalles_Evaluacion","","");

CALL SARA_CRUD("DELETE","Rankin","","Id_Rankin > 0");
-- NUEVA VERSION PARA ACTUALIZAR UNA YA PUBLICADA

CALL RegistrarVersion("1~urlactualizacion6/~url2actualizacion/6~Instruacion actualizacion 6~Requisitos actualizacion 6~1,5");

CALL SARA_CRUD("SELECT","Notificacion","","");
CALL SARA_CRUD("SELECT","Detalles_Notificacion","","");

CALL SARA_CRUD("DELETE","Detalles_Notificacion","","Id_Detalles_Notificacion > 0");
CALL SARA_CRUD("DELETE","Notificacion","","Id_Notificacion > 7");

CALL SARA_CRUD("SELECT","Categoria","","");
CALL SARA_CRUD("SELECT","Evaluacion_General","","");

CALL SARA_CRUD("DELETE","Detalles_Evaluacion","","Id_Detalles_Evaluacion > 6");
CALL SARA_CRUD("DELETE","Evaluacion_General","","Id_Evaluacion_General > 3");

CALL SARA_CRUD("UPDATE","Version","Id_Estado~5","Id_Version = 2");

DROP PROCEDURE IF EXISTS Pruebita;
DELIMITER ;;
CREATE PROCEDURE Pruebita(IN valor INTEGER,OUT retorno VARCHAR(10))
BEGIN
	CASE valor
		WHEN 1 THEN SET retorno = "uno";
        WHEN 2 THEN SET retorno = "dos";
    END CASE;
END;;
DELIMITER ;

CALL Pruebita(2,@p);

SELECT @p;