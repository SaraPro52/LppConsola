USE SARA;

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
			WHEN 4 THEN SET @Url_Version = @valor;
			WHEN 5 THEN SET @Url_Img = @valor;
			WHEN 6 THEN SET @Inst_Instalacion= @valor;
			WHEN 7 THEN SET @Reqst_Instalacion = @valor;
			WHEN 8 THEN SET @ArrayFuncionario = @valor;
			WHEN 9 THEN SET @ArrayTema = @valor;
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
    CALL SARA_CRUD("INSERT","Version",CONCAT("Url_Version~",@Url_Version,"|Url_Img~",@Url_Img,"|Inst_Instalacion~",@Inst_Instalacion,"|Reqst_Instalacion~",@Reqst_Instalacion ,"|Id_P_Virtual~",@idPro,""),"");
    CALL SARA_CRUD("SELECT","Version","Id_Version INTO @idVer","Inst_Instalacion = @Inst_Instalacion AND Reqst_Instalacion = @Reqst_Instalacion");
   
   
   Bucle : WHILE (TRUE) DO
        SET @valor = SUBSTRING_INDEX(@ArrayFuncionario,",",1);
        SET @cantidad = CHAR_LENGTH(@ArrayFuncionario) - CHAR_LENGTH(@valor);
        SET @ArrayFuncionario = RIGHT(@ArrayFuncionario,@cantidad -1);
        CALL SARA_CRUD("INSERT","Autor",CONCAT("Id_Version~",@idVer,"|Id_Funcionario~",@valor),"");
        IF(CHAR_LENGTH(@ArrayFuncionario) = 0) THEN
			LEAVE Bucle;
        END IF;
    END WHILE Bucle;
END;;
DELIMITER ;

CALL Registrar_OA("Prueba Producto12~Se esta porbando el procedimiento12~Prueba12,Producto,virtual~1~Prueba12/Version~Prueba12/Imagen~No se instal5a~Ningun requisit24o~1,2~2-1,2-0");

CALL SARA_CRUD("SELECT","Producto_Virtual","","");
CALL SARA_CRUD("SELECT","Detalles_Tema","","");
CALL SARA_CRUD("SELECT","Version","","");
CALL SARA_CRUD("SELECT","Autor","","");
CALL SARA_CRUD("SELECT","Categoria","","");