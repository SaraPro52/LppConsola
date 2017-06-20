DROP PROCEDURE IF EXISTS CorreccionVersion;
DELIMITER ;;
CREATE PROCEDURE CorreccionVersion(IN ArrayCorrecion VARCHAR(2000),OUT nomUrl VARCHAR(50))
BEGIN

	CALL EXECUTE_ARRAY(
		ArrayCorrecion,
        "~",
        "CASE @i
			WHEN 0 THEN SET @idFuncionario = @valor;
			WHEN 1 THEN SET @idVersion = @valor;
		END CASE"
    );
    

	SELECT Id_Funcionario INTO @idFun
    FROM Version v1 INNER JOIN Autor v2 ON v1.Id_Version = v2.Id_Version
    WHERE v1.Id_Version = @idVersion AND Principal = 1;
    
    CALL SARA_CRUD("SELECT","Version","Id_Estado INTO @oldEstado","Id_Version = @idVersion");
    CALL SARA_CRUD("SELECT","Version","Url_Version INTO @oldUrl","Id_Version = @idVersion");
    
    SELECT CONCAT("ID1",@idFuncionario,"---  ID2",@idFun);
    
    IF(@idFuncionario = @idFun)THEN -- Cambio en la validacion ------------------------
		
		SELECT Id_Centro INTO @idCentro
		FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro
		WHERE Id_Funcionario = @idFun;
		
        IF(@oldEstado = 9 OR @oldEstado = 10)THEN-- Cambio de estados 9-3 y 10-4
        
			CASE  @oldEstado
				WHEN 9 THEN SET @rol = 2, @newEstado = 3;-- @newEstado 12/042017
                WHEN 10 THEN SET @rol = 3, @newEstado = 4;-- @newEstado 12/042017
            END CASE;
            
			SELECT v1.Id_Funcionario INTO @idEval
			FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro 
			 INNER JOIN Rol_Funcionario v3 ON v1.Id_Funcionario = v3.Id_Funcionario
			WHERE Id_Centro = @idCentro AND Id_Rol = @rol;
            
            CALL SARA_CRUD("UPDATE","Version",CONCAT("Id_Estado~",@newEstado,"|Fecha_Envio~",CURRENT_TIMESTAMP,""),CONCAT("Id_Version = ",@idVersion,""));-- @newEstado 12/042017
            CALL RegistarNotificaion(CONCAT("Nuevo Producto Virtual Corregido ha evaluar para Equipo~1~",@idFun,"~",@idEval,"~",@idVersion,""));
            
            UPDATE Version SET Url_Version = NameUrl(@idVersion) WHERE Id_Version = @idVersion;-- NUEVO NOMBRE 16/04/2017
            SET nomUrl = NameUrl(@idVersion);-- RETORNA EL NOMBRE DEL ARCHIVO
        END IF;
        ELSE SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Usuario no aceptado o URL no actualizado";
    END IF;
    
END;;
DELIMITER ;
