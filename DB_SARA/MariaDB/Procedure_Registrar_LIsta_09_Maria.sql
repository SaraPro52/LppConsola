USE SARA;

DROP PROCEDURE IF EXISTS RegistrarLista;
DELIMITER ;;
CREATE PROCEDURE RegistrarLista(IN ArrayLista VARCHAR(500))
BEGIN

	CALL EXECUTE_ARRAY(
		ArrayLista,
        "~",
        "CASE @i
			WHEN 0 THEN SET @Nom_Lista_Chequeo = @valor;
			WHEN 1 THEN SET @Des_Lista_Chequeo = @valor;
			WHEN 2 THEN SET @Id_Funcionario = @valor;
			WHEN 3 THEN SET @Array_Items = @valor;
        END CASE;"
    );
    CALL SARA_CRUD("INSERT","Lista_Chequeo",CONCAT("Nom_Lista_Chequeo~",@Nom_Lista_Chequeo,"|Des_Lista_Chequeo~",@Des_Lista_Chequeo,"|Id_Funcionario~",@Id_Funcionario,""),"");

	CALL SARA_CRUD("SELECT","Lista_Chequeo","Id_Lista_Chequeo INTO @idList","Nom_Lista_Chequeo  = @Nom_Lista_Chequeo");

    SET @i = 0;
    SET @num = M_LENGTH(@Array_Items,",");
    WHILE(@i < @num)DO
		SET @valor = SUBSTRING_INDEX(@Array_Items,",",1);
        SET @cant = CHAR_LENGTH(@Array_Items) - CHAR_LENGTH(@valor);
        SET @Array_Items = RIGHT(@Array_Items,@cant -1);
		CALL SARA_CRUD("INSERT","Detalles_Lista",CONCAT("Id_Lista_Chequeo~",@idList,"|Id_Item_Lista~",@valor,""),"");
        SET @i = @i + 1;
    END WHILE;
    
END;;
DELIMITER ;

CALL RegistrarLista("Listao~Evals~2~1,2,3");
CALL SARA_CRUD("SELECT","Lista_Chequeo","","");
CALL SARA_CRUD("SELECT","Detalles_Lista","","");


