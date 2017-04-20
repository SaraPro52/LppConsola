USE SARA001;

DROP PROCEDURE IF EXISTS RegistrarCategoria;
DELIMITER ;;
CREATE PROCEDURE RegistrarCategoria(IN ArrayCategoria VARCHAR(500))
BEGIN
	CALL EXECUTE_ARRAY(
    ArrayCategoria,
    "~",
    "CASE @i 
		WHEN 0 THEN SET @nomCategoria  = @valor; 
        WHEN 1 THEN SET @desCategoria  = @valor;
        WHEN 2 THEN SET @idFuncionario = @valor;
        WHEN 3 THEN SET @ArrayTemas 	= @valor;
    END CASE;"
    );
    
    CALL SARA_CRUD("INSERT","Categoria",CONCAT("Nom_Categoria~",@nomCategoria,"|Des_Categoria~",@desCategoria,"|Id_Funcionario~",@idFuncionario,""),"");
    CALL SARA_CRUD("SELECT","Categoria","Id_Categoria INTO @idCate","Nom_Categoria = @nomCategoria AND Des_Categoria = @desCategoria");
    
     SET @i = 0;
    SET @num = M_LENGTH(@ArrayTemas,",");
    WHILE(@i < @num)DO
		SET @valor = SUBSTRING_INDEX(@ArrayTemas,",",1);
        SET @cant = CHAR_LENGTH(@ArrayTemas) - CHAR_LENGTH(@valor);
        SET @ArrayTemas = RIGHT(@ArrayTemas,@cant -1);
			CALL SARA_CRUD("INSERT","Detalles_Categoria",CONCAT("Id_Categoria~",@idCate,"|Id_Tema~",@valor,""),"");
        SET @i = @i + 1;
    END WHILE;
END;;
DELIMITER ;


-- CALL RegistrarCategoria("LA PRUEBA2~ECHA PARA SER LA MEJOR2~13~1,2");

-- CALL SARA_CRUD("SELECT","Categoria","","");
-- CALL SARA_CRUD("SELECT","Detalles_Categoria","","");