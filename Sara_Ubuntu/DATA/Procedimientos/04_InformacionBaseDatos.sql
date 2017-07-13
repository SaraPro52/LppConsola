DROP PROCEDURE IF EXISTS InfoDB;
DELIMITER ;;
CREATE PROCEDURE InfoDB(IN ArrayInfoDB VARCHAR(200))
BEGIN
	
    
    CALL EXECUTE_ARRAY(
		ArrayInfoDB,"~",
        "CASE @i 
			WHEN 0 THEN SET @valDB    	 	= @valor;
			WHEN 1 THEN SET @valINT 	  	= @valor;
			WHEN 2 THEN SET @valTabla 	  	= @valor;
		END CASE;");
        
    SET @cont = -1;
	CASE (@valINT) 
		WHEN 1 THEN 
                    SET @cont1 = -1;
					SELECT DISTINCT iT.TABLE_NAME AS tablas,1 AS tipoT, @cont := @cont + 1 AS posicion
					FROM  information_schema.TABLES iT
					WHERE iT.TABLE_SCHEMA = @valDB AND TABLE_TYPE = "BASE TABLE"
					GROUP BY  iT.TABLE_NAME,TABLE_TYPE 
                    UNION 
                    SELECT DISTINCT iT.TABLE_NAME AS tablas,2 AS tipoT, @cont1 := @cont1 + 1 AS posicion
					FROM  information_schema.TABLES iT
					WHERE iT.TABLE_SCHEMA = @valDB AND TABLE_TYPE = "VIEW"
					GROUP BY  iT.TABLE_NAME,TABLE_TYPE 
                    ORDER BY tablas, tipoT;
		WHEN 2 THEN 
					SELECT COLUMN_NAME AS Columnas, @cont := @cont + 1 AS PosicionColum
                    FROM information_schema.COLUMNS iC
                    WHERE iC.TABLE_SCHEMA = @valDB AND TABLE_NAME = @valTabla;
		WHEN 3 THEN 
					SELECT DISTINCT iT.TABLE_NAME AS tablas
					FROM  information_schema.TABLES iT
					WHERE iT.TABLE_SCHEMA = @valDB AND TABLE_TYPE = "BASE TABLE" AND iT.TABLE_NAME NOT LIKE '%_Log';
    END CASE;
 
END;;
DELIMITER ;

-- CALL InfoDB("SARA006~3~0");