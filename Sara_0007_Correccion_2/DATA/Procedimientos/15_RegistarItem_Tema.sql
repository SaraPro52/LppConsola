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
        SELECT Id_Item_Lista, Des_Item_Lista FROM Item_Lista WHERE Id_Item_Lista = @idItem;
        
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
        SELECT Id_Tema, Nom_Tema FROM Tema WHERE Id_Tema = @idTema;
        END IF;
    END IF;
END;;
DELIMITER ;;
