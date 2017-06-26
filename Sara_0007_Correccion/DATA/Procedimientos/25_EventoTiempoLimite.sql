SET GLOBAL event_scheduler = ON;

DROP EVENT IF EXISTS Event_Notificaciones;
DELIMITER ;;
CREATE EVENT Event_Notificaciones 
ON SCHEDULE EVERY 1 DAY STARTS '2017/03/09 18:00:00' ENABLE
COMMENT "Notificaciones"
DO
BEGIN 
	CALL TIME_LIMIT ();
END;;

DELIMITER ;

DROP PROCEDURE IF EXISTS TIME_LIMIT;
DELIMITER ;;
CREATE PROCEDURE TIME_LIMIT()
BEGIN

	DECLARE done INTEGER DEFAULT FALSE;
    DECLARE idVer INTEGER;
    DECLARE fechaV TIMESTAMP;
    DECLARE idEst INTEGER;
    DECLARE cur CURSOR FOR 
    SELECT Id_Version, DATE_FORMAT(Fecha_Vigencia,'%y-%m-%d'),Id_Estado
    FROM Version WHERE Id_Estado IN (6,7);
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    SELECT Id_Version, DATE_FORMAT(Fecha_Vigencia,'%y-%m-%d') 
    FROM Version WHERE Id_Estado IN (6,7);-- Select
    
    SET @fechaA  = DATE_FORMAT(CURRENT_TIMESTAMP,'%y-%m-%d');
    OPEN cur;
    read_loop:LOOP
    
		FETCH cur INTO idVer,fechaV,idEst;
        
        IF done THEN LEAVE read_loop; END IF;-- Posible salida
        
        -- Valida que el pv no tenga una nueva version
        SELECT COUNT(*) INTO @validarNuevoV
		FROM Version v1 INNER JOIN Producto_Virtual  v2 ON v1.Id_P_Virtual = v2.Id_P_Virtual
		WHERE v1.Id_P_Virtual = (SELECT Id_P_Virtual FROM Version WHERE Id_Version = idVer) 
			AND Id_Estado IN (6,7)-- Num Version 
			AND Num_Version > (SELECT Num_Version FROM Version WHERE Id_Version = idVer); 
        
		
        SELECT v1.Id_Funcionario INTO @idFunc
        FROM Funcionario v1 INNER JOIN Rol_Funcionario v2 ON v1.Id_Funcionario = v2.Id_Funcionario
			INNER JOIN Area_Centro v3 ON v1.Id_Area_Centro = v3.Id_Area_Centro
		WHERE Id_Centro = 
        (
			SELECT Id_Centro 
			FROM Funcionario v1 
				INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro
				INNER JOIN Autor v3 ON v1.Id_Funcionario = v3.Id_Funcionario
			WHERE v3.Id_Version = idVer AND Principal = 1
        ) AND Id_Rol = 4;
        
        SELECT idVer;-- 
        
        CALL ALL_AUTOR(idVer,@autores);
        
        SELECT @autores as au;
        
        IF(fechaV = @fechaA AND idEst = 6)THEN
			SELECT "time 1";-- 
            
			UPDATE Version
            SET Id_Estado = 7
            WHERE Id_Version = idVer;
            
            CALL RegistarNotificaion(CONCAT("La version fue inhabilitada por ser obsoleta~3~",@idFunc,"~",@autores,"~",idVer,""));	
            
            ELSE IF(fechaV = DATE_ADD(@fechaA, INTERVAL 7 DAY ) AND idEst = 6 AND @validarNuevoV = 0)THEN
            
				SELECT "time 2";-- 
                
				CALL RegistarNotificaion(CONCAT("La version debe ser actualizada antes de 7 dias~3~",@idFunc,"~",@autores,"~",idVer,""));
                
                ELSE IF( @fechaA = DATE_ADD(fechaV, INTERVAL 7 DAY) AND idEst = 7 AND @validarNuevoV = 0)THEN
					
                    SELECT "time 3";--
                    
					SELECT @idFunc,@autores,idVer;-- 
                    
					CALL RegistarNotificaion(CONCAT("La Version debe ser actualizada yaque fue inhabilitada hace 7 dias~3~",@idFunc,"~",@autores,"~",idVer,""));
                    
                END IF;
            END IF;
        END IF;
		
    END LOOP;
    CLOSE cur;
    
END;;
DELIMITER ;
