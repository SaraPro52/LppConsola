DROP PROCEDURE IF EXISTS ModificarLista;
DELIMITER ;;
CREATE PROCEDURE ModificarLista(IN arrayModificar VARCHAR(400))
BEGIN
	CALL EXECUTE_ARRAY(
		arrayModificar,
        "~",
        "CASE @i
			WHEN 0 THEN SET @Id_Lista_Chequeo = @valor;
			WHEN 1 THEN SET @Nom_Lista_Chequeo = @valor;
			WHEN 2 THEN SET @Des_Lista_Chequeo = @valor;
			WHEN 3 THEN SET @Array_Items = @valor;
        END CASE;"
    );
    
    UPDATE lista_chequeo 
    SET Nom_Lista_Chequeo = @Nom_Lista_Chequeo, Des_Lista_Chequeo = @Des_Lista_Chequeo
    WHERE Id_Lista_Chequeo = @Id_Lista_Chequeo;
    
    IF (@Array_Items)THEN
		SET @i = 0;
		SET @num = M_LENGTH(@Array_Items,",");
		WHILE(@i < @num)DO
			SET @valor = SUBSTRING_INDEX(@Array_Items,",",1);
			SET @cant = CHAR_LENGTH(@Array_Items) - CHAR_LENGTH(@valor);
			SET @Array_Items = RIGHT(@Array_Items,@cant -1);
			CALL SARA_CRUD("INSERT","Detalles_Lista",CONCAT("Id_Lista_Chequeo~",@Id_Lista_Chequeo,"|Id_Item_Lista~",@valor,""),"");
			SET @i = @i + 1;
		END WHILE;
    END IF;
END;;
DELIMITER ;
