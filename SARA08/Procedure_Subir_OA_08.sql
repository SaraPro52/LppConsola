USE SARA08;

DROP PROCEDURE IF EXISTS Registrar_OA;
DELIMITER ;;
CREATE PROCEDURE Registrar_OA(IN ArrayTodo VARCHAR(2000))
BEGIN
	CALL EXECUTE_ARRAY(
		ArrayTodo,
		"~",
		"CASE @i
			WHEN 0 THEN SET @Nom_P_Virtual = @valor;
			WHEN 1 THEN SET @Des_P_Virtual = @valor;
			WHEN 2 THEN SET @Palabras_Clave = @valor;
			WHEN 3 THEN SET @Id_Formato = @valor;
			WHEN 4 THEN SET @Num_Version = @valor;
			WHEN 5 THEN SET @Url_Version = @valor;
			WHEN 6 THEN SET @Url_Img = @valor;
			WHEN 7 THEN SET @Inst_Instalacion= @valor;
			WHEN 8 THEN SET @Reqst_Instalacion = @valor;
			WHEN 9 THEN SET @ArrayFuncionario = @valor;
			WHEN 10 THEN SET @ArrayTema = @valor;
		END CASE;"
	);
    CALL SARA_CRUD("INSERT","Producto_Virtual",CONCAT("Nom_P_Virtual~",@Nom_P_Virtual,"|Des_P_Virtual~",@Des_P_Virtual,"|Palabras_Clave~",@Palabras_Clave,"|Id_Formato~",@Id_Formato,""),"");
	CALL SARA_CRUD("SELECT","Producto_Virtual","Id_P_Virtual INTO @idPro","Nom_P_Virtual = @Nom_P_Virtual");
	SET @i = 0;
	SET @num = M_LENGTH(@ArrayTema,",");
	WHILE(@i < @num)DO
		SET @arrayT = SUBSTRING_INDEX(@ArrayTema,",",1);
        SET @cant = CHAR_LENGTH(@ArrayTema) - CHAR_LENGTH(@arrayT);
        SET @ArrayTema = RIGHT(@ArrayTema,@cant -1);
        SET @a = 0;
        WHILE(@a < 2)DO
			SET @val = SUBSTRING_INDEX(@arrayT,"-",1);
			SET @cant = CHAR_LENGTH(@arrayT) - CHAR_LENGTH(@val);
			SET @arrayT = RIGHT(@arrayT,@cant -1);
            CASE @a
				WHEN 0 THEN SET @idTema = @val; 
                WHEN 1 THEN SET @tipo 	= @val;
            END CASE;
            SET @a = @a + 1;        
        END WHILE;
        CALL SARA_CRUD("INSERT","Detalles_Tema",CONCAT("Id_Tema~",@idTema,"|Id_P_Virtual~",@idPro,"|Tipo_Tema~",@tipo,""),"");
		SET @i = @i + 1;
    END WHILE;
    CALL SARA_CRUD("INSERT","Version",CONCAT("Num_Version~",@Num_Version,"|Url_Version~",@Url_Version,"|Url_Img~",@Url_Img,"|Inst_Instalacion~",@Inst_Instalacion,"|Reqst_Instalacion~",@Reqst_Instalacion ,"|Id_P_Virtual~",@idPro,"|Id_Estado~1|Id_Tipo_Version~1"),"");
    CALL SARA_CRUD("SELECT","Version","Id_Version INTO @idVer","Inst_Instalacion = @Inst_Instalacion AND Reqst_Instalacion = @Reqst_Instalacion");
    CALL EXECUTE_ARRAY(
		@ArrayFuncionario,
        ",",CONCAT("CALL SARA_CRUD('INSERT','Autor','Id_Version~",@idVer,"|Id_Funcionario~",@valor,"','')")
    );
END;;
DELIMITER ;

CALL Registrar_OA("153325522~1253355222 C2~H233155225122,4453552253244~1~1~C555224233/2D7552212~C22143553224/5242255427q~I2524522524337~FI555522123372~1~2-1,2-0");

CALL SARA_CRUD("SELECT","Producto_Virtual","","");
CALL SARA_CRUD("SELECT","Detalles_Tema","","");
CALL SARA_CRUD("SELECT","Version","","");
CALL SARA_CRUD("SELECT","Autor","","");
CALL SARA_CRUD("SELECT","Categoria");