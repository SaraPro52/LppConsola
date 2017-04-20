USE SARA001;

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


-- CALL RegistarItem_Tema("1,Prueba Item Registro 1~0");
-- CALL RegistarItem_Tema("2,Prueba Tema Registro 1~Descripcion tema 1 Prueba");

DROP PROCEDURE IF EXISTS RegistrarItem_Tema;
DELIMITER ;;
CREATE PROCEDURE RegistrarItem_Tema(IN arrayItems_Temas VARCHAR(400))
BEGIN
	CALL EXECUTE_ARRAY(
		arrayItems_Temas,
        ",",
        "CASE @i
			WHEN 0 THEN SET @eleccion = @valor;
			WHEN 1 THEN SET @arrayEleccion = @valor;
        END CASE;"
    );
    IF(@eleccion = 1)THEN
		CALL EXECUTE_ARRAY(
			@arrayEleccion,
			"~",
			"CASE @i
				WHEN 0 THEN SET @desItemLista = @valor;
				WHEN 1 THEN SET @tipoItem = @valor;
			END CASE;"
		);
        INSERT INTO Item_Lista VALUES(null,@desItemLista,@tipoItem);
        SELECT Id_Item_Lista INTO @idItem FROM Item_Lista WHERE Des_Item_Lista = @desItemLista AND Tipo_Item = @tipoItem;
        SELECT Id_Item_Lista, Des_Item_Lista FROM Item_Lista WHERE Tipo_Item = @tipoItem;
        
        ELSE IF(@eleccion = 2)THEN
			CALL EXECUTE_ARRAY(
			@arrayEleccion,
			"~",
			"CASE @i
				WHEN 0 THEN SET @nomTema = @valor;
				WHEN 1 THEN SET @desTema = @valor;
			END CASE;"
		);
        INSERT INTO Tema VALUES (null,@nomTema,@desTema);
        SELECT Id_Tema INTO @idTema FROM Tema WHERE Nom_Tema = @nomTema AND Des_Tema = @desTema;
        SELECT Id_Tema, Nom_Tema FROM Tema;
        END IF;
    END IF;
END;;
DELIMITER ;
-- CALL RegistrarLista("Listao~Evals~2~1,2,3");
-- CALL SARA_CRUD("SELECT","Lista_Chequeo","","");
-- CALL SARA_CRUD("SELECT","Detalles_Lista","","");


