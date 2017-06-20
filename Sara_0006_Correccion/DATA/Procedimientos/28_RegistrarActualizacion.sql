DROP PROCEDURE IF EXISTS RegistarActualizacion;
DELIMITER ;;
CREATE PROCEDURE RegistarActualizacion(IN ArrayActualizacion VARCHAR(2000),OUT nomUrl VARCHAR(50))
BEGIN
  CALL EXECUTE_ARRAY(
		ArrayActualizacion,
        "~",
        "CASE @i
			WHEN 0 THEN SET @idPro = @valor;
			WHEN 1 THEN SET @Url_Version = @valor;
			WHEN 2 THEN SET @Url_Img = @valor;
			WHEN 3 THEN SET @Inst_Instalacion = @valor;
			WHEN 4 THEN SET @Reqst_Instalacion = @valor;
			WHEN 5 THEN SET @ArrayFuncionario = @valor;
			WHEN 6 THEN SET @ArrayTemas = @valor;
        END CASE;"
    );
    SELECT "1";
    
    IF(@ArrayTemas != "null")THEN-- 20/04/2017
		SET @i = 0;
		SET @num = M_LENGTH(@ArrayTemas,",");
		WHILE(@i < @num)DO
			 SET @i = @i + 1;
				SET @arrayT = SUBSTRING_INDEX(@ArrayTemas,",",1);
				SET @cant = CHAR_LENGTH(@ArrayTemas) - CHAR_LENGTH(@arrayT);
				SET @ArrayTemas = RIGHT(@ArrayTemas,@cant -1);
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
    END IF;
    
    
    CALL RegistrarVersion(CONCAT("",@idPro,"~",@Url_Version,"~",@Url_Img,"~",@Inst_Instalacion,"~",@Reqst_Instalacion,"~",@ArrayFuncionario,""),nomUrl);
    
END;;
DELIMITER ;
