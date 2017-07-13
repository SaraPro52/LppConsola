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
			 INNER JOIN Rol_Funcionario v3 ON v1.Id_Funcionario = v3.Id_Funcionario AND v3.Vigencia = 1
			 INNER JOIN Rol v4 ON v3.Id_Rol = v4.Id_Rol
		WHERE Id_Centro = @idCentro AND v3.Id_Rol = 2; -- SE PUEDE HACER DESDE SARA_CRUD
		
		CALL RegistarNotificaion(CONCAT("Nuevo Producto Virtual ha evaluar para el ",@nomRol,"~1~",@funPrin,"~",@idEval,"~",@idVer,""));-- Anadir nomRol para la notificacion 14/04/2017
		
		UPDATE Version SET Url_Version = NameUrl(@idVer) WHERE Id_Version = @idVer;-- NUEVO NOMBRE 16/04/2017
		
		SET nomUrl = NameUrl(@idVer);-- RETORNA EL NOMBRE DEL ARCHIVO
        
END;;
DELIMITER ;;
