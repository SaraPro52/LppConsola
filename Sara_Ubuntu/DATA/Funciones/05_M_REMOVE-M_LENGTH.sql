DROP FUNCTION IF EXISTS M_REMOVE;
DELIMITER ;;
CREATE FUNCTION M_REMOVE(cadena VARCHAR(500)) RETURNS varchar(500) CHARSET latin1
BEGIN
	RETURN REPLACE(REPLACE(TRIM(cadena),"\n",""),"\t","");
END;;
DELIMITER ;

DROP FUNCTION IF EXISTS M_LENGTH;
DELIMITER ;;
CREATE FUNCTION M_LENGTH(Array VARCHAR(1000), Separador CHAR(1)) RETURNS int(11)
BEGIN 
	DECLARE	contador INTEGER DEFAULT 1;
    DECLARE valor VARCHAR(500);
    DECLARE cantidad INTEGER;
    Bucle : WHILE (TRUE) DO
		
        SET valor = SUBSTRING_INDEX(Array,Separador,1);
        SET cantidad = CHAR_LENGTH(Array) - CHAR_LENGTH(valor);
        SET Array = RIGHT(Array,cantidad -1);
        
        IF(CHAR_LENGTH(Array) = 0) THEN
			LEAVE Bucle;
        END IF;
        
        SET contador = contador + 1; 
    END WHILE Bucle;
    RETURN contador;
    
END;;
DELIMITER ;