DROP PROCEDURE IF EXISTS EXECUTE_ARRAY;
DELIMITER ;;
CREATE PROCEDURE EXECUTE_ARRAY(IN Array VARCHAR(500),IN Separador CHAR(1),IN Contenido VARCHAR(1000))
BEGIN
	
	SET @i = 0;SET @valor = "";SET @cant = 0;
    Bucle : WHILE(TRUE)DO
		SET @valor = SUBSTRING_INDEX(Array,Separador,1);
        SET @cant = CHAR_LENGTH(Array) - CHAR_LENGTH(@valor);
        SET Array = RIGHT(Array,@cant-1);
        CALL MACC(Contenido);
        
        IF(CHAR_LENGTH(Array) = 0) THEN
			LEAVE Bucle;
        END IF;
        SET @i = @i + 1;
    END WHILE Bucle;
    SET @i = 0;SET @valor = "";SET @cant = 0;
END;;

DELIMITER ;

