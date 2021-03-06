DROP PROCEDURE IF EXISTS SARA_CRUD;
DELIMITER ;;
CREATE PROCEDURE SARA_CRUD(IN Sentencia VARCHAR(40),IN Tabla VARCHAR(70),IN Array_Datos1 VARCHAR(500), IN Array_Datos2 VARCHAR(500))
BEGIN
DECLARE i INTEGER DEFAULT 0;DECLARE a INTEGER DEFAULT 0;DECLARE num INTEGER DEFAULT 0;
DECLARE ArrayColum VARCHAR(500);DECLARE val VARCHAR(500);DECLARE cant INTEGER;
DECLARE columnas VARCHAR(500) DEFAULT "";DECLARE conjunto VARCHAR(500) DEFAULT "";DECLARE valores  VARCHAR(500) DEFAULT "";

	SET Sentencia = M_REMOVE(Sentencia);
    SET Tabla = M_REMOVE(Tabla);
    SET Array_Datos2 = M_REMOVE(Array_Datos2);
    
    IF(Array_Datos2 != " " OR Array_Datos2 != null)THEN
		SET Array_Datos2 = CONCAT("WHERE ", Array_Datos2);
    END IF;
    
	SET i = 0;
	SET num = M_LENGTH(Array_Datos1,"|");
	WHILE(i < num)DO
        SET Array_Datos1 = M_REMOVE(Array_Datos1);
		SET ArrayColum = SUBSTRING_INDEX(Array_Datos1,"|",1);
        SET cant = CHAR_LENGTH(Array_Datos1) - CHAR_LENGTH(ArrayColum);
        SET Array_Datos1 = RIGHT(Array_Datos1,cant -1);
        
        SET a = 0;
        WHILE(a < 2)DO
			SET ArrayColum = M_REMOVE(ArrayColum);
			SET val = SUBSTRING_INDEX(ArrayColum,"~",1);
			SET cant = CHAR_LENGTH(ArrayColum) - CHAR_LENGTH(val);
			SET ArrayColum = RIGHT(ArrayColum,cant -1);
            SET val = M_REMOVE(val);
            CASE a
				WHEN 0 THEN 
					BEGIN
						IF(val != "")THEN
							IF(i = 0 AND (Sentencia = "INSERT" OR Sentencia = "SELECT"))THEN
								SET columnas = val; 
                                ELSEIF(i > 0 AND (Sentencia = "INSERT" OR Sentencia = "SELECT"))THEN
									SET columnas = CONCAT(columnas ,",", val);
							END IF;
                            IF(i = (num-1) AND Sentencia = "INSERT")THEN 
								SET columnas = RPAD(columnas,CHAR_LENGTH(columnas)+1,")");
								SET columnas = LPAD(columnas,CHAR_LENGTH(columnas)+1,"(");
							END IF;
                            ELSEIF(Sentencia = "SELECT")THEN SET columnas = "*";
								ELSE SET columnas = "";
                        END IF;
                        
                        IF(i = 0 AND Sentencia = "UPDATE")THEN
                            SET conjunto = CONCAT(val," = ");
                            ELSEIF(i > 0 AND Sentencia = "UPDATE")THEN
                            SET conjunto = CONCAT(conjunto,",",val," = ");
                        END IF;
                    END;
                WHEN 1 THEN 
					BEGIN
						IF(i = 0 AND Sentencia = "INSERT")THEN
							SET valores = CONCAT("'",val,"'"); 
							ELSEIF(i > 0 AND Sentencia = "INSERT")THEN
							SET valores = CONCAT(valores ,",'", val,"'");
                        END IF;
                        IF(Sentencia = "UPDATE")THEN
                            SET conjunto = CONCAT(conjunto," '",val,"'");
                        END IF;
                    END;
            END CASE;
            SET a = a + 1; 
        END WHILE;    
		SET i = i + 1;
    END WHILE;
    
	CASE Sentencia
		WHEN "INSERT" THEN SET @EXEC = 	(CONCAT("INSERT INTO ",Tabla," ",columnas," VALUES(",valores,")"));
        WHEN "UPDATE" THEN SET @EXEC =	(CONCAT("UPDATE ",Tabla," SET ",conjunto," ",Array_Datos2,""));
        WHEN "SELECT" THEN SET @EXEC =	(CONCAT("SELECT DISTINCT ",columnas," FROM ",Tabla," ",Array_Datos2,""));
        WHEN "DELETE" THEN SET @EXEC =	(CONCAT("DELETE FROM ",Tabla," ",Array_Datos2,""));
    END CASE;
    
    PREPARE EXEC FROM @EXEC;
    EXECUTE EXEC;
    DEALLOCATE PREPARE EXEC;
END;;

DELIMITER ;