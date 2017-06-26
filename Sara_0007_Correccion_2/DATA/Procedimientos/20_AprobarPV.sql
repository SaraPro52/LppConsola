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
    
    -- ----------------------------------------
    --  RANKIN
    INSERT INTO Rankin (Id_Version)VALUES (@idVersion);
    
    -- CALL SARA_CRUD("SELECT","Version","Id_P_Virtual~@idPro","Id_Version = @idVersion");
    -- CALL SARA_CRUD("SELECT","Version","Num_Version~@numVer","Id_Version = @idVersion");
    -- CALL SARA_CRUD("UPDATE","Version",CONCAT("Num_Version~",@numVer + 1,""),
			-- "Id_P_Virtual = @idPro AND Id_Estado != 6 AND Num_Version = @numVer");
END;;
DELIMITER ;

