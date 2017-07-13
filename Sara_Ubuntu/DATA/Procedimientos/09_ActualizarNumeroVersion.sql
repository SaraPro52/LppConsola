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
